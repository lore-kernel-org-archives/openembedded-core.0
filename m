Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2587176A51
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 21:23:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 May 2016 14:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,569,1455004800"; d="scan'208";a="944713038"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 02 May 2016 14:23:19 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 13:19:19 +0000
Message-Id: <76cd378d0a83dfc1fae429a196e21e089d1fbe76.1462194553.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1462194553.git.mariano.lopez@linux.intel.com>
References: <cover.1462194553.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1462194553.git.mariano.lopez@linux.intel.com>
References: <cover.1462194553.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 6/6] oetest.py: Use the real ExportTestContext in exported tests
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
X-List-Received-Date: Mon, 02 May 2016 21:23:18 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

There are parts of the fuctionallity missing when using the
dummy ExportTestContext class in runexported.py.

This changes the use of ExportTestContext dummy class from
runexported.py to the real class in oetest.py.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py      | 26 +++++++++++++++++---------
 meta/lib/oeqa/runexported.py | 16 ++--------------
 2 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 6a908ee..70db119 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -186,11 +186,19 @@ def custom_verbose(msg, *args, **kwargs):
         _buffer_logger = ""
 
 class TestContext(object):
-    def __init__(self, d):
+    def __init__(self, d, exported=False):
         self.d = d
 
         self.testsuites = self._get_test_suites()
-        self.testslist = self._get_tests_list(d.getVar("BBPATH", True).split(':'))
+
+        if exported:
+            path = [os.path.dirname(os.path.abspath(__file__))]
+            extrapath = ""
+        else:
+            path = d.getVar("BBPATH", True).split(':')
+            extrapath = "lib/oeqa"
+
+        self.testslist = self._get_tests_list(path, extrapath)
         self.testsrequired = self._get_test_suites_required()
 
         self.filesdir = os.path.join(os.path.dirname(os.path.abspath(
@@ -213,7 +221,7 @@ class TestContext(object):
         return " ".join(tcs)
 
     # return test list by type also filter if TEST_SUITES is specified
-    def _get_tests_list(self, bbpath):
+    def _get_tests_list(self, bbpath, extrapath):
         testslist = []
 
         type = self._get_test_namespace()
@@ -227,11 +235,11 @@ class TestContext(object):
                     continue
                 found = False
                 for p in bbpath:
-                    if os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname + '.py')):
+                    if os.path.exists(os.path.join(p, extrapath, type, testname + ".py")):
                         testslist.append("oeqa." + type + "." + testname)
                         found = True
                         break
-                    elif os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname.split(".")[0] + '.py')):
+                    elif os.path.exists(os.path.join(p, extrapath, type, testname.split(".")[0] + ".py")):
                         testslist.append("oeqa." + type + "." + testname)
                         found = True
                         break
@@ -333,8 +341,8 @@ class TestContext(object):
         return runner.run(self.suite)
 
 class RuntimeTestContext(TestContext):
-    def __init__(self, d, target):
-        super(RuntimeTestContext, self).__init__(d)
+    def __init__(self, d, target, exported=False):
+        super(RuntimeTestContext, self).__init__(d, exported)
 
         self.tagexp =  d.getVar("TEST_SUITES_TAGS", True)
 
@@ -393,8 +401,8 @@ class ImageTestContext(RuntimeTestContext):
         self.target.stop()
 
 class ExportTestContext(RuntimeTestContext):
-    def __init__(self, d, target):
-        super(ExportTestContext, self).__init__(d, target)
+    def __init__(self, d, target, exported=False):
+        super(ExportTestContext, self).__init__(d, target, exported)
         self.sigterm = None
 
 class SDKTestContext(TestContext):
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index f333879..52c1171 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -30,7 +30,7 @@ except ImportError:
 
 sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "oeqa")))
 
-from oeqa.oetest import TestContext
+from oeqa.oetest import ExportTestContext
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.dump import get_host_dumper
 
@@ -69,10 +69,6 @@ class MyDataDict(dict):
     def getVar(self, key, unused = None):
         return self.get(key, "")
 
-class ExportTestContext(TestContext):
-    def __init__(self, d):
-        self.d = d
-
 def main():
 
     parser = argparse.ArgumentParser()
@@ -111,20 +107,12 @@ def main():
         if not os.path.isdir(d["DEPLOY_DIR"]):
             print("WARNING: The path to DEPLOY_DIR does not exist: %s" % d["DEPLOY_DIR"])
 
-
     target = FakeTarget(d)
     for key in loaded["target"].keys():
         setattr(target, key, loaded["target"][key])
 
     target.exportStart()
-    tc = ExportTestContext(d)
-
-    setattr(tc, "d", d)
-    setattr(tc, "target", target)
-    for key in loaded.keys():
-        if key != "d" and key != "target" and key != "host_dumper":
-            setattr(tc, key, loaded[key])
-
+    tc = ExportTestContext(d, target, True)
     tc.loadTests()
     tc.runTests()
 
-- 
2.6.6


