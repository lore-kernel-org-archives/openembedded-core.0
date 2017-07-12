Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80136780A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:36:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133753"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:36:59 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:36:53 -0500
Message-Id: <c6197cbf7fbf7e69b431a3507691da6ba50b7bbd.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 07/29] oeqa/core/threaded: Add support to run into a thread at end of execution
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
X-List-Received-Date: Wed, 12 Jul 2017 19:36:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some test cases aren't allowed to run into a multi-thread environment so
add the posibility to run those tests at end of execution.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/threaded.py | 102 +++++++++++++++++++++++++++++++----------
 1 file changed, 78 insertions(+), 24 deletions(-)

diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
index 34217f1a8b8..a7dc0aed401 100644
--- a/meta/lib/oeqa/core/threaded.py
+++ b/meta/lib/oeqa/core/threaded.py
@@ -30,18 +30,35 @@ class OETestLoaderThreaded(OETestLoader):
         suites = {}
         suites['main'] = self.suiteClass()
         suites['pool'] = []
+        suites['end'] = self.suiteClass()
         for _ in range(self.process_num - 1):
             suites['pool'].append(self.suiteClass())
 
+        def _add_by_module_or_dep(suite, case, depends):
+            """
+                A test case that needs to run into the same thread
+                because is on the same module or for dependency
+                reasons.
+            """
+
+            for c in suite._tests:
+                if case.__module__ == c.__module__:
+                    suite.addTest(case)
+                    return True
+
+            if case.id() in depends:
+                case_depends = depends[case.id()]
+                for c in suite._tests:
+                    if c.id() in case_depends:
+                        suite.addTest(case)
+                        return True
+
+            return False
+
         def _add_to_main_thread(main_suite, case, depends):
             """
                 Some test cases needs to be run into the main
-                thread for several resons.
-
-                A test case that needs to run in the main thread
-                can be for specific set via test class _main_thread
-                attr or because is on the same module or for a dependency
-                reason.
+                thread by request.
             """
 
             if hasattr(case.__class__, '_main_thread') and \
@@ -50,19 +67,20 @@ class OETestLoaderThreaded(OETestLoader):
                 main_suite.addTest(case)
                 return True
 
-            for c in main_suite._tests:
-                if case.__module__ == c.__module__:
-                    main_suite.addTest(case)
-                    return True
+            return _add_by_module_or_dep(main_suite, case, depends)
 
-            if case.id() in depends:
-                case_depends = depends[case.id()]
-                for c in main_suite._tests:
-                    if c.id() in case_depends:
-                        main_suite.addTest(case)
-                        return True
+        def _add_to_end_thread(end_suite, case, depends):
+            """
+                Some test cases needs to be run into at end of
+                execution into the main by request.
+            """
+            if hasattr(case.__class__, '_end_thread') and \
+                    case.__class__._end_thread or \
+                    self.process_num == 1:
+                end_suite.addTest(case)
+                return True
 
-            return False
+            return _add_by_module_or_dep(end_suite, case, depends)
 
         def _search_for_module_idx(suites, case):
             """
@@ -112,6 +130,9 @@ class OETestLoaderThreaded(OETestLoader):
                     if 'depends' in self.tc._registry:
                         depends = self.tc._registry['depends']
 
+                    if _add_to_end_thread(suites['end'], case, depends):
+                        continue
+
                     if _add_to_main_thread(suites['main'], case, depends):
                         continue
 
@@ -135,7 +156,7 @@ class OETestLoaderThreaded(OETestLoader):
 
         # if the main suite doesn't have test cases
         # use the first element of the suites pool
-        if not len(suites['main']._tests):
+        if not len(suites['main']._tests) and len(suites['pool']):
             suites['main'] = suites['pool'].pop(0)
 
         return suites
@@ -268,6 +289,12 @@ class _ThreadedPool:
         self.tasks = queue.Queue(num_tasks)
         self.workers = []
 
+        self.stream = stream
+        self.result = result
+
+        self.end_task = None
+        self.end_worker = None
+
         for _ in range(num_workers):
             worker = _Worker(self.tasks, result, stream)
             self.workers.append(worker)
@@ -280,12 +307,25 @@ class _ThreadedPool:
         """Add a task to the queue"""
         self.tasks.put((func, args, kargs))
 
+    def add_end_task(self, func, *args, **kwargs):
+        """Add a task to be executed at end"""
+
+        self.end_task = queue.Queue(1)
+        self.end_task.put((func, args, kwargs))
+        self.end_worker = _Worker(self.end_task, self.result,
+                self.stream)
+
     def wait_completion(self):
         """Wait for completion of all the tasks in the queue"""
         self.tasks.join()
         for worker in self.workers:
             worker.join()
 
+        if self.end_task:
+            self.end_worker.start()
+            self.end_task.join()
+            self.end_worker.join()
+
 class OETestRunnerThreaded(OETestRunner):
     streamLoggerClass = OEStreamLoggerThreaded
 
@@ -293,32 +333,46 @@ class OETestRunnerThreaded(OETestRunner):
         super(OETestRunnerThreaded, self).__init__(tc, *args, **kwargs)
         self.resultclass = OETestResultThreadedInternal # XXX: XML reporting overrides at __init__
 
+    def _run_main_thread(self, suite, result):
+        if len(suite._tests):
+            run_start_time = time.time()
+            rc = super(OETestRunnerThreaded, self).run(suite)
+            run_end_time = time.time()
+            result.addResult(rc, run_start_time, run_end_time)
+            self.stream.finish()
+
     def run(self, suites):
         result = OETestResultThreaded(self.tc)
 
         pool = None
+
         if suites['pool']:
             thread_no = len(suites['pool'])
             pool = _ThreadedPool(thread_no, thread_no, stream=self.stream,
                     result=result)
             for s in suites['pool']:
                 pool.add_task(super(OETestRunnerThreaded, self).run, s)
-            pool.start()
 
-        run_start_time = time.time()
-        rc = super(OETestRunnerThreaded, self).run(suites['main'])
-        run_end_time = time.time()
-        result.addResult(rc, run_start_time, run_end_time)
-        self.stream.finish()
+        if len(suites['end']._tests):
+            if not pool:
+                pool = _ThreadedPool(0, 0, stream=self.stream,
+                            result=result)
+            pool.add_end_task(super(OETestRunnerThreaded, self).run,
+                    suites['end'])
 
         if pool:
+            pool.start()
+        self._run_main_thread(suites['main'], result)
+        if pool:
             pool.wait_completion()
+
         result._fill_tc_results()
 
         return result
 
     def list_tests(self, suite, display_type):
         suite['pool'].insert(0, suite['main'])
+        suite['pool'].append(suite['end'])
 
         return super(OETestRunnerThreaded, self).list_tests(
                 suite['pool'], display_type)
-- 
2.11.0


