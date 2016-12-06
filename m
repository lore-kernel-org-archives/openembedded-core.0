Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1F071B1C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:33 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533319"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:35 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:44:07 -0600
Message-Id: <3b1412e80b82dab37cd2821aca2c9a65aae4612f.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 22/32] classes/testsdk: Migrates testsdk.bbclass to use new OESDKTestContext
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The functionality provided is the same with imporvements on code
reuse and better interfaces.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 67 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 12 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 06b4c50..959fb38 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -50,30 +50,74 @@ def run_test_context(CTestContext, d, testdir, tcname, pn, *args):
 
 def testsdk_main(d):
     import os
-    import oeqa.sdk
     import subprocess
-    from oeqa.oetest import SDKTestContext
+    import json
+    import logging
+
+    from bb.utils import export_proxies
+    from oeqa.core.runner import OEStreamLogger
+    from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
 
     pn = d.getVar("PN", True)
-    bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
+    logger = logging.getLogger("BitBake")
+
+    # sdk use network for download projects for build
+    export_proxies(d)
+
+    test_log_dir = d.getVar("TEST_LOG_DIR", True)
+
+    bb.utils.mkdirhier(test_log_dir)
 
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
         bb.fatal("The toolchain %s is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' ." % tcname)
 
-    sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
-    bb.utils.remove(sdktestdir, True)
-    bb.utils.mkdirhier(sdktestdir)
+    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.testdata.json")
+    test_data = json.load(open(tdname, "r"))
+    test_data['TEST_LOG_DIR'] = test_log_dir
+
+    target_pkg_manifest = OESDKTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"))
+    host_pkg_manifest = OESDKTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
+
+    sdk_dir = d.expand("${WORKDIR}/testimage-sdk/")
+    bb.utils.remove(sdk_dir, True)
+    bb.utils.mkdirhier(sdk_dir)
     try:
-        subprocess.check_output("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
+        subprocess.check_output("cd %s; %s <<EOF\n./\nY\nEOF" % (sdk_dir, tcname), shell=True)
     except subprocess.CalledProcessError as e:
         bb.fatal("Couldn't install the SDK:\n%s" % e.output.decode("utf-8"))
 
-    try:
-        run_test_context(SDKTestContext, d, sdktestdir, tcname, pn)
-    finally:
-        bb.utils.remove(sdktestdir, True)
+    fail = False
+    sdk_envs = OESDKTestContextExecutor._get_sdk_environs(sdk_dir)
+    for s in sdk_envs:
+        sdk_env = sdk_envs[s]
+        bb.plain("SDK testing environment: %s" % s)
+        tc = OESDKTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
+            sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
+            host_pkg_manifest=host_pkg_manifest)
 
+        try:
+            tc.loadTests(OESDKTestContextExecutor.default_cases)
+        except Exception as e:
+            import traceback
+            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+        result = tc.runTests()
+
+        component = "%s %s" % (pn, OESDKTestContextExecutor.name)
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
+  
 testsdk_main[vardepsexclude] =+ "BB_ORIGENV"
 
 python do_testsdk() {
@@ -94,7 +138,6 @@ def testsdkext_main(d):
     from oeqa.oetest import SDKTestContext, SDKExtTestContext
     from oeqa.utils import avoid_paths_in_environ
 
-
     # extensible sdk use network
     export_proxies(d)
 
-- 
2.1.4


