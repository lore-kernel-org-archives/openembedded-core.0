Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 69C676BC7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 23:38:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 15:38:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,296,1539673200"; d="scan'208";a="94287183"
Received: from vsiribox-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.174.172])
	by orsmga007.jf.intel.com with ESMTP; 29 Nov 2018 15:38:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 12:38:28 +1300
Message-Id: <20181129233828.10908-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181129092115.28502-1-paul.eggleton@linux.intel.com>
References: <20181129092115.28502-1-paul.eggleton@linux.intel.com>
Subject: [PATCH v4 4/4] oe-selftest: add some tests for recipeutils module
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
X-List-Received-Date: Thu, 29 Nov 2018 23:38:39 -0000

Add some tests for functions in meta/lib/oe/recipeutils.py, in
particular for a few issues I've just fixed. I haven't added tests for
all of the functions - some of them are already being tested via devtool
in any case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-async-test.inc              |  16 ++
 .../python/python3-async-test_0.6.2.bb        |   2 +
 .../recipeutils/recipeutils-test.inc          |   5 +
 .../recipeutils/recipeutils-test/anotherfile  |   0
 .../recipeutils/recipeutils-test/somefile     |   0
 .../recipeutils/recipeutils-test_1.2.bb       |  13 ++
 meta/lib/oeqa/selftest/cases/recipeutils.py   | 137 ++++++++++++++++++
 7 files changed, 173 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/python/python-async-test.inc
 create mode 100644 meta-selftest/recipes-devtools/python/python3-async-test_0.6.2.bb
 create mode 100644 meta-selftest/recipes-test/recipeutils/recipeutils-test.inc
 create mode 100644 meta-selftest/recipes-test/recipeutils/recipeutils-test/anotherfile
 create mode 100644 meta-selftest/recipes-test/recipeutils/recipeutils-test/somefile
 create mode 100644 meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/recipeutils.py

diff --git a/meta-selftest/recipes-devtools/python/python-async-test.inc b/meta-selftest/recipes-devtools/python/python-async-test.inc
new file mode 100644
index 00000000000..c9602e8e52d
--- /dev/null
+++ b/meta-selftest/recipes-devtools/python/python-async-test.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Python framework to process interdependent tasks in a pool of workers"
+HOMEPAGE = "http://github.com/gitpython-developers/async"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
+
+inherit pypi
+
+PYPI_PACKAGE = "async"
+
+SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
+SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-threading"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-selftest/recipes-devtools/python/python3-async-test_0.6.2.bb b/meta-selftest/recipes-devtools/python/python3-async-test_0.6.2.bb
new file mode 100644
index 00000000000..22e241afb3c
--- /dev/null
+++ b/meta-selftest/recipes-devtools/python/python3-async-test_0.6.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-async-test.inc
diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test.inc b/meta-selftest/recipes-test/recipeutils/recipeutils-test.inc
new file mode 100644
index 00000000000..8490b902d75
--- /dev/null
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test.inc
@@ -0,0 +1,5 @@
+SRC_URI = "http://xorg.freedesktop.org/releases/individual/lib/libxshmfence-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
+SRC_URI[sha256sum] = "d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c"
+
diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test/anotherfile b/meta-selftest/recipes-test/recipeutils/recipeutils-test/anotherfile
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test/somefile b/meta-selftest/recipes-test/recipeutils/recipeutils-test/somefile
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
new file mode 100644
index 00000000000..f6da97b2d43
--- /dev/null
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Test recipe for recipeutils.patch_recipe()"
+
+require recipeutils-test.inc
+
+LICENSE = "Proprietary"
+
+DEPENDS += "virtual/libx11"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += "file://somefile"
+
+SRC_URI_append = " file://anotherfile"
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
new file mode 100644
index 00000000000..dd2f55839ae
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -0,0 +1,137 @@
+import os
+import re
+import time
+import logging
+import bb.tinfoil
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, get_test_layer
+from oeqa.core.decorator.oeid import OETestID
+
+
+def setUpModule():
+    global tinfoil
+    global metaselftestpath
+    metaselftestpath = get_test_layer()
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
+        vals = {'SRC_URI[md5sum]': 'aaaaaa', 'LICENSE': 'something'}
+        patches = oe.recipeutils.patch_recipe(rd, rd.getVar('FILE'), vals, patch=True, relpath=metaselftestpath)
+
+        expected_patch = """
+--- a/recipes-devtools/python/python-async-test.inc
++++ b/recipes-devtools/python/python-async-test.inc
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
++SRC_URI[md5sum] = "aaaaaa"
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
+        patches = oe.recipeutils.patch_recipe(rd, rd.getVar('FILE'), vals, patch=True, relpath=metaselftestpath)
+
+        expected_patch = """
+--- a/recipes-test/recipeutils/recipeutils-test_1.2.bb
++++ b/recipes-test/recipeutils/recipeutils-test_1.2.bb
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
+        patches = oe.recipeutils.patch_recipe(rd, rd.getVar('FILE'), vals, patch=True, relpath=metaselftestpath)
+
+        expected_patch = """
+--- a/recipes-test/recipeutils/recipeutils-test_1.2.bb
++++ b/recipes-test/recipeutils/recipeutils-test_1.2.bb
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


