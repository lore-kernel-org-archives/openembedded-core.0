Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 166936D8F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 19:21:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 03 Feb 2014 11:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,774,1384329600"; d="scan'208";a="469208045"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2014 11:21:28 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id B23296A4092
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 11:21:21 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 21:22:29 +0200
Message-Id: <e52a5e3e66a0534fe52c8ad61dfe92f8095ebc38.1391454072.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391454072.git.stefanx.stanacar@intel.com>
References: <cover.1391454072.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1391454072.git.stefanx.stanacar@intel.com>
References: <cover.1391454072.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/3] testimage: add ability to export tests
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
X-List-Received-Date: Mon, 03 Feb 2014 19:21:30 -0000

Add the ability to export the tests so that they can run independently of
the build system, as is required if you want to be able to hand the test
execution off to a scheduler.
Booting/deployment of the target is still handled by the build system,
as before, only the execution of the tests happens outside of the build system.
Tests exported are the ones defined in TEST_SUITES.

No tests have been changed as interesting parts of the data store have been
exported and tests can continue to query them as before. Small adjustments were made
for a couple of oeqa modules though.

[YOCTO #5613]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass | 107 +++++++++++++++++++++++++++++++++++------
 meta/lib/oeqa/oetest.py        |  17 +++----
 2 files changed, 98 insertions(+), 26 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 4777e14..75ab716 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -25,15 +25,16 @@
 
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
+TEST_EXPORT_DIR ?= "${TMPDIR}/testimage/${PN}"
+TEST_EXPORT_ONLY ?= "0"
+
 DEFAULT_TEST_SUITES = "ping auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "ping"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "ping ssh df connman syslog xorg scp vnc date rpm smart dmesg python"
 DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg scp vnc date perl ldd gcc rpm smart kernelmodule dmesg python"
-
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
-
 TEST_TARGET ?= "qemu"
 TEST_TARGET_IP ?= ""
 TEST_SERVER_IP ?= ""
@@ -85,6 +86,71 @@ def get_tests_list(d):
 
     return testslist
 
+
+def exportTests(d,tc):
+    import json
+    import shutil
+    import pkgutil
+
+    exportpath = d.getVar("TEST_EXPORT_DIR", True)
+
+    savedata = {}
+    savedata["d"] = {}
+    savedata["target"] = {}
+    for key in tc.__dict__:
+        # special cases
+        if key != "d" and key != "target":
+            savedata[key] = getattr(tc, key)
+    savedata["target"]["ip"] = tc.target.ip or d.getVar("TEST_TARGET_IP", True)
+    savedata["target"]["server_ip"] = tc.target.server_ip or d.getVar("TEST_SERVER_IP", True)
+
+    keys = [ key for key in d.keys() if not key.startswith("_") and not key.startswith("BB") \
+            and not key.startswith("B_pn") and not key.startswith("do_") and not d.getVarFlag(key, "func")]
+    for key in keys:
+        try:
+            savedata["d"][key] = d.getVar(key, True)
+        except bb.data_smart.ExpansionError:
+            # we don't care about those anyway
+            pass
+
+    with open(os.path.join(exportpath, "testdata.json"), "w") as f:
+            json.dump(savedata, f, skipkeys=True, indent=4, sort_keys=True)
+
+    # now start copying files
+    # we'll basically copy everything under meta/lib/oeqa, with these exceptions
+    #  - oeqa/targetcontrol.py - not needed
+    #  - oeqa/selftest - something else
+    # That means:
+    #   - all tests from oeqa/runtime defined in TEST_SUITES (including from other layers)
+    #   - the contents of oeqa/utils and oeqa/runtime/files
+    #   - oeqa/oetest.py and oeqa/runexport.py (this will get copied to exportpath not exportpath/oeqa)
+    #   - __init__.py files
+    bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/runtime/files"))
+    bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
+    # copy test modules, this should cover tests in other layers too
+    for t in tc.testslist:
+        mod = pkgutil.get_loader(t)
+        shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
+    # copy __init__.py files
+    oeqadir = pkgutil.get_loader("oeqa").filename
+    shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(exportpath, "oeqa"))
+    shutil.copy2(os.path.join(oeqadir, "runtime/__init__.py"), os.path.join(exportpath, "oeqa/runtime"))
+    # copy oeqa/oetest.py and oeqa/runexported.py
+    shutil.copy2(os.path.join(oeqadir, "oetest.py"), os.path.join(exportpath, "oeqa"))
+    shutil.copy2(os.path.join(oeqadir, "runexported.py"), exportpath)
+    # copy oeqa/utils/*.py
+    for root, dirs, files in os.walk(os.path.join(oeqadir, "utils")):
+        for f in files:
+            if f.endswith(".py"):
+                shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/utils"))
+    # copy oeqa/runtime/files/*
+    for root, dirs, files in os.walk(os.path.join(oeqadir, "runtime/files")):
+        for f in files:
+            shutil.copy2(os.path.join(root, f), os.path.join(exportpath, "oeqa/runtime/files"))
+
+    bb.plain("Exported tests to: %s" % exportpath)
+
+
 def testimage_main(d):
     import unittest
     import os
