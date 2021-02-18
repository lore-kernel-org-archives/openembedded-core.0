Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.3009.1613625665960662264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 21:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: 400DqcIq8YZSkxJy4vj8Udz8PT9Blzh6BKMfqlGyOSbnXGLuFSCmCCm6repAJnZCiZ3sv2FJqn
 A2OEdB9AC95w==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="268255372"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="268255372"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 21:21:05 -0800
IronPort-SDR: W+J+nV/arzgVWM6CK9JcN1oEI0ltqC9x7JiJdvWrEvkaBl4qBewK+f8nRM5dASvQY3Bz8OwFOB
 SCrKKijBswCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="427853001"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2021 21:21:04 -0800
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runlevel : add test for runlevels
Date: Thu, 18 Feb 2021 13:21:01 +0800
Message-Id: <1613625661-5834-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test mimic the boot_from_runlevel_3 and boot_from_runlevel_5 test cases from oeqa/manual/bsp-hw.json.
The boot_from_runlevel_3 and boot_from_runlevel_5 manual test cases should be remove from oeqa/manual/bsp-hw.json if this patch get merged.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/runlevel.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/runlevel.py

diff --git a/meta/lib/oeqa/runtime/cases/runlevel.py b/meta/lib/oeqa/runtime/cases/runlevel.py
new file mode 100644
index 0000000..3a4df8a
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/runlevel.py
@@ -0,0 +1,22 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+
+import time
+
+class RunLevel_Test(OERuntimeTestCase):
+    
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_runlevel_3(self):
+        (status, output) = self.target.run("init 3 && sleep 5 && runlevel")
+        runlevel= '5 3'
+        self.assertEqual(output, runlevel, msg='Failed to set current runlevel to runlevel 3, current runlevel : %s' % output[-1])
+        (status, output) = self.target.run("uname -a")
+        self.assertEqual(status, 0, msg='Failed to run uname command, output: %s' % output)
+        
+    @OETestDepends(['runlevel.RunLevel_Test.test_runlevel_3']) 
+    def test_runlevel_5(self):
+        (status, output) = self.target.run("init 5 && sleep 5 && runlevel")
+        runlevel = '3 5'
+        self.assertEqual(output, runlevel, msg='Failed to set current runlevel to runlevel 5, current runlevel : %s' % output[-1])
+        (status, output) = self.target.run('export DISPLAY=:0 && x11perf -aa10text')
+        self.assertEqual(status, 0, msg='Failed to run 2D graphic test, output: %s' % output)
-- 
2.7.4

