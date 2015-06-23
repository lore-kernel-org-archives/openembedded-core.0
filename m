Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE896AC1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:48:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2015 09:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,666,1427785200"; d="scan'208";a="593327632"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2015 09:48:01 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 11:49:53 -0500
Message-Id: <6a669a718ef958751c3c0741c9cc6f7783bab05e.1435078109.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435078109.git.anibal.limon@linux.intel.com>
References: <cover.1435078109.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1435078109.git.anibal.limon@linux.intel.com>
References: <cover.1435078109.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] oe/utils.py: Fix thread leakage in ThreadPool
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
X-List-Received-Date: Tue, 23 Jun 2015 16:48:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to fix Thread leakage caused by not call join() in Threads,

Pass num_tasks in ThreadPool for add all the tasks into a Queue this
enable catch of Queue.Empty exception and exit the threads.

classes/sstate.bbclass: Change checkstatus function to match new
ThreadPool operation.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/sstate.bbclass |  3 ++-
 meta/lib/oe/utils.py        | 26 ++++++++++++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1e5e98a..a80d1ce 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -771,9 +771,10 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             bb.note("Checking sstate mirror object availability (for %s objects)" % len(tasklist))
             import multiprocessing
             nproc = min(multiprocessing.cpu_count(), len(tasklist))
-            pool = oe.utils.ThreadedPool(nproc)
+            pool = oe.utils.ThreadedPool(nproc, len(tasklist))
             for t in tasklist:
                 pool.add_task(checkstatus, t)
+            pool.start()
             pool.wait_completion()
 
     inheritlist = d.getVar("INHERIT", True)
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 0de8800..f0d3c14 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -222,11 +222,16 @@ class ThreadedWorker(Thread):
         Thread.__init__(self)
         self.tasks = tasks
         self.daemon = True
-        self.start()
 
     def run(self):
+        from Queue import Empty
+
         while True:
-            func, args, kargs = self.tasks.get()
+            try:
+                func, args, kargs = self.tasks.get(block=False)
+            except Empty:
+                break
+
             try:
                 func(*args, **kargs)
             except Exception, e:
@@ -236,9 +241,17 @@ class ThreadedWorker(Thread):
 
 class ThreadedPool:
     """Pool of threads consuming tasks from a queue"""
-    def __init__(self, num_threads):
-        self.tasks = Queue(num_threads)
-        for _ in range(num_threads): ThreadedWorker(self.tasks)
+    def __init__(self, num_workers, num_tasks):
+        self.tasks = Queue(num_tasks)
+        self.workers = []
+
+        for _ in range(num_workers):
+            worker = ThreadedWorker(self.tasks)
+            self.workers.append(worker)
+
+    def start(self):
+        for worker in self.workers:
+            worker.start()
 
     def add_task(self, func, *args, **kargs):
         """Add a task to the queue"""
@@ -247,4 +260,5 @@ class ThreadedPool:
     def wait_completion(self):
         """Wait for completion of all the tasks in the queue"""
         self.tasks.join()
-
+        for worker in self.workers:
+            worker.join()
-- 
1.9.1


