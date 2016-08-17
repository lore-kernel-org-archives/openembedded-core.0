Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D7B816013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 22:31:08 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 17 Aug 2016 15:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,535,1464678000"; d="scan'208";a="157417384"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2016 15:31:08 -0700
Received: from fjpedraz-MOBL3.zpn.intel.com (conejo-nuc.zpn.intel.com
	[10.219.128.66])
	by linux.intel.com (Postfix) with ESMTP id 4827C6A4080;
	Wed, 17 Aug 2016 15:30:52 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 17:30:59 -0500
Message-Id: <1471473060-27026-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 1/2] oeqa/sdkext: Adds test cases for devtool extensible SDK
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
X-List-Received-Date: Wed, 17 Aug 2016 22:31:09 -0000

Adds test cases in order to increase devtool verification.
The changes cover add, reset, build make, build cmake,
extend autotools recipe creation, kernel module and node.js.

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/sdkext/devtool.py                    | 90 ++++++++++++++++++++--
 .../oeqa/sdkext/files/myapp_cmake/CMakeLists.txt   | 11 +++
 meta/lib/oeqa/sdkext/files/myapp_cmake/myapp.c     |  9 +++
 3 files changed, 103 insertions(+), 7 deletions(-)
 create mode 100644 meta/lib/oeqa/sdkext/files/myapp_cmake/CMakeLists.txt
 create mode 100644 meta/lib/oeqa/sdkext/files/myapp_cmake/myapp.c

diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
index c5bb310..5d955eb 100644
--- a/meta/lib/oeqa/sdkext/devtool.py
+++ b/meta/lib/oeqa/sdkext/devtool.py
@@ -1,32 +1,108 @@
 import shutil
-
+import subprocess
+import urllib.request
 from oeqa.oetest import oeSDKExtTest
 from oeqa.utils.decorators import *
 
 class DevtoolTest(oeSDKExtTest):
-
     @classmethod
     def setUpClass(self):
         self.myapp_src = os.path.join(self.tc.sdkextfilesdir, "myapp")
         self.myapp_dst = os.path.join(self.tc.sdktestdir, "myapp")
         shutil.copytree(self.myapp_src, self.myapp_dst)
 
+        self.myapp_cmake_src = os.path.join(self.tc.sdkextfilesdir, "myapp_cmake")
+        self.myapp_cmake_dst = os.path.join(self.tc.sdktestdir, "myapp_cmake")
+        shutil.copytree(self.myapp_cmake_src, self.myapp_cmake_dst)
+
+    def _test_devtool_build(self, directory):
+        self._run('devtool add myapp %s' % directory)
+        try:
+            self._run('devtool build myapp')
+        except Exception as e:
+            print(e.output)
+            self._run('devtool reset myapp')
+            raise e
+        self._run('devtool reset myapp')
+
+    def _test_devtool_build_package(self, directory):
+        self._run('devtool add myapp %s' % directory)
+        try:
+            self._run('devtool package myapp')
+        except Exception as e:
+            print(e.output)
+            self._run('devtool reset myapp')
+            raise e
+        self._run('devtool reset myapp')
+
     def test_devtool_location(self):
         output = self._run('which devtool')
         self.assertEqual(output.startswith(self.tc.sdktestdir), True, \
             msg="Seems that devtool isn't the eSDK one: %s" % output)
-
+    
     @skipUnlessPassed('test_devtool_location')
     def test_devtool_add_reset(self):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool reset myapp')
+    
+    @testcase(1473)
+    @skipUnlessPassed('test_devtool_location')
+    def test_devtool_build_make(self):
+        self._test_devtool_build(self.myapp_dst)
+    
+    @testcase(1474)
+    @skipUnlessPassed('test_devtool_location')
+    def test_devtool_build_esdk_package(self):
+        self._test_devtool_build_package(self.myapp_dst)
 
+    @testcase(1479)
     @skipUnlessPassed('test_devtool_location')
-    def test_devtool_build(self):
-        self._run('devtool add myapp %s' % self.myapp_dst)
-        self._run('devtool build myapp')
-        self._run('devtool reset myapp')
+    def test_devtool_build_cmake(self):
+        self._test_devtool_build(self.myapp_cmake_dst)
+    
+    @testcase(1482)
+    @skipUnlessPassed('test_devtool_location')
+    def test_extend_autotools_recipe_creation(self):
+        req = 'https://github.com/rdfa/librdfa'
+        recipe = "bbexample"
+        self._run('devtool add %s %s' % (recipe, req) )
+        try:
+            self._run('devtool build %s' % recipe)
+        except Exception as e:
+            print(e.output)
+            self._run('devtool reset %s' % recipe)
+            raise e
+        self._run('devtool reset %s' % recipe)
+
+    @testcase(1484)
+    @skipUnlessPassed('test_devtool_location')
+    def test_devtool_kernelmodule(self):
+        docfile = 'git://github.com/Mange/rtl8192eu-linux-driver.git'
+        recipe = 'rtl-linux-driver'
+        self._run('devtool add %s %s' % (recipe, docfile) )
+        try:
+            self._run('devtool build %s' % recipe)
+        except Exception as e:
+            print(e.output)
+            self._run('devtool reset %s' % recipe)
+            raise e
+        self._run('devtool reset %s' % recipe)
+
+    @testcase(1478)
+    @skipUnlessPassed('test_devtool_location')
+    def test_recipes_for_nodejs(self):
+        package_nodejs = "npm://registry.npmjs.org;name=forever;version=0.15.1"
+        self._run('devtool add %s ' % package_nodejs)
+        try:
+            self._run('devtool build %s ' % package_nodejs)
+        except Exception as e:
+            print(e.output)
+            self._run('devtool reset %s' % package_nodejs)
+            raise e
+        self._run('devtool reset %s '% package_nodejs)
+
 
     @classmethod
     def tearDownClass(self):
         shutil.rmtree(self.myapp_dst)
+        shutil.rmtree(self.myapp_cmake_dst)
diff --git a/meta/lib/oeqa/sdkext/files/myapp_cmake/CMakeLists.txt b/meta/lib/oeqa/sdkext/files/myapp_cmake/CMakeLists.txt
new file mode 100644
index 0000000..19d773d
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/files/myapp_cmake/CMakeLists.txt
@@ -0,0 +1,11 @@
+cmake_minimum_required (VERSION 2.6)
+project (myapp)
+# The version number.
+set (myapp_VERSION_MAJOR 1)
+set (myapp_VERSION_MINOR 0)
+
+# add the executable
+add_executable (myapp myapp.c)
+
+install(TARGETS myapp
+        RUNTIME DESTINATION bin)
diff --git a/meta/lib/oeqa/sdkext/files/myapp_cmake/myapp.c b/meta/lib/oeqa/sdkext/files/myapp_cmake/myapp.c
new file mode 100644
index 0000000..f0b63f0
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/files/myapp_cmake/myapp.c
@@ -0,0 +1,9 @@
+#include <stdio.h>
+
+int
+main(int argc, char *argv[])
+{
+	printf("Hello world\n");
+
+	return 0;
+}
-- 
2.5.0


