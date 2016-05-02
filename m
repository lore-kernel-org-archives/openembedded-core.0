Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D395076809
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 21:23:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 May 2016 14:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,569,1455004800"; d="scan'208";a="944713025"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2016 14:23:15 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 13:19:14 +0000
Message-Id: <a8b4efbd41bb4e99af2f04ad85de0412377cac12.1462194553.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1462194553.git.mariano.lopez@linux.intel.com>
References: <cover.1462194553.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1462194553.git.mariano.lopez@linux.intel.com>
References: <cover.1462194553.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/6] oeqa/oetest.py: Add class ExportTestContext
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
X-List-Received-Date: Mon, 02 May 2016 21:23:16 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Adding the class is needed to separate the exported test
from the test image; both test run under different conditions,
i.e. an exported test doesn't require to change the signal
handling.

This change adds clasess ExportTestContext and ImageTestContext,
both of them inherits from RuntimeTestContext. Also refactors
RuntimeTestContext class, to keep the code common in this class.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 3ed5bb8..bef9ac4 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -331,14 +331,13 @@ class TestContext(object):
 
         return runner.run(self.suite)
 
-class ImageTestContext(TestContext):
-    def __init__(self, d, target, host_dumper):
-        super(ImageTestContext, self).__init__(d)
+class RuntimeTestContext(TestContext):
+    def __init__(self, d, target):
+        super(RuntimeTestContext, self).__init__(d)
 
         self.tagexp =  d.getVar("TEST_SUITES_TAGS", True)
 
         self.target = target
-        self.host_dumper = host_dumper
 
         manifest = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),
                 d.getVar("IMAGE_LINK_NAME", True) + ".manifest")
@@ -352,15 +351,6 @@ class ImageTestContext(TestContext):
         else:
             self.pkgmanifest = ""
 
-        self.sigterm = False
-        self.origsigtermhandler = signal.getsignal(signal.SIGTERM)
-        signal.signal(signal.SIGTERM, self._sigterm_exception)
-
-    def _sigterm_exception(self, signum, stackframe):
-        bb.warn("TestImage received SIGTERM, shutting down...")
-        self.sigterm = True
-        self.target.stop()
-
     def _get_test_namespace(self):
         return "runtime"
 
@@ -382,9 +372,29 @@ class ImageTestContext(TestContext):
         return [t for t in self.d.getVar("TEST_SUITES", True).split() if t != "auto"]
 
     def loadTests(self):
-        super(ImageTestContext, self).loadTests()
+        super(RuntimeTestContext, self).loadTests()
         setattr(oeRuntimeTest, "pscmd", "ps -ef" if oeTest.hasPackage("procps") else "ps")
 
+class ImageTestContext(RuntimeTestContext):
+    def __init__(self, d, target, host_dumper):
+        super(ImageTestContext, self).__init__(d, target)
+
+        self.host_dumper = host_dumper
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
+class ExportTestContext(RuntimeTestContext):
+    def __init__(self, d, target):
+        super(ExportTestContext, self).__init__(d, target)
+        self.sigterm = None
+
 class SDKTestContext(TestContext):
     def __init__(self, d, sdktestdir, sdkenv, tcname, *args):
         super(SDKTestContext, self).__init__(d)
-- 
2.6.6


