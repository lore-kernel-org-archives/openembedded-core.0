Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E231771E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:27:54 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2016 14:27:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647384161"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:27:54 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:29:30 -0600
Message-Id: <b31d64b5e06e166faf0442fb3fe5697a79d691b6.1454624835.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH v3 13/22] classes/testsdk: Add function run_test_context
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
X-List-Received-Date: Thu, 04 Feb 2016 22:27:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

This helper functions will be serve as well to run extensible
sdk tests so generalize it to get function context as arg.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testsdk.bbclass | 62 +++++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index ba8897e..88057e5 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -5,13 +5,40 @@
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 TESTSDKLOCK = "${TMPDIR}/testsdk.lock"
 
+def run_test_context(CTestContext, d, testdir, tcname, pn):
+    import glob
+    import time
+
+    targets = glob.glob(d.expand(testdir + "/tc/environment-setup-*"))
+    for sdkenv in targets:
+        bb.plain("Testing %s" % sdkenv)
+        tc = CTestContext(d, testdir, sdkenv)
+
+        # this is a dummy load of tests
+        # we are doing that to find compile errors in the tests themselves
+        # before booting the image
+        try:
+            tc.loadTests()
+        except Exception as e:
+            import traceback
+            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+        starttime = time.time()
+        result = tc.runTests()
+        stoptime = time.time()
+        if result.wasSuccessful():
+            bb.plain("%s SDK(%s):%s - Ran %d test%s in %.3fs" % (pn, os.path.basename(tcname), os.path.basename(sdkenv),result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
+            msg = "%s - OK - All required tests passed" % pn
+            skipped = len(result.skipped)
+            if skipped:
+                msg += " (skipped=%d)" % skipped
+            bb.plain(msg)
+        else:
+            raise bb.build.FuncFailed("%s - FAILED - check the task log and the commands log" % pn )
+
 def testsdk_main(d):
-    import unittest
     import os
-    import glob
-    import oeqa.runtime
     import oeqa.sdk
-    import time
     import subprocess
     from oeqa.oetest import SDKTestContext
 
@@ -31,32 +58,7 @@ def testsdk_main(d):
         bb.fatal("Couldn't install the SDK:\n%s" % e.output)
 
     try:
-        targets = glob.glob(d.expand(sdktestdir + "/tc/environment-setup-*"))
-        for sdkenv in targets:
-            bb.plain("Testing %s" % sdkenv)
-            tc = SDKTestContext(d, sdktestdir, sdkenv)
-
-            # this is a dummy load of tests
-            # we are doing that to find compile errors in the tests themselves
-            # before booting the image
-            try:
-                tc.loadTests()
-            except Exception as e:
-                import traceback
-                bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
-
-            starttime = time.time()
-            result = tc.runTests()
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
+        run_test_context(SDKTestContext, d, sdktestdir, tcname, pn)
     finally:
         bb.utils.remove(sdktestdir, True)
 
-- 
2.1.4


