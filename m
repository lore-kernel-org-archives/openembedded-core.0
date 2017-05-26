Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1EB782C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887620"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:15 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:32 -0500
Message-Id: <07366784aa5718666ce3df916d66159feeb32cdf.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 06/36] oeqa/core: Move OETestContext.log{Summary, Details} into OETestResult
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
X-List-Received-Date: Fri, 26 May 2017 20:38:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Those methods are used to write in the log the results so
it makes sense to have defined at OETestResult because
is a format of the result itself.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testimage.bbclass |  4 +-
 meta/classes/testsdk.bbclass   |  8 ++--
 meta/lib/oeqa/core/context.py  | 93 ++----------------------------------------
 meta/lib/oeqa/core/runner.py   | 88 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+), 96 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index fb21460..d42907c 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -292,8 +292,8 @@ def testimage_main(d):
     # Show results (if we have them)
     if not results:
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn)
-    tc.logSummary(results, pn)
-    tc.logDetails()
+    results.logSummary(pn)
+    results.logDetails()
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn)
 
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 4740233..edea89c 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -70,8 +70,8 @@ def testsdk_main(d):
         component = "%s %s" % (pn, OESDKTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
 
-        tc.logSummary(result, component, context_msg)
-        tc.logDetails()
+        result.logSummary(component, context_msg)
+        result.logDetails()
 
         if not result.wasSuccessful():
             fail = True
@@ -172,8 +172,8 @@ def testsdkext_main(d):
         component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
 
-        tc.logSummary(result, component, context_msg)
-        tc.logDetails()
+        result.logSummary(component, context_msg)
+        result.logDetails()
 
         if not result.wasSuccessful():
             fail = True
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 2628651..54958ad 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -7,10 +7,9 @@ import json
 import time
 import logging
 import collections
-import re
 
 from oeqa.core.loader import OETestLoader
-from oeqa.core.runner import OETestRunner, xmlEnabled
+from oeqa.core.runner import OETestRunner
 
 class OETestContext(object):
     loaderClass = OETestLoader
@@ -59,92 +58,6 @@ class OETestContext(object):
 
         return result
 
-    def logSummary(self, result, component, context_msg=''):
-        self.logger.info("SUMMARY:")
-        self.logger.info("%s (%s) - Ran %d test%s in %.3fs" % (component,
-            context_msg, result.testsRun, result.testsRun != 1 and "s" or "",
-            (self._run_end_time - self._run_start_time)))
-
-        if result.wasSuccessful():
-            msg = "%s - OK - All required tests passed" % component
-        else:
-            msg = "%s - FAIL - Required tests failed" % component
-        skipped = len(self._results['skipped'])
-        if skipped: 
-            msg += " (skipped=%d)" % skipped
-        self.logger.info(msg)
-
-    def _getDetailsNotPassed(self, case, type, desc):
-        found = False
-
-        for (scase, msg) in self._results[type]:
-            # XXX: When XML reporting is enabled scase is
-            # xmlrunner.result._TestInfo instance instead of
-            # string.
-            if xmlEnabled:
-                if case.id() == scase.test_id:
-                    found = True
-                    break
-                scase_str = scase.test_id
-            else:
-                if case == scase:
-                    found = True
-                    break
-                scase_str = str(scase)
-
-            # When fails at module or class level the class name is passed as string
-            # so figure out to see if match
-            m = re.search("^setUpModule \((?P<module_name>.*)\)$", scase_str)
-            if m:
-                if case.__class__.__module__ == m.group('module_name'):
-                    found = True
-                    break
-
-            m = re.search("^setUpClass \((?P<class_name>.*)\)$", scase_str)
-            if m:
-                class_name = "%s.%s" % (case.__class__.__module__,
-                        case.__class__.__name__)
-
-                if class_name == m.group('class_name'):
-                    found = True
-                    break
-
-        if found:
-            return (found, msg)
-
-        return (found, None)
-
-    def logDetails(self):
-        self.logger.info("RESULTS:")
-        for case_name in self._registry['cases']:
-            case = self._registry['cases'][case_name]
-
-            result_types = ['failures', 'errors', 'skipped', 'expectedFailures']
-            result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL']
-
-            fail = False
-            desc = None
-            for idx, name in enumerate(result_types):
-                (fail, msg) = self._getDetailsNotPassed(case, result_types[idx],
-                        result_desc[idx])
-                if fail:
-                    desc = result_desc[idx]
-                    break
-
-            oeid = -1
-            for d in case.decorators:
-                if hasattr(d, 'oeid'):
-                    oeid = d.oeid
-            
-            if fail:
-                self.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
-                    oeid, desc))
-                if msg:
-                    self.logger.info(msg)
-            else:
-                self.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
-                    oeid, 'PASSED'))
-
 class OETestContextExecutor(object):
     _context_class = OETestContext
 
