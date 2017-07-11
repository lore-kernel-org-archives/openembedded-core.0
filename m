Return-Path: <libertad.cruz@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BA3C2780A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:57:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 13:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="285660588"
Received: from liberta1-mobl1.zpn.intel.com ([10.219.128.130])
	by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2017 13:57:36 -0700
From: libertad.cruz@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 16:04:28 -0500
Message-Id: <1499807068-15802-1-git-send-email-libertad.cruz@intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Libertad Cruz <libertad.cruz@intel.com>
Subject: [PATCH] dpky.py: Adds testcases for dpkg package manager
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
X-List-Received-Date: Tue, 11 Jul 2017 20:57:36 -0000

From: Libertad Cruz <libertad.cruz@intel.com>

Adds dpkg testcases for testing basic operation functionality for the dpkg package manager.

[YOCTO #10063]

Signed-off-by: Libertad Cruz <libertad.cruz@intel.com>
---
 meta/lib/oeqa/runtime/cases/dpkg.py | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/dpkg.py

diff --git a/meta/lib/oeqa/runtime/cases/dpkg.py b/meta/lib/oeqa/runtime/cases/dpkg.py
new file mode 100644
index 0000000..cd1183c
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/dpkg.py
@@ -0,0 +1,52 @@
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
+
+class dpkgTest(OERuntimeTestCase):
+    def dpkg(self, command, expected=0):
+        status, output = self.target.run(command, 1500)
+        message = os.linesep.join([command, output])
+        self.assertEqual(status, expected, message)
+        return output
+
+class dpkgBasicTest(dpkgTest):
+    @skipIfNotFeature('package-management','Test requires package-management to be in IMAGE_FEATURES')
+    @skipIfNotDataVar('IMAGE_PKGTYPE','deb','DEB is not the primary package manager')
+    @OEHasPackage(['dpkg'])
+    
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OETestID(1801)
+    def test_dpkg_help(self):
+        self.dpkg('dpkg --help')
+
+    @OETestDepends(['dpkg.dpkgBasicTest.test_dpkg_help'])
+    @OETestID(1802)
+    def test_dpkg_version(self):
+        self.dpkg('dpkg --version')
+
+    @OETestID(1803)
+    def test_dpkg_Dhelp(self):
+        self.dpkg('dpkg -Dhelp')
+
+    @OETestID(1805)
+    def test_dpkg_force_help(self):
+        self.dpkg('dpkg --force-help')
+
+    @OETestID(1806)
+    def test_dpkg_deb_help(self):
+        self.dpkg('dpkg-deb --help')
+
+    @OETestID(1812)
+    def test_dpkg_status(self):
+        self.dpkg('dpkg -s dpkg')
+
+    @OETestID(1814)
+    def test_dpkg_list(self):
+        self.dpkg('dpkg -l')
-- 
2.1.4


