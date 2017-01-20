Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 628C3771D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567447"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:46 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:55 -0600
Message-Id: <24fbfb8be638fce4f9d6e0234f54c6f23040d164.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 24/55] oeqa/sdk/cases: Migrate tests to the new OEQA framework
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Summary of the changes:

- Remove auto extend_path using pkgutil at __init__, is not needed.
- Change base class to OESDKTestCase.
- Add td_vars attr to set dependencies of certain variables in test
data.
- Change skips from module level to class level because Test context
  (tc)
now isn't at module level.
- Variable names changes to be consistent (i.e. sdktestdir ->
  sdk_dir).

[YOCTO #10599]

- Don't use bb.utils functions use instead remove_safe and shutil
  for copy files.
- SDKBuildProject pass test data variables instead of call getVar
  inside.

[YOCTO #10231]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/sdk/cases/__init__.py        |  3 ---
 meta/lib/oeqa/sdk/cases/buildcvs.py        | 15 ++++++-----
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 28 ++++++++++++--------
 meta/lib/oeqa/sdk/cases/buildiptables.py   | 16 +++++++-----
 meta/lib/oeqa/sdk/cases/gcc.py             | 41 +++++++++++++++++-------------
 meta/lib/oeqa/sdk/cases/perl.py            | 25 +++++++++---------
 meta/lib/oeqa/sdk/cases/python.py          | 25 +++++++++---------
 7 files changed, 84 insertions(+), 69 deletions(-)
 delete mode 100644 meta/lib/oeqa/sdk/cases/__init__.py

diff --git a/meta/lib/oeqa/sdk/cases/__init__.py b/meta/lib/oeqa/sdk/cases/__init__.py
deleted file mode 100644
index 4cf3fa7..0000000
--- a/meta/lib/oeqa/sdk/cases/__init__.py
+++ /dev/null
@@ -1,3 +0,0 @@
-# Enable other layers to have tests in the same named directory
-from pkgutil import extend_path
-__path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oeqa/sdk/cases/buildcvs.py b/meta/lib/oeqa/sdk/cases/buildcvs.py
index c7146fa..ee7fb73 100644
--- a/meta/lib/oeqa/sdk/cases/buildcvs.py
+++ b/meta/lib/oeqa/sdk/cases/buildcvs.py
@@ -1,13 +1,16 @@
-from oeqa.oetest import oeSDKTest, skipModule
-from oeqa.utils.decorators import *
-from oeqa.utils.targetbuild import SDKBuildProject
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
-class BuildCvsTest(oeSDKTest):
+class BuildCvsTest(OESDKTestCase):
+    td_vars = ['TEST_LOG_DIR', 'DATETIME']
 
     @classmethod
     def setUpClass(self):
-        self.project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/cvs/", oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
-                        "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
+        dl_dir = self.td.get('DL_DIR', None)
+
+        self.project = SDKBuildProject(self.tc.sdk_dir + "/cvs/", self.tc.sdk_env,
+                        "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2",
+                        self.td['TEST_LOG_DIR'], self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
     def test_cvs(self):
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index dc2fa9c..d2c1189 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -1,17 +1,25 @@
-from oeqa.oetest import oeSDKTest, skipModule
-from oeqa.utils.decorators import *
-from oeqa.utils.targetbuild import SDKBuildProject
+import unittest
 
-def setUpModule():
-    if not (oeSDKTest.hasPackage("gtk+3") or oeSDKTest.hasPackage("libgtk-3.0")):
-        skipModule("Image doesn't have gtk+3 in manifest")
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
+
+class GalculatorTest(OESDKTestCase):
+    td_vars = ['TEST_LOG_DIR', 'DATETIME']
+
+    @classmethod
+    def setUpClass(self):
+        if not (self.tc.hasTargetPackage("gtk+3") or\
+                self.tc.hasTargetPackage("libgtk-3.0")):
+            raise unittest.SkipTest("%s class: SDK don't support gtk+3" % self.__name__)
 
-class GalculatorTest(oeSDKTest):
     def test_galculator(self):
+        dl_dir = self.td.get('DL_DIR', None)
+        project = None
         try:
-            project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/galculator/",
-                                      oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
-                                      "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2")
+            project = SDKBuildProject(self.tc.sdk_dir + "/galculator/",
+                                      self.tc.sdk_env,
+                                      "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2",
+                                      self.td['TEST_LOG_DIR'], self.td['DATETIME'], dl_dir=dl_dir)
 
             project.download_archive()
 
diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildiptables.py
index f0cb8a4..a50fb5d 100644
--- a/meta/lib/oeqa/sdk/cases/buildiptables.py
+++ b/meta/lib/oeqa/sdk/cases/buildiptables.py
@@ -1,14 +1,16 @@
-from oeqa.oetest import oeSDKTest
-from oeqa.utils.decorators import *
-from oeqa.utils.targetbuild import SDKBuildProject
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
-
-class BuildIptablesTest(oeSDKTest):
+class BuildIptablesTest(OESDKTestCase):
+    td_vars = ['TEST_LOG_DIR', 'DATETIME']
 
     @classmethod
     def setUpClass(self):
-        self.project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/iptables/", oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
-                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2")
+        dl_dir = self.td.get('DL_DIR', None)
+
+        self.project = SDKBuildProject(self.tc.sdk_dir + "/iptables/", self.tc.sdk_env, 
+                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2",
+                        self.td['TEST_LOG_DIR'], self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
     def test_iptables(self):
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index f3f4341..e06af4c 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -1,36 +1,43 @@
-import unittest
 import os
 import shutil
-from oeqa.oetest import oeSDKTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    machine = oeSDKTest.tc.d.getVar("MACHINE")
-    if not oeSDKTest.hasHostPackage("packagegroup-cross-canadian-" + machine):
-        skipModule("SDK doesn't contain a cross-canadian toolchain")
+import unittest
 
+from oeqa.core.utils.path import remove_safe
+from oeqa.sdk.case import OESDKTestCase
 
-class GccCompileTest(oeSDKTest):
+class GccCompileTest(OESDKTestCase):
+    td_vars = ['MACHINE']
 
     @classmethod
     def setUpClass(self):
-        for f in ['test.c', 'test.cpp', 'testsdkmakefile']:
-            shutil.copyfile(os.path.join(self.tc.filesdir, f), self.tc.sdktestdir + f)
+        files = {'test.c' : self.tc.files_dir, 'test.cpp' : self.tc.files_dir,
+                'testsdkmakefile' : self.tc.sdk_files_dir} 
+        for f in files:
+            shutil.copyfile(os.path.join(files[f], f),
+                    os.path.join(self.tc.sdk_dir, f))
+
+    def setUp(self):
+        machine = self.td.get("MACHINE")
+        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
+            raise unittest.SkipTest("%s class: SDK doesn't contain a cross-canadian toolchain",
+                    self.__name__)
 
     def test_gcc_compile(self):
-        self._run('$CC %s/test.c -o %s/test -lm' % (self.tc.sdktestdir, self.tc.sdktestdir))
+        self._run('$CC %s/test.c -o %s/test -lm' % (self.tc.sdk_dir, self.tc.sdk_dir))
 
     def test_gpp_compile(self):
-        self._run('$CXX %s/test.c -o %s/test -lm' % (self.tc.sdktestdir, self.tc.sdktestdir))
+        self._run('$CXX %s/test.c -o %s/test -lm' % (self.tc.sdk_dir, self.tc.sdk_dir))
 
     def test_gpp2_compile(self):
-        self._run('$CXX %s/test.cpp -o %s/test -lm' % (self.tc.sdktestdir, self.tc.sdktestdir))
+        self._run('$CXX %s/test.cpp -o %s/test -lm' % (self.tc.sdk_dir, self.tc.sdk_dir))
 
     def test_make(self):
-        self._run('cd %s; make -f testsdkmakefile' % self.tc.sdktestdir)
+        self._run('cd %s; make -f testsdkmakefile' % self.tc.sdk_dir)
 
     @classmethod
     def tearDownClass(self):
-        files = [self.tc.sdktestdir + f for f in ['test.c', 'test.cpp', 'test.o', 'test', 'testsdkmakefile']]
+        files = [os.path.join(self.tc.sdk_dir, f) \
+                for f in ['test.c', 'test.cpp', 'test.o', 'test',
+                    'testsdkmakefile']]
         for f in files:
-            bb.utils.remove(f)
+            remove_safe(f)
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index 45f422e..e1bded2 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -1,28 +1,27 @@
-import unittest
 import os
 import shutil
-from oeqa.oetest import oeSDKTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeSDKTest.hasHostPackage("nativesdk-perl"):
-        skipModule("No perl package in the SDK")
-
+import unittest
 
-class PerlTest(oeSDKTest):
+from oeqa.core.utils.path import remove_safe
+from oeqa.sdk.case import OESDKTestCase
 
+class PerlTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
+        if not self.tc.hasHostPackage("nativesdk-perl"):
+            raise unittest.SkipTest("No perl package in the SDK")
+
         for f in ['test.pl']:
-            shutil.copyfile(os.path.join(self.tc.filesdir, f), self.tc.sdktestdir + f)
-        self.testfile = self.tc.sdktestdir + "test.pl"
+            shutil.copyfile(os.path.join(self.tc.files_dir, f),
+                    os.path.join(self.tc.sdk_dir, f))
+        self.testfile = os.path.join(self.tc.sdk_dir, "test.pl")
 
     def test_perl_exists(self):
         self._run('which perl')
 
     def test_perl_works(self):
-        self._run('perl %s/test.pl' % self.tc.sdktestdir)
+        self._run('perl %s' % self.testfile)
 
     @classmethod
     def tearDownClass(self):
-        bb.utils.remove("%s/test.pl" % self.tc.sdktestdir)
+        remove_safe(self.testfile)
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index 896fab4..94a296f 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -1,26 +1,25 @@
-import unittest
 import os
 import shutil
-from oeqa.oetest import oeSDKTest, skipModule
-from oeqa.utils.decorators import *
-
-def setUpModule():
-    if not oeSDKTest.hasHostPackage("nativesdk-python"):
-        skipModule("No python package in the SDK")
-
+import unittest
 
-class PythonTest(oeSDKTest):
+from oeqa.core.utils.path import remove_safe
+from oeqa.sdk.case import OESDKTestCase
 
+class PythonTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
+        if not self.tc.hasHostPackage("nativesdk-python"):
+            raise unittest.SkipTest("No python package in the SDK")
+
         for f in ['test.py']:
-            shutil.copyfile(os.path.join(self.tc.filesdir, f), self.tc.sdktestdir + f)
+            shutil.copyfile(os.path.join(self.tc.files_dir, f),
+                   os.path.join(self.tc.sdk_dir, f))
 
     def test_python_exists(self):
         self._run('which python')
 
     def test_python_stdout(self):
-        output = self._run('python %s/test.py' % self.tc.sdktestdir)
+        output = self._run('python %s/test.py' % self.tc.sdk_dir)
         self.assertEqual(output.strip(), "the value of a is 0.01", msg="Incorrect output: %s" % output)
 
     def test_python_testfile(self):
@@ -28,5 +27,5 @@ class PythonTest(oeSDKTest):
 
     @classmethod
     def tearDownClass(self):
-        bb.utils.remove("%s/test.py" % self.tc.sdktestdir)
-        bb.utils.remove("/tmp/testfile.python")
+        remove_safe("%s/test.py" % self.tc.sdk_dir)
+        remove_safe("/tmp/testfile.python")
-- 
2.1.4