@@ -227,8 +140,8 @@ class OETestContextExecutor(object):
         self.tc = self._context_class(**self.tc_kwargs['init'])
         self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
         rc = self.tc.runTests(**self.tc_kwargs['run'])
-        self.tc.logSummary(rc, self.name)
-        self.tc.logDetails()
+        rc.logSummary(self.name)
+        rc.logDetails()
 
         output_link = os.path.join(os.path.dirname(args.output_log),
                 "%s-results.log" % self.name)
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 0b04e8d..7505838 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -5,6 +5,7 @@ import os
 import time
 import unittest
 import logging
+import re
 
 xmlEnabled = False
 try:
@@ -44,6 +45,93 @@ class OETestResult(_TestResult):
         self.tc._results['skipped'] = self.skipped
         self.tc._results['expectedFailures'] = self.expectedFailures
 
+    def logSummary(self, component, context_msg=''):
+        elapsed_time = self.tc._run_end_time - self.tc._run_start_time
+        self.tc.logger.info("SUMMARY:")
+        self.tc.logger.info("%s (%s) - Ran %d test%s in %.3fs" % (component,
+            context_msg, self.testsRun, self.testsRun != 1 and "s" or "",
+            elapsed_time))
+
+        if self.wasSuccessful():
+            msg = "%s - OK - All required tests passed" % component
+        else:
+            msg = "%s - FAIL - Required tests failed" % component
+        skipped = len(self.tc._results['skipped'])
+        if skipped: 
+            msg += " (skipped=%d)" % skipped
+        self.tc.logger.info(msg)
+
+    def _getDetailsNotPassed(self, case, type, desc):
+        found = False
+
+        for (scase, msg) in self.tc._results[type]:
+            # XXX: When XML reporting is enabled scase is
+            # xmlrunner.result._TestInfo instance instead of
+            # string.
+            if xmlEnabled:
+                if case.id() == scase.test_id:
+                    found = True
+                    break
+                scase_str = scase.test_id
+            else:
+                if case == scase:
+                    found = True
+                    break
+                scase_str = str(scase)
+
+            # When fails at module or class level the class name is passed as string
+            # so figure out to see if match
+            m = re.search("^setUpModule \((?P<module_name>.*)\)$", scase_str)
+            if m:
+                if case.__class__.__module__ == m.group('module_name'):
+                    found = True
+                    break
+
+            m = re.search("^setUpClass \((?P<class_name>.*)\)$", scase_str)
+            if m:
+                class_name = "%s.%s" % (case.__class__.__module__,
+                        case.__class__.__name__)
+
+                if class_name == m.group('class_name'):
+                    found = True
+                    break
+
+        if found:
+            return (found, msg)
+
+        return (found, None)
+
+    def logDetails(self):
+        self.tc.logger.info("RESULTS:")
+        for case_name in self.tc._registry['cases']:
+            case = self.tc._registry['cases'][case_name]
+
+            result_types = ['failures', 'errors', 'skipped', 'expectedFailures']
+            result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL']
+
+            fail = False
+            desc = None
+            for idx, name in enumerate(result_types):
+                (fail, msg) = self._getDetailsNotPassed(case, result_types[idx],
+                        result_desc[idx])
+                if fail:
+                    desc = result_desc[idx]
+                    break
+
+            oeid = -1
+            for d in case.decorators:
+                if hasattr(d, 'oeid'):
+                    oeid = d.oeid
+
+            if fail:
+                self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
+                    oeid, desc))
+                if msg:
+                    self.tc.logger.info(msg)
+            else:
+                self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
+                    oeid, 'PASSED'))
+
 class OETestRunner(_TestRunner):
     streamLoggerClass = OEStreamLogger
 
-- 
2.1.4


