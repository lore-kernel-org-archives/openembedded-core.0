Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1C36F79BF3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 09:26:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Oct 2018 02:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,396,1534834800"; d="scan'208";a="101236450"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2018 02:26:23 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 17:11:06 +0800
Message-Id: <1539853869-53465-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539853869-53465-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1539853869-53465-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Thu, 18 Oct 2018 09:26:23 -0000

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
 meta/lib/oeqa/core/runner.py | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index f1dd080..e82acdf 100644
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
+    def logDetails(self, json_file_dir=None, test_environments=None):
         self.tc.logger.info("RESULTS:")
+        results = {}
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
@@ -137,6 +139,11 @@ class OETestResult(_TestResult):
                 t = " (" + "{0:.2f}".format(self.endtime[case.id()] - self.starttime[case.id()]) + "s)"
 
             self.tc.logger.info("RESULTS - %s - Testcase %s: %s%s" % (case.id(), oeid, status, t))
+            results[case.id()] = (status, log)
+
+        if json_file_dir:
+            tresultjsonhelper = OETestResultJSONHelper()
+            tresultjsonhelper.dump_testresult_file(results, test_environments, json_file_dir)
 
 class OEListTestsResult(object):
     def wasSuccessful(self):
@@ -249,3 +256,24 @@ class OETestRunner(_TestRunner):
             self._list_tests_module(suite)
 
         return OEListTestsResult()
+
+class OETestResultJSONHelper(object):
+
+    def _create_json_testresult_string(self, test_results, test_environments):
+        testcase_dict = {}
+        for testcase in sorted(test_results):
+            testcase_dict[testcase] = {"testresult": test_results[testcase][0], "log": test_results[testcase][1]}
+        testresult_object = {'testenvironment': test_environments,
+                             'testcase': testcase_dict}
+        return json.dumps(testresult_object, sort_keys=True, indent=4)
+
+    def _write_file(self, write_dir, file_name, file_content):
+        file_path = os.path.join(write_dir, file_name)
+        with open(file_path, 'w') as the_file:
+            the_file.write(file_content)
+
+    def dump_testresult_file(self, test_results, test_environments, write_dir):
+        if not os.path.exists(write_dir):
+            bb.utils.mkdirhier(write_dir)
+        json_testresult = self._create_json_testresult_string(test_results, test_environments)
+        self._write_file(write_dir, 'testresults.json', json_testresult)
-- 
2.7.4


