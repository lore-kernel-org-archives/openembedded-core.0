Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8F67721C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:12:30 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2016 07:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="645913204"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 07:12:30 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:14:05 -0600
Message-Id: <699d08c4019c6e5a73a80637de5d8bea1c2a2842.1454424743.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 02/20] classes/testsdk: Add new class testsdk.
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
X-List-Received-Date: Tue, 02 Feb 2016 15:12:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Moves all the testsdk code from testimage in order to have it's own
class because new tests will be added for extensible SDK.

The old paths for store logs "${WORKDIR}/testimage" and sdk
"${WORKDIR}/testimage-sdk" was maintained for compatibility may be
change to point testsdk after review the codebase.

The dependency of QEMU was removed because isn't needed.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testimage.bbclass |  98 ----------------------------------------
 meta/classes/testsdk.bbclass   | 100 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+), 98 deletions(-)
 create mode 100644 meta/classes/testsdk.bbclass

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index a4026d3..ce71209 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -98,14 +98,6 @@ do_testimage[nostamp] = "1"
 do_testimage[depends] += "${TESTIMAGEDEPENDS}"
 do_testimage[lockfiles] += "${TESTIMAGELOCK}"
 
-python do_testsdk() {
-    testsdk_main(d)
-}
-addtask testsdk
-do_testsdk[nostamp] = "1"
-do_testsdk[depends] += "${TESTIMAGEDEPENDS}"
-do_testsdk[lockfiles] += "${TESTIMAGELOCK}"
-
 def exportTests(d,tc):
     import json
     import shutil
@@ -197,7 +189,6 @@ def exportTests(d,tc):
 
     bb.plain("Exported tests to: %s" % exportpath)
 
-
 def testimage_main(d):
     import unittest
     import os
@@ -299,92 +290,3 @@ def testimage_main(d):
             target.stop()
 
 testimage_main[vardepsexclude] =+ "BB_ORIGENV"
