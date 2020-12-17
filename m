Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.4051.1608183278713279691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 21:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: 120ppdvsqnaxGu8UeoWxPpjfTBLkqBsKnT1wC7mXg2uDaN+S+/I268NFI6Rb1egPo6M3BPt1HW
 JAtbb2O8Z5Eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="193582864"
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="193582864"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2020 21:34:36 -0800
IronPort-SDR: L8gpTGdZPilmyvBBaaQyJJRfHPSCrXVohYvSk/Q5rP92YHZG+V6VKb6OhmDe5lWjlnWTZmgvih
 WQCITHXkRL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,425,1599548400"; 
   d="scan'208";a="413179891"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2020 21:34:35 -0800
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] oeqa/terminal : improve the test case
Date: Thu, 17 Dec 2020 13:34:30 +0800
Message-Id: <1608183270-6229-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <16460429C740485C.10479@lists.openembedded.org>
References: <16460429C740485C.10479@lists.openembedded.org>

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

-Improve this test case to fulfill the requirements of replacing the click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw :
1) verify that the terminal window is working without problem
2) verify that there's only 1 terminal window is launched
3) reduce test case run time

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/terminal.py | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
index ea4ef02..c330054 100644
--- a/meta/lib/oeqa/runtime/cases/terminal.py
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -2,21 +2,20 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
-import re
+import threading
+import time
 
 class TerminalTest(OERuntimeTestCase):
 
     @OEHasPackage(['matchbox-terminal'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_terminal_running(self):
-        status, output = self.target.run("export DISPLAY=:0 && matchbox-terminal",)
-        check_terminal = re.search("Process killed - no output for 300 seconds.", output)
-        self.assertTrue(check_terminal, msg='Terminal window should be launched without any problem')  
-        
-        status, output = self.target.run('pidof matchbox-terminal | wc -w')
-        output = int(output)
-        self.assertEqual(output, 1, 'There should be only one terminal window being launched. Terminal window launched : %s' % output)
+        t_thread = threading.Thread(target=self.target.run, args=("export DISPLAY=:0 && matchbox-terminal -e 'sh -c \"uname -a && exec sh\"'",))
+        t_thread.start()
+        time.sleep(2)
         
         status, output = self.target.run('pidof matchbox-terminal')
+        number_of_terminal = len(output.split())
+        self.assertEqual(number_of_terminal, 1, msg='There should be only one terminal being launched. Number of terminal launched : %s' % number_of_terminal)
         self.target.run('kill -9 %s' % output)
-        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')   
+        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.') 
\ No newline at end of file
-- 
2.7.4

