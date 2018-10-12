Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7C7746E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 06:48:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2018 23:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,371,1534834800"; d="scan'208";a="91360835"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga003.jf.intel.com with ESMTP; 11 Oct 2018 23:48:23 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 14:33:07 +0800
Message-Id: <1539325990-89780-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Fri, 12 Oct 2018 06:48:24 -0000

As part of the solution to replace Testopia to store testresult,
OEQA need to output testresult into json files, where these json
testresult files will be stored in git repository by the future
test-case-management tools.

Both the testresult (eg. PASSED, FAILED, ERROR) and  the test log
(eg. message from unit test assertion) will be created for storing.

Also the library class inside this patch will be reused by the future
test-case-management tools to write json testresult for manual test
case executed.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/core/runner.py | 132 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 121 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index eeb625b..cc33d9c 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -6,6 +6,8 @@ import time
 import unittest
 import logging
 import re
+import json
+import pathlib
 
 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
@@ -44,6 +46,9 @@ class OETestResult(_TestResult):
 
         self.tc = tc
 
+        self.result_types = ['failures', 'errors', 'skipped', 'expectedFailures', 'successes']
+        self.result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL', 'PASSED']
+
     def startTest(self, test):
         # May have been set by concurrencytest
         if test.id() not in self.starttime:
@@ -80,7 +85,7 @@ class OETestResult(_TestResult):
             msg += " (skipped=%d)" % skipped
         self.tc.logger.info(msg)
 
-    def _getDetailsNotPassed(self, case, type, desc):
+    def _isTestResultContainTestCaseWithResultTypeProvided(self, case, type):
         found = False
 
         for (scase, msg) in getattr(self, type):
@@ -121,16 +126,12 @@ class OETestResult(_TestResult):
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
-            result_types = ['failures', 'errors', 'skipped', 'expectedFailures', 'successes']
-            result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL', 'PASSED']
-
-            fail = False
+            found = False
             desc = None
-            for idx, name in enumerate(result_types):
-                (fail, msg) = self._getDetailsNotPassed(case, result_types[idx],
-                        result_desc[idx])
-                if fail:
-                    desc = result_desc[idx]
+            for idx, name in enumerate(self.result_types):
+                (found, msg) = self._isTestResultContainTestCaseWithResultTypeProvided(case, self.result_types[idx])
+                if found:
+                    desc = self.result_desc[idx]
                     break
 
             oeid = -1
@@ -143,13 +144,43 @@ class OETestResult(_TestResult):
             if case.id() in self.starttime and case.id() in self.endtime:
                 t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
 
-            if fail:
+            if found:
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(),
                     oeid, desc, t))
             else:
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(),
                     oeid, 'UNKNOWN', t))
 
+    def _get_testcase_result_and_log_dict(self):
+        testcase_result_dict = {}
+        testcase_log_dict = {}
+        for case_name in self.tc._registry['cases']:
+            case = self.tc._registry['cases'][case_name]
+
+            found = False
+            desc = None
+            test_log = ''
+            for idx, name in enumerate(self.result_types):
+                (found, msg) = self._isTestResultContainTestCaseWithResultTypeProvided(case, self.result_types[idx])
+                if found:
+                    desc = self.result_desc[idx]
+                    test_log = msg
+                    break
+
+            if found:
+                testcase_result_dict[case.id()] = desc
+                testcase_log_dict[case.id()] = test_log
+            else:
+                testcase_result_dict[case.id()] = "UNKNOWN"
+        return testcase_result_dict, testcase_log_dict
+
+    def logDetailsInJson(self, file_dir):
+        (testcase_result_dict, testcase_log_dict) = self._get_testcase_result_and_log_dict()
+        if len(testcase_result_dict) > 0 and len(testcase_log_dict) > 0:
+            tresultjsonhelper = OETestResultJSONHelper()
+            tresultjsonhelper.dump_testresult_files(testcase_result_dict, file_dir)
+            tresultjsonhelper.dump_log_files(testcase_log_dict, os.path.join(file_dir, 'logs'))
+
 class OEListTestsResult(object):
     def wasSuccessful(self):
         return True
