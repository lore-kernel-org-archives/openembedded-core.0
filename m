Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9E23479DD9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:37 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z9so1740811pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Puq5sgG/l3t3kRoTBNj2bB+3KDZ2D5x4+zs0MfTh7/4=;
	b=bcGYqbCHO57xkFFs0TKx0uBhUl9mK01yFLGJZ3w1yMzKHMCaOiQ1oLhWoZXm+uKekf
	wSL3v8H9NX6YRFV8iZyF9xt+tNAc+wNOaX2w9PIjmb329FKnTUpDBM26Ijv7ZAEiCtJd
	aqWgZoiBTC5UcW3K1lKf+b6AELcQRWxOS8LiioVFwXhHtC2rB6IMHBbwFPQvjmS8yIMK
	lHgDJUwbUP86HG3qV8QopIcyZVUsnxZHY7V8lIuR/ahK9Z07Wh+UC/6/80d8dlePWF8l
	gr27/Vr6pCsVZ4qxvWwsxerBLgCryaXP0qTmq9Y8Pix+CCigyzrkozHdzkfao0oyjZNR
	/dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Puq5sgG/l3t3kRoTBNj2bB+3KDZ2D5x4+zs0MfTh7/4=;
	b=JEda/iA3VEWyQD+ktPlca83bjr9zYVenUUjEwC0QOQIblky/r/eFKwudBX1rRv095/
	WVVyVcZrnkqsqPAIfQG42DeHHLLJCXhEVx6TX60PQe/Q5l216Dd28QEYHFA3CVGizxxg
	+I0i6qsoPxdRbmF/Qmn0KL4orON1T/xhz/bDXv0uDW3zoZUlJKNg5joyz6DsV1o0idV2
	8KCA/BrWyMpvw7zB+GooF2wP4coEL53nQn4lOkoHR7I5fy+Nu+Z3i2rlDLcseKrVNyyi
	Aj9dzMKMjKcp+2OgdtAWEqEbA3FjvMuyDLj8XZUChZ3C7v8elNopQijJqdMacAwXTqDt
	7Ikw==
X-Gm-Message-State: AA+aEWZMMChadULg1hFMv0NkczBSWf387Kh+cR+NzjVg1tp7y1rpXIoZ
	9rABsXnUN51s6cFrFc/YoHRXmq0B
X-Google-Smtp-Source: AFSGD/WFqeqYAfZYWoQ1DuTC6l0Eq912EA9E644032MU1BQVRf3t8/5UjRlS5MPy6Ra+JD/fG69DDg==
X-Received: by 2002:a63:594d:: with SMTP id j13mr420736pgm.210.1544737178598; 
	Thu, 13 Dec 2018 13:39:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:39 -0800
Message-Id: <6fecbe152f32a7902c787b37208fc895bf8e99e8.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 31/45] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:37 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

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

(From OE-Core rev: 00e03b5004f1eb6d59295544b3a8620504278f51)

(From OE-Core rev: 045511425577ccbe89d8eb91e2a87e385390cabf)

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index a7b7463..7e0b61b 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -6,6 +6,7 @@ import time
 import unittest
 import logging
 import re
+import json
 
 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
@@ -104,8 +105,9 @@ class OETestResult(_TestResult):
         self.successes.append((test, None))
         super(OETestResult, self).addSuccess(test)
 
-    def logDetails(self):
+    def logDetails(self, json_file_dir=None, configuration=None, result_id=None):
         self.tc.logger.info("RESULTS:")
+        result = {}
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
@@ -118,6 +120,11 @@ class OETestResult(_TestResult):
                         oeid = d.oeid
 
             self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(), oeid, status))
+            result[case.id()] = {'status': status, 'log': log}
+
+        if json_file_dir:
+            tresultjsonhelper = OETestResultJSONHelper()
+            tresultjsonhelper.dump_testresult_file(json_file_dir, configuration, result_id, result)
 
 class OEListTestsResult(object):
     def wasSuccessful(self):
@@ -230,3 +237,29 @@ class OETestRunner(_TestRunner):
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


