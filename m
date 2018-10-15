Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 551C679A9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 07:40:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2018 00:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,383,1534834800"; d="scan'208";a="100295777"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 15 Oct 2018 00:40:09 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2018 15:24:51 +0800
Message-Id: <1539588294-5532-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/5] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Mon, 15 Oct 2018 07:40:09 -0000

As part of the solution to replace Testopia to store testresult,
OEQA need to output testresult into json file, where these json
testresult file will be stored in git repository by the future
test-case-management tools.

Both the testresult (eg. PASSED, FAILED, ERROR) and  the test log
(eg. message from unit test assertion) will be created for storing.

Also the library class inside this patch will be reused by the future
test-case-management tools to write json testresult for manual test
case executed.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/core/runner.py | 64 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 56666ee..56e8526 100644
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
@@ -119,8 +121,9 @@ class OETestResult(_TestResult):
         self.successes.append((test, None))
         super(OETestResult, self).addSuccess(test)
 
-    def logDetails(self):
+    def logDetails(self, json_file_dir=''):
         self.tc.logger.info("RESULTS:")
+        results = {}
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
@@ -137,6 +140,12 @@ class OETestResult(_TestResult):
                 t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
 
             self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
+            results[case.id()] = (status, log)
+
+        if len(json_file_dir) > 0:
+            tresultjsonhelper = OETestResultJSONHelper()
+            tresultjsonhelper.dump_testresult_file(results, json_file_dir)
+            tresultjsonhelper.dump_log_files(results, os.path.join(json_file_dir, 'logs'))
 
 class OEListTestsResult(object):
     def wasSuccessful(self):
@@ -249,3 +258,56 @@ class OETestRunner(_TestRunner):
             self._list_tests_module(suite)
 
         return OEListTestsResult()
+
+class OETestResultJSONHelper(object):
+
+    def get_testsuite_from_testcase(self, testcase):
+        testsuite = testcase[0:testcase.rfind(".")]
+        return testsuite
+
+    def get_testsuite_testcase_dictionary(self, testresults):
+        testsuite_testcase_dict = {}
+        for testcase in testresults.keys():
+            testsuite = self.get_testsuite_from_testcase(testcase)
+            if testsuite in testsuite_testcase_dict:
+                testsuite_testcase_dict[testsuite].append(testcase)
+            else:
+                testsuite_testcase_dict[testsuite] = [testcase]
+        return testsuite_testcase_dict
+
+    def _create_testcase_testresult_object(self, testcase_list, testresults):
+        testcase_dict = {}
+        for testcase in sorted(testcase_list):
+            testcase_dict[testcase] = {"testresult": testresults[testcase][0]}
+        return testcase_dict
+
+    def _create_json_testsuite_string(self, testresults):
+        testsuite_testcase = self.get_testsuite_testcase_dictionary(testresults)
+        testsuite_object = {'testsuite': {}}
+        testsuite_dict = testsuite_object['testsuite']
+        for testsuite in sorted(testsuite_testcase.keys()):
+            testsuite_dict[testsuite] = {'testcase': {}}
+            testsuite_dict[testsuite]['testcase'] = self._create_testcase_testresult_object(
+                                                        testsuite_testcase[testsuite],
+                                                        testresults)
+        return json.dumps(testsuite_object, sort_keys=True, indent=4)
+
+    def _write_file(self, write_dir, file_name, file_content):
+        file_path = os.path.join(write_dir, file_name)
+        with open(file_path, 'w') as the_file:
+            the_file.write(file_content)
+
+    def dump_testresult_file(self, testresults, write_dir):
+        if not os.path.exists(write_dir):
+            pathlib.Path(write_dir).mkdir(parents=True, exist_ok=True)
+        json_testsuite = self._create_json_testsuite_string(testresults)
+        self._write_file(write_dir, 'testresults.json', json_testsuite)
+
+    def dump_log_files(self, testresults, write_dir):
+        if not os.path.exists(write_dir):
+            pathlib.Path(write_dir).mkdir(parents=True, exist_ok=True)
+        for testcase in testresults.keys():
+            test_log = testresults[testcase][1]
+            if test_log is not None:
+                file_name = '%s.log' % testcase
+                self._write_file(write_dir, file_name, test_log)
-- 
2.7.4


