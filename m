Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.2278.1609299424984527203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Dec 2020 19:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: dS2jdrLpyhATbRHNQ/k15A+eqc3TPzvWYT0GNb08x4rMUK22JVmQYiMf4KnsVDahc4vz27gc5c
 bs31O187QVhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="238118011"
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="238118011"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2020 19:37:03 -0800
IronPort-SDR: OxBfsAJ2cYOAVmSm6IZUh7T0MkaTZrsTZtKmQglF6RXSgbtDJHwmum0pCUHwDffPKl3Q5unv5U
 LfZFQaFahvtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="347623950"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 29 Dec 2020 19:37:02 -0800
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/suspend : add test for suspend state
Date: Wed, 30 Dec 2020 11:36:59 +0800
Message-Id: <1609299419-39449-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test case is checking the command and LAN device behaviour before and after suspend state. The Test_if_LAN_device_works_well_after_resume_from_suspend_state and standby manual test cases from oeqa/manual/bsp-hw can be replace by this runtime test.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/suspend.py | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/suspend.py

diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runtime/cases/suspend.py
new file mode 100644
index 0000000..67b6f7e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/suspend.py
@@ -0,0 +1,33 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfQemu
+import threading
+import time
+
+class Suspend_Test(OERuntimeTestCase):
+
+    def test_date(self): 
+        (status, output) = self.target.run('date')
+        self.assertEqual(status, 0,  msg = 'Failed to run date command, output : %s' % output)
+        
+    def test_ping(self):
+        t_thread = threading.Thread(target=self.target.run, args=("ping 8.8.8.8",))
+        t_thread.start()
+        time.sleep(2)
+        
+        status, output = self.target.run('pidof ping')
+        self.target.run('kill -9 %s' % output)
+        self.assertEqual(status, 0, msg = 'Not able to find process that runs ping, output : %s' % output)  
+        
+    def set_suspend(self): 
+        (status, output) = self.target.run('sudo rtcwake -m mem -s 10')
+        self.assertEqual(status, 0,  msg = 'Failed to suspends your system to RAM, output : %s' % output)
+    
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_suspend(self):
+        self.test_date()
+        self.test_ping()
+        self.set_suspend()
+        self.test_date()
+        self.test_ping()
-- 
2.7.4

