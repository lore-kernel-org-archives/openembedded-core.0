Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1E3716BCE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:14:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id g69so950358plb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=cLxtPIfy1+inw0/KGJ4cxSW0kSEjDfdJtukT42aCcjc=;
	b=VxVDrDVi6S6mKahduNL7QMjjseWFDFMvUY2gkvAuL5kqYxBtJmqcrpdQPYmf5asp4P
	HRecAj25yOCMZV5Z1BRe2pFaBZwlcc/6UwLwm1FHvRN7wE2TxWvp80AXu2QtYqTKN4Z1
	5sDUXOV0IrSdqHnZttQVd6QLhkhQn3nPZSjtQw617p8/0Sg/7KqJ0XUNp308hVXz/m8S
	9uGdPZtzY5llzozF2VV1IaXySj6iP3kDdQqnpY7nzD3TFx72LYYM06DNr9tce8L+s744
	Xv9Lh71CIx8WfgPKwa34FlsSV2KQmkg45qu8O+GfEDwuDnEyR6lkIGtwnk5Na0sSN5fD
	Wn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cLxtPIfy1+inw0/KGJ4cxSW0kSEjDfdJtukT42aCcjc=;
	b=JQXqJXtW+RxKcpz2Ca5DJp0JpWHxWR8LgeAOEZF/GhoIsH94+UJhczaxdNBC7+Wh9p
	n9h5HCPiLws+L+ikqJzenMXMMVInAmc4WfPzYFYZ5cfO5i2mufC/BXfVJP422sKCkTKa
	Bggzc0FF1z7qhcWkEtkAU+2VBvKLIj00otgCJtIWpJXpUMrdXUfKTfi79P0lfDSuTXsQ
	jg5PGizSMQDdlJO3PA9cC7zwxmGcy2f3atAtpf6lEJqVa4TNaOaODpy01WBOaGTYbjk2
	G9VZrk9xe4wmLH/p2mfm9ESUCtHHLPDRyyLFikERWgQRy823FOjvOy+nbmVEMq7UwdBi
	zKaQ==
X-Gm-Message-State: APjAAAW9JBOTpSFTcYO9ldCC2GXMS9cRrlX2q9w068P/jqG+0VNm/B/f
	P1lqcS5tyWTo3xzGvif6aGExfa0l
X-Google-Smtp-Source: APXvYqzYELPfx+vgQE0KS+otdItpFaCQeyio2fFxgsYyyZaiJuJcclyOmVxmEo8HL3yfa/bqtFoDyw==
X-Received: by 2002:a17:902:2a:: with SMTP id 39mr37736959pla.64.1557843255856;
	Tue, 14 May 2019 07:14:15 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136])
	by smtp.gmail.com with ESMTPSA id n9sm1449872pfq.53.2019.05.14.07.14.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 07:14:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 07:14:13 -0700
Message-Id: <20190514141413.4728-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [v2][PATCH] runtime ptest: refactor for future work
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
X-List-Received-Date: Tue, 14 May 2019 14:14:15 -0000

This in preparation for being able to run and capture each
ptest separately.

moves things to setup and finish functions
breaks a few checks out into their own tests.

no change in result tool output.

Recipe  | Passed    | Failed | Skipped | Time(s)
-------------------------------------------------
openssh | 0         | 0      | 1      | 1
openssl | 146       | 1      | 8      | 68
python  | 0         | 0      | 0      | 22

[v2]
remove  unneeded check
move @unittest check to test_ptestrunner

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 104 +++++++++++++++++----------
 1 file changed, 66 insertions(+), 38 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index d8d1e1b344..fa95fefe01 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -12,59 +12,90 @@ from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import PtestParser
 
-class PtestRunnerTest(OERuntimeTestCase):
 
