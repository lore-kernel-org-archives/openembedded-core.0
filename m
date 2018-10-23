Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 97AC460190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 06:12:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 23:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,415,1534834800"; d="scan'208";a="97699681"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2018 23:12:33 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2018 13:57:19 +0800
Message-Id: <1540274242-78226-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Tue, 23 Oct 2018 06:12:33 -0000

As part of the solution to replace Testopia to store testresult,
OEQA need to output testresult into single json file, where json
testresult file will be stored in git repository by the future
test-case-management tools.

The json testresult file will store more than one set of results,
where each set of results was uniquely identified by the result_id.
The result_id would be like "runtime-qemux86-core-image-sato", where
it was a runtime test with target machine equal to qemux86 and running
on core-image-sato image. The json testresult file will only store
the latest test content for a given result_id. The json testresult
file contains the configuration (eg. COMMIT, BRANCH, MACHINE, IMAGE),
result (eg. PASSED, FAILED, ERROR), test log, and result_id.

Based on the destination json testresult file directory provided,
it could have multiple instances of bitbake trying to write json
testresult to a single testresult file, using locking a lockfile
alongside the results file directory to prevent races.

Also the library class inside this patch will be reused by the future
test-case-management tools to write json testresult for manual test
case executed.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/core/runner.py | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index f1dd080..d6d5afe 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -6,6 +6,7 @@ import time
 import unittest
 import logging
 import re
+import json
 
 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
@@ -119,8 +120,9 @@ class OETestResult(_TestResult):
         self.successes.append((test, None))
         super(OETestResult, self).addSuccess(test)
 
-    def logDetails(self):
+    def logDetails(self, json_file_dir=None, configuration=None, result_id=None):
         self.tc.logger.info("RESULTS:")
+        result = {}
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
@@ -137,6 +139,11 @@ class OETestResult(_TestResult):
                 t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
 
             self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
+            result[case.id()] = {'status': status, 'log': log}
+
+        if json_file_dir:
+            tresultjsonhelper = OETestResultJSONHelper()
+            tresultjsonhelper.dump_testresult_file(json_file_dir, configuration, result_id, result)
 
 class OEListTestsResult(object):
     def wasSuccessful(self):
@@ -249,3 +256,29 @@ class OETestRunner(_TestRunner):
             self._list_tests_module(suite)
 
         return OEListTestsResult()
+
+class OETestResultJSONHelper(object):
+
+    testresult_filename = 'testresults.json'
+
+    def _get_existing_testresults_if_available(self, write_dir):
+        testresults = {}
+        file = os.path.join(write_dir, self.testresult_filename)
+        if os.path.exists(file):
+            with open(file, "r") as f:
+                testresults = json.load(f)
+        return testresults
+
+    def _write_file(self, write_dir, file_name, file_content):
+        file_path = os.path.join(write_dir, file_name)
+        with open(file_path, 'w') as the_file:
+            the_file.write(file_content)
+
+    def dump_testresult_file(self, write_dir, configuration, result_id, test_result):
+        bb.utils.mkdirhier(write_dir)
+        lf = bb.utils.lockfile(os.path.join(write_dir, 'jsontestresult.lock'))
+        test_results = self._get_existing_testresults_if_available(write_dir)
+        test_results[result_id] = {'configuration': configuration, 'result': test_result}
+        json_testresults = json.dumps(test_results, sort_keys=True, indent=4)
+        self._write_file(write_dir, self.testresult_filename, json_testresults)
+        bb.utils.unlockfile(lf)
-- 
2.7.4


