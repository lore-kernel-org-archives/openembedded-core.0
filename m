Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6237706E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:27:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2016 14:27:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647384152"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:27:52 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:29:28 -0600
Message-Id: <9e760e99f531290c7c6b1c96ae80cb3f0c6d07f6.1454624835.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH v3 11/22] testimage/testsdk: Move get test suites routine inside TestContext.
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
X-List-Received-Date: Thu, 04 Feb 2016 22:27:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

In order to provide better abstraction move functions to get the test
suite inside the TestContext.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testimage.bbclass |  11 +--
 meta/classes/testsdk.bbclass   |  19 +---
 meta/lib/oeqa/oetest.py        | 192 +++++++++++++++++++++++------------------
 3 files changed, 112 insertions(+), 110 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2e5bf44..5ffa8a5 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -195,8 +195,7 @@ def testimage_main(d):
     import oeqa.runtime
     import time
     import signal
-    from oeqa.oetest import loadTests, runTests, \
-        get_test_suites, get_tests_list, ImageTestContext
+    from oeqa.oetest import loadTests, runTests, ImageTestContext
     from oeqa.targetcontrol import get_target_controller
     from oeqa.utils.dump import get_host_dumper
 
@@ -207,12 +206,6 @@ def testimage_main(d):
         bb.utils.remove(d.getVar("TEST_EXPORT_DIR", True), recurse=True)
         bb.utils.mkdirhier(d.getVar("TEST_EXPORT_DIR", True))
 
-    # tests in TEST_SUITES become required tests
-    # they won't be skipped even if they aren't suitable for a image (like xorg for minimal)
-    # testslist is what we'll actually pass to the unittest loader
-    testslist = get_tests_list(get_test_suites(d), d.getVar("BBPATH", True).split(':'))
-    testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
-
     # we need the host dumper in test context
     host_dumper = get_host_dumper(d)
 
@@ -220,7 +213,7 @@ def testimage_main(d):
     target = get_target_controller(d)
 
     # test context
-    tc = ImageTestContext(d, testslist, testsrequired, target, host_dumper)
+    tc = ImageTestContext(d, target, host_dumper)
 
     # this is a dummy load of tests
     # we are doing that to find compile errors in the tests themselves
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 06e7a77..47bad29 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -13,18 +13,11 @@ def testsdk_main(d):
     import oeqa.sdk
     import time
     import subprocess
-    from oeqa.oetest import loadTests, runTests, \
-        get_test_suites, get_tests_list, SDKTestContext
+    from oeqa.oetest import loadTests, runTests, SDKTestContext
 
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
 
-    # tests in TEST_SUITES become required tests
-    # they won't be skipped even if they aren't suitable.
-    # testslist is what we'll actually pass to the unittest loader
-    testslist = get_tests_list(get_test_suites(d, "sdk"), d.getVar("BBPATH", True).split(':'), "sdk")
-    testsrequired = [t for t in (d.getVar("TEST_SUITES_SDK", True) or "auto").split() if t != "auto"]
-
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
         bb.fatal("The toolchain is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' .")
@@ -41,7 +34,7 @@ def testsdk_main(d):
         targets = glob.glob(d.expand(sdktestdir + "/tc/environment-setup-*"))
         for sdkenv in targets:
             bb.plain("Testing %s" % sdkenv)
-            tc = SDKTestContext(d, testslist, testsrequired, sdktestdir, sdkenv)
+            tc = SDKTestContext(d, sdktestdir, sdkenv)
 
             # this is a dummy load of tests
             # we are doing that to find compile errors in the tests themselves
@@ -94,14 +87,6 @@ def testsdkext_main(d):
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR", True))
 
