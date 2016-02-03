Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8716E77331
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 00:29:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 16:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,387,1449561600"; d="scan'208";a="904289428"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 16:29:10 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 18:30:38 -0600
Message-Id: <19e8b333ebf37036962a64d0f550994c9d54847b.1454459362.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH v2 26/28] oeqa/oetest: Fix compatibility SDK tests using eSDK.
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
X-List-Received-Date: Wed, 03 Feb 2016 00:29:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When run SDK tests over eSDK we need to use SDKExtTestContext
instead of SDKTestContext because if we use SDKTestContext search
for SDK manifest and depends on the SDK manifest generation so
populate_sdk needs to be executed.

Adds a compatibility mode flag to SDKExtTestContext for search tests
over sdk module instead of sdkext module and change testsdk calls
to comply with this new param.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass |  6 +++---
 meta/lib/oeqa/oetest.py      | 13 ++++++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 757c769..edc29ca 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -15,14 +15,14 @@
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 TESTSDKLOCK = "${TMPDIR}/testsdk.lock"
 
-def run_test_context(CTestContext, d, testdir, tcname, pn):
+def run_test_context(CTestContext, d, testdir, tcname, pn, *args):
     import glob
     import time
 
     targets = glob.glob(d.expand(testdir + "/tc/environment-setup-*"))
     for sdkenv in targets:
         bb.plain("Testing %s" % sdkenv)
-        tc = CTestContext(d, testdir, sdkenv)
+        tc = CTestContext(d, testdir, sdkenv, args)
 
         # this is a dummy load of tests
         # we are doing that to find compile errors in the tests themselves
@@ -122,7 +122,7 @@ def testsdkext_main(d):
 
     try:
         bb.plain("Running SDK Compatibility tests ...")
-        run_test_context(SDKTestContext, d, testdir, tcname, pn)
+        run_test_context(SDKExtTestContext, d, testdir, tcname, pn, True)
     finally:
         pass
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 80b40b6..3e2ea0f 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -376,7 +376,7 @@ class ImageTestContext(TestContext):
         setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeTest.hasPackage("procps") else "ps")
 
 class SDKTestContext(TestContext):
-    def __init__(self, d, sdktestdir, sdkenv):
+    def __init__(self, d, sdktestdir, sdkenv, *args):
         super(SDKTestContext, self).__init__(d)
 
         self.sdktestdir = sdktestdir
@@ -409,9 +409,13 @@ class SDKTestContext(TestContext):
                 "auto").split() if t != "auto"]
 
 class SDKExtTestContext(SDKTestContext):
-    def __init__(self, d, sdktestdir, sdkenv):
+    def __init__(self, d, sdktestdir, sdkenv, *args):
         self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST", True)
         self.host_manifest = d.getVar("SDK_EXT_HOST_MANIFEST", True)
+        if args:
+            self.cm = args[0] # Compatibility mode for run SDK tests
+        else:
+            self.cm = False
 
         super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv)
 
@@ -419,7 +423,10 @@ class SDKExtTestContext(SDKTestContext):
             oeqa.sdkext.__file__)), "files")
 
     def _get_test_namespace(self):
-        return "sdkext"
+        if self.cm:
+            return "sdk"
+        else:
+            return "sdkext"
 
     def _get_test_suites(self):
         return (self.d.getVar("TEST_SUITES_SDK_EXT", True) or "auto").split()
-- 
2.1.4


