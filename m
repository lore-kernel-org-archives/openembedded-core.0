Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.3636.1627521721258460137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 18:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="212812116"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="212812116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 18:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="517870778"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2021 18:21:52 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][Patch 4/7] oeqa/suspend : add test for suspend state
Date: Thu, 29 Jul 2021 09:21:20 +0800
Message-Id: <20210729012123.27489-4-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729012123.27489-1-jay.shen.teoh@intel.com>
References: <20210729012123.27489-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test case is checking the command and LAN device behaviour before and after suspend state. The Test_if_LAN_device_works_well_after_resume_from_suspend_state and standby manual test cases from oeqa/manual/bsp-hw can be replace by this runtime test.

(From OE-Core rev: 10728035a606483ea67f6cb8ba5779558856593a)

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/suspend.py | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/suspend.py

diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runtime/cases/suspend.py
new file mode 100644
index 0000000000..67b6f7e56f
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
2.32.0

