//
//  ViewController.swift
//  LocationFun
//
//  Created by Yairo Fernandez on 12/18/18.
//  Copyright © 2018 Yairo Fernandez. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    @IBOutlet
    var debugLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugLabel.text = ""
        locationManager.delegate = self
        
    }

    func addDebugText(_ text: String) {
        debugLabel.text = "\(debugLabel.text ?? "")\n\(text)"
    }
    
    @IBAction
    func requestPermissionButtonPressed() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    @IBAction
    func startUpdatingPressed() {
        locationManager.startUpdatingLocation()
    }
    
    //: MARK - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            addDebugText("lat/lng: \(lastLocation.coordinate.latitude),\(lastLocation.coordinate.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            addDebugText("Access Granted")
        case .notDetermined:
            addDebugText("Access Denied")
        case .restricted:
            addDebugText("Access Denied")
        case .denied:
            addDebugText("Access Denied")
        case .authorizedAlways:
            addDebugText("Access Granted")
        }
    }
    

}

