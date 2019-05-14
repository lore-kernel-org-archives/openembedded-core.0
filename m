Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id C91FE7DF41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:14:42 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id c13so8723186pgt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=xyhKvlLCmIyASv2Jesu66wEOk9eOrxUqAYn9QU2kSO8=;
	b=YkPvwks7V4w4OdtEB7m+hlOyRkVuYobjHZAbzOOWKXLu+/+43iMjka1ifwAgjpq7CB
	AheNrtHs+Sl/zIeiYhdztNVF5bfiKxlC8KEipMcbWe8G9A3TRUrwbemB0KtmqPP99ddT
	aO8B8+7hz4u3jcDwoAkqEBGav9X5cxnCfoxe8VPGQBohp8Qi1Xued6wCmQ08/9jToEz/
	sANOVN4vBh1D6Az45Za8Q6rZwmydeLpvonEGgbJyBD6brlMFaJ5cE238D1T50qQrgYMB
	IQKJQ9Z/efzmeXRfcUa2PAJsSs37veOpzWSe1X1wykFia7yEu22EIoWYKpgEElsaysrM
	VN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xyhKvlLCmIyASv2Jesu66wEOk9eOrxUqAYn9QU2kSO8=;
	b=C9InP4eywlJqlzoWO6lE7RahnfQxqOg8Y3CuF9khdqHahgavvoSoGd3P9RoAWDJRcf
	D++Kdb5lmYR3dfyMOWWGK+PO+yxmmsgLXRPVFIjH8sxMNsP2cKkUS7rv1twQZ+PO91oq
	cCWyGbdyt+0F11st/cgHwJoDYhL0PaWrNRvnECW9Ane2/bICgBl+DiggBuI1nI1HC9mF
	wua7BB2wbBbYbdnBehItRuX9JetHRVyacjGP0JtyYE0GklZEz2Bj5PikPGAe7W2WnVgi
	VhNDTg8Oj+g2E357RnYqE9/3FmmYrRt1dlCVDan1PXry/y6WRIM1UNAyp9C4F/+RSNp0
	frNQ==
X-Gm-Message-State: APjAAAU+HXnwuKUqw2N9McQ1G2SJ3H2t5Sjxx7KXpwWa+/s6LWIP63sR
	WegFKWWe6vg5T8M8SzYZRUEUN1nO
X-Google-Smtp-Source: APXvYqw89/aDbk3OZ2JJG3mX2fGIzFspiP172AzXm3iPSjqjD4pmJrwDulkB+uydQ2Ncx59E9mu75w==
X-Received: by 2002:a63:1e4d:: with SMTP id p13mr38166554pgm.125.1557843283611;
	Tue, 14 May 2019 07:14:43 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	l23sm18250555pgh.68.2019.05.14.07.14.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 07:14:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 07:14:41 -0700
Message-Id: <20190514141441.4789-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] runtime ptest: run each ptest separately
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
X-List-Received-Date: Tue, 14 May 2019 14:14:42 -0000

resulttool still working

Recipe  | Passed    | Failed | Skipped | Time(s)
------------------------------------------------
openssh | 0         | 0      | 1      | 1
openssl | 146       | 1      | 8      | 80
python  | 0         | 0      | 0      | 21

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 52 +++++++++++++++++-----------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index fa95fefe01..520f65d450 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -26,6 +26,7 @@ class PTestBase(OERuntimeTestCase):
     @classmethod
     def ptest_startup(cls):
         cls.failmsg = ""
+        cls.ptests = []
 
         cls.test_log_dir = cls.td.get('TEST_LOG_DIR', '')
         # The TEST_LOG_DIR maybe NULL when testimage is added after
@@ -46,6 +47,8 @@ class PTestBase(OERuntimeTestCase):
             cls.tc.extraresults = {}
 
         cls.extras = cls.tc.extraresults
+        cls.extras['ptestresult.rawlogs'] = {'log': ""}
+        cls.extras['ptestresult.sections'] = {}
 
     @classmethod
     def ptest_finishup(cls):
@@ -60,24 +63,7 @@ class PTestBase(OERuntimeTestCase):
             cls.fail(cls.failmsg)
 
 class PtestRunnerTest(PTestBase):
-
-    @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['ptest-runner'])
-    def test_ptestrunner_check(self):
-        status, output = self.target.run('which ptest-runner')
-        msg = 'ptest-runner not installed .  %s' % output
-        self.assertEqual(status, 0, msg=msg)
-
-    @OETestDepends(['ptest.PtestRunnerTest.test_ptestrunner_check'])
-    def test_ptests_installed(self):
-        status, output = self.target.run('ptest-runner -l')
-        msg = 'No ptests found.  %s' % output
-        self.assertEqual(status, 0, msg=msg)
-
-    @OETestDepends(['ptest.PtestRunnerTest.test_ptests_installed'])
-    @unittest.expectedFailure
-    def test_ptestrunner(self):
+    def run_ptest(self, ptest):
         status, output = self.target.run('ptest-runner', 0)
         with open(self.ptest_runner_log, 'w') as f:
             f.write(output)
@@ -87,8 +73,8 @@ class PtestRunnerTest(PTestBase):
         results, sections = parser.parse(self.ptest_runner_log)
         parser.results_as_files(self.ptest_log_dir)
 
-        self.extras['ptestresult.rawlogs'] = {'log': output}
-        self.extras['ptestresult.sections'] = sections
+        self.extras['ptestresult.rawlogs']['log']  = self.extras['ptestresult.rawlogs']['log'] + output
+        self.extras['ptestresult.sections'][ptest]  = sections[ptest]
 
         trans = str.maketrans("()", "__")
         for section in results:
@@ -110,3 +96,29 @@ class PtestRunnerTest(PTestBase):
         if failed_tests:
             self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
 
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
+        # built ptest list
+        for ptest in output.split("\n"):
+            if ptest.startswith("Available"):
+                continue
+            self.ptests.append(ptest.split()[0])
+
+    @OETestDepends(['ptest.PtestRunnerTest.test_ptests_installed'])
+    @unittest.expectedFailure
+    def test_ptestrunner(self):
+        for ptest in self.ptests:
+            self.run_ptest(ptest)
-- 
2.17.1


