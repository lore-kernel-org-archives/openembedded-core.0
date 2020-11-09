Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.8722.1604910616928896524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: zXLFYW1q+oiLa40Bzvm+hNNIcBPNREIZoZyBQOmV7Br8pIUmlnNRucH0rJuKDo3ov5Uf0Hi+w6
 BXE+wqWL8y4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="231400136"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="231400136"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 00:30:15 -0800
IronPort-SDR: 5PaD1vdeb2FC5HYfFFQLU0jY1xrfrQPUZB8x+UDQM8Yz+9N3Hp2QSTk2+G3mGACjSG6PUa2laF
 hBuXIemgZhMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="530617217"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2020 00:30:12 -0800
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/terminal : rework the logic
Date: Mon,  9 Nov 2020 16:30:10 +0800
Message-Id: <1604910610-68620-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Rework this test case to fulfill the requirements of replacing the click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw :
1) code added to verify that the terminal window is working without problem
2) code added to verify that there's only 1 terminal window is launched

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/terminal.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
index a268f26..8a079a5 100644
--- a/meta/lib/oeqa/runtime/cases/terminal.py
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -2,17 +2,22 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
-import threading
-import time
+import re
 
 class TerminalTest(OERuntimeTestCase):
 
     @OEHasPackage(['matchbox-terminal'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_terminal_running(self):
-        t_thread = threading.Thread(target=self.target.run, args=('export DISPLAY=:0 && matchbox-terminal',))
-        t_thread.start()
-        time.sleep(2)
+        
+        status, output = self.target.run("export DISPLAY=:0 && matchbox-terminal",)
+        check_terminal = re.search("Process killed - no output for 300 seconds.", output)
+        self.assertTrue(check_terminal, msg='Terminal window should be launched without any problem')  
+        
+        status, output = self.target.run('pidof matchbox-terminal | wc -w')
+        output = int(output)
+        self.assertEqual(output, 1, 'There should be only one terminal window being launched. Terminal window launched : %s' % output)
+      
         status, output = self.target.run('pidof matchbox-terminal')
         self.target.run('kill -9 %s' % output)
         self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')   
-- 
2.7.4

