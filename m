Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 927DE65C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 03:14:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2016 20:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,464,1459839600"; d="scan'208";a="718037624"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2016 20:14:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 15:13:55 +1200
Message-Id: <c2ad913df96426cb36d7a3746f0ab316c38a9126.1465787274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/9] classes/sstate: show progress during sstate object availability check
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
X-List-Received-Date: Mon, 13 Jun 2016 03:14:39 -0000

Show progress through bitbake's standard terminal UI when checking for
shared state object availability, since this can take some time if there
are a large number of tasks to be executed and/or the network connection
is slow.

Part of the implementation for [YOCTO #5853].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 994eae6..4e81fc9 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -800,7 +800,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             except:
                 missed.append(task)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
-                pass     
+                pass
+            bb.event.fire(bb.event.ProcessProgress("Checking sstate mirror object availability", len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
         for task in range(len(sq_fn)):
@@ -811,7 +812,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             tasklist.append((task, sstatefile))
 
         if tasklist:
-            bb.note("Checking sstate mirror object availability (for %s objects)" % len(tasklist))
+            bb.event.fire(bb.event.ProcessStarted("Checking sstate mirror object availability", len(tasklist)), d)
             import multiprocessing
             nproc = min(multiprocessing.cpu_count(), len(tasklist))
 
@@ -821,6 +822,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
                 pool.add_task(checkstatus, t)
             pool.start()
             pool.wait_completion()
+            bb.event.fire(bb.event.ProcessFinished("Checking sstate mirror object availability"), d)
 
     inheritlist = d.getVar("INHERIT", True)
     if "toaster" in inheritlist:
-- 
2.5.5


