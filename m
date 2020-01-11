Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 3227E7FFC1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 03:28:51 +0000 (UTC)
IronPort-SDR: M0S2r3QZ4KmHXIxiYvDLyNamPs59YyW8V0DKkOg1javjRFUvEA9DWBGQg99vUi+eKjZjXfkFnq
	qce0MvBHwRXXqkPwnUtptaqgsOs/etClde9Kyzbg0jMW7XV64v3wU2Gt/dS1Um76tSaio4F8U9
	i4/0LqZGyHNvRCrsTBUGNBW5XprtQbCCaOlYZrYtz+ULZ3zSJN/tzTuMJisfH+9Rw71pn8b51C
	e5vvP/lpgcuJ5ukVvRBleWOM0wvk23L7GSLPebEgapyVuAOa9I2MbapCCvHO175OXvOIWCLXKn
	7pM=
X-IronPort-AV: E=Sophos;i="5.69,419,1571695200"; 
   d="scan'208";a="4204973"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jan 2020 04:28:43 +0100
Message-ID: <20200111032843.26745-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [master][zeus][PATCH] sstate.bbclass: Only show sstate mirror progress bar for >= 100 objects
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
X-List-Received-Date: Sat, 11 Jan 2020 03:28:52 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With the introduction of the hash equivalence server, the progress bar
for "Checking sstate mirror object availability" is shown
repeatedly. Most of the times the number of objects scanned is very
low and the progress bar completes almost immediately. To avoid all
these unnecessary progress bars, set the minimum number of objects to
100 before the progress bar is shown.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

The minimum limit of 100 objects is of course quite arbitrarily
chosen, but it seems to do the job for me.

 meta/classes/sstate.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 356fe7ec18..c089a3fe94 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -930,9 +930,11 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 missed.add(tid)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass
-            bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
+            if len(tasklist) >= min_tasks:
+                bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
+        min_tasks = 100
         for tid in sq_data['hash']:
             if tid in found:
                 continue
@@ -941,8 +943,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             tasklist.append((tid, sstatefile))
 
         if tasklist:
-            msg = "Checking sstate mirror object availability"
-            bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
+            if len(tasklist) >= min_tasks:
+                msg = "Checking sstate mirror object availability"
+                bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
             import multiprocessing
             nproc = min(multiprocessing.cpu_count(), len(tasklist))
@@ -956,7 +959,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             pool.wait_completion()
             bb.event.disable_threadlock()
 
-            bb.event.fire(bb.event.ProcessFinished(msg), d)
+            if len(tasklist) >= min_tasks:
+                bb.event.fire(bb.event.ProcessFinished(msg), d)
 
     # Likely checking an individual task hash again for multiconfig sharing of sstate tasks so skip reporting
     if len(sq_data['hash']) == 1:
-- 
2.21.1


