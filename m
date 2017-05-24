Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6E19B71C7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 08:09:44 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 1117_5312_bf0c1d70_ca6e_4886_979b_901f751cb708;
	Wed, 24 May 2017 17:09:41 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 88C01AC00E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 17:09:41 +0900 (JST)
Received: from G01JPEXCHKW13.g01.fujitsu.local
	(G01JPEXCHKW13.g01.fujitsu.local [10.0.194.52])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	82CC53284AA for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 17:09:40 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHKW13.g01.fujitsu.local (10.0.194.52) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 24 May 2017 17:09:40 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 May 2017 17:10:52 +0900
Message-ID: <1495613452-22020-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] rpcbind: Fix CVE-2017-8779
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
X-List-Received-Date: Wed, 24 May 2017 08:09:46 -0000
Content-Type: text/plain

This vulnerability is also called "rpcbomb".
Backport upstream patch to fix this vulnerability.

CVE: CVE-2017-8779

Signed-off-by: Fan Xin<fan.xin@jp.fujitsu.com>
---
 ...r-all-svc_getargs-calls-with-svc_freeargs.patch | 221 +++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
new file mode 100644
index 0000000..bf7aaef
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
@@ -0,0 +1,221 @@
+From 7ea36eeece56b59f98e469934e4c20b4da043346 Mon Sep 17 00:00:00 2001
+From: Doran Moppert <dmoppert@redhat.com>
+Date: Thu, 11 May 2017 11:42:54 -0400
+Subject: [PATCH] rpcbind: pair all svc_getargs() calls with svc_freeargs() to
+ avoid memory leak
+
+This patch is to address CVE-2017-8779 "rpcbomb" in rpcbind, discussed
+at [1], [2], [3].  The last link suggests this issue is actually a bug
+in rpcbind, which led me here.
+
+The leak caused by the reproducer at [4] appears to come from
+rpcb_service_4(), in the case where svc_getargs() returns false and the
+function had an early return, rather than passing through the cleanup
+path at done:, as would otherwise occur.
+
+It also addresses a couple of other locations where the same fault seems
+to exist, though I haven't been able to exercise those.  I hope someone
+more intimate with rpc(3) can confirm my understanding is correct, and
+that I haven't introduced any new bugs.
+
+Without this patch, using the reproducer (and variants) repeatedly
+against rpcbind with a numBytes argument of 1_000_000_000, /proc/$(pidof
+rpcbind)/status reports VmSize increase of 976564 kB each call, and
+VmRSS increase of around 260 kB every 33 calls - the specific numbers
+are probably an artifact of my rhel/glibc version.  With the patch,
+there is a small (~50 kB) VmSize increase with the first message, but
+thereafter both VmSize and VmRSS remain steady.
+
+[1]: http://seclists.org/oss-sec/2017/q2/209
+[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1448124
+[3]: https://sourceware.org/ml/libc-alpha/2017-05/msg00129.html
+[4]: https://github.com/guidovranken/rpcbomb/
+
+
+CVE: CVE-2017-8779
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ src/pmap_svc.c     | 56 +++++++++++++++++++++++++++++++++++++++++++++---------
+ src/rpcb_svc.c     |  2 +-
+ src/rpcb_svc_4.c   |  2 +-
+ src/rpcb_svc_com.c |  8 ++++++++
+ 4 files changed, 57 insertions(+), 11 deletions(-)
+
+diff --git a/src/pmap_svc.c b/src/pmap_svc.c
+index 4c744fe..e926cdc 100644
+--- a/src/pmap_svc.c
++++ b/src/pmap_svc.c
+@@ -175,6 +175,7 @@ pmapproc_change(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt, unsigned long
+ 	long ans;
+ 	uid_t uid;
+ 	char uidbuf[32];
++	int rc = TRUE;
+ 
+ 	/*
+ 	 * Can't use getpwnam here. We might end up calling ourselves
+@@ -194,7 +195,8 @@ pmapproc_change(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt, unsigned long
+ 
+ 	if (!svc_getargs(xprt, (xdrproc_t) xdr_pmap, (char *)&reg)) {
+ 		svcerr_decode(xprt);
+-		return (FALSE);
++		rc = FALSE;
++		goto done;
+ 	}
+ #ifdef RPCBIND_DEBUG
+ 	if (debugging)
+@@ -205,7 +207,8 @@ pmapproc_change(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt, unsigned long
+ 
+ 	if (!check_access(xprt, op, reg.pm_prog, PMAPVERS)) {
+ 		svcerr_weakauth(xprt);
+-		return (FALSE);
++		rc = (FALSE);
++		goto done;
+ 	}
+ 
+ 	rpcbreg.r_prog = reg.pm_prog;
+@@ -258,7 +261,16 @@ done_change:
+ 		rpcbs_set(RPCBVERS_2_STAT, ans);
+ 	else
+ 		rpcbs_unset(RPCBVERS_2_STAT, ans);
+-	return (TRUE);
++done:
++	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)&reg)) {
++		if (debugging) {
++			/*(void) xlog(LOG_DEBUG, "unable to free arguments\n");*/
++			if (doabort) {
++				rpcbind_abort();
++			}
++		}
++	}
++	return (rc);
+ }
+ 
+ /* ARGSUSED */
+@@ -272,15 +284,18 @@ pmapproc_getport(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
+ #ifdef RPCBIND_DEBUG
+ 	char *uaddr;
+ #endif
++	int rc = TRUE;
+ 
+ 	if (!svc_getargs(xprt, (xdrproc_t) xdr_pmap, (char *)&reg)) {
+ 		svcerr_decode(xprt);
+-		return (FALSE);
++		rc = FALSE;
++		goto done;
+ 	}
+ 
+ 	if (!check_access(xprt, PMAPPROC_GETPORT, reg.pm_prog, PMAPVERS)) {
+ 		svcerr_weakauth(xprt);
+-		return FALSE;
++		rc = FALSE;
++		goto done;
+ 	}
+ 
+ #ifdef RPCBIND_DEBUG
+@@ -330,21 +345,34 @@ pmapproc_getport(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
+ 		pmap_ipprot2netid(reg.pm_prot) ?: "<unknown>",
+ 		port ? udptrans : "");
+ 
+-	return (TRUE);
++done:
++	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)&reg)) {
++		if (debugging) {
++			/* (void) xlog(LOG_DEBUG, "unable to free arguments\n");*/
++			if (doabort) {
++				rpcbind_abort();
++			}
++		}
++	}
++	return (rc);
+ }
+ 
+ /* ARGSUSED */
+ static bool_t
+ pmapproc_dump(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
+ {
++	int rc = TRUE;
++
+ 	if (!svc_getargs(xprt, (xdrproc_t)xdr_void, NULL)) {
+ 		svcerr_decode(xprt);
+-		return (FALSE);
++		rc = FALSE;
++		goto done;
+ 	}
+ 
+ 	if (!check_access(xprt, PMAPPROC_DUMP, 0, PMAPVERS)) {
+ 		svcerr_weakauth(xprt);
+-		return FALSE;
++		rc = FALSE;
++		goto done;
+ 	}
+ 	
+ 	if ((!svc_sendreply(xprt, (xdrproc_t) xdr_pmaplist_ptr,
+@@ -354,7 +382,17 @@ pmapproc_dump(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
+ 			rpcbind_abort();
+ 		}
+ 	}
+-	return (TRUE);
++
++done:
++	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)NULL)) {
++		if (debugging) {
++			/*(void) xlog(LOG_DEBUG, "unable to free arguments\n");*/
++			if (doabort) {
++				rpcbind_abort();
++			}
++		}
++	}
++	return (rc);
+ }
+ 
+ int pmap_netid2ipprot(const char *netid)
+diff --git a/src/rpcb_svc.c b/src/rpcb_svc.c
+index 709e3fb..091f530 100644
+--- a/src/rpcb_svc.c
++++ b/src/rpcb_svc.c
+@@ -166,7 +166,7 @@ rpcb_service_3(struct svc_req *rqstp, SVCXPRT *transp)
+ 		svcerr_decode(transp);
+ 		if (debugging)
+ 			(void) xlog(LOG_DEBUG, "rpcbind: could not decode");
+-		return;
++		goto done;
+ 	}
+ 
+ 	if (rqstp->rq_proc == RPCBPROC_SET
+diff --git a/src/rpcb_svc_4.c b/src/rpcb_svc_4.c
+index 5094879..eebbbbe 100644
+--- a/src/rpcb_svc_4.c
++++ b/src/rpcb_svc_4.c
+@@ -218,7 +218,7 @@ rpcb_service_4(struct svc_req *rqstp, SVCXPRT *transp)
+ 		svcerr_decode(transp);
+ 		if (debugging)
+ 			(void) xlog(LOG_DEBUG, "rpcbind: could not decode\n");
+-		return;
++		goto done;
+ 	}
+ 
+ 	if (rqstp->rq_proc == RPCBPROC_SET
+diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
+index 5862c26..cb63afd 100644
+--- a/src/rpcb_svc_com.c
++++ b/src/rpcb_svc_com.c
+@@ -927,6 +927,14 @@ error:
+ 	if (call_msg.rm_xid != 0)
+ 		(void) free_slot_by_xid(call_msg.rm_xid);
+ out:
++	if (!svc_freeargs(transp, (xdrproc_t) xdr_rmtcall_args, (char *) &a)) {
++		if (debugging) {
++			(void) xlog(LOG_DEBUG, "unable to free arguments\n");
++			if (doabort) {
++				rpcbind_abort();
++			}
++		}
++	}
+ 	if (local_uaddr)
+ 		free(local_uaddr);
+ 	if (buf_alloc)
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
index d3ebcb3..60e46ed 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind.conf \
            file://rpcbind.socket \
            file://rpcbind.service \
+           file://0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch \
           "
 SRC_URI[md5sum] = "cf10cd41ed8228fc54c316191c1f07fe"
 SRC_URI[sha256sum] = "074a9a530dc7c11e0d905aa59bcb0847c009313f02e98d3d798aa9568f414c66"
-- 
1.9.1


