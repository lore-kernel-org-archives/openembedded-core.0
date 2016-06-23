Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 788286FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:07:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2016 05:07:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="1003730829"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2016 05:07:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 00:07:00 +1200
Message-Id: <6076fa56f94de1a295c6ea23c69bd8cf11400554.1466683248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 04/10] classes/sstate: show progress during sstate object availability check
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
X-List-Received-Date: Thu, 23 Jun 2016 12:07:42 -0000

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