@@ -94,7 +160,11 @@ def testimage_main(d):
     from oeqa.targetcontrol import get_target_controller
 
     pn = d.getVar("PN", True)
+    export = oe.utils.conditional("TEST_EXPORT_ONLY", "1", True, False, d)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+    if export:
+        bb.utils.remove(d.getVar("TEST_EXPORT_DIR", True), recurse=True)
+        bb.utils.mkdirhier(d.getVar("TEST_EXPORT_DIR", True))
 
     # tests in TEST_SUITES become required tests
     # they won't be skipped even if they aren't suitable for a image (like xorg for minimal)
@@ -105,13 +175,18 @@ def testimage_main(d):
     # the robot dance
     target = get_target_controller(d)
 
-    class TestContext:
+    class TestContext(object):
         def __init__(self):
             self.d = d
             self.testslist = testslist
             self.testsrequired = testsrequired
             self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
             self.target = target
+            self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
+            self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
+            manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
+            with open(manifest) as f:
+                self.pkgmanifest = f.read()
 
     # test context
     tc = TestContext()
@@ -129,19 +204,21 @@ def testimage_main(d):
 
     try:
         target.start()
-        # run tests and get the results
-        starttime = time.time()
-        result = runTests(tc)
-        stoptime = time.time()
-        if result.wasSuccessful():
-            bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
-            msg = "%s - OK - All required tests passed" % pn
-            skipped = len(result.skipped)
-            if skipped:
-                msg += " (skipped=%d)" % skipped
-            bb.plain(msg)
+        if export:
+            exportTests(d,tc)
         else:
-            raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
+            starttime = time.time()
+            result = runTests(tc)
+            stoptime = time.time()
+            if result.wasSuccessful():
+                bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
+                msg = "%s - OK - All required tests passed" % pn
+                skipped = len(result.skipped)
+                if skipped:
+                    msg += " (skipped=%d)" % skipped
+                bb.plain(msg)
+            else:
+                raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
     finally:
         target.stop()
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 23a3e5d..0db6cb8 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -10,8 +10,6 @@
 import os, re, mmap
 import unittest
 import inspect
-import bb
-from oeqa.utils.sshcontrol import SSHControl
 
 
 def loadTests(tc):
@@ -31,15 +29,14 @@ def loadTests(tc):
 def runTests(tc):
 
     suite = loadTests(tc)
-    bb.note("Test modules  %s" % tc.testslist)
-    bb.note("Found %s tests" % suite.countTestCases())
+    print("Test modules  %s" % tc.testslist)
+    print("Found %s tests" % suite.countTestCases())
     runner = unittest.TextTestRunner(verbosity=2)
     result = runner.run(suite)
 
     return result
 
 
-
 class oeTest(unittest.TestCase):
 
     longMessage = True
@@ -60,18 +57,16 @@ class oeTest(unittest.TestCase):
 
     @classmethod
     def hasPackage(self, pkg):
-        manifest = os.path.join(oeTest.tc.d.getVar("DEPLOY_DIR_IMAGE", True), oeTest.tc.d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
-        with open(manifest) as f:
-            data = f.read()
-        if re.search(pkg, data):
+
+        if re.search(pkg, oeTest.tc.pkgmanifest):
             return True
         return False
 
     @classmethod
     def hasFeature(self,feature):
 
-        if feature in oeTest.tc.d.getVar("IMAGE_FEATURES", True).split() or \
-                feature in oeTest.tc.d.getVar("DISTRO_FEATURES", True).split():
+        if feature in oeTest.tc.imagefeatures or \
+                feature in oeTest.tc.distrofeatures:
             return True
         else:
             return False
-- 
1.8.5.3


