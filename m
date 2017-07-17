Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 46F2377BE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467519"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:14 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:15 -0500
Message-Id: <e3688e68443a14a14a21ed2109fdd70e70b304f2.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 07/30] oeqa/core/threaded: Enable support to use the main thread
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some test cases needs to be executed by the main thread for
several resons, this implmentation enables usage of the main
thread to execute suites.

The rules are if some test case request by test class attr
_main_thread it will be executed, if no tests are scheduled
to be executed into the main thread the algorithm with take
the first suite in the pool, finallay this will avoid
thread usage if only one suite needs to be executed.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/threaded.py | 104 ++++++++++++++++++++++++++++++++---------
 1 file changed, 83 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
index 2cafe03a212..34217f1a8b8 100644
--- a/meta/lib/oeqa/core/threaded.py
+++ b/meta/lib/oeqa/core/threaded.py
@@ -27,9 +27,42 @@ class OETestLoaderThreaded(OETestLoader):
             self.process_num = min(multiprocessing.cpu_count(),
                     len(suite._tests))
 
-        suites = []
-        for _ in range(self.process_num):
-            suites.append(self.suiteClass())
+        suites = {}
+        suites['main'] = self.suiteClass()
+        suites['pool'] = []
+        for _ in range(self.process_num - 1):
+            suites['pool'].append(self.suiteClass())
+
+        def _add_to_main_thread(main_suite, case, depends):
+            """
+                Some test cases needs to be run into the main
+                thread for several resons.
+
+                A test case that needs to run in the main thread
+                can be for specific set via test class _main_thread
+                attr or because is on the same module or for a dependency
+                reason.
+            """
+
+            if hasattr(case.__class__, '_main_thread') and \
+                    case.__class__._main_thread or \
+                    self.process_num == 1:
+                main_suite.addTest(case)
+                return True
+
+            for c in main_suite._tests:
+                if case.__module__ == c.__module__:
+                    main_suite.addTest(case)
+                    return True
+
+            if case.id() in depends:
+                case_depends = depends[case.id()]
+                for c in main_suite._tests:
+                    if c.id() in case_depends:
+                        main_suite.addTest(case)
+                        return True
+
+            return False
 
         def _search_for_module_idx(suites, case):
             """
@@ -37,8 +70,7 @@ class OETestLoaderThreaded(OETestLoader):
                 in the same thread because PyUnit keeps track
                 of setUp{Module, Class,} and tearDown{Module, Class,}.
             """
-
-            for idx in range(self.process_num):
+            for idx in range(self.process_num - 1):
                 suite = suites[idx]
                 for c in suite._tests:
                     if case.__module__ == c.__module__:
@@ -53,7 +85,7 @@ class OETestLoaderThreaded(OETestLoader):
                 of dependant test to figure out if skip or not.
             """
 
-            for idx in range(self.process_num):
+            for idx in range(self.process_num - 1):
                 suite = suites[idx]
 
                 for case in suite._tests:
@@ -62,6 +94,11 @@ class OETestLoaderThreaded(OETestLoader):
             return -1
 
         def _get_best_idx(suites):
+            """
+                The best index is selected to the suite that has
+                minor test cases to run.
+            """
+
             sizes = [len(suite._tests) for suite in suites]
             return sizes.index(min(sizes))
 
@@ -71,27 +108,35 @@ class OETestLoaderThreaded(OETestLoader):
                 if isinstance(case, TestSuite):
                     _fill_suites(case)
                 else:
-                    idx = _search_for_module_idx(suites, case)
-
                     depends = {}
                     if 'depends' in self.tc._registry:
                         depends = self.tc._registry['depends']
 
+                    if _add_to_main_thread(suites['main'], case, depends):
+                        continue
+
+                    # Get the best index in the suite pool to add the case
+                    idx = _search_for_module_idx(suites['pool'], case)
                     if idx == -1 and case.id() in depends:
                         case_depends = depends[case.id()] 
-                        idx = _search_for_depend_idx(suites, case_depends)
-
+                        idx = _search_for_depend_idx(suites['pool'], case_depends)
                     if idx == -1:
-                        idx = _get_best_idx(suites)
+                        idx = _get_best_idx(suites['pool'])
+                    suites['pool'][idx].addTest(case)
 
-                    suites[idx].addTest(case)
         _fill_suites(suite)
 
-        suites_tmp = suites
-        suites = []
+        # clean suites in pool without test cases
+        suites_tmp = suites['pool']
+        suites['pool'] = []
         for suite in suites_tmp:
             if len(suite._tests) > 0:
-                suites.append(suite)
+                suites['pool'].append(suite)
+
+        # if the main suite doesn't have test cases
+        # use the first element of the suites pool
+        if not len(suites['main']._tests):
+            suites['main'] = suites['pool'].pop(0)
 
         return suites
 
@@ -251,16 +296,33 @@ class OETestRunnerThreaded(OETestRunner):
     def run(self, suites):
         result = OETestResultThreaded(self.tc)
 
-        pool = _ThreadedPool(len(suites), len(suites), stream=self.stream,
-                result=result)
-        for s in suites:
-            pool.add_task(super(OETestRunnerThreaded, self).run, s)
-        pool.start()
-        pool.wait_completion()
+        pool = None
+        if suites['pool']:
+            thread_no = len(suites['pool'])
+            pool = _ThreadedPool(thread_no, thread_no, stream=self.stream,
+                    result=result)
+            for s in suites['pool']:
+                pool.add_task(super(OETestRunnerThreaded, self).run, s)
+            pool.start()
+
+        run_start_time = time.time()
+        rc = super(OETestRunnerThreaded, self).run(suites['main'])
+        run_end_time = time.time()
+        result.addResult(rc, run_start_time, run_end_time)
+        self.stream.finish()
+
+        if pool:
+            pool.wait_completion()
         result._fill_tc_results()
 
         return result
 
+    def list_tests(self, suite, display_type):
+        suite['pool'].insert(0, suite['main'])
+
+        return super(OETestRunnerThreaded, self).list_tests(
+                suite['pool'], display_type)
+
 class OETestContextThreaded(OETestContext):
     loaderClass = OETestLoaderThreaded
     runnerClass = OETestRunnerThreaded
-- 
2.11.0


