Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 89084748D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:33:30 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b15-v6so32599400wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AqnznKZMjSHQxkCobXgV1ClWDB5G+qFmEkVdDCjs1xw=;
	b=W8ZfKHjhjfXHUjx1XqQtWuwd/+c20HI6Xwj8IrLKiOBvLl7q0gc8yEYsozPzhLJBno
	1ovROEVny3m1rpgeTpNVX3wRu+NRQhCdngnQnKVyzt322XWw4kNFFAT30SSitbCtVsMY
	nebBY9fupS+42tCsy1rCIB+8CaMWC3+p0lMRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AqnznKZMjSHQxkCobXgV1ClWDB5G+qFmEkVdDCjs1xw=;
	b=ZY/9nZNbP244X8Bx7THrIlEI92AZja3TvIlkifzvQ18r1Fim6m+/ldSFJIytWqjyaA
	yjAVkWhRg6mZWSeAZoIYd1vnYDH3+jwgcsY5it8LGFzPsppI/h4J7kv4FX2uy3xo7uKW
	BVluktXSTk3tJf/1i05ARrDnbitOL5cuqcTbdJTCVxGnGfJgh8fSy0Lg0y+YLTFDNNoD
	dTWcVHugHPvi53CP1KPODc6D3pCwniKzD04F/2UF5kqDkMIgLHtUO67uqR0Q+fpbDrzK
	N9FqYeOXxZ8nHFwzGySvzVNgdsTOZKnxDzXtilTpnmR013hMsZhiGooF65MgcTiBZsu6
	Y4Tw==
X-Gm-Message-State: AOUpUlGmRntC77sKugaXDGCg3gUQ/Ufc9HHpmxnNF3mRTXb0jD1sgjbs
	oLsYY2miorwuoueF+3XqGjhQt4ivZzA=
X-Google-Smtp-Source: AAOMgpcQDuJpNEpyQt32ReGMicqqbH4bUpmels6zJzDxq86ESn+gAe/MjlIuXOrff04M0cH2Hy0wyA==
X-Received: by 2002:a5d:4acc:: with SMTP id
	y12-v6mr11807677wrs.132.1531758811058; 
	Mon, 16 Jul 2018 09:33:31 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j65-v6sm13571188wmd.39.2018.07.16.09.33.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 09:33:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 17:33:22 +0100
Message-Id: <20180716163325.13847-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
References: <20180716163325.13847-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/6] oeqa/runner: Simplify code
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
X-List-Received-Date: Mon, 16 Jul 2018 16:33:30 -0000

There doesn't appear to be any reason we need this _results indirection
any more so remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py           |  1 -
 meta/lib/oeqa/core/decorator/depends.py |  4 +---
 meta/lib/oeqa/core/runner.py            | 15 +++++----------
 meta/lib/oeqa/core/tests/test_data.py   |  4 ++--
 4 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 8cdfbf834f3..f174c4bbcfc 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -27,7 +27,6 @@ class OETestContext(object):
         self.logger = logger
         self._registry = {}
         self._registry['cases'] = collections.OrderedDict()
-        self._results = {}
 
     def _read_modules_from_manifest(self, manifest):
         if not os.path.exists(manifest):
diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 99eccc12685..69c604d8f4b 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -63,12 +63,10 @@ def _order_test_case_by_depends(cases, depends):
     return [cases[case_id] for case_id in cases_ordered]
 
 def _skipTestDependency(case, depends):
-    results = case.tc._results
-
     skipReasons = ['errors', 'failures', 'skipped']
 
     for reason in skipReasons:
-        for test, _ in results[reason]:
+        for test, _ in getattr(case.tc.results, reason):
             if test.id() in depends:
                 raise SkipTest("Test case %s depends on %s and was in %s." \
                         % (case.id(), test.id(), reason))
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 6adbe3827b4..0f84a1d2803 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -47,8 +47,10 @@ class OETestResult(_TestResult):
         self.endtime = {}
         self.progressinfo = {}
 
+        # Inject into tc so that TestDepends decorator can see results
+        tc.results = self
+
         self.tc = tc
-        self._tc_map_results()
 
     def startTest(self, test):
         # May have been set by concurrencytest
@@ -56,13 +58,6 @@ class OETestResult(_TestResult):
             self.starttime[test.id()] = time.time()
         super(OETestResult, self).startTest(test)
 
-    def _tc_map_results(self):
-        self.tc._results['failures'] = self.failures
-        self.tc._results['errors'] = self.errors
-        self.tc._results['skipped'] = self.skipped
-        self.tc._results['expectedFailures'] = self.expectedFailures
-        self.tc._results['successes'] = self.successes
-
     def stopTest(self, test):
         self.endtime[test.id()] = time.time()
         super(OETestResult, self).stopTest(test)
@@ -80,7 +75,7 @@ class OETestResult(_TestResult):
             msg = "%s - OK - All required tests passed" % component
         else:
             msg = "%s - FAIL - Required tests failed" % component
-        skipped = len(self.tc._results['skipped'])
+        skipped = len(self.skipped)
         if skipped: 
             msg += " (skipped=%d)" % skipped
         self.tc.logger.info(msg)
@@ -88,7 +83,7 @@ class OETestResult(_TestResult):
     def _getDetailsNotPassed(self, case, type, desc):
         found = False
 
-        for (scase, msg) in self.tc._results[type]:
+        for (scase, msg) in getattr(self, type):
             # XXX: When XML reporting is enabled scase is
             # xmlrunner.result._TestInfo instance instead of
             # string.
diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
index 320468cbe4a..21b6c68b8a4 100755
--- a/meta/lib/oeqa/core/tests/test_data.py
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -21,7 +21,7 @@ class TestData(TestBase):
 
         tc = self._testLoader(modules=self.modules)
         self.assertEqual(False, tc.runTests().wasSuccessful())
-        for test, data in tc._results['errors']:
+        for test, data in tc.errors:
             expect = False
             if expectedException in data:
                 expect = True
@@ -34,7 +34,7 @@ class TestData(TestBase):
 
         tc = self._testLoader(d=d, modules=self.modules)
         self.assertEqual(False, tc.runTests().wasSuccessful())
-        for test, data in tc._results['failures']:
+        for test, data in tc.failures:
             expect = False
             if expectedError in data:
                 expect = True
-- 
2.17.1


