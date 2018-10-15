Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 81DA279A9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 07:40:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2018 00:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,383,1534834800"; d="scan'208";a="100295765"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 15 Oct 2018 00:40:07 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 15:24:50 +0800
Message-Id: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/5] oeqa/core/runner: refactor for OEQA to write json testresult
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
X-List-Received-Date: Mon, 15 Oct 2018 07:40:07 -0000

Refactor the original _getDetailsNotPassed method to return
testresult details (test status and log), which will be reused
by future OEQA code to write json testresult.

Take the opportunity to consolidate and simplify the logic used
to gather test status and log within the TestResult instance.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/core/runner.py | 70 ++++++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index eeb625b..56666ee 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -76,40 +76,43 @@ class OETestResult(_TestResult):
         else:
             msg = "%s - FAIL - Required tests failed" % component
         skipped = len(self.skipped)
-        if skipped: 
+        if skipped:
             msg += " (skipped=%d)" % skipped
         self.tc.logger.info(msg)
 
-    def _getDetailsNotPassed(self, case, type, desc):
-        found = False
+    def _getTestResultDetails(self, case):
+        result_types = ['failures', 'errors', 'skipped', 'expectedFailures', 'successes']
+        result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL', 'PASSED']
 
-        for (scase, msg) in getattr(self, type):
-            if case.id() == scase.id():
-                found = True
-                break
-            scase_str = str(scase.id())
-
-            # When fails at module or class level the class name is passed as string
-            # so figure out to see if match
-            m = re.search("^setUpModule \((?P<module_name>.*)\)$", scase_str)
-            if m:
-                if case.__class__.__module__ == m.group('module_name'):
+        for idx, name in enumerate(result_types):
+            found = False
+            for (scase, msg) in getattr(self, result_types[idx]):
+                if case.id() == scase.id():
                     found = True
                     break
+                scase_str = str(scase.id())
 
-            m = re.search("^setUpClass \((?P<class_name>.*)\)$", scase_str)
-            if m:
-                class_name = "%s.%s" % (case.__class__.__module__,
-                        case.__class__.__name__)
+                # When fails at module or class level the class name is passed as string
+                # so figure out to see if match
+                m = re.search("^setUpModule \((?P<module_name>.*)\)$", scase_str)
+                if m:
+                    if case.__class__.__module__ == m.group('module_name'):
+                        found = True
+                        break
 
-                if class_name == m.group('class_name'):
-                    found = True
-                    break
+                m = re.search("^setUpClass \((?P<class_name>.*)\)$", scase_str)
+                if m:
+                    class_name = "%s.%s" % (case.__class__.__module__,
+                            case.__class__.__name__)
+
+                    if class_name == m.group('class_name'):
+                        found = True
+                        break
 
-        if found:
-            return (found, msg)
+            if found:
+                return result_desc[idx], msg
 
-        return (found, None)
+        return 'UNKNOWN', None
 
     def addSuccess(self, test):
         #Added so we can keep track of successes too
@@ -121,17 +124,7 @@ class OETestResult(_TestResult):
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
-            result_types = ['failures', 'errors', 'skipped', 'expectedFailures', 'successes']
-            result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL', 'PASSED']
-
-            fail = False
-            desc = None
-            for idx, name in enumerate(result_types):
-                (fail, msg) = self._getDetailsNotPassed(case, result_types[idx],
-                        result_desc[idx])
-                if fail:
-                    desc = result_desc[idx]
-                    break
+            (status, log) = self._getTestResultDetails(case)
 
             oeid = -1
             if hasattr(case, 'decorators'):
@@ -143,12 +136,7 @@ class OETestResult(_TestResult):
             if case.id() in self.starttime and case.id() in self.endtime:
                 t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
 
-            if fail:
-                self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(),
-                    oeid, desc, t))
-            else:
-                self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(),
-                    oeid, 'UNKNOWN', t))
+            self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
 
 class OEListTestsResult(object):
     def wasSuccessful(self):
-- 
2.7.4


