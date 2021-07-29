Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.3565.1627521724546005785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 18:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="199999094"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="199999094"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 18:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="517870820"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jul 2021 18:22:02 -0700
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][Patch 5/7] oeqa/runtime: add test for matchbox-terminal
Date: Thu, 29 Jul 2021 09:21:21 +0800
Message-Id: <20210729012123.27489-5-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729012123.27489-1-jay.shen.teoh@intel.com>
References: <20210729012123.27489-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: TeohJayShen <jay.shen.teoh@intel.com>

This test is checking that the terminal application is able to run. The click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw can be replace by this runtime test.

(From OE-Core rev: cfa9c1ce853bfd31c1febe61d0f7ad9c5d35f709)

Signed-off-by: TeohJayShen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/terminal.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/terminal.py

diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
new file mode 100644
index 0000000000..a268f26880
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
2.32.0

