Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0B9771D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567461"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:48 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:00 -0600
Message-Id: <9048c0abcec229dccea9963a1fe8366098e8f54d.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 29/55] oeqa/sdkext/cases: Migrate test case to new OEQA framework
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Summary,

- Changes base case class to OESDKExtTest.
- Changes decorator classes to new ones.
- Chnages variable names sdktestdir -> sdk_dir.
- Added missing license to MIT.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py |  2 +-
 meta/lib/oeqa/sdk/cases/gcc.py             |  3 +-
 meta/lib/oeqa/sdkext/cases/devtool.py      | 49 ++++++++++++++++--------------
 meta/lib/oeqa/sdkext/cases/sdk_update.py   | 17 ++++++-----
 4 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index bdc8b6a..42e8ddb 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -10,7 +10,7 @@ class GalculatorTest(OESDKTestCase):
     def setUpClass(self):
         if not (self.tc.hasTargetPackage("gtk+3") or\
                 self.tc.hasTargetPackage("libgtk-3.0")):
-            raise unittest.SkipTest("%s class: SDK don't support gtk+3" % self.__name__)
+            raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
 
     def test_galculator(self):
         dl_dir = self.td.get('DL_DIR', None)
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index e06af4c..74ad2a2 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -19,8 +19,7 @@ class GccCompileTest(OESDKTestCase):
     def setUp(self):
         machine = self.td.get("MACHINE")
         if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
-            raise unittest.SkipTest("%s class: SDK doesn't contain a cross-canadian toolchain",
-                    self.__name__)
+            raise unittest.SkipTest("GccCompileTest class: SDK doesn't contain a cross-canadian toolchain")
 
     def test_gcc_compile(self):
         self._run('$CC %s/test.c -o %s/test -lm' % (self.tc.sdk_dir, self.tc.sdk_dir))
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 65f41f6..da0050c 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -1,18 +1,22 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
 import shutil
 import subprocess
-import urllib.request
-from oeqa.oetest import oeSDKExtTest
-from oeqa.utils.decorators import *
 
-class DevtoolTest(oeSDKExtTest):
+from oeqa.sdkext.case import OESDKExtTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+
+class DevtoolTest(OESDKExtTestCase):
     @classmethod
     def setUpClass(self):
-        self.myapp_src = os.path.join(self.tc.sdkextfilesdir, "myapp")
-        self.myapp_dst = os.path.join(self.tc.sdktestdir, "myapp")
+        self.myapp_src = os.path.join(self.tc.esdk_files_dir, "myapp")
+        self.myapp_dst = os.path.join(self.tc.sdk_dir, "myapp")
         shutil.copytree(self.myapp_src, self.myapp_dst)
 
-        self.myapp_cmake_src = os.path.join(self.tc.sdkextfilesdir, "myapp_cmake")
-        self.myapp_cmake_dst = os.path.join(self.tc.sdktestdir, "myapp_cmake")
+        self.myapp_cmake_src = os.path.join(self.tc.esdk_files_dir, "myapp_cmake")
+        self.myapp_cmake_dst = os.path.join(self.tc.sdk_dir, "myapp_cmake")
         shutil.copytree(self.myapp_cmake_src, self.myapp_cmake_dst)
 
     def _test_devtool_build(self, directory):
@@ -37,31 +41,31 @@ class DevtoolTest(oeSDKExtTest):
 
     def test_devtool_location(self):
         output = self._run('which devtool')