-    # tests in TEST_SUITES become required tests
-    # they won't be skipped even if they aren't suitable.
-    # testslist is what we'll actually pass to the unittest loader
-    testslist = get_tests_list(get_test_suites(d, "sdkext"),
-                    d.getVar("BBPATH", True).split(':'), "sdkext")
-    testsrequired = [t for t in (d.getVar("TEST_SUITES_SDKEXT", True) or \
-                    "auto").split() if t != "auto"]
-
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
         bb.fatal("The toolchain ext is not built. Build it before running the" \
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 9951a6f..7f07037 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -33,7 +33,6 @@ def getVar(obj):
 def checkTags(tc, tagexp):
     return eval(tagexp, None, getVar(tc))
 
-
 def filterByTagExp(testsuite, tagexp):
     if not tagexp:
         return testsuite
@@ -254,96 +253,80 @@ def skipModuleUnless(cond, reason):
     if not cond:
         skipModule(reason, 3)
 
-# get testcase list from specified file
-# if path is a relative path, then relative to build/conf/
-def read_testlist(fpath, builddir):
-    if not os.path.isabs(fpath):
-        fpath = os.path.join(builddir, "conf", fpath)
-    if not os.path.exists(fpath):
-        bb.fatal("No such manifest file: ", fpath)
-    tcs = []
-    for line in open(fpath).readlines():
-        line = line.strip()
-        if line and not line.startswith("#"):
-            tcs.append(line)
-    return " ".join(tcs)
-
-# get test suites, returns test suites based on d variables
-def get_test_suites(d, type='runtime'):
-    testsuites = []
-
-    if type == "sdk":
-        testsuites = (d.getVar("TEST_SUITES_SDK", True) or "auto").split()
-    elif type == "sdkext":
-        testsuites = (d.getVar("TEST_SUITES_SDKEXT", True) or "auto").split()
-    else:
-        manifests = (d.getVar("TEST_SUITES_MANIFEST", True) or '').split()
-        if manifests:
-            for manifest in manifests:
-                testsuites.extend(read_testlist(manifest,
-                                    d.getVar("TOPDIR", True)).split())
-
-        else:
-            testsuites = d.getVar("TEST_SUITES", True).split()
-
-    return testsuites
-
-# return test list by type also filter if TEST_SUITES is specified
-def get_tests_list(testsuites, bbpath, type="runtime"):
-    testslist = []
-
-    # This relies on lib/ under each directory in BBPATH being added to sys.path
-    # (as done by default in base.bbclass)
-    for testname in testsuites:
-        if testname != "auto":
-            if testname.startswith("oeqa."):
-                testslist.append(testname)
-                continue
-            found = False
-            for p in bbpath:
-                if os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname + '.py')):
-                    testslist.append("oeqa." + type + "." + testname)
-                    found = True
-                    break
-                elif os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname.split(".")[0] + '.py')):
-                    testslist.append("oeqa." + type + "." + testname)
-                    found = True
-                    break
-            if not found:
-                bb.fatal('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
-
-    if "auto" in testsuites:
-        def add_auto_list(path):
-            if not os.path.exists(os.path.join(path, '__init__.py')):
-                bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
-            files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
-            for f in files:
-                module = 'oeqa.' + type + '.' + f[:-3]
-                if module not in testslist:
-                    testslist.append(module)
-
-        for p in bbpath:
-            testpath = os.path.join(p, 'lib', 'oeqa', type)
-            bb.debug(2, 'Searching for tests in %s' % testpath)
-            if os.path.exists(testpath):
-                add_auto_list(testpath)
-
-    return testslist
-
 class TestContext(object):
-    def __init__(self, d, testslist, testsrequired):
+    def __init__(self, d):
         self.d = d
-        self.testslist = testslist
-        self.testsrequired = testsrequired
+
+        self.testsuites = self._get_test_suites()
+        self.testslist = self._get_tests_list(d.getVar("BBPATH", True).split(':'))
+        self.testsrequired = self._get_test_suites_required()
 
         self.filesdir = os.path.join(os.path.dirname(os.path.abspath(
             oeqa.runtime.__file__)), "files")
         self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
         self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
 
+    # get testcase list from specified file
+    # if path is a relative path, then relative to build/conf/
+    def _read_testlist(self, fpath, builddir):
+        if not os.path.isabs(fpath):
+            fpath = os.path.join(builddir, "conf", fpath)
+        if not os.path.exists(fpath):
+            bb.fatal("No such manifest file: ", fpath)
+        tcs = []
+        for line in open(fpath).readlines():
+            line = line.strip()
+            if line and not line.startswith("#"):
+                tcs.append(line)
+        return " ".join(tcs)
+
+    # return test list by type also filter if TEST_SUITES is specified
+    def _get_tests_list(self, bbpath):
+        testslist = []
+
+        type = self._get_test_namespace()
+
+        # This relies on lib/ under each directory in BBPATH being added to sys.path
+        # (as done by default in base.bbclass)
+        for testname in self.testsuites:
+            if testname != "auto":
+                if testname.startswith("oeqa."):
+                    testslist.append(testname)
+                    continue
+                found = False
+                for p in bbpath:
+                    if os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname + '.py')):
+                        testslist.append("oeqa." + type + "." + testname)
+                        found = True
+                        break
+                    elif os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname.split(".")[0] + '.py')):
+                        testslist.append("oeqa." + type + "." + testname)
+                        found = True
+                        break
+                if not found:
+                    bb.fatal('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
+
+        if "auto" in self.testsuites:
+            def add_auto_list(path):
+                if not os.path.exists(os.path.join(path, '__init__.py')):
+                    bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
+                files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
+                for f in files:
+                    module = 'oeqa.' + type + '.' + f[:-3]
+                    if module not in testslist:
+                        testslist.append(module)
+
+            for p in bbpath:
+                testpath = os.path.join(p, 'lib', 'oeqa', type)
+                bb.debug(2, 'Searching for tests in %s' % testpath)
+                if os.path.exists(testpath):
+                    add_auto_list(testpath)
+
+        return testslist
+
 class ImageTestContext(TestContext):
-    def __init__(self, d, testslist, testsrequired, target, host_dumper):
-        super(ImageTestContext, self).__init__(d, testslist, testsrequired)
+    def __init__(self, d, target, host_dumper):
+        super(ImageTestContext, self).__init__(d)
 
         self.tagexp =  d.getVar("TEST_SUITES_TAGS", True)
 
@@ -371,9 +354,29 @@ class ImageTestContext(TestContext):
         self.sigterm = True
         self.target.stop()
 
+    def _get_test_namespace(self):
+        return "runtime"
+
+    def _get_test_suites(self):
+        testsuites = []
+
+        manifests = (self.d.getVar("TEST_SUITES_MANIFEST", True) or '').split()
+        if manifests:
+            for manifest in manifests:
+                testsuites.extend(self._read_testlist(manifest,
+                                  self.d.getVar("TOPDIR", True)).split())
+
+        else:
+            testsuites = self.d.getVar("TEST_SUITES", True).split()
+
+        return testsuites
+
+    def _get_test_suites_required(self):
+        return [t for t in self.d.getVar("TEST_SUITES", True).split() if t != "auto"]
+
 class SDKTestContext(TestContext):
-    def __init__(self, d, testslist, testsrequired, sdktestdir, sdkenv):
-        super(SDKTestContext, self).__init__(d, testslist, testsrequired)
+    def __init__(self, d, sdktestdir, sdkenv):
+        super(SDKTestContext, self).__init__(d)
 
         self.sdktestdir = sdktestdir
         self.sdkenv = sdkenv
@@ -389,3 +392,24 @@ class SDKTestContext(TestContext):
                 self.hostpkgmanifest = f.read()
         except IOError as e:
             bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
+
+    def _get_test_namespace(self):
+        return "sdk"
+
+    def _get_test_suites(self):
+        return (self.d.getVar("TEST_SUITES_SDK", True) or "auto").split()
+
+    def _get_test_suites_required(self):
+        return [t for t in (self.d.getVar("TEST_SUITES_SDK", True) or \
+                "auto").split() if t != "auto"]
+
+class SDKExtTestContext(TestContext):
+    def _get_test_namespace(self):
+        return "sdkext"
+
+    def _get_test_suites(self):
+        return (self.d.getVar("TEST_SUITES_SDK_EXT", True) or "auto").split()
+
+    def _get_test_suites_required(self):
+        return [t for t in (self.d.getVar("TEST_SUITES_SDK_EXT", True) or \
+                "auto").split() if t != "auto"]
-- 
2.1.4


