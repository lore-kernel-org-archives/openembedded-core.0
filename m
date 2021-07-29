Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.3570.1627521741733232561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 18:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="276563785"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="276563785"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 18:22:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="517870890"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2021 18:22:18 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][Patch 7/7] oeqa/usb_hid.py : add test to check the usb/human interface device status after suspend state
Date: Thu, 29 Jul 2021 09:21:23 +0800
Message-Id: <20210729012123.27489-7-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729012123.27489-1-jay.shen.teoh@intel.com>
References: <20210729012123.27489-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test mimic the Test_if_usb_hid_device_works_well_after_resume_from_suspend_state manual test case from oeqa/manual/bsp-hw.json.

(From OE-Core rev: 23a3dc370a52907ee3261746405fb9b2af9e9a11)

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/usb_hid.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/usb_hid.py

diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runtime/cases/usb_hid.py
new file mode 100644
index 0000000000..3c292cf661
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
2.32.0