-    @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['ptest-runner'])
-    @unittest.expectedFailure
-    def test_ptestrunner(self):
-        status, output = self.target.run('which ptest-runner', 0)
-        if status != 0:
-            self.skipTest("No -ptest packages are installed in the image")
+class PTestBase(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        cls.ptest_startup()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.ptest_finishup()
 
-        test_log_dir = self.td.get('TEST_LOG_DIR', '')
+    @classmethod
+    def ptest_startup(cls):
+        cls.failmsg = ""
+
+        cls.test_log_dir = cls.td.get('TEST_LOG_DIR', '')
         # The TEST_LOG_DIR maybe NULL when testimage is added after
         # testdata.json is generated.
-        if not test_log_dir:
-            test_log_dir = os.path.join(self.td.get('WORKDIR', ''), 'testimage')
+        if not cls.test_log_dir:
+            cls.test_log_dir = os.path.join(cls.td.get('WORKDIR', ''), 'testimage')
         # Don't use self.td.get('DATETIME'), it's from testdata.json, not
         # up-to-date, and may cause "File exists" when re-reun.
+
         timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-        ptest_log_dir_link = os.path.join(test_log_dir, 'ptest_log')
-        ptest_log_dir = '%s.%s' % (ptest_log_dir_link, timestamp)
-        ptest_runner_log = os.path.join(ptest_log_dir, 'ptest-runner.log')
+        cls.ptest_log_dir_link = os.path.join(cls.test_log_dir, 'ptest_log')
+        cls.ptest_log_dir = '%s.%s' % (cls.ptest_log_dir_link, timestamp)
+        cls.ptest_runner_log = os.path.join(cls.ptest_log_dir, 'ptest-runner.log')
 
-        status, output = self.target.run('ptest-runner', 0)
-        os.makedirs(ptest_log_dir)
-        with open(ptest_runner_log, 'w') as f:
-            f.write(output)
+        os.makedirs(cls.ptest_log_dir)
 
-        # status != 0 is OK since some ptest tests may fail
-        self.assertTrue(status != 127, msg="Cannot execute ptest-runner!")
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
 
-        if not hasattr(self.tc, "extraresults"):
-            self.tc.extraresults = {}
-        extras = self.tc.extraresults
-        extras['ptestresult.rawlogs'] = {'log': output}
+        cls.extras = cls.tc.extraresults
+
+    @classmethod
+    def ptest_finishup(cls):
+
+        # update symlink to ptest_log
+        if os.path.exists(cls.ptest_log_dir_link):
+            # Remove the old link to create a new one
+            os.remove(cls.ptest_log_dir_link)
+        os.symlink(os.path.basename(cls.ptest_log_dir), cls.ptest_log_dir_link)
+
+        if cls.failmsg:
+            cls.fail(cls.failmsg)
+
+class PtestRunnerTest(PTestBase):
+
+    @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['ptest-runner'])
+    def test_ptestrunner_check(self):
+        status, output = self.target.run('which ptest-runner')
+        msg = 'ptest-runner not installed .  %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['ptest.PtestRunnerTest.test_ptestrunner_check'])
+    def test_ptests_installed(self):
+        status, output = self.target.run('ptest-runner -l')
+        msg = 'No ptests found.  %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['ptest.PtestRunnerTest.test_ptests_installed'])
+    @unittest.expectedFailure
+    def test_ptestrunner(self):
+        status, output = self.target.run('ptest-runner', 0)
+        with open(self.ptest_runner_log, 'w') as f:
+            f.write(output)
 
         # Parse and save results
         parser = PtestParser()
-        results, sections = parser.parse(ptest_runner_log)
-        parser.results_as_files(ptest_log_dir)
-        if os.path.exists(ptest_log_dir_link):
-            # Remove the old link to create a new one
-            os.remove(ptest_log_dir_link)
-        os.symlink(os.path.basename(ptest_log_dir), ptest_log_dir_link)
+        results, sections = parser.parse(self.ptest_runner_log)
+        parser.results_as_files(self.ptest_log_dir)
 
-        extras['ptestresult.sections'] = sections
+        self.extras['ptestresult.rawlogs'] = {'log': output}
+        self.extras['ptestresult.sections'] = sections
 
         trans = str.maketrans("()", "__")
         for section in results:
             for test in results[section]:
                 result = results[section][test]
                 testname = "ptestresult." + (section or "No-section") + "." + "_".join(test.translate(trans).split())
-                extras[testname] = {'status': result}
+                self.extras[testname] = {'status': result}
 
         failed_tests = {}
         for section in results:
@@ -72,13 +103,10 @@ class PtestRunnerTest(OERuntimeTestCase):
             if failed_testcases:
                 failed_tests[section] = failed_testcases
 
-        failmsg = ""
         status, output = self.target.run('dmesg | grep "Killed process"', 0)
         if output:
-            failmsg = "ERROR: Processes were killed by the OOM Killer:\n%s\n" % output
+            self.failmsg = "ERROR: Processes were killed by the OOM Killer:\n%s\n" % output
 
         if failed_tests:
-            failmsg = failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
+            self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
 
-        if failmsg:
-            self.fail(failmsg)
-- 
2.17.1


