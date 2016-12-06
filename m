Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBAE71AE4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533348"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:38 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:44:15 -0600
Message-Id: <09d3e1ab9c85b0055b5b10342fa3c4fe12d0083e.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 30/32] oeqa/sdkext/cases: Migrate test case to new OEQA framework
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:36 -0000
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
 meta/lib/oeqa/sdk/cases/gcc.py             |  2 +-
 meta/lib/oeqa/sdkext/cases/devtool.py      | 49 ++++++++++++++++--------------
 meta/lib/oeqa/sdkext/cases/sdk_update.py   | 14 +++++----
 4 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index bdc8b6a..b9b24ee 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -10,7 +10,7 @@ class GalculatorTest(OESDKTestCase):
     def setUpClass(self):
         if not (self.tc.hasTargetPackage("gtk+3") or\
                 self.tc.hasTargetPackage("libgtk-3.0")):
-            raise unittest.SkipTest("%s class: SDK don't support gtk+3" % self.__name__)
+            raise unittest.SkipTest("%s class: SDK don't support gtk+3" % self.__class__.__name__)
 
     def test_galculator(self):
         dl_dir = self.td.get('DL_DIR', None)
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index e06af4c..36725e3 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -20,7 +20,7 @@ class GccCompileTest(OESDKTestCase):
         machine = self.td.get("MACHINE")
         if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
             raise unittest.SkipTest("%s class: SDK doesn't contain a cross-canadian toolchain",
-                    self.__name__)
+                    self.__class__.__name__)
 
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
index 2ade839..4e70c8f 100644
--- a/meta/lib/oeqa/sdkext/cases/sdk_update.py
+++ b/meta/lib/oeqa/sdkext/cases/sdk_update.py
@@ -1,21 +1,23 @@
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
+        tcname_new = "%s/%s-new.sh" % (self.td.get("SDK_DEPLOY", ''),
+            self.td.get("TOOLCHAINEXT_OUTPUTNAME", ''))
         if not os.path.exists(tcname_new):
             tcname_new = self.tc.tcname
 
-- 
2.1.4


