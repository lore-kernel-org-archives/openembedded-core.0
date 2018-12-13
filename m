Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id C704B79DDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:38 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id z10so1647896pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pOCugbuPXri1K23r5BLVWaMi/5wmqJNa0802Nf/aFaQ=;
	b=SJXhW9ashuFWxS2Cw09/bKNTTOILZM56+nu4aav6Ehz/A5jXa+jhGdVxLMxXM+a0ym
	yIKDp7VX32m02GV6S0O2ufrFGzEvQoFxjlYDe3e3EBa9eYl+5wVvodcmox0twRBOdHsT
	8Bbdrf0mC+6z+3dfna4Jed6jm/8gI1m7p6uFBoL2IOSn6DfIxX73nCrH1PgNT9L/pd/b
	2j+ok91nnCCgERmZTm3mEHyPmp67chkLyaUtB+BKNttA66yeIGDreG9WVEzYHrjMlA1E
	qyVcYJY9b/w5JfissedvddhPHbnyZ5Xt7ERNIfADAyq5SBUH+ycKya/wfRkPzz/rstSW
	DdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pOCugbuPXri1K23r5BLVWaMi/5wmqJNa0802Nf/aFaQ=;
	b=iPYrsmUiGnF9zK3hB9n/kWvHF0/kcJdjUm2dxonNGN/ABqoHuDisyQ/JSc9yuVhHRj
	kzX9Lx1+116rRoXUXdJZql0kx8/HBPBehvF8wccNfMqXlFwWyGeDzCfRzcZc77pYcn9A
	DXC5cUVYS7WIYUNUVCqysgbNMmVwaQgLa2RxK/0ovYkRbZLXgx1yyEgsoPAtO4TG+AnD
	tX1S1pUL+WD1ujWUfe0Y7WCrrT8Nh7CJvOejoIO7e6hSwVqi66NOPSB0niwi793cadA2
	1j1NHn73SRywxWVs3/MTKXbN5KkHc225h29im3c179kOOii9QMm3mlIJHUSjCjZTUQJw
	/gMA==
X-Gm-Message-State: AA+aEWYnyCgYdP3Lt/KKq1HWW1OLM68SEX5C5ATgDgXoWtMLgcMBCZ9j
	EKGJMPnXe5p4kmjSzK56UterNtwU
X-Google-Smtp-Source: AFSGD/VsBzKJdiKvgY6wMo4INfHCS79SgPGT9R/evysaGUU+QVd1s0LgU7j39+ezItyGb7KDJHiwsg==
X-Received: by 2002:a63:4e15:: with SMTP id c21mr441095pgb.50.1544737179755;
	Thu, 13 Dec 2018 13:39:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:40 -0800
Message-Id: <4ae3782e4e498f9eb54e91c82b4a9c02abba63e9.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 32/45] oeqa/runtime/ptest: Inject results+logs into stored json results file
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:39 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This allows the ptest results from ptest-runner, run in an image to be
transferred over to the resulting json results output.

Each test is given a pass/skip/fail so individual results can be monitored
and the raw log output from the ptest-runner is also dumped into the
results json file as this means after the fact debugging becomes much easier.

Currently the log output is not split up per test but that would make a good
future enhancement.

I attempted to implement this as python subTests however it failed as the
output was too confusing, subTests don't support any kind of log
output handling, subTest successes aren't logged and it was making things
far more complex than they needed to be.

We mark ptest-runner as "EXPECTEDFAILURE" since its unlikely every ptest
will pass currently and we don't want that to fail the whole image test run.
Its assumed there would be later analysis of the json output to determine
regressions. We do have to change the test runner code so that
'unexpectedsuccess' is not a failure.

Also, the test names are manipuated to remove spaces and brackets with
"_" used as a replacement and any duplicate occurrences truncated.

(From OE-Core rev: a13e088942e2a3c3521e98954a394e61a15234e8)

(From OE-Core rev: 526ceab9d0e43f73635bb92e8dd7763ef75ad33b)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py         |  8 ++++++++
 meta/lib/oeqa/runtime/cases/ptest.py | 21 +++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 7e0b61b..9a64e49 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -107,7 +107,11 @@ class OETestResult(_TestResult):
 
     def logDetails(self, json_file_dir=None, configuration=None, result_id=None):
         self.tc.logger.info("RESULTS:")
+
         result = {}
+        if hasattr(self.tc, "extraresults"):
+            result = self.tc.extraresults
+
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
@@ -126,6 +130,10 @@ class OETestResult(_TestResult):
             tresultjsonhelper = OETestResultJSONHelper()
             tresultjsonhelper.dump_testresult_file(json_file_dir, configuration, result_id, result)
 
+    def wasSuccessful(self):
+        # Override as we unexpected successes aren't failures for us
+        return (len(self.failures) == len(self.errors) == 0)
+
 class OEListTestsResult(object):
     def wasSuccessful(self):
         return True
diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index f60a433..77ae7b6 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -1,3 +1,6 @@
+import unittest
+import pprint
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
@@ -49,6 +52,7 @@ class PtestRunnerTest(OERuntimeTestCase):
     @OETestID(1600)
     @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @unittest.expectedFailure
     def test_ptestrunner(self):
         status, output = self.target.run('which ptest-runner', 0)
         if status != 0:
@@ -76,6 +80,11 @@ class PtestRunnerTest(OERuntimeTestCase):
         # status != 0 is OK since some ptest tests may fail
         self.assertTrue(status != 127, msg="Cannot execute ptest-runner!")
 
+        if not hasattr(self.tc, "extraresults"):
+            self.tc.extraresults = {}
+        extras = self.tc.extraresults
+        extras['ptestresult.rawlogs'] = {'log': output}
+
         # Parse and save results
         parse_result = self.parse_ptest(ptest_runner_log)
         parse_result.log_as_files(ptest_log_dir, test_status = ['pass','fail', 'skip'])
@@ -84,10 +93,18 @@ class PtestRunnerTest(OERuntimeTestCase):
             os.remove(ptest_log_dir_link)
         os.symlink(os.path.basename(ptest_log_dir), ptest_log_dir_link)
 
+        trans = str.maketrans("()", "__")
+        resmap = {'pass': 'PASSED', 'skip': 'SKIPPED', 'fail': 'FAILED'}
+        for section in parse_result.result_dict:
+            for test, result in parse_result.result_dict[section]:
+                testname = "ptestresult." + section + "." + "_".join(test.translate(trans).split())
+                extras[testname] = {'status': resmap[result]}
+
         failed_tests = {}
         for section in parse_result.result_dict:
-            failed_testcases = [ test for test, result in parse_result.result_dict[section] if result == 'fail' ]
+            failed_testcases = [ "_".join(test.translate(trans).split()) for test, result in parse_result.result_dict[section] if result == 'fail' ]
             if failed_testcases:
                 failed_tests[section] = failed_testcases
 
-        self.assertFalse(failed_tests, msg = "Failed ptests: %s" %(str(failed_tests)))
+        if failed_tests:
+            self.fail("Failed ptests:\n%s" % pprint.pformat(failed_tests))
-- 
2.7.4


