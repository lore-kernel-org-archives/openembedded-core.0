Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7EDB770CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:27:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2016 14:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647384191"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:27:56 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:29:33 -0600
Message-Id: <e6d78b3dd281f1818b60494294578208dd361050.1454624835.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH v3 16/22] testsdkext: Add skeleton for support Extensible SDK tests.
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
X-List-Received-Date: Thu, 04 Feb 2016 22:27:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

oeqa/sdkext: Add module and __init__.py will contain eSDK tests.
classes/testsdk: Add support for run eSDK tests.
oeqa/oetest: Create oeSDKExtTest for now only inherit oeSDKTest,
             modified SDKExtTestContext now inherit SDKTestContext
             and set sdkext filesdir for store data fixtures.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testsdk.bbclass     | 10 +++++++++-
 meta/lib/oeqa/oetest.py          | 12 +++++++++++-
 meta/lib/oeqa/sdkext/__init__.py |  3 +++
 3 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/sdkext/__init__.py

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index a0c50fe..417510c 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -114,7 +114,15 @@ def testsdkext_main(d):
         bb.plain("Running SDK Compatibility tests ...")
         run_test_context(SDKTestContext, d, testdir, tcname, pn)
     finally:
-        bb.utils.remove(testdir, True)
+        pass
+
+    try:
+        bb.plain("Running Extensible SDK tests ...")
+        run_test_context(SDKExtTestContext, d, testdir, tcname, pn)
+    finally:
+        pass
+
+    bb.utils.remove(testdir, True)
 
 testsdkext_main[vardepsexclude] =+ "BB_ORIGENV"
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 47ea3b2..620617c 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -19,6 +19,7 @@ except ImportError:
 import logging
 
 import oeqa.runtime
+import oeqa.sdkext
 from oeqa.utils.decorators import LogResults, gettag, getResults
 
 logger = logging.getLogger("BitBake")
@@ -126,6 +127,9 @@ class oeSDKTest(oeTest):
     def _run(self, cmd):
         return subprocess.check_output(". %s > /dev/null; %s;" % (self.tc.sdkenv, cmd), shell=True)
 
+class oeSDKExtTest(oeSDKTest):
+    pass
+
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
@@ -400,7 +404,13 @@ class SDKTestContext(TestContext):
         return [t for t in (self.d.getVar("TEST_SUITES_SDK", True) or \
                 "auto").split() if t != "auto"]
 
-class SDKExtTestContext(TestContext):
+class SDKExtTestContext(SDKTestContext):
+    def __init__(self, d, sdktestdir, sdkenv):
+        super(SDKExtTestContext, self).__init__(d, sdktestdir, sdkenv)
+
+        self.sdkextfilesdir = os.path.join(os.path.dirname(os.path.abspath(
+            oeqa.sdkext.__file__)), "files")
+
     def _get_test_namespace(self):
         return "sdkext"
 
diff --git a/meta/lib/oeqa/sdkext/__init__.py b/meta/lib/oeqa/sdkext/__init__.py
new file mode 100644
index 0000000..4cf3fa7
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/__init__.py
@@ -0,0 +1,3 @@
+# Enable other layers to have tests in the same named directory
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
-- 
2.1.4


