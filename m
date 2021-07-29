Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.3568.1627521733639931669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 18:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="193060290"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="193060290"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 18:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="517870866"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2021 18:22:11 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][Patch 6/7] oeqa/terminal : improve the test case
Date: Thu, 29 Jul 2021 09:21:22 +0800
Message-Id: <20210729012123.27489-6-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729012123.27489-1-jay.shen.teoh@intel.com>
References: <20210729012123.27489-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

-Improve this test case to fulfill the requirements of replacing the click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw :
1) verify that the terminal window is working without problem
2) verify that there's only 1 terminal window is launched

(From OE-Core rev: 824713174fae0617240a236d1bbfd2929bf4b24f)

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/terminal.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
index a268f26880..8fcca99f47 100644
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
2.32.0

