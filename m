Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.54284.1600057669022825861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 21:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: DfIFqhtR8s/Y8hE5FVBje8bQrFOiR9YAIGxiPo37oXzzl3vBxB91RRVrBagaRGeI2yvWh2a+74
 cytbvNoNEMCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="156466067"
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
   d="scan'208";a="156466067"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2020 21:27:48 -0700
IronPort-SDR: YQ3uquIV7ms768smjgsFyYDxyfhR+x4G6P/jW/uAvhxUKNPGqQDggGOCXzCtlj8CmcA9ZD6wlC
 ZwTEHDUiwNWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,424,1592895600"; 
   d="scan'208";a="450724405"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2020 21:27:47 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime: add test for matchbox-terminal
Date: Mon, 14 Sep 2020 12:27:41 +0800
Message-Id: <1600057661-71125-1-git-send-email-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.7.4

From: TeohJayShen <jay.shen.teoh@intel.com>

This test is checking that the terminal application is able to run. The click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw can be replace by this runtime test.

Signed-off-by: TeohJayShen <jay.shen.teoh@intel.com>
---
 meta/lib/oeqa/runtime/cases/terminal.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/terminal.py

diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
new file mode 100644
index 0000000..a268f26
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -0,0 +1,18 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+import threading
+import time
+
+class TerminalTest(OERuntimeTestCase):
+
+    @OEHasPackage(['matchbox-terminal'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_terminal_running(self):
+        t_thread = threading.Thread(target=self.target.run, args=('export DISPLAY=:0 && matchbox-terminal',))
+        t_thread.start()
+        time.sleep(2)
+        status, output = self.target.run('pidof matchbox-terminal')
+        self.target.run('kill -9 %s' % output)
+        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')   
-- 
2.7.4

