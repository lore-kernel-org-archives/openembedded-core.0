Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2891B78555
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 14:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4F61A1844F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:50:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 7m_8-cBxKQKj
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:50:09 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id E2BA618430
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:50:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDDFD1E095
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:50:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C29341E089
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:50:09 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:50:09 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id B6BD42A65
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 15:50:09 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id vB7Eo95L022035
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Dec 2017 15:50:09 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id vB7Eo9Sc022034
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Dec 2017 15:50:09 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 15:50:08 +0100
Message-Id: <20171207145008.21993-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] sstate.bbclass: Add progress bars when removing from the sysroots
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
X-List-Received-Date: Thu, 07 Dec 2017 14:50:11 -0000

If there are many recipes that should be cleaned out from the
sysroots, it can actually take some time. This adds a progress bar to
give a visual clue that the clean up is actually progressing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/sstate.bbclass | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index e30fbe1280..6e41b56861 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -845,7 +845,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
                 missed.append(task)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass
-            bb.event.fire(bb.event.ProcessProgress("Checking sstate mirror object availability", len(tasklist) - thread_worker.tasks.qsize()), d)
+            bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
 
         tasklist = []
         for task in range(len(sq_fn)):
@@ -856,7 +856,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             tasklist.append((task, sstatefile))
 
         if tasklist:
-            bb.event.fire(bb.event.ProcessStarted("Checking sstate mirror object availability", len(tasklist)), d)
+            msg = "Checking sstate mirror object availability"
+            bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
             import multiprocessing
             nproc = min(multiprocessing.cpu_count(), len(tasklist))
@@ -870,7 +871,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             pool.wait_completion()
             bb.event.disable_threadlock()
 
-            bb.event.fire(bb.event.ProcessFinished("Checking sstate mirror object availability"), d)
+            bb.event.fire(bb.event.ProcessFinished(msg), d)
 
     inheritlist = d.getVar("INHERIT")
     if "toaster" in inheritlist:
@@ -1038,18 +1039,25 @@ python sstate_eventhandler2() {
                         seen.append(stamp)
 
         if toremove:
-            bb.note("There are %d recipes to be removed from sysroot %s, removing..." % (len(toremove), a))
+            msg = "Removing %d recipes from the %s sysroot" % (len(toremove), a)
+            bb.event.fire(bb.event.ProcessStarted(msg, len(toremove)), d)
+
+            removed = 0
+            for r in toremove:
+                (stamp, manifest, workdir) = r.split()
+                for m in glob.glob(manifest + ".*"):
+                    if m.endswith(".postrm"):
+                        continue
+                    sstate_clean_manifest(m, d)
+                bb.utils.remove(stamp + "*")
+                if removeworkdir:
+                    bb.utils.remove(workdir, recurse = True)
+                lines.remove(r)
+                removed = removed + 1
+                bb.event.fire(bb.event.ProcessProgress(msg, removed), d)
+
+            bb.event.fire(bb.event.ProcessFinished(msg), d)
 
-        for r in toremove:
-            (stamp, manifest, workdir) = r.split()
-            for m in glob.glob(manifest + ".*"):
-                if m.endswith(".postrm"):
-                    continue
-                sstate_clean_manifest(m, d)
-            bb.utils.remove(stamp + "*")
-            if removeworkdir:
-                bb.utils.remove(workdir, recurse = True)
-            lines.remove(r)
         with open(i, "w") as f:
             for l in lines:
                 f.write(l)
-- 
2.12.0


