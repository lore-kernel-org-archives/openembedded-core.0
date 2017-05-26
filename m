Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5A478305
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887800"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:42 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:44 -0500
Message-Id: <43da75faefa0ddb95645f89b26431054b5a26f1d.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 18/36] oeqa/core: Add list tests support in context and runner
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
X-List-Received-Date: Fri, 26 May 2017 20:38:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A common operation is to list tests, currently only selftest
support it, this changes enables this functionality into the
core framework.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/context.py | 22 +++++++---
 meta/lib/oeqa/core/runner.py  | 98 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 54958ad..bc958d0 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -58,6 +58,10 @@ class OETestContext(object):
 
         return result
 
+    def listTests(self, display_type):
+        self.runner = self.runnerClass(self, verbosity=2)
+        return self.runner.list_tests(self.suites, display_type)
+
 class OETestContextExecutor(object):
     _context_class = OETestContext
 
@@ -79,9 +83,14 @@ class OETestContextExecutor(object):
         self.parser.add_argument('--output-log', action='store',
                 default=self.default_output_log,
                 help="results output log, default: %s" % self.default_output_log)
-        self.parser.add_argument('--run-tests', action='store',
+
+        group = self.parser.add_mutually_exclusive_group()
+        group.add_argument('--run-tests', action='store',
                 default=self.default_tests,
                 help="tests to run in <module>[.<class>[.<name>]] format. Just works for modules now")
+        group.add_argument('--list-tests', action='store',
+                choices=('module', 'class', 'name'),
+                help="lists available tests")
 
         if self.default_test_data:
             self.parser.add_argument('--test-data-file', action='store',
@@ -126,7 +135,6 @@ class OETestContextExecutor(object):
         else:
             self.tc_kwargs['init']['td'] = {}
 
-
         if args.run_tests:
             self.tc_kwargs['load']['modules'] = args.run_tests.split()
         else:
@@ -139,9 +147,13 @@ class OETestContextExecutor(object):
 
         self.tc = self._context_class(**self.tc_kwargs['init'])
         self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
-        rc = self.tc.runTests(**self.tc_kwargs['run'])
-        rc.logSummary(self.name)
-        rc.logDetails()
+
+        if args.list_tests:
+            rc = self.tc.listTests(args.list_tests, **self.tc_kwargs['run'])
+        else:
+            rc = self.tc.runTests(**self.tc_kwargs['run'])
+            rc.logSummary(self.name)
+            rc.logDetails()
 
         output_link = os.path.join(os.path.dirname(args.output_log),
                 "%s-results.log" % self.name)
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 3ebffc7..7ce718e 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -134,6 +134,10 @@ class OETestResult(_TestResult):
                 self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
                     oeid, 'PASSED'))
 
+class OEListTestsResult(object):
+    def wasSuccessful(self):
+        return True
+
 class OETestRunner(_TestRunner):
     streamLoggerClass = OEStreamLogger
 
@@ -164,3 +168,97 @@ class OETestRunner(_TestRunner):
         def _makeResult(self):
             return self.resultclass(self.tc, self.stream, self.descriptions,
                     self.verbosity)
+
+
+    def _walk_suite(self, suite, func):
+        for obj in suite:
+            if isinstance(obj, unittest.suite.TestSuite):
+                if len(obj._tests):
+                    self._walk_suite(obj, func)
+            elif isinstance(obj, unittest.case.TestCase):
+                func(self.tc.logger, obj)
+                self._walked_cases = self._walked_cases + 1
+
+    def _list_tests_name(self, suite):
+        from oeqa.core.decorator.oeid import OETestID
+        from oeqa.core.decorator.oetag import OETestTag
+
+        self._walked_cases = 0
+
+        def _list_cases_without_id(logger, case):
+
+            found_id = False
+            for d in case.decorators:
+                if isinstance(d, OETestID):
+                    found_id = True
+
+            if not found_id:
+                logger.info('oeid missing for %s' % case.id())
+
+        def _list_cases(logger, case):
+            oeid = None
+            oetag = None
+
+            for d in case.decorators:
+                if isinstance(d, OETestID):
+                    oeid = d.oeid
+                elif isinstance(d, OETestTag):
+                    oetag = d.oetag
+
+            logger.info("%s\t%s\t\t%s" % (oeid, oetag, case.id()))
+
+        self.tc.logger.info("Listing test cases that don't have oeid ...")
+        self._walk_suite(suite, _list_cases_without_id)
+        self.tc.logger.info("-" * 80)
+
+        self.tc.logger.info("Listing all available tests:")
+        self._walked_cases = 0
+        self.tc.logger.info("id\ttag\t\ttest")
+        self.tc.logger.info("-" * 80)
+        self._walk_suite(suite, _list_cases)
+        self.tc.logger.info("-" * 80)
+        self.tc.logger.info("Total found:\t%s" % self._walked_cases)
+
+    def _list_tests_class(self, suite):
+        self._walked_cases = 0
+
+        curr = {}
+        def _list_classes(logger, case):
+            if not 'module' in curr or curr['module'] != case.__module__:
+                curr['module'] = case.__module__
+                logger.info(curr['module'])
+
+            if not 'class' in curr  or curr['class'] != \
+                    case.__class__.__name__:
+                curr['class'] = case.__class__.__name__
+                logger.info(" -- %s" % curr['class'])
+
+            logger.info(" -- -- %s" % case._testMethodName)
+
+        self.tc.logger.info("Listing all available test classes:")
+        self._walk_suite(suite, _list_classes)
+
+    def _list_tests_module(self, suite):
+        self._walked_cases = 0
+
+        listed = []
+        def _list_modules(logger, case):
+            if not case.__module__ in listed:
+                if case.__module__.startswith('_'):
+                    logger.info("%s (hidden)" % case.__module__)
+                else:
+                    logger.info(case.__module__)
+                listed.append(case.__module__)
+
+        self.tc.logger.info("Listing all available test modules:")
+        self._walk_suite(suite, _list_modules)
+
+    def list_tests(self, suite, display_type):
+        if display_type == 'name':
+            self._list_tests_name(suite)
+        elif display_type == 'class':
+            self._list_tests_class(suite)
+        elif display_type == 'module':
+            self._list_tests_module(suite)
+
+        return OEListTestsResult()
-- 
2.1.4


