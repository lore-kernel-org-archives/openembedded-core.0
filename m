Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 78C96759D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 20:00:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 13:00:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,667,1427785200"; d="scan'208";a="749087929"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2015 13:00:48 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:02:41 -0500
Message-Id: <1435089761-27337-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435089761-27337-1-git-send-email-anibal.limon@linux.intel.com>
References: <1435089761-27337-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH] classes/sstate.bbclass: Improve checkstatus using connection cache.
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
X-List-Received-Date: Tue, 23 Jun 2015 20:00:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use FetcherConnectionCache to improve times when do checkstatus over
sstate resources.

Add debug message about how many SState objecs are available also
how many time takes to get it.

[YOCTO #7796]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/sstate.bbclass | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1e2d4f6..0345716 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -739,6 +739,13 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
         if localdata.getVar('BB_NO_NETWORK', True) == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) == "1":
             localdata.delVar('BB_NO_NETWORK')
 
+        from bb.fetch2 import FetchConnectionCache
+        def checkstatus_init(thread_worker):
+            thread_worker.connection_cache = FetchConnectionCache()
+
+        def checkstatus_end(thread_worker):
+            thread_worker.connection_cache.close_connections()
+
         def checkstatus(thread_worker, arg):
             (task, sstatefile) = arg
 
@@ -748,7 +755,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
             try:
-                fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2)
+                fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2,
+                            connection_cache=thread_worker.connection_cache)
                 fetcher.checkstatus()
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 ret.append(task)
@@ -768,14 +776,21 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             tasklist.append((task, sstatefile))
 
         if tasklist:
+            from datetime import datetime
             bb.note("Checking sstate mirror object availability (for %s objects)" % len(tasklist))
             import multiprocessing
             nproc = min(multiprocessing.cpu_count(), len(tasklist))
-            pool = oe.utils.ThreadedPool(nproc, len(tasklist))
+
+            timei = datetime.now()
+            pool = oe.utils.ThreadedPool(nproc, len(tasklist),
+                    worker_init=checkstatus_init, worker_end=checkstatus_end)
             for t in tasklist:
                 pool.add_task(checkstatus, t)
             pool.start()
             pool.wait_completion()
+            timee = datetime.now()
+
+            bb.debug(2, "SState mirror objects available %d, run time %s" % (len(ret), (timee - timei)))
 
     inheritlist = d.getVar("INHERIT", True)
     if "toaster" in inheritlist:
-- 
1.9.1


