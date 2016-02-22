Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EBAD7771CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 18:29:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 22 Feb 2016 10:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,485,1449561600"; d="scan'208";a="657283090"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.35])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2016 10:29:19 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 12:31:32 -0600
Message-Id: <0dbfbcb65189d2195b1010834f193d268db6a752.1456165797.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1456165797.git.anibal.limon@linux.intel.com>
References: <cover.1456165797.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1456165797.git.anibal.limon@linux.intel.com>
References: <cover.1456165797.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCHv2 3/4] classes/testsdk: Pass tcname to SDK and SDKExt contexts
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
X-List-Received-Date: Mon, 22 Feb 2016 18:29:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

tcname is needed for eSDK update testcase will be used for
 publish it and then try to update

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testsdk.bbclass | 2 +-
 meta/lib/oeqa/oetest.py      | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 157077e..f4dc2c3 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -22,7 +22,7 @@ def run_test_context(CTestContext, d, testdir, tcname, pn, *args):
     targets = glob.glob(d.expand(testdir + "/tc/environment-setup-*"))
     for sdkenv in targets:
         bb.plain("Testing %s" % sdkenv)
-        tc = CTestContext(d, testdir, sdkenv, args)
+        tc = CTestContext(d, testdir, sdkenv, tcname, args)
 
         # this is a dummy load of tests
         # we are doing that to find compile errors in the tests themselves
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 3809ed7..fc1e8b5 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -386,11 +386,12 @@ class ImageTestContext(TestContext):
         setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeTest.hasPackage("procps") else "ps")
 
 class SDKTestContext(TestContext):
-    def __init__(self, d, sdktestdir, sdkenv, *args):
+    def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
         super(SDKTestContext, self).__init__(d)
 
         self.sdktestdir = sdktestdir
         self.sdkenv = sdkenv
+        self.tcname = tcname
 
         if not hasattr(self, 'target_manifest'):
             self.target_manifest = d.getVar("SDK_TARGET_MANIFEST", True)
@@ -419,7 +420,7 @@ class SDKTestContext(TestContext):
                 "auto").split() if t != "auto"]
 
 class SDKExtTestContext(SDKTestContext):
-    def __init__(self, d, sdktestdir, sdkenv, *args):
+    def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
         self.target_manifest = d.getVar("SDK_EXT_TARGET_MANIFEST", True)
         self.host_manifest = d.getVar("SDK_EXT_HOST_MANIFEST", True)
         if args:
@@ -427,7 +428,7 @@ class SDKExtTestContext(SDKTestContext):
         else:
             self.cm = False
 
-        super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv)
+        super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv, tcname)
 
         self.sdkextfilesdir = os.path.join(os.path.dirname(os.path.abspath(
             oeqa.sdkext.__file__)), "files")
-- 
2.1.4