@@ -261,3 +292,82 @@ class OETestRunner(_TestRunner):
             self._list_tests_module(suite)
 
         return OEListTestsResult()
+
+class OETestResultJSONHelper(object):
+
+    def get_testsuite_from_testcase(self, testcase):
+        testsuite = testcase[0:testcase.rfind(".")]
+        return testsuite
+
+    def get_testmodule_from_testsuite(self, testsuite):
+        testmodule = testsuite[0:testsuite.find(".")]
+        return testmodule
+
+    def get_testsuite_testcase_dictionary(self, testcase_result_dict):
+        testcase_list = testcase_result_dict.keys()
+        testsuite_testcase_dict = {}
+        for testcase in testcase_list:
+            testsuite = self.get_testsuite_from_testcase(testcase)
+            if testsuite in testsuite_testcase_dict:
+                testsuite_testcase_dict[testsuite].append(testcase)
+            else:
+                testsuite_testcase_dict[testsuite] = [testcase]
+        return testsuite_testcase_dict
+
+    def get_testmodule_testsuite_dictionary(self, testsuite_testcase_dict):
+        testsuite_list = testsuite_testcase_dict.keys()
+        testmodule_testsuite_dict = {}
+        for testsuite in testsuite_list:
+            testmodule = self.get_testmodule_from_testsuite(testsuite)
+            if testmodule in testmodule_testsuite_dict:
+                testmodule_testsuite_dict[testmodule].append(testsuite)
+            else:
+                testmodule_testsuite_dict[testmodule] = [testsuite]
+        return testmodule_testsuite_dict
+
+    def _get_testcase_result(self, testcase, testcase_status_dict):
+        if testcase in testcase_status_dict:
+            return testcase_status_dict[testcase]
+        return ""
+
+    def _create_testcase_testresult_object(self, testcase_list, testcase_result_dict):
+        testcase_dict = {}
+        for testcase in sorted(testcase_list):
+            result = self._get_testcase_result(testcase, testcase_result_dict)
+            testcase_dict[testcase] = {"testresult": result}
+        return testcase_dict
+
+    def _create_json_testsuite_string(self, testsuite_list, testsuite_testcase_dict, testcase_result_dict):
+        testsuite_object = {'testsuite': {}}
+        testsuite_dict = testsuite_object['testsuite']
+        for testsuite in sorted(testsuite_list):
+            testsuite_dict[testsuite] = {'testcase': {}}
+            testsuite_dict[testsuite]['testcase'] = self._create_testcase_testresult_object(
+                testsuite_testcase_dict[testsuite],
+                testcase_result_dict)
+        return json.dumps(testsuite_object, sort_keys=True, indent=4)
+
+    def dump_testresult_files(self, testcase_result_dict, write_dir):
+        if not os.path.exists(write_dir):
+            pathlib.Path(write_dir).mkdir(parents=True, exist_ok=True)
+        testsuite_testcase_dict = self.get_testsuite_testcase_dictionary(testcase_result_dict)
+        testmodule_testsuite_dict = self.get_testmodule_testsuite_dictionary(testsuite_testcase_dict)
+        for testmodule in testmodule_testsuite_dict.keys():
+            testsuite_list = testmodule_testsuite_dict[testmodule]
+            json_testsuite = self._create_json_testsuite_string(testsuite_list, testsuite_testcase_dict,
+                                                                testcase_result_dict)
+            file_name = '%s.json' % testmodule
+            file_path = os.path.join(write_dir, file_name)
+            with open(file_path, 'w') as the_file:
+                the_file.write(json_testsuite)
+
+    def dump_log_files(self, testcase_log_dict, write_dir):
+        if not os.path.exists(write_dir):
+            pathlib.Path(write_dir).mkdir(parents=True, exist_ok=True)
+        for testcase in testcase_log_dict.keys():
+            test_log = testcase_log_dict[testcase]
+            if test_log is not None:
+                file_name = '%s.log' % testcase
+                file_path = os.path.join(write_dir, file_name)
+                with open(file_path, 'w') as the_file:
+                    the_file.write(test_log)
-- 
2.7.4


