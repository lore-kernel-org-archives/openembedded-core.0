Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D44371D06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 18:29:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 19 Jan 2017 10:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,255,1477983600"; d="scan'208";a="32818936"
Received: from zpchu5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.128.210])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2017 10:29:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 07:29:17 +1300
Message-Id: <95451fccdfefabfe196786303be959ac22888ce5.1484850485.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484850485.git.paul.eggleton@linux.intel.com>
References: <cover.1484850485.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] Revert "classes/sstate: add a mode to error if sstate package unavailable"
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
X-List-Received-Date: Thu, 19 Jan 2017 18:29:27 -0000

It turns out that this check cannot work. We don't have the information
to know whether an sstate package is really needed at this point in the
execution, so we check the availability for things that we won't
actually end up needing later on. Thus we can't fail if some of these
aren't found or we'll get needless failures.

This check was intended to give earlier more accurate errors when sstate
artifacts failed to download, but that's not practical so we'll rely
solely on the task execution check that was added within the runqueue.

This reverts most of commit 9e711b54487c3141d7264b8cf0d74f9465020190 (we
still need to allow BB_SETSCENE_ENFORCE through from the external
environment since the eSDK relies upon that.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index afdb4a3..dff530f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -738,7 +738,6 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
 
     ret = []
     missed = []
-    missing = []
     extension = ".tgz"
     if siginfo:
         extension = extension + ".siginfo"
@@ -760,18 +759,6 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
 
         return spec, extrapath, tname
 
-    def sstate_pkg_to_pn(pkg, d):
-        """
-        Translate an sstate filename to a PN value by way of SSTATE_PKGSPEC. This is slightly hacky but
-        we don't have access to everything in this context.
-        """
-        pkgspec = d.getVar('SSTATE_PKGSPEC', False)
-        try:
-            idx = pkgspec.split(':').index('${PN}')
-        except ValueError:
-            bb.fatal('Unable to find ${PN} in SSTATE_PKGSPEC')
-        return pkg.split(':')[idx]
-
 
     for task in range(len(sq_fn)):
 
@@ -806,8 +793,6 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
         if localdata.getVar('BB_NO_NETWORK') == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK') == "1":
             localdata.delVar('BB_NO_NETWORK')
 
-        whitelist = bb.runqueue.get_setscene_enforce_whitelist(d)
-
         from bb.fetch2 import FetchConnectionCache
         def checkstatus_init(thread_worker):
             thread_worker.connection_cache = FetchConnectionCache()
@@ -834,12 +819,6 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             except:
                 missed.append(task)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
-                if whitelist:
-                    pn = sstate_pkg_to_pn(sstatefile, d)
-                    taskname = sq_task[task]
-                    if not bb.runqueue.check_setscene_enforce_whitelist(pn, taskname, whitelist):
-                        missing.append(task)
-                        bb.error('Sstate artifact unavailable for %s.%s' % (pn, taskname))
                 pass
             bb.event.fire(bb.event.ProcessProgress("Checking sstate mirror object availability", len(tasklist) - thread_worker.tasks.qsize()), d)
 
@@ -867,8 +846,6 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             bb.event.disable_threadlock()
 
             bb.event.fire(bb.event.ProcessFinished("Checking sstate mirror object availability"), d)
-            if whitelist and missing:
-                bb.fatal('Required artifacts were unavailable - exiting')
 
     inheritlist = d.getVar("INHERIT")
     if "toaster" in inheritlist:
-- 
2.5.5


