Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE5F7721C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:12:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2016 07:12:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="645913252"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 07:12:38 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:14:13 -0600
Message-Id: <1bda7f4a1157a9164f97b9cfbab5934d1fbdcb09.1454424743.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH 10/20] testimage/testsdk: Modularize TestContext.
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
X-List-Received-Date: Tue, 02 Feb 2016 15:12:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

Move anonymous duplicated class TestContext from testimage/testsdk to
oeqa/oetest now we have two new classes ImageTestContext and
SDKTestContext with common code in TestContext class.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testimage.bbclass | 40 ++-------------------------
 meta/classes/testsdk.bbclass   | 29 ++-----------------
 meta/lib/oeqa/oetest.py        | 63 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 63 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index cb3314d..2e5bf44 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -195,7 +195,8 @@ def testimage_main(d):
     import oeqa.runtime
     import time
     import signal
-    from oeqa.oetest import loadTests, runTests, get_test_suites, get_tests_list
+    from oeqa.oetest import loadTests, runTests, \
+        get_test_suites, get_tests_list, ImageTestContext
     from oeqa.targetcontrol import get_target_controller
     from oeqa.utils.dump import get_host_dumper
 
@@ -212,48 +213,14 @@ def testimage_main(d):
     testslist = get_tests_list(get_test_suites(d), d.getVar("BBPATH", True).split(':'))
     testsrequired = [t for t in d.getVar("TEST_SUITES", True).split() if t != "auto"]
 
-    tagexp = d.getVar("TEST_SUITES_TAGS", True)
-
     # we need the host dumper in test context
     host_dumper = get_host_dumper(d)
 
     # the robot dance
     target = get_target_controller(d)
 
-    class TestContext(object):
-        def __init__(self):
-            self.d = d
-            self.testslist = testslist
-            self.tagexp = tagexp
-            self.testsrequired = testsrequired
-            self.filesdir = os.path.join(os.path.dirname(os.path.abspath(oeqa.runtime.__file__)),"files")
-            self.target = target
-            self.host_dumper = host_dumper
-            self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
-            self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
-            manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
-            nomanifest = d.getVar("IMAGE_NO_MANIFEST", True)
-
-            self.sigterm = False
-            self.origsigtermhandler = signal.getsignal(signal.SIGTERM)
-            signal.signal(signal.SIGTERM, self.sigterm_exception)
-
-            if nomanifest is None or nomanifest != "1":
-                try:
-                    with open(manifest) as f:
-                        self.pkgmanifest = f.read()
-                except IOError as e:
-                    bb.fatal("No package manifest file found. Did you build the image?\n%s" % e)
-            else:
-                self.pkgmanifest = ""
-
-        def sigterm_exception(self, signum, stackframe):
-            bb.warn("TestImage received SIGTERM, shutting down...")
-            self.sigterm = True
-            self.target.stop()
-
     # test context
-    tc = TestContext()
+    tc = ImageTestContext(d, testslist, testsrequired, target, host_dumper)
 
     # this is a dummy load of tests
     # we are doing that to find compile errors in the tests themselves
@@ -264,7 +231,6 @@ def testimage_main(d):
         import traceback
         bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
 
-
     if export:
         signal.signal(signal.SIGTERM, tc.origsigtermhandler)
         tc.origsigtermhandler = None
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 3665593..5210811 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -13,7 +13,8 @@ def testsdk_main(d):
     import oeqa.sdk
     import time
     import subprocess
-    from oeqa.oetest import loadTests, runTests, get_test_suites, get_tests_list
+    from oeqa.oetest import loadTests, runTests, \
+        get_test_suites, get_tests_list, SDKTestContext
 
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
@@ -28,29 +29,6 @@ def testsdk_main(d):
     if not os.path.exists(tcname):
         bb.fatal("The toolchain is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' .")
 
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
     sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
     bb.utils.remove(sdktestdir, True)
     bb.utils.mkdirhier(sdktestdir)
@@ -63,8 +41,7 @@ def testsdk_main(d):
         targets = glob.glob(d.expand(sdktestdir + "/tc/environment-setup-*"))
         for sdkenv in targets:
             bb.plain("Testing %s" % sdkenv)
-            # test context
-            tc = TestContext()
+            tc = SDKTestContext(d, testslist, testsrequired, sdktestdir, sdkenv)
 
             # this is a dummy load of tests
             # we are doing that to find compile errors in the tests themselves
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 6470129..166a1ba 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -11,11 +11,14 @@ import os, re, mmap
 import unittest
 import inspect
 import subprocess
+import signal
 try:
     import bb
 except ImportError:
     pass
 import logging
+
+import oeqa
 from oeqa.utils.decorators import LogResults, gettag, getResults
 
 logger = logging.getLogger("BitBake")
@@ -326,3 +329,63 @@ def get_tests_list(testsuites, bbpath, type="runtime"):
                 add_auto_list(testpath)
 
     return testslist
+
+class TestContext(object):
+    def __init__(self, d, testslist, testsrequired):
+        self.d = d
+        self.testslist = testslist
+        self.testsrequired = testsrequired
+
+        self.filesdir = os.path.join(os.path.dirname(os.path.abspath(
+            oeqa.runtime.__file__)), "files")
+        self.imagefeatures = d.getVar("IMAGE_FEATURES", True).split()
+        self.distrofeatures = d.getVar("DISTRO_FEATURES", True).split()
+
+class ImageTestContext(TestContext):
+    def __init__(self, d, testslist, testsrequired, target, host_dumper):
+        super(ImageTestContext, self).__init__(d, testslist, testsrequired)
+
+        self.tagexp =  d.getVar("TEST_SUITES_TAGS", True)
+
+        self.target = target
+        self.host_dumper = host_dumper
+
+        manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
+                d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
+        nomanifest = d.getVar("IMAGE_NO_MANIFEST", True)
+        if nomanifest is None or nomanifest != "1":
+            try:
+                with open(manifest) as f:
+                    self.pkgmanifest = f.read()
+            except IOError as e:
+                bb.fatal("No package manifest file found. Did you build the image?\n%s" % e)
+        else:
+            self.pkgmanifest = ""
+
+        self.sigterm = False
+        self.origsigtermhandler = signal.getsignal(signal.SIGTERM)
+        signal.signal(signal.SIGTERM, self._sigterm_exception)
+
+    def _sigterm_exception(self, signum, stackframe):
+        bb.warn("TestImage received SIGTERM, shutting down...")
+        self.sigterm = True
+        self.target.stop()
+
+class SDKTestContext(TestContext):
+    def __init__(self, d, testslist, testsrequired, sdktestdir, sdkenv):
+        super(SDKTestContext, self).__init__(d, testslist, testsrequired)
+
+        self.sdktestdir = sdktestdir
+        self.sdkenv = sdkenv
+
+        try:
+            with open(d.getVar("SDK_TARGET_MANIFEST", True)) as f:
+                 self.pkgmanifest = f.read()
+        except IOError as e:
+            bb.fatal("No package manifest file found. Did you build the sdk image?\n%s" % e)
+
+        try:
+            with open(d.getVar("SDK_HOST_MANIFEST", True)) as f:
+                self.hostpkgmanifest = f.read()
+        except IOError as e:
+            bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
-- 
2.1.4


