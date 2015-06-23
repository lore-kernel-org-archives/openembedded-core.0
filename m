Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97D3873E36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:48:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2015 09:48:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,666,1427785200"; d="scan'208";a="593327650"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2015 09:48:02 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 11:49:54 -0500
Message-Id: <ee1783181d643156ef483c088b899b1d53945ef0.1435078109.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435078109.git.anibal.limon@linux.intel.com>
References: <cover.1435078109.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1435078109.git.anibal.limon@linux.intel.com>
References: <cover.1435078109.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oe/utils.py: Add support for init/end helper functions in ThreadWorker.
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

Add init/end helper functions for ThreadWorker also pass ThreadWorker
as first argument to init/end/func functions this enables per-thread
storage handling.

classes/sstate.bbclass: Add thread_worker argument to checkstatus
function.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/sstate.bbclass |  2 +-
 meta/lib/oe/utils.py        | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a80d1ce..1e2d4f6 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -739,7 +739,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
         if localdata.getVar('BB_NO_NETWORK', True) == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) == "1":
             localdata.delVar('BB_NO_NETWORK')
 
-        def checkstatus(arg):
+        def checkstatus(thread_worker, arg):
             (task, sstatefile) = arg
 
             localdata2 = bb.data.createCopy(localdata)
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index f0d3c14..cee087f 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -218,22 +218,30 @@ from threading import Thread
 
 class ThreadedWorker(Thread):
     """Thread executing tasks from a given tasks queue"""
-    def __init__(self, tasks):
+    def __init__(self, tasks, worker_init, worker_end):
         Thread.__init__(self)
         self.tasks = tasks
         self.daemon = True
 
+        self.worker_init = worker_init
+        self.worker_end = worker_end
+
     def run(self):
         from Queue import Empty
 
+        if self.worker_init is not None:
+            self.worker_init(self)
+
         while True:
             try:
                 func, args, kargs = self.tasks.get(block=False)
             except Empty:
+                if self.worker_end is not None:
+                    self.worker_end(self)
                 break
 
             try:
-                func(*args, **kargs)
+                func(self, *args, **kargs)
             except Exception, e:
                 print e
             finally:
@@ -241,12 +249,13 @@ class ThreadedWorker(Thread):
 
 class ThreadedPool:
     """Pool of threads consuming tasks from a queue"""
-    def __init__(self, num_workers, num_tasks):
+    def __init__(self, num_workers, num_tasks, worker_init=None,
+            worker_end=None):
         self.tasks = Queue(num_tasks)
         self.workers = []
 
         for _ in range(num_workers):
-            worker = ThreadedWorker(self.tasks)
+            worker = ThreadedWorker(self.tasks, worker_init, worker_end)
             self.workers.append(worker)
 
     def start(self):
-- 
1.9.1