-        self.assertEqual(output.startswith(self.tc.sdktestdir), True, \
+        self.assertEqual(output.startswith(self.tc.sdk_dir), True, \
             msg="Seems that devtool isn't the eSDK one: %s" % output)
     
-    @skipUnlessPassed('test_devtool_location')
+    @OETestDepends(['test_devtool_location'])
     def test_devtool_add_reset(self):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool reset myapp')
     
-    @testcase(1473)
-    @skipUnlessPassed('test_devtool_location')
+    @OETestID(1473)
+    @OETestDepends(['test_devtool_location'])
     def test_devtool_build_make(self):
         self._test_devtool_build(self.myapp_dst)
     
-    @testcase(1474)
-    @skipUnlessPassed('test_devtool_location')
+    @OETestID(1474)
+    @OETestDepends(['test_devtool_location'])
     def test_devtool_build_esdk_package(self):
         self._test_devtool_build_package(self.myapp_dst)
 
-    @testcase(1479)
-    @skipUnlessPassed('test_devtool_location')
+    @OETestID(1479)
+    @OETestDepends(['test_devtool_location'])
     def test_devtool_build_cmake(self):
         self._test_devtool_build(self.myapp_cmake_dst)
     
-    @testcase(1482)
-    @skipUnlessPassed('test_devtool_location')
+    @OETestID(1482)
+    @OETestDepends(['test_devtool_location'])
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
         recipe = "bbexample"
@@ -74,8 +78,8 @@ class DevtoolTest(oeSDKExtTest):
             raise e
         self._run('devtool reset %s' % recipe)
 
-    @testcase(1484)
-    @skipUnlessPassed('test_devtool_location')
+    @OETestID(1484)
+    @OETestDepends(['test_devtool_location'])
     def test_devtool_kernelmodule(self):
         docfile = 'https://github.com/umlaeute/v4l2loopback.git'
         recipe = 'v4l2loopback-driver'
@@ -88,8 +92,8 @@ class DevtoolTest(oeSDKExtTest):
             raise e
         self._run('devtool reset %s' % recipe)
 
-    @testcase(1478)
-    @skipUnlessPassed('test_devtool_location')
+    @OETestID(1478)
+    @OETestDepends(['test_devtool_location'])
     def test_recipes_for_nodejs(self):
         package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"
         self._run('devtool add %s ' % package_nodejs)
@@ -101,7 +105,6 @@ class DevtoolTest(oeSDKExtTest):
             raise e
         self._run('devtool reset %s '% package_nodejs)
 
-
     @classmethod
     def tearDownClass(self):
         shutil.rmtree(self.myapp_dst)
diff --git a/meta/lib/oeqa/sdkext/cases/sdk_update.py b/meta/lib/oeqa/sdkext/cases/sdk_update.py
index 2ade839..2f8598b 100644
--- a/meta/lib/oeqa/sdkext/cases/sdk_update.py
+++ b/meta/lib/oeqa/sdkext/cases/sdk_update.py
@@ -1,23 +1,26 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
 import os
 import shutil
 import subprocess
 
-from oeqa.oetest import oeSDKExtTest
+from oeqa.sdkext.case import OESDKExtTestCase
 from oeqa.utils.httpserver import HTTPService
 
-class SdkUpdateTest(oeSDKExtTest):
-
+class SdkUpdateTest(OESDKExtTestCase):
     @classmethod
     def setUpClass(self):
-        self.publish_dir = os.path.join(self.tc.sdktestdir, 'esdk_publish')
+        self.publish_dir = os.path.join(self.tc.sdk_dir, 'esdk_publish')
         if os.path.exists(self.publish_dir):
             shutil.rmtree(self.publish_dir)
         os.mkdir(self.publish_dir)
 
-        tcname_new = self.tc.d.expand(
-            "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}-new.sh")
+        base_tcname = "%s/%s" % (self.td.get("SDK_DEPLOY", ''),
+            self.td.get("TOOLCHAINEXT_OUTPUTNAME", ''))
+        tcname_new = "%s-new.sh" % base_tcname
         if not os.path.exists(tcname_new):
-            tcname_new = self.tc.tcname
+            tcname_new = "%s.sh" % base_tcname
 
         cmd = 'oe-publish-sdk %s %s' % (tcname_new, self.publish_dir)
         subprocess.check_output(cmd, shell=True)
-- 
2.1.4


