Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C8B6471AD9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 16:16:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jun 2017 09:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,373,1493708400"; d="scan'208";a="1163523708"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2017 09:16:39 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jun 2017 09:16:32 -0700
Message-Id: <20170622161632.42163-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Cc: Mariano Lopez <mariano.lopez@linux.intel.com>
Subject: [PATCH] selftest/seltest.py: Add test to check imports from other layers
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
X-List-Received-Date: Thu, 22 Jun 2017 16:16:42 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

This tests adds a check of selftest itself to verify if can
add test from other layers.

[YOCTO #9770]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 .../lib/oeqa/selftest/cases/external-layer.py      | 16 +++++++
 meta/lib/oeqa/selftest/cases/selftest.py           | 51 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/selftest/cases/external-layer.py
 create mode 100644 meta/lib/oeqa/selftest/cases/selftest.py

diff --git a/meta-selftest/lib/oeqa/selftest/cases/external-layer.py b/meta-selftest/lib/oeqa/selftest/cases/external-layer.py
new file mode 100644
index 00000000000..59b1afab7d1
--- /dev/null
+++ b/meta-selftest/lib/oeqa/selftest/cases/external-layer.py
@@ -0,0 +1,16 @@
+#from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.case import OESelftestTestCase
+#from oeqa.utils.decorators import testcase
+
+
+class ImportedTests(OESelftestTestCase):
+
+    def test_unconditional_pass(self):
+        """
+        Summary: Doesn't check anything, used to check import test from other layers.
+        Expected: 1. Pass unconditionally
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com
+        """
+
+        self.assertEqual(True, True, msg = "Impossible to fail this test")
diff --git a/meta/lib/oeqa/selftest/cases/selftest.py b/meta/lib/oeqa/selftest/cases/selftest.py
new file mode 100644
index 00000000000..4b3cb144638
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/selftest.py
@@ -0,0 +1,51 @@
+import importlib
+from oeqa.utils.commands import runCmd
+import oeqa.selftest
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
+
+class ExternalLayer(OESelftestTestCase):
+
+    @OETestID(1885)
+    def test_list_imported(self):
+        """
+        Summary: Checks functionality to import tests from other layers.
+        Expected: 1. File "external-layer.py" must be in
+        oeqa.selftest.__path__
+                  2. test_unconditional_pas method must exists
+                     in ImportedTests class
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        test_file = "external-layer.py"
+        test_module = "oeqa.selftest.cases.external-layer"
+        method_name = "test_unconditional_pass"
+
+        # Check if "external-layer.py" is in oeqa path
+        found_file = search_test_file(test_file)
+        self.assertTrue(found_file, msg="Can't find %s in the oeqa path" % test_file)
+
+        # Import oeqa.selftest.external-layer module and search for
+        # test_unconditional_pass method of ImportedTests class
+        found_method = search_method(test_module, method_name)
+        self.assertTrue(method_name, msg="Can't find %s method" % method_name)
+
+def search_test_file(file_name):
+    for layer_path in oeqa.selftest.__path__:
+        for _, _, files in os.walk(layer_path):
+            for f in files:
+                if f == file_name:
+                    return True
+    return False
+
+def search_method(module, method):
+    modlib = importlib.import_module(module)
+    for var in vars(modlib):
+        klass = vars(modlib)[var]
+        if isinstance(klass, type(OESelftestTestCase)) and issubclass(klass, OESelftestTestCase):
+            for m in dir(klass):
+                if m == method:
+                    return True
+    return False
+
-- 
2.12.0


