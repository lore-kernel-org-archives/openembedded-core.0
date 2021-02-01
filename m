Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.28562.1612148193151413032
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 18:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: 4w76bDYKFQJ44ugZxXNZqpxCFkdnwQ2yjGBGUrIlZNYG/sH1EE+T6KSaGJCabX3wBzhrxl377v
 +xyeiWyBtzsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="160393407"
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="160393407"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2021 18:56:32 -0800
IronPort-SDR: a4XIFJ/JH/1b0a7C4FiNwWqS+4yU0qL+eWC5EYbfkQTPyX57S66jU7gfJVmricoIiww8GF8IgG
 ZY7RY/CYFsAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,391,1602572400"; 
   d="scan'208";a="353644429"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2021 18:56:31 -0800
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/usb_hid.py : add test to check the usb/human interface device status after suspend state
Date: Mon,  1 Feb 2021 10:56:29 +0800
Message-Id: <1612148189-52270-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test mimic the Test_if_usb_hid_device_works_well_after_resume_from_suspend_state manual test case from oeqa/manual/bsp-hw.json.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/usb_hid.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/usb_hid.py

diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runtime/cases/usb_hid.py
new file mode 100644
index 0000000..3c292cf
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/usb_hid.py
@@ -0,0 +1,22 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfQemu
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class USB_HID_Test(OERuntimeTestCase):
+
+    def keyboard_mouse_simulation(self): 
+        (status, output) = self.target.run('export DISPLAY=:0 && xdotool key F2 && xdotool mousemove 100 100')
+        return self.assertEqual(status, 0,  msg = 'Failed to simulate keyboard/mouse input event, output : %s' % output)
+             
+    def set_suspend(self): 
+        (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
+        return self.assertEqual(status, 0,  msg = 'Failed to suspends your system to RAM, output : %s' % output)
+    
+    @OEHasPackage(['xdotool'])
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_USB_Hid_input(self):
+        self.keyboard_mouse_simulation()
+        self.set_suspend()
+        self.keyboard_mouse_simulation()  
-- 
2.7.4

