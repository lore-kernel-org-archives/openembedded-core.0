Received: from anchovy3.45ru.net.au (anchovy3.45ru.net.au [203.30.46.155])
 by mx.groups.io with SMTP id smtpd.web08.1758.1615436052956451947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 20:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: electromag.com.au, ip: 203.30.46.155, mailfrom: preid@electromag.com.au)
Received: (qmail 30838 invoked by uid 5089); 11 Mar 2021 04:14:10 -0000
Received: by simscan 1.2.0 ppid: 30762, pid: 30763, t: 0.0488s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Return-Path: <preid@electromag.com.au>
Received: from unknown (HELO ?192.168.0.22?) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 11 Mar 2021 04:14:10 -0000
To: openembedded-core@lists.openembedded.org
From: "Phil Reid" <preid@electromag.com.au>
Subject: INITRAMFS_IMAGE Manifest packagedata not found
Message-ID: <fe33bbac-fdfa-abd6-5e05-b716449dd7ec@electromag.com.au>
Date: Thu, 11 Mar 2021 12:14:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit

oe branch: dunfell

Or kernel uses a simple initramfs, no modules are package so there's no circular dependencies.
And this approach seems simplest for a one pass build.

So it includes this:
INITRAMFS_IMAGE = "emit-image-init"
INITRAMFS_TASK =  "emit-image-init:do_image_complete"

Previously this seemed to be just a warning, but now we are getting an error that aborts the build:

NOTE: recipe emit-linux-rel-5.1.7+gitAUTOINC+d2b6c25422-r0: task do_populate_sysroot: Started
ERROR: emit-linux-rel-5.1.7+gitAUTOINC+d2b6c25422-r0 do_package: Manifest 
/home/cleanbuild/build/workspace/soc-image-v2020.04/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-emit-image-init.packagedata not found in cyclone5 
cortexa9t2hf-neon cortexa9t2hf-vfp cortexa9hf-neon cortexa9hf-vfp armv7at2hf-neon armv7ahf-neon armv7at2hf-vfp armv7ahf-vfp armv6thf-vfp armv6hf-vfp 
armv5tehf-vfp armv5ehf-vfp armv5thf-vfp armv5hf-vfp allarch x86_64_x86_64-nativesdk (variant '')?


And sure enough there is no packagedata file being generated.

Not sure what the solution is here.

image.bbclass sets: do_packagedata[noexec] = "1"
So I tried do_packagedata[noexec] = "0" in the emit-image-init recipe but that had no effect.

Any suggestions appreciated.


-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

23 Junction Parade, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
