Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id C39EC7E069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 16:07:02 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id n8so1833846plp.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SqIfnw0SAt5XUDv7/uPBXVbrgJ0cdn9hJrMBuCiP8NQ=;
	b=Ow6LwLdidzH2I3+RrcmMhPu3jLph19TDijs7c+yaouvCWO3c4A4hfp8+52qWfzcZY2
	zxzjIyFXvasN5SqaW8g+RRqSZC4BpzoNf5qFfKP86m1unTRM+PLrYuI1ADamAv9ke9qI
	xbxWWY+sHjDNM2DiLDLUJSU0mq62I5ycOMm3voNVAi+vh2o/xqmf8wequ/CQQ1nuukCH
	/gW2MW6ic6KMVKyXyJC85iM+C9IsVcNOD8ljkJH+fFVXpD2cVDLqMUcOPn+MoASf/sWP
	at4CFTsCAGDD5am6etWGCyvaggAZIieZAj9y6wwXR5hzggxegimbGbOPcqcuUcCjqy46
	FTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SqIfnw0SAt5XUDv7/uPBXVbrgJ0cdn9hJrMBuCiP8NQ=;
	b=k6d0xy+tAAaj33bGpZ3tjfML91qJGnI8vwo57sv9UleJMARUvh90nQ0LJp/sFsuz/n
	rdXBTSBWAS1kcxTiCjed3Hl+/+K1X+zGAt7w4FKgJUcayiO0d8gzVsQmWqUuA8ycdDgf
	4YN+hPwcDHnOUxEnNsaqSY4j7hk0sz1JqYBLv6B7QmL5uWAwZFWpXlzQ41cMkvdKeqn5
	5kf8+9r54hGO45oYIjRlkxBzIrdwC/d5Ffj/k3U1rbZW/oIWeRxmtZo7QKCIp63cIQ3A
	Kp0lbkQ4bakT4xi70pHImurXFkNnxiEm36hGwjESs8IiYAnqYArHa4juX0ZVL9nF6FsU
	HiJw==
X-Gm-Message-State: APjAAAViy6bMMBTb6YdVvMI3Rw50ewHLpSHvxSEw7ktKo5jqi+ZkMcmw
	wEhAZ8yA/CWtk8OupvlLZ8J3WI+S
X-Google-Smtp-Source: APXvYqwMWmYbLLPe+AgVE6tN1hrITdYhNLX29yGnBCABftF3olau7o4Hup/3CzirKt9+IsrrKvCsQg==
X-Received: by 2002:a17:902:9686:: with SMTP id
	n6mr52071935plp.282.1558022823726; 
	Thu, 16 May 2019 09:07:03 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	q10sm6156148pgh.93.2019.05.16.09.07.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 09:07:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 09:06:59 -0700
Message-Id: <20190516160700.20685-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516160700.20685-1-akuster808@gmail.com>
References: <20190516160700.20685-1-akuster808@gmail.com>
Subject: [PATCH 1/2] runtime ptest: refactor for future work
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
X-List-Received-Date: Thu, 16 May 2019 16:07:02 -0000

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
index d8d1e1b344f..fa95fefe011 100644
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


