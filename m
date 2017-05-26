Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C1734782D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887686"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:25 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:37 -0500
Message-Id: <6968c34dc3ded470ec1fbea09ba5d87b3c642e69.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 11/36] oeqa/core/threaded: Add support of OETestRunnerThreaded
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
X-List-Received-Date: Fri, 26 May 2017 20:38:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OETestRunnerThreaded overrides the run method of OETestRunner
it recieves a list of suites to be executed by a ThreadPool.

The new run method handles the ThreadPool creation and the
OETestResultThreaded fill.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/threaded.py | 75 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/threaded.py b/meta/lib/oeqa/core/threaded.py
index f216685..81df340 100644
--- a/meta/lib/oeqa/core/threaded.py
+++ b/meta/lib/oeqa/core/threaded.py
@@ -3,11 +3,13 @@
 
 import threading
 import multiprocessing
+import queue
+import time
 
 from unittest.suite import TestSuite
 
 from oeqa.core.loader import OETestLoader
-from oeqa.core.runner import OEStreamLogger, OETestResult
+from oeqa.core.runner import OEStreamLogger, OETestResult, OETestRunner
 
 class OETestLoaderThreaded(OETestLoader):
     def __init__(self, tc, module_paths, modules, tests, modules_required,
@@ -185,3 +187,74 @@ class OETestResultThreaded(object):
         tid = list(self._results)[0]
         result = self._results[tid]['result']
         result.logDetails()
+
+class _Worker(threading.Thread):
+    """Thread executing tasks from a given tasks queue"""
+    def __init__(self, tasks, result, stream):
+        threading.Thread.__init__(self)
+        self.tasks = tasks
+
+        self.result = result
+        self.stream = stream
+
+    def run(self):
+        while True:
+            try:
+                func, args, kargs = self.tasks.get(block=False)
+            except queue.Empty:
+                break
+
+            try:
+                run_start_time = time.time()
+                rc = func(*args, **kargs)
+                run_end_time = time.time()
+                self.result.addResult(rc, run_start_time, run_end_time)
+                self.stream.finish()
+            except Exception as e:
+                print(e)
+            finally:
+                self.tasks.task_done()
+
+class _ThreadedPool:
+    """Pool of threads consuming tasks from a queue"""
+    def __init__(self, num_workers, num_tasks, stream=None, result=None):
+        self.tasks = queue.Queue(num_tasks)
+        self.workers = []
+
+        for _ in range(num_workers):
+            worker = _Worker(self.tasks, result, stream)
+            self.workers.append(worker)
+
+    def start(self):
+        for worker in self.workers:
+            worker.start()
+
+    def add_task(self, func, *args, **kargs):
+        """Add a task to the queue"""
+        self.tasks.put((func, args, kargs))
+
+    def wait_completion(self):
+        """Wait for completion of all the tasks in the queue"""
+        self.tasks.join()
+        for worker in self.workers:
+            worker.join()
+
+class OETestRunnerThreaded(OETestRunner):
+    streamLoggerClass = OEStreamLoggerThreaded
+
+    def __init__(self, tc, *args, **kwargs):
+        super(OETestRunnerThreaded, self).__init__(tc, *args, **kwargs)
+        self.resultclass = OETestResultThreadedInternal # XXX: XML reporting overrides at __init__
+
+    def run(self, suites):
+        result = OETestResultThreaded(self.tc)
+
+        pool = _ThreadedPool(len(suites), len(suites), stream=self.stream,
+                result=result)
+        for s in suites:
+            pool.add_task(super(OETestRunnerThreaded, self).run, s)
+        pool.start()
+        pool.wait_completion()
+        result._fill_tc_results()
+
+        return result
-- 
2.1.4


