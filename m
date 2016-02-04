Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 652DE605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:27:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2016 14:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647384209"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:27:58 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:29:35 -0600
Message-Id: <20316408d3b31e887b30371b22d49e8b37cfbb30.1454624835.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH v3 18/22] oeqa/oetest: Fix compatibility SDK tests using eSDK.
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
X-List-Received-Date: Thu, 04 Feb 2016 22:27:58 -0000
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
index 417510c..453ce40 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -5,14 +5,14 @@
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
@@ -112,7 +112,7 @@ def testsdkext_main(d):
 
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


