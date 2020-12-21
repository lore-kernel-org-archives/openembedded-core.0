Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.34480.1608518589009114759
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 18:43:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: XK0DSalXgt+6QYsKACmqWwZchDwvsA2dEapnN7RVrat8DVFLej+66Z/TsFDpTnNKYCA3nB/++S
 XVzfLLeTKtjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="155464589"
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; 
   d="scan'208";a="155464589"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 18:43:08 -0800
IronPort-SDR: +z003cMIeez+0VPC5kn4axjmps3cjH9zauZyb+jhonw1TTRmHq9bcae3t6//+pyf6ewqYIJm8W
 jD1wSn5eCjFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,436,1599548400"; 
   d="scan'208";a="381703186"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga007.jf.intel.com with ESMTP; 20 Dec 2020 18:43:07 -0800
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [Patch v2] oeqa/terminal : improve the test case
Date: Mon, 21 Dec 2020 10:43:03 +0800
Message-Id: <1608518583-859-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <BN6PR11MB1474B9871D304DB05874288FBBE90@BN6PR11MB1474.namprd11.prod.outlook.com>
References: <BN6PR11MB1474B9871D304DB05874288FBBE90@BN6PR11MB1474.namprd11.prod.outlook.com>

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

-Improve this test case to fulfill the requirements of replacing the click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw :
1) verify that the terminal window is working without problem
2) verify that there's only 1 terminal window is launched

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/terminal.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
index a268f26..8fcca99 100644
--- a/meta/lib/oeqa/runtime/cases/terminal.py
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -10,9 +10,12 @@ class TerminalTest(OERuntimeTestCase):
     @OEHasPackage(['matchbox-terminal'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_terminal_running(self):
-        t_thread = threading.Thread(target=self.target.run, args=('export DISPLAY=:0 && matchbox-terminal',))
+        t_thread = threading.Thread(target=self.target.run, args=("export DISPLAY=:0 && matchbox-terminal -e 'sh -c \"uname -a && exec sh\"'",))
         t_thread.start()
         time.sleep(2)
+        
         status, output = self.target.run('pidof matchbox-terminal')
+        number_of_terminal = len(output.split())
+        self.assertEqual(number_of_terminal, 1, msg='There should be only one terminal being launched. Number of terminal launched : %s' % number_of_terminal)
         self.target.run('kill -9 %s' % output)
-        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')   
+        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')     
-- 
2.7.4

