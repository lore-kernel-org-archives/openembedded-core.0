Return-Path: <libertad.cruz@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD4777D2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 20:14:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jul 2017 13:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,342,1496127600"; d="scan'208";a="1150111202"
Received: from liberta1-mobl1.zpn.intel.com ([10.219.128.130])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2017 13:15:00 -0700
From: libertad.cruz@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jul 2017 15:22:29 -0500
Message-Id: <1499718149-29243-1-git-send-email-libertad.cruz@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Libertad Cruz <libertad.cruz@intel.com>
Subject: [PATCH v2] opkg.py Adds tests for ipk/opkg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jul 2017 20:15:00 -0000

From: Libertad Cruz <libertad.cruz@intel.com>

Adds opkg selftest tests cases which exercises basic functional operation of the opkg package manager.

[YOCTO #11488]

Signed-off-by: Libertad Cruz <libertad.cruz@intel.com>
---
 meta/lib/oeqa/runtime/cases/opkg.py | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/opkg.py

diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
new file mode 100644
index 0000000..3e76176
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -0,0 +1,51 @@
+import os
+import re
+import subprocess
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class opkgTest(OERuntimeTestCase):
+    def opkg(self, command, expected = 0):
+        command = 'opkg %s' % command
+        status, output = self.target.run(command, 1500)
+        message = os.linesep.join([command, output])
+        self.assertEqual(status, expected, message)
+        return output
+
+class opkgBasicTest(opkgTest):
+    @skipIfNotFeature('package-management', 'Test requires package-management to be in IMAGE_FEATURES')
+    @skipIfNotDataVar('IMAGE_PKGTYPE','ipk', 'IPK is not the primary package manager')
+    @OEHasPackage(['opkg'])
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OETestID(1841)
+    def test_opkg_list(self):
+       self.opkg('list')
+
+    @OETestID(1842)
+    def test_opkg_list_installed(self):
+       self.opkg('list-installed')
+
+    @OETestID(1843)
+    def test_opkg_depends(self):
+       self.opkg('depends opkg')
+
+    @OETestID(1837)
+    def test_opkg_whatdepends(self):
+      self.opkg('whatdepends opkg')
+
+    @OETestID(1838)
+    def test_opkg_status(self):
+      self.opkg('status')
+
+    @OETestID(1839)
+    def test_opkg_info(self):
+        self.opkg('info opkg')
+
+    @OETestID(1840)
+    def test_opkg_print_architecture(self):
+        self.opkg('print-architecture')
-- 
2.1.4


