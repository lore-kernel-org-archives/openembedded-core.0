Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 69C8B65C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 03:14:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2016 20:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,464,1459839600"; d="scan'208";a="718037634"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2016 20:14:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 15:13:56 +1200
Message-Id: <39074b5170ef1ef7dc9f249d88c2f66b8f8b9714.1465787274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/9] classes/sstate: add a mode to error if sstate package unavailable
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
X-List-Received-Date: Mon, 13 Jun 2016 03:14:42 -0000

If BB_SETSCENE_ENFORCE is set to "1" and an sstate package fails to
download outside of the whitelist specified by
BB_SETSCENE_ENFORCE_WHITELIST, then fail immediately so you can tell
that the problem was caused by failing to restore the task from sstate.

Part of the implementation of [YOCTO #9367].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass  | 23 +++++++++++++++++++++++
 meta/conf/bitbake.conf       |  3 ++-
 scripts/oe-buildenv-internal |  2 +-
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4e81fc9..621dc37 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -719,6 +719,7 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
 
     ret = []
     missed = []
+    missing = []
     extension = ".tgz"
     if siginfo:
         extension = extension + ".siginfo"
@@ -740,6 +741,18 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
 
         return spec, extrapath, tname
 
+    def sstate_pkg_to_pn(pkg, d):
+        """
+        Translate an sstate filename to a PN value by way of SSTATE_PKGSPEC. This is slightly hacky but
+        we don't have access to everything in this context.
+        """
+        pkgspec = d.getVar('SSTATE_PKGSPEC', False)
+        try:
+            idx = pkgspec.split(':').index('${PN}')
+        except ValueError:
+            bb.fatal('Unable to find ${PN} in SSTATE_PKGSPEC')
+        return pkg.split(':')[idx]
+
 
     for task in range(len(sq_fn)):
 
@@ -774,6 +787,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
         if localdata.getVar('BB_NO_NETWORK', True) == "1" and localdata.getVar('SSTATE_MIRROR_ALLOW_NETWORK', True) == "1":
             localdata.delVar('BB_NO_NETWORK')
 
+        whitelist = bb.runqueue.get_setscene_enforce_whitelist(d)
+
         from bb.fetch2 import FetchConnectionCache
         def checkstatus_init(thread_worker):
             thread_worker.connection_cache = FetchConnectionCache()
@@ -800,6 +815,12 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             except:
                 missed.append(task)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
+                if whitelist:
+                    pn = sstate_pkg_to_pn(sstatefile, d)
+                    taskname = sq_task[task]
+                    if not bb.runqueue.check_setscene_enforce_whitelist(pn, taskname, whitelist):
+                        missing.append(task)
+                        bb.error('Sstate artifact unavailable for %s.%s' % (pn, taskname))
                 pass
             bb.event.fire(bb.event.ProcessProgress("Checking sstate mirror object availability", len(tasklist) - thread_worker.tasks.qsize()), d)
 
@@ -823,6 +844,8 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d, siginfo=False):
             pool.start()
             pool.wait_completion()
             bb.event.fire(bb.event.ProcessFinished("Checking sstate mirror object availability"), d)
+            if whitelist and missing:
+                bb.fatal('Required artifacts were unavailable - exiting')
 
     inheritlist = d.getVar("INHERIT", True)
     if "toaster" in inheritlist:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2e95819..45d9862 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -817,7 +817,8 @@ BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
     GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ftp_proxy \
-    HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD"
+    HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD \
+    BB_SETSCENE_ENFORCE"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 56d3419..03dc50f 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -118,7 +118,7 @@ BB_ENV_EXTRAWHITE_OE="MACHINE DISTRO TCMODE TCLIBC HTTP_PROXY http_proxy \
 HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy FTPS_PROXY ftps_proxy ALL_PROXY \
 all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
-SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA"
+SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR BBPATH_EXTRA BB_SETSCENE_ENFORCE"
 
 BB_ENV_EXTRAWHITE="$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
 
-- 
2.5.5


