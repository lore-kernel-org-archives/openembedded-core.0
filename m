Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 20791771D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567455"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:48 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:59 -0600
Message-Id: <2cb534518dbd7634076a282e1cc80b6e8a9ff8de.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 28/55] classes/testsdk: Migrate to use the new OESDKExtTestContext
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

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 98 ++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 53 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 176dafd..69689a1 100644
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
@@ -122,7 +91,6 @@ addtask testsdk
 do_testsdk[nostamp] = "1"
 do_testsdk[lockfiles] += "${TESTSDKLOCK}"
 
-TEST_LOG_SDKEXT_DIR ?= "${WORKDIR}/testsdkext"
 TESTSDKEXTLOCK = "${TMPDIR}/testsdkext.lock"
 
 def testsdkext_main(d):
@@ -132,7 +100,11 @@ def testsdkext_main(d):
     import logging
 
     from bb.utils import export_proxies
-    from oeqa.utils import avoid_paths_in_environ
+    from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible
+    from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
+
+    pn = d.getVar("PN", True)
+    logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
 
     # extensible sdk use network
     export_proxies(d)
@@ -143,23 +115,27 @@ def testsdkext_main(d):
                       d.getVar('BASE_WORKDIR')]
     os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
 
-    pn = d.getVar("PN")
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR"))
-
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
         bb.fatal("The toolchain ext %s is not built. Build it before running the" \
                  " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
 
-    testdir = d.expand("${WORKDIR}/testsdkext/")
-    bb.utils.remove(testdir, True)
-    bb.utils.mkdirhier(testdir)
-    sdkdir = os.path.join(testdir, 'tc')
+    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.testdata.json")
+    test_data = json.load(open(tdname, "r"))
+
+    target_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"))
+    host_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"))
+
+    sdk_dir = d.expand("${WORKDIR}/testsdkext/")
+    bb.utils.remove(sdk_dir, True)
+    bb.utils.mkdirhier(sdk_dir)
     try:
-        subprocess.check_output("%s -y -d %s" % (tcname, sdkdir), shell=True)
+        subprocess.check_output("%s -y -d %s" % (tcname, sdk_dir), shell=True)
     except subprocess.CalledProcessError as e:
         msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
-        logfn = os.path.join(sdkdir, 'preparing_build_system.log')
+        logfn = os.path.join(sdk_dir, 'preparing_build_system.log')
         if os.path.exists(logfn):
             msg += '\n\nContents of preparing_build_system.log:\n'
             with open(logfn, 'r') as f:
@@ -167,19 +143,35 @@ def testsdkext_main(d):
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
+
+        try:
+            tc.loadTests(OESDKExtTestContextExecutor.default_cases)
+        except Exception as e:
+            import traceback
+            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+        result = tc.runTests()
 
-    bb.utils.remove(testdir, True)
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
 
-- 
2.1.4


