Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3446E65F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 16:44:54 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 04 Oct 2016 09:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,444,1473145200"; d="scan'208";a="16094134"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.33])
	by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2016 09:44:55 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 11:45:53 -0500
Message-Id: <1475599553-21057-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com, clarson@kergoth.com
Subject: [PATCH] classes/sstate.bbclass: Enable thread lock when checkstatus
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
X-List-Received-Date: Tue, 04 Oct 2016 16:44:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The checkstatus function fires an event to notify bitbake UI about
the progress of the task, this function is implemented using ThreadPool
and is causing event lose when multiple threads tries to fire an event
(writes over socket/fd).

[YOCTO #10330]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 6f0c791..172384b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -851,15 +851,19 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
 
         if tasklist:
             bb.event.fire(bb.event.ProcessStarted("Checking sstate mirror object availability", len(tasklist)), d)
+
             import multiprocessing
             nproc = min(multiprocessing.cpu_count(), len(tasklist))
 
+            bb.event.enable_threadlock()
             pool = oe.utils.ThreadedPool(nproc, len(tasklist),
                     worker_init=checkstatus_init, worker_end=checkstatus_end)
             for t in tasklist:
                 pool.add_task(checkstatus, t)
             pool.start()
             pool.wait_completion()
+            bb.event.disable_threadlock()
+
             bb.event.fire(bb.event.ProcessFinished("Checking sstate mirror object availability"), d)
             if whitelist and missing:
                 bb.fatal('Required artifacts were unavailable - exiting')
-- 
2.1.4


