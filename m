Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 331D27DF0B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 15:41:01 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id p15so6671610pll.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=yAh9wEe5EQobakAN1lw/xvwiQjkYekP7OQqi4ZGUQVE=;
	b=RCYbC3nqjy9MKVaLxknbX7zUlviSUyjZ01p/XgMN3jmljPMqCiVO0sgp5on6OUIu/8
	eUBq8HZUgwIUx8x8M6PpKX/mA99K/nkwm/CTKULg4eGk/wmsH9YtO7WwblLv1CA8MX5L
	7nl9z0ihAyCKQM2LaGa98eMKw8eMr2EKodHwZ2tWNDIr02P3XYG4nxGFSL2lSb+GyOm3
	ekqjomJU0lHkb1D2TNVxBR5Qs65I7RRnQmZhwQ9eJnpVIrwfqO+Fd3sS3XVDsN0mqTuv
	XZMKmfJX5xF8kI+xomVarH1CgpXDRjwA2Lej3/kD9WWudNr06Pd+HYCuzYwjQrAdOK34
	Ozjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yAh9wEe5EQobakAN1lw/xvwiQjkYekP7OQqi4ZGUQVE=;
	b=spiVHCybLW3/jAy+DQFcl95g1AJ3KBSn1p8iRLpfAa/tdjBEk962vyaiBGe+Z+8RBM
	dGKiN+VRPy3jnHdPxB6xuSQb8R4xXMlx1Fpzj1viVeTS/MYRvZhHuqh6cINRl9vGPHG5
	3DV3XUWjghW1Xl5XboWs+3uiWEG2PI8d588PFjykcuxXWVpPaqUGNPu7m5zumPsInq3N
	TJidWzEIz26eLsO4mZ0/44iQX32ZA9k5RrGiR9IVdiHHodDIinKLOyGF0+5xptipQ8J0
	L3CDHyBoFJXiYy44SlOnfYmd4QHdLMErpLSAVQMF6WIpYQ3OWIZ5rgnwjzL0j89VQTWC
	aqKw==
X-Gm-Message-State: APjAAAV+pmuCc0U24ZB+FWDyCSZF/vlc4WqmpeAjX6SK7ZIBGg9+HQny
	s/ObfAzdFt/t0JRg1E+PGriLqI9S
X-Google-Smtp-Source: APXvYqzcPBLyUAJhZ7CTWgi1x2P446roqckN3bQRcEuf5Qwq9VuqGaBpOXxDOJJPF/8J8rjD9iXCRA==
X-Received: by 2002:a17:902:3281:: with SMTP id
	z1mr31107971plb.44.1557762062810; 
	Mon, 13 May 2019 08:41:02 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	q20sm24695811pfi.166.2019.05.13.08.41.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 08:41:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 08:41:01 -0700
Message-Id: <20190513154101.25386-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] runtime ptest: refactor for future work
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
X-List-Received-Date: Mon, 13 May 2019 15:41:02 -0000

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

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 100 +++++++++++++++++----------
 1 file changed, 65 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index d8d1e1b344..95dd19a5eb 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -12,59 +12,92 @@ from oeqa.core.decorator.data import skipIfNotFeature
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
+
+        os.makedirs(cls.ptest_log_dir)
+
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+
+        cls.extras = cls.tc.extraresults
+
+    @classmethod
+    def ptest_finishup(cls):
 
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
+    @unittest.expectedFailure
+    def test_ptestrunner_check(self):
+        status, output = self.target.run('which ptest-runner')
+        msg = 'ptest-runner not installed .  %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    def test_ptests_installed(self):
+        status, output = self.target.run('ptest-runner -l')
+        msg = 'No ptests found.  %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['ptest.PtestRunnerTest.test_ptests_installed'])
+    def test_ptestrunner(self):
         status, output = self.target.run('ptest-runner', 0)
-        os.makedirs(ptest_log_dir)
-        with open(ptest_runner_log, 'w') as f:
+        with open(self.ptest_runner_log, 'w') as f:
             f.write(output)
 
         # status != 0 is OK since some ptest tests may fail
         self.assertTrue(status != 127, msg="Cannot execute ptest-runner!")
 
-        if not hasattr(self.tc, "extraresults"):
-            self.tc.extraresults = {}
-        extras = self.tc.extraresults
-        extras['ptestresult.rawlogs'] = {'log': output}
-
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
@@ -72,13 +105,10 @@ class PtestRunnerTest(OERuntimeTestCase):
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


