Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BCB0670178
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 21:36:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 20 Jul 2016 14:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,396,1464678000"; d="scan'208";a="737410506"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2016 14:36:16 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 13:29:40 +0000
Message-Id: <4dce7adf2ce4a5cde1679d5a7bea15cc4e641739.1469021121.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1469021121.git.mariano.lopez@linux.intel.com>
References: <cover.1469021121.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1469021121.git.mariano.lopez@linux.intel.com>
References: <cover.1469021121.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 1/1] selftest/seltest.py: Add test to check imports from other layers
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
X-List-Received-Date: Wed, 20 Jul 2016 21:36:19 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This tests adds a check of selftest itself to verify if can
add test from other layers.

[YOCTO #9770]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta-selftest/lib/oeqa/selftest/external-layer.py | 14 +++++++
 meta/lib/oeqa/selftest/selftest.py                | 50 +++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-selftest/lib/oeqa/selftest/external-layer.py
 create mode 100644 meta/lib/oeqa/selftest/selftest.py

diff --git a/meta-selftest/lib/oeqa/selftest/external-layer.py b/meta-selftest/lib/oeqa/selftest/external-layer.py
new file mode 100644
index 0000000..224ab36
--- /dev/null
+++ b/meta-selftest/lib/oeqa/selftest/external-layer.py
@@ -0,0 +1,14 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.decorators import testcase
+
+class ImportedTests(oeSelfTest):
+
+    def test_unconditional_pass(self):
+        """
+        Summary: Doesn't check anything, used to check import test from other layers.
+        Expected: 1. Pass unconditionally
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.comr
+        """
+
+        self.assertEqual(True, True, msg = "Impossible to fail this test")
diff --git a/meta/lib/oeqa/selftest/selftest.py b/meta/lib/oeqa/selftest/selftest.py
new file mode 100644
index 0000000..7850c4b
--- /dev/null
+++ b/meta/lib/oeqa/selftest/selftest.py
@@ -0,0 +1,50 @@
+import importlib
+import oeqa.selftest
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd
+from oeqa.utils.decorators import testcase
+
+class ExternalLayer(oeSelfTest):
+
+    def test_list_imported(self):
+        """
+        Summary: Checks functionality to import tests from other layers.
+        Expected: 1. File "external-layer.py" must be in
+                     oeqa.selftest.__path__
+                  2. test_unconditional_pass method must exists
+                     in ImportedTests class
+        Product: oe-core
+        Author: Mariano Lopez <mariano.lopez@intel.com>
+        """
+
+        #test_name = "external-layer.ImportedTests.test_unconditional_pass"
+        test_file = "external-layer.py"
+        test_module = "oeqa.selftest.external-layer"
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
+        if isinstance(klass, type(oeSelfTest)) and issubclass(klass, oeSelfTest):
+            for m in dir(klass):
+                if m == method:
+                    return True
+    return False
-- 
2.6.6


