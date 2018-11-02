Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B14D879E82
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 14:21:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d10-v6so2177515wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=tUj7xw/CJ3SBrJYKBaEwqxHsyGS5kZrDaUmAISeL7Rw=;
	b=Gduje3GSCrNAp3Cr7JL9Yyg248kTThW7p6L0fe+gz0psmm9kSDcVKaVeqXVKQXjPQp
	zUcwz0ALVHE8cxJkZ9bX1yBr+c+OKU1FDiQag1ipxgQsJGJiPl7OqKHLR2LFhwv9HPvu
	6rMWu8/hucpPTqfH9qDgv8dMZp5GEMwdZblEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tUj7xw/CJ3SBrJYKBaEwqxHsyGS5kZrDaUmAISeL7Rw=;
	b=ZpnKItI6xCoDIL5pt2EdGlYd7iybunTSW1jHnEgNucNPPTHwJQOhLuKQTv7vB0+QN0
	PnThfa4MinthexEf81T+ahfwnKISIxqZleaxMMZW72wiaJrrGk+nK43OsJG0vOd9FX8f
	ehGUG3/Wi7VIN3+JjJhDws3VZVfqKJJTVetfxs2Ss7FPgbK7Ajp7c3prBYzCJbosXbti
	v4H3B+wHwV6L0ttIgl9kzElXDvRpdEFGhpuNQL0ngxQ9ORaoHKScAqfCsOKt24ZpDfuA
	HthTe6J8JbYQukiWjwmj2r2ndxM6HiI43R0scdcRbH4QfxXxGI3lXMxn66tFKrruGGNh
	KODg==
X-Gm-Message-State: AGRZ1gLBx++ER1URDtmf1D4KQNG3PtzayOQcCHkIgkPGirVgDdyS+a+c
	SfN/HaAeQNPrBYUZK5miFrSocMZzfvY=
X-Google-Smtp-Source: AJdET5e4gHOGvou7JOBiJW08vfQD49cAR4fda/f80R75ssqvDIsCioQ9x2gC7ULLaU1MS+h2hl1OyQ==
X-Received: by 2002:a5d:558b:: with SMTP id
	i11-v6mr9910857wrv.38.1541168480508; 
	Fri, 02 Nov 2018 07:21:20 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm1975138wmg.23.2018.11.02.07.21.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 07:21:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Nov 2018 14:21:18 +0000
Message-Id: <20181102142118.909-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] oeqa/runtime/ptest: Inject results+logs into stored json results file
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
X-List-Received-Date: Fri, 02 Nov 2018 14:21:20 -0000

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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py         |  8 ++++++++
 meta/lib/oeqa/runtime/cases/ptest.py | 21 +++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 67756c38676..034f2232402 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -122,7 +122,11 @@ class OETestResult(_TestResult):
 
     def logDetails(self, json_file_dir=None, configuration=None, result_id=None):
         self.tc.logger.info("RESULTS:")
+
         result = {}
+        if hasattr(self.tc, "extraresults"):
+            result = self.tc.extraresults
+
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
@@ -148,6 +152,10 @@ class OETestResult(_TestResult):
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
index f60a433d590..77ae7b6b863 100644
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
2.17.1


