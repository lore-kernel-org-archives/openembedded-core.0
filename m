Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 051DC6C660
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:16:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 20:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,289,1539673200"; d="scan'208";a="96057628"
Received: from thivuong-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.255.138.218])
	by orsmga008.jf.intel.com with ESMTP; 27 Nov 2018 20:16:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:16:17 +1300
Message-Id: <4366ab6172fbfc210bc85d2c8f2e3fd0c4b8248b.1543378296.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1543378296.git.paul.eggleton@linux.intel.com>
References: <cover.1543378296.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] oe-selftest: add some tests for recipeutils module
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
X-List-Received-Date: Wed, 28 Nov 2018 04:16:42 -0000

Add some tests for functions in meta/lib/oe/recipeutils.py, in
particular for a few issues I've just fixed. I haven't added tests for
all of the functions - some of them are already being tested via devtool
in any case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/recipeutils.py | 135 ++++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/recipeutils.py

diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
new file mode 100644
index 00000000000..c7036c7f04e
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -0,0 +1,135 @@
+import os
+import re
+import time
+import logging
+import bb.tinfoil
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd
+from oeqa.core.decorator.oeid import OETestID
+
+
+def setUpModule():
+    global tinfoil
+    tinfoil = bb.tinfoil.Tinfoil(tracking=True)
+    tinfoil.prepare(config_only=False, quiet=2)
+
+
+def tearDownModule():
+    tinfoil.shutdown()
+
+
+class RecipeUtilsTests(OESelftestTestCase):
+    """ Tests for the recipeutils module functions """
+
+    def test_patch_recipe_varflag(self):
+        import oe.recipeutils
+        rd = tinfoil.parse_recipe('python3-async-test')
+        vals = {'SRC_URI[md5sum]': 'woot', 'LICENSE': 'something'}
+        patches = oe.recipeutils.patch_recipe(rd, rd.getVar('FILE'), vals, patch=True)
+
+        expected_patch = """
+--- a/../meta-selftest/recipes-devtools/python/python-async-test.inc
++++ b/../meta-selftest/recipes-devtools/python/python-async-test.inc
+@@ -1,14 +1,14 @@
+ SUMMARY = "Python framework to process interdependent tasks in a pool of workers"
+ HOMEPAGE = "http://github.com/gitpython-developers/async"
+ SECTION = "devel/python"
+-LICENSE = "BSD"
++LICENSE = "something"
+ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
+ 
+ inherit pypi
+ 
+ PYPI_PACKAGE = "async"
+ 
+-SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
++SRC_URI[md5sum] = "woot"
+ SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
+ 
+ RDEPENDS_${PN} += "${PYTHON_PN}-threading"
+"""
+        patchlines = []
+        for f in patches:
+            for line in f:
+                patchlines.append(line)
+        self.maxDiff = None
+        self.assertEqual(''.join(patchlines).strip(), expected_patch.strip())
+
+
+    def test_patch_recipe_singleappend(self):
+        import oe.recipeutils
+        rd = tinfoil.parse_recipe('recipeutils-test')
+        val = rd.getVar('SRC_URI', False).split()
+        del val[1]
+        val = ' '.join(val)
+        vals = {'SRC_URI': val}
+        patches = oe.recipeutils.patch_recipe(rd, rd.getVar('FILE'), vals, patch=True)
+
+        expected_patch = """
+--- a/../meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
++++ b/../meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+@@ -8,6 +8,4 @@
+ 
+ BBCLASSEXTEND = "native nativesdk"
+ 
+-SRC_URI += "file://somefile"
+-
+ SRC_URI_append = " file://anotherfile"
+"""
+        patchlines = []
+        for f in patches:
+            for line in f:
+                patchlines.append(line)
+        self.assertEqual(''.join(patchlines).strip(), expected_patch.strip())
+
+
+    def test_patch_recipe_appends(self):
+        import oe.recipeutils
+        rd = tinfoil.parse_recipe('recipeutils-test')
+        val = rd.getVar('SRC_URI', False).split()
+        vals = {'SRC_URI': val[0]}
+        patches = oe.recipeutils.patch_recipe(rd, rd.getVar('FILE'), vals, patch=True)
+
+        expected_patch = """
+--- a/../meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
++++ b/../meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+@@ -8,6 +8,3 @@
+ 
+ BBCLASSEXTEND = "native nativesdk"
+ 
+-SRC_URI += "file://somefile"
+-
+-SRC_URI_append = " file://anotherfile"
+"""
+        patchlines = []
+        for f in patches:
+            for line in f:
+                patchlines.append(line)
+        self.assertEqual(''.join(patchlines).strip(), expected_patch.strip())
+
+
+    def test_validate_pn(self):
+        import oe.recipeutils
+        expected_results = {
+            'test': '',
+            'glib-2.0': '',
+            'gtk+': '',
+            'forcevariable': 'reserved',
+            'pn-something': 'reserved',
+            'test.bb': 'file',
+            'test_one': 'character',
+            'test!': 'character',
+        }
+
+        for pn, expected in expected_results.items():
+            result = oe.recipeutils.validate_pn(pn)
+            if expected:
+                self.assertIn(expected, result)
+            else:
+                self.assertEqual(result, '')
+
+    def test_split_var_value(self):
+        import oe.recipeutils
+        res = oe.recipeutils.split_var_value('test.1 test.2 ${@call_function("hi there world", false)} test.4')
+        self.assertEqual(res, ['test.1', 'test.2', '${@call_function("hi there world", false)}', 'test.4'])
-- 
2.17.2