-
-def testsdk_main(d):
-    import unittest
-    import os
-    import glob
-    import oeqa.runtime
-    import oeqa.sdk
-    import time
-    import subprocess
-    from oeqa.oetest import loadTests, runTests, get_test_suites, get_tests_list
-
-    pn = d.getVar("PN", True)
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
-
-    # tests in TEST_SUITES become required tests
-    # they won't be skipped even if they aren't suitable.
-    # testslist is what we'll actually pass to the unittest loader
-    testslist = get_tests_list(get_test_suites(d, "sdk"), d.getVar("BBPATH", True).split(':'), "sdk")
-    testsrequired = [t for t in (d.getVar("TEST_SUITES_SDK", True) or "auto").split() if t != "auto"]
-
-    tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
-    if not os.path.exists(tcname):
-        bb.fatal("The toolchain is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' .")
-
-    class TestContext(object):
-        def __init__(self):
-            self.d = d
-            self.testslist = testslist
-            self.testsrequired = testsrequired
-            self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
-            self.sdktestdir = sdktestdir
-            self.sdkenv = sdkenv
-            self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
-            self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
-            manifest = d.getVar("SDK_TARGET_MANIFEST", True)
-            try:
-                with open(manifest) as f:
-                    self.pkgmanifest = f.read()
-            except IOError as e:
-                bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
-            hostmanifest = d.getVar("SDK_HOST_MANIFEST", True)
-            try:
-                with open(hostmanifest) as f:
-                    self.hostpkgmanifest = f.read()
-            except IOError as e:
-                bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
-
-    sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
-    bb.utils.remove(sdktestdir, True)
-    bb.utils.mkdirhier(sdktestdir)
-    try:
-        subprocess.check_output("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
-    except subprocess.CalledProcessError as e:
-        bb.fatal("Couldn't install the SDK:\n%s" % e.output)
-
-    try:
-        targets = glob.glob(d.expand(sdktestdir + "/tc/environment-setup-*"))
-        bb.warn(str(targets))
-        for sdkenv in targets:
-            bb.plain("Testing %s" % sdkenv)
-            # test context
-            tc = TestContext()
-
-            # this is a dummy load of tests
-            # we are doing that to find compile errors in the tests themselves
-            # before booting the image
-            try:
-                loadTests(tc, "sdk")
-            except Exception as e:
-                import traceback
-                bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
-
-    
-            starttime = time.time()
-            result = runTests(tc, "sdk")
-            stoptime = time.time()
-            if result.wasSuccessful():
-                bb.plain("%s SDK(%s):%s - Ran %d test%s in %.3fs" % (pn, os.path.basename(tcname), os.path.basename(sdkenv),result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
-                msg = "%s - OK - All required tests passed" % pn
-                skipped = len(result.skipped)
-                if skipped:
-                    msg += " (skipped=%d)" % skipped
-                bb.plain(msg)
-            else:
-                raise bb.build.FuncFailed("%s - FAILED - check the task log and the commands log" % pn )
-    finally:
-        bb.utils.remove(sdktestdir, True)
-
-testsdk_main[vardepsexclude] =+ "BB_ORIGENV"
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
new file mode 100644
index 0000000..d81c456
--- /dev/null
+++ b/meta/classes/testsdk.bbclass
@@ -0,0 +1,100 @@
+# Copyright (C) 2016 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+TEST_LOG_DIR ?= "${WORKDIR}/testimage"
+TESTSDKLOCK = "${TMPDIR}/testsdk.lock"
+
+def testsdk_main(d):
+    import unittest
+    import os
+    import glob
+    import oeqa.runtime
+    import oeqa.sdk
+    import time
+    import subprocess
+    from oeqa.oetest import loadTests, runTests, get_test_suites, get_tests_list
+
+    pn = d.getVar("PN", True)
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+
+    # tests in TEST_SUITES become required tests
+    # they won't be skipped even if they aren't suitable.
+    # testslist is what we'll actually pass to the unittest loader
+    testslist = get_tests_list(get_test_suites(d, "sdk"), d.getVar("BBPATH", True).split(':'), "sdk")
+    testsrequired = [t for t in (d.getVar("TEST_SUITES_SDK", True) or "auto").split() if t != "auto"]
+
+    tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
+    if not os.path.exists(tcname):
+        bb.fatal("The toolchain is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' .")
+
+    class TestContext(object):
+        def __init__(self):
+            self.d = d
+            self.testslist = testslist
+            self.testsrequired = testsrequired
+            self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
+            self.sdktestdir = sdktestdir
+            self.sdkenv = sdkenv
+            self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
+            self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
+            manifest = d.getVar("SDK_TARGET_MANIFEST", True)
+            try:
+                with open(manifest) as f:
+                    self.pkgmanifest = f.read()
+            except IOError as e:
+                bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
+            hostmanifest = d.getVar("SDK_HOST_MANIFEST", True)
+            try:
+                with open(hostmanifest) as f:
+                    self.hostpkgmanifest = f.read()
+            except IOError as e:
+                bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
+
+    sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
+    bb.utils.remove(sdktestdir, True)
+    bb.utils.mkdirhier(sdktestdir)
+    try:
+        subprocess.check_output("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
+    except subprocess.CalledProcessError as e:
+        bb.fatal("Couldn't install the SDK:\n%s" % e.output)
+
+    try:
+        targets = glob.glob(d.expand(sdktestdir + "/tc/environment-setup-*"))
+        for sdkenv in targets:
+            bb.plain("Testing %s" % sdkenv)
+            # test context
+            tc = TestContext()
+
+            # this is a dummy load of tests
+            # we are doing that to find compile errors in the tests themselves
+            # before booting the image
+            try:
+                loadTests(tc, "sdk")
+            except Exception as e:
+                import traceback
+                bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+            starttime = time.time()
+            result = runTests(tc, "sdk")
+            stoptime = time.time()
+            if result.wasSuccessful():
+                bb.plain("%s SDK(%s):%s - Ran %d test%s in %.3fs" % (pn, os.path.basename(tcname), os.path.basename(sdkenv),result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
+                msg = "%s - OK - All required tests passed" % pn
+                skipped = len(result.skipped)
+                if skipped:
+                    msg += " (skipped=%d)" % skipped
+                bb.plain(msg)
+            else:
+                raise bb.build.FuncFailed("%s - FAILED - check the task log and the commands log" % pn )
+    finally:
+        bb.utils.remove(sdktestdir, True)
+
+testsdk_main[vardepsexclude] =+ "BB_ORIGENV"
+
+python do_testsdk() {
+    testsdk_main(d)
+}
+addtask testsdk
+do_testsdk[nostamp] = "1"
+do_testsdk[lockfiles] += "${TESTSDKLOCK}"
-- 
2.1.4


