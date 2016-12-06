Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D525971AB2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:35 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533342"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:37 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:44:13 -0600
Message-Id: <6c6b8ae4591ab8a6f6672d45500560d34808c667.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 28/32] oeqa/sdkext: Adds case and context modules.
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

The extensible sdk context and case modules extends the sdk ones,
this means that the tests from sdk are run also the sdkext tests.

Enables support in context for use oe-test esdk command for run
the test suites, the same options of sdk are required for run esdk tests.

Removes old related to case and context inside oetest.py.

[YOCTO #10599]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass    | 99 +++++++++++++++++++----------------------
 meta/lib/oeqa/oetest.py         | 40 -----------------
 meta/lib/oeqa/sdkext/case.py    | 21 +++++++++
 meta/lib/oeqa/sdkext/context.py | 21 +++++++++
 4 files changed, 88 insertions(+), 93 deletions(-)
 create mode 100644 meta/lib/oeqa/sdkext/case.py
 create mode 100644 meta/lib/oeqa/sdkext/context.py

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 4c4df10..24529ca 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -16,37 +16,6 @@
 
 TESTSDKLOCK = "${TMPDIR}/testsdk.lock"
 
-def run_test_context(CTestContext, d, testdir, tcname, pn, *args):
-    import glob
-    import time
-
-    targets = glob.glob(d.expand(testdir + "/tc/environment-setup-*"))
-    for sdkenv in targets:
-        bb.plain("Testing %s" % sdkenv)
-        tc = CTestContext(d, testdir, sdkenv, tcname, args)
-
-        # this is a dummy load of tests
-        # we are doing that to find compile errors in the tests themselves
-        # before booting the image
-        try:
-            tc.loadTests()
-        except Exception as e:
-            import traceback
-            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
-
-        starttime = time.time()
-        result = tc.runTests()
-        stoptime = time.time()
-        if result.wasSuccessful():
-            bb.plain("%s SDK(%s):%s - Ran %d test%s in %.3fs" % (pn, os.path.basename(tcname), os.path.basename(sdkenv),result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
-            msg = "%s - OK - All required tests passed" % pn
-            skipped = len(result.skipped)
-            if skipped:
-                msg += " (skipped=%d)" % skipped
-            bb.plain(msg)
-        else:
-            bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
-
 def testsdk_main(d):
     import os
     import subprocess
@@ -121,16 +90,20 @@ addtask testsdk
 do_testsdk[nostamp] = "1"
 do_testsdk[lockfiles] += "${TESTSDKLOCK}"
 
-TEST_LOG_SDKEXT_DIR ?= "${WORKDIR}/testsdkext"
 TESTSDKEXTLOCK = "${TMPDIR}/testsdkext.lock"
 
 def testsdkext_main(d):
     import os
-    import oeqa.sdkext
+    import json
     import subprocess
+    import logging
+
     from bb.utils import export_proxies
-    from oeqa.oetest import SDKTestContext, SDKExtTestContext
     from oeqa.utils import avoid_paths_in_environ
+    from oeqa.sdk.context import OESDKExtTestContext, OESDKExtTestContextExecutor
+
+    pn = d.getVar("PN", True)
+    logger = logging.getLogger("BitBake")
 
     # extensible sdk use network
     export_proxies(d)
@@ -141,20 +114,24 @@ def testsdkext_main(d):
                       d.getVar('BASE_WORKDIR', True)]
     os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
 
-    pn = d.getVar("PN", True)
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR", True))
-
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
         bb.fatal("The toolchain ext %s is not built. Build it before running the" \
                  " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
 
-    testdir = d.expand("${WORKDIR}/testsdkext/")
-    bb.utils.remove(testdir, True)
-    bb.utils.mkdirhier(testdir)
-    sdkdir = os.path.join(testdir, 'tc')
+    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.testdata.json")
+    test_data = json.load(open(tdname, "r"))
+
+    target_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"))
+    host_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
+
+    sdk_dir = d.expand("${WORKDIR}/testsdkext/")
+    bb.utils.remove(sdk_dir, True)
+    bb.utils.mkdirhier(sdk_dir)
     try:
-        subprocess.check_output("%s -y -d %s" % (tcname, sdkdir), shell=True)
+        subprocess.check_output("%s -y -d %s" % (tcname, sdk_dir), shell=True)
     except subprocess.CalledProcessError as e:
         msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
         logfn = os.path.join(sdkdir, 'preparing_build_system.log')
@@ -165,19 +142,35 @@ def testsdkext_main(d):
                     msg += line
         bb.fatal(msg)
 
-    try:
-        bb.plain("Running SDK Compatibility tests ...")
-        run_test_context(SDKExtTestContext, d, testdir, tcname, pn, True)
-    finally:
-        pass
+    fail = False
+    sdk_envs = OESDKExtTestContextExecutor._get_sdk_environs(sdk_dir)
+    for s in sdk_envs:
+        bb.plain("Extensible SDK testing environment: %s" % s)
 
-    try:
-        bb.plain("Running Extensible SDK tests ...")
-        run_test_context(SDKExtTestContext, d, testdir, tcname, pn)
-    finally:
-        pass
+        sdk_env = sdk_envs[s]
+        tc = OESDKExtTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
+            sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
+            host_pkg_manifest=host_pkg_manifest)
 
-    bb.utils.remove(testdir, True)
+        try:
+            tc.loadTests(OESDKExtTestContextExecutor.default_cases)
+        except Exception as e:
+            import traceback
+            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+        result = tc.runTests()
+
+        component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
+        context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
+
+        tc.logSummary(result, component, context_msg)
+        tc.logDetails()
+
+        if not result.wasSuccessful():
+            fail = True
+
+    if fail:
+        bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
 
 testsdkext_main[vardepsexclude] =+ "BB_ORIGENV"
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 4a98b0f1..f9e9025 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -27,7 +27,6 @@ try:
 except ImportError:
     pass
 from oeqa.utils.decorators import LogResults, gettag, getResults
-from oeqa.utils import avoid_paths_in_environ
 
 logger = logging.getLogger("BitBake")
 
@@ -145,18 +144,6 @@ class OETestCalledProcessError(subprocess.CalledProcessError):
 
 subprocess.CalledProcessError = OETestCalledProcessError
 
-class oeSDKExtTest(oeSDKTest):
-    def _run(self, cmd):
-        # extensible sdk shows a warning if found bitbake in the path
-        # because can cause contamination, i.e. use devtool from
-        # poky/scripts instead of eSDK one.
-        env = os.environ.copy()
-        paths_to_avoid = ['bitbake/bin', 'poky/scripts']
-        env['PATH'] = avoid_paths_in_environ(paths_to_avoid)
-
-        return subprocess.check_output(". %s > /dev/null;"\
-            " %s;" % (self.tc.sdkenv, cmd), stderr=subprocess.STDOUT, shell=True, env=env).decode("utf-8")
-
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
@@ -642,30 +629,3 @@ class ExportTestContext(RuntimeTestContext):
         extracted_dir = self.d.getVar("TEST_EXPORT_EXTRACTED_DIR", True)
         pkg_dir = os.path.join(export_dir, extracted_dir)
         super(ExportTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
-
-class SDKExtTestContext(SDKTestContext):
-    def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
-        self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST", True)
-        self.host_manifest = d.getVar("SDK_EXT_HOST_MANIFEST", True)
-        if args:
-            self.cm = args[0] # Compatibility mode for run SDK tests
-        else:
-            self.cm = False
-
-        super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv, tcname)
-
-        self.sdkextfilesdir = os.path.join(os.path.dirname(os.path.abspath(
-            oeqa.sdkext.__file__)), "files")
-
-    def _get_test_namespace(self):
-        if self.cm:
-            return "sdk"
-        else:
-            return "sdkext"
-
-    def _get_test_suites(self):
-        return (self.d.getVar("TEST_SUITES_SDK_EXT", True) or "auto").split()
-
-    def _get_test_suites_required(self):
-        return [t for t in (self.d.getVar("TEST_SUITES_SDK_EXT", True) or \
-                "auto").split() if t != "auto"]
diff --git a/meta/lib/oeqa/sdkext/case.py b/meta/lib/oeqa/sdkext/case.py
new file mode 100644
index 0000000..6f708aa
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/case.py
@@ -0,0 +1,21 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import subprocess
+
+from oeqa.utils import avoid_paths_in_environ
+from oeqa.sdk.case import OESDKTestCase
+
+class OESDKExtTestCase(OESDKTestCase):
+    def _run(self, cmd):
+        # extensible sdk shows a warning if found bitbake in the path
+        # because can cause contamination, i.e. use devtool from
+        # poky/scripts instead of eSDK one.
+        env = os.environ.copy()
+        paths_to_avoid = ['bitbake/bin', 'poky/scripts']
+        env['PATH'] = avoid_paths_in_environ(paths_to_avoid)
+
+        return subprocess.check_output(". %s > /dev/null;"\
+            " %s;" % (self.tc.sdk_env, cmd), stderr=subprocess.STDOUT,
+            shell=True, env=env).decode("utf-8")
diff --git a/meta/lib/oeqa/sdkext/context.py b/meta/lib/oeqa/sdkext/context.py
new file mode 100644
index 0000000..8dbcd80
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/context.py
@@ -0,0 +1,21 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
+
+class OESDKExtTestContext(OESDKTestContext):
+    esdk_files_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
+
+class OESDKExtTestContextExecutor(OESDKTestContextExecutor):
+    _context_class = OESDKExtTestContext
+
+    name = 'esdk'
+    help = 'esdk test component'
+    description = 'executes esdk tests'
+
+    default_cases = [OESDKTestContextExecutor.default_cases[0],
+            os.path.join(os.path.abspath(os.path.dirname(__file__)), 'cases')]
+    default_test_data = None
+
+_executor_class = OESDKExtTestContextExecutor
-- 
2.1.4


