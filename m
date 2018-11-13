Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 471136C0CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 03:03:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAD33l2a000835
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Nov 2018 19:03:47 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 12 Nov 2018 19:03:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Tue, 13 Nov 2018 11:14:26 +0800
Message-ID: <1542078866-4265-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LYLxciQZcMt+5SPBWKoOxS9C98WP_Te8LGDXciA6FmEDQ@mail.gmail.com>
References: <CAJTo0LYLxciQZcMt+5SPBWKoOxS9C98WP_Te8LGDXciA6FmEDQ@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] rpcbind: 0.2.4 -> 1.2.5
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
X-List-Received-Date: Tue, 13 Nov 2018 03:03:49 -0000
Content-Type: text/plain

- Drop backport fixes
  0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
  pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
  rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch

- Do not manually move binaries from bindir to sbindir,
  the upstream already moved rpcbind from bin_PROGRAMS
  to sbin_PROGRAMS in Makefile.am
  https://git.linux-nfs.org/?p=steved/rpcbind.git;a=commitdiff;h=9afccfcd5ab350d6bc72622f3d1ccfb9e54652b0

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...r-all-svc_getargs-calls-with-svc_freeargs.patch | 221 ---------------------
 ...proc_dump-Fixed-typo-in-memory-leak-patch.patch |  30 ---
 ..._callit_com-Stop-freeing-a-static-pointer.patch | 100 ----------
 .../rpcbind/{rpcbind_0.2.4.bb => rpcbind_1.2.5.bb} |   9 +-
 4 files changed, 2 insertions(+), 358 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.4.bb => rpcbind_1.2.5.bb} (84%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
deleted file mode 100644
index bf7aaef..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-From 7ea36eeece56b59f98e469934e4c20b4da043346 Mon Sep 17 00:00:00 2001
-From: Doran Moppert <dmoppert@redhat.com>
-Date: Thu, 11 May 2017 11:42:54 -0400
-Subject: [PATCH] rpcbind: pair all svc_getargs() calls with svc_freeargs() to
- avoid memory leak
-
-This patch is to address CVE-2017-8779 "rpcbomb" in rpcbind, discussed
-at [1], [2], [3].  The last link suggests this issue is actually a bug
-in rpcbind, which led me here.
-
-The leak caused by the reproducer at [4] appears to come from
-rpcb_service_4(), in the case where svc_getargs() returns false and the
-function had an early return, rather than passing through the cleanup
-path at done:, as would otherwise occur.
-
-It also addresses a couple of other locations where the same fault seems
-to exist, though I haven't been able to exercise those.  I hope someone
-more intimate with rpc(3) can confirm my understanding is correct, and
-that I haven't introduced any new bugs.
-
-Without this patch, using the reproducer (and variants) repeatedly
-against rpcbind with a numBytes argument of 1_000_000_000, /proc/$(pidof
-rpcbind)/status reports VmSize increase of 976564 kB each call, and
-VmRSS increase of around 260 kB every 33 calls - the specific numbers
-are probably an artifact of my rhel/glibc version.  With the patch,
-there is a small (~50 kB) VmSize increase with the first message, but
-thereafter both VmSize and VmRSS remain steady.
-
-[1]: http://seclists.org/oss-sec/2017/q2/209
-[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1448124
-[3]: https://sourceware.org/ml/libc-alpha/2017-05/msg00129.html
-[4]: https://github.com/guidovranken/rpcbomb/
-
-
-CVE: CVE-2017-8779
-Upstream-Status: Backport
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
----
- src/pmap_svc.c     | 56 +++++++++++++++++++++++++++++++++++++++++++++---------
- src/rpcb_svc.c     |  2 +-
- src/rpcb_svc_4.c   |  2 +-
- src/rpcb_svc_com.c |  8 ++++++++
- 4 files changed, 57 insertions(+), 11 deletions(-)
-
-diff --git a/src/pmap_svc.c b/src/pmap_svc.c
-index 4c744fe..e926cdc 100644
---- a/src/pmap_svc.c
-+++ b/src/pmap_svc.c
-@@ -175,6 +175,7 @@ pmapproc_change(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt, unsigned long
- 	long ans;
- 	uid_t uid;
- 	char uidbuf[32];
-+	int rc = TRUE;
- 
- 	/*
- 	 * Can't use getpwnam here. We might end up calling ourselves
-@@ -194,7 +195,8 @@ pmapproc_change(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt, unsigned long
- 
- 	if (!svc_getargs(xprt, (xdrproc_t) xdr_pmap, (char *)&reg)) {
- 		svcerr_decode(xprt);
--		return (FALSE);
-+		rc = FALSE;
-+		goto done;
- 	}
- #ifdef RPCBIND_DEBUG
- 	if (debugging)
-@@ -205,7 +207,8 @@ pmapproc_change(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt, unsigned long
- 
- 	if (!check_access(xprt, op, reg.pm_prog, PMAPVERS)) {
- 		svcerr_weakauth(xprt);
--		return (FALSE);
-+		rc = (FALSE);
-+		goto done;
- 	}
- 
- 	rpcbreg.r_prog = reg.pm_prog;
-@@ -258,7 +261,16 @@ done_change:
- 		rpcbs_set(RPCBVERS_2_STAT, ans);
- 	else
- 		rpcbs_unset(RPCBVERS_2_STAT, ans);
--	return (TRUE);
-+done:
-+	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)&reg)) {
-+		if (debugging) {
-+			/*(void) xlog(LOG_DEBUG, "unable to free arguments\n");*/
-+			if (doabort) {
-+				rpcbind_abort();
-+			}
-+		}
-+	}
-+	return (rc);
- }
- 
- /* ARGSUSED */
-@@ -272,15 +284,18 @@ pmapproc_getport(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
- #ifdef RPCBIND_DEBUG
- 	char *uaddr;
- #endif
-+	int rc = TRUE;
- 
- 	if (!svc_getargs(xprt, (xdrproc_t) xdr_pmap, (char *)&reg)) {
- 		svcerr_decode(xprt);
--		return (FALSE);
-+		rc = FALSE;
-+		goto done;
- 	}
- 
- 	if (!check_access(xprt, PMAPPROC_GETPORT, reg.pm_prog, PMAPVERS)) {
- 		svcerr_weakauth(xprt);
--		return FALSE;
-+		rc = FALSE;
-+		goto done;
- 	}
- 
- #ifdef RPCBIND_DEBUG
-@@ -330,21 +345,34 @@ pmapproc_getport(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
- 		pmap_ipprot2netid(reg.pm_prot) ?: "<unknown>",
- 		port ? udptrans : "");
- 
--	return (TRUE);
-+done:
-+	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)&reg)) {
-+		if (debugging) {
-+			/* (void) xlog(LOG_DEBUG, "unable to free arguments\n");*/
-+			if (doabort) {
-+				rpcbind_abort();
-+			}
-+		}
-+	}
-+	return (rc);
- }
- 
- /* ARGSUSED */
- static bool_t
- pmapproc_dump(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
- {
-+	int rc = TRUE;
-+
- 	if (!svc_getargs(xprt, (xdrproc_t)xdr_void, NULL)) {
- 		svcerr_decode(xprt);
--		return (FALSE);
-+		rc = FALSE;
-+		goto done;
- 	}
- 
- 	if (!check_access(xprt, PMAPPROC_DUMP, 0, PMAPVERS)) {
- 		svcerr_weakauth(xprt);
--		return FALSE;
-+		rc = FALSE;
-+		goto done;
- 	}
- 	
- 	if ((!svc_sendreply(xprt, (xdrproc_t) xdr_pmaplist_ptr,
-@@ -354,7 +382,17 @@ pmapproc_dump(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
- 			rpcbind_abort();
- 		}
- 	}
--	return (TRUE);
-+
-+done:
-+	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)NULL)) {
-+		if (debugging) {
-+			/*(void) xlog(LOG_DEBUG, "unable to free arguments\n");*/
-+			if (doabort) {
-+				rpcbind_abort();
-+			}
-+		}
-+	}
-+	return (rc);
- }
- 
- int pmap_netid2ipprot(const char *netid)
-diff --git a/src/rpcb_svc.c b/src/rpcb_svc.c
-index 709e3fb..091f530 100644
---- a/src/rpcb_svc.c
-+++ b/src/rpcb_svc.c
-@@ -166,7 +166,7 @@ rpcb_service_3(struct svc_req *rqstp, SVCXPRT *transp)
- 		svcerr_decode(transp);
- 		if (debugging)
- 			(void) xlog(LOG_DEBUG, "rpcbind: could not decode");
--		return;
-+		goto done;
- 	}
- 
- 	if (rqstp->rq_proc == RPCBPROC_SET
-diff --git a/src/rpcb_svc_4.c b/src/rpcb_svc_4.c
-index 5094879..eebbbbe 100644
---- a/src/rpcb_svc_4.c
-+++ b/src/rpcb_svc_4.c
-@@ -218,7 +218,7 @@ rpcb_service_4(struct svc_req *rqstp, SVCXPRT *transp)
- 		svcerr_decode(transp);
- 		if (debugging)
- 			(void) xlog(LOG_DEBUG, "rpcbind: could not decode\n");
--		return;
-+		goto done;
- 	}
- 
- 	if (rqstp->rq_proc == RPCBPROC_SET
-diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index 5862c26..cb63afd 100644
---- a/src/rpcb_svc_com.c
-+++ b/src/rpcb_svc_com.c
-@@ -927,6 +927,14 @@ error:
- 	if (call_msg.rm_xid != 0)
- 		(void) free_slot_by_xid(call_msg.rm_xid);
- out:
-+	if (!svc_freeargs(transp, (xdrproc_t) xdr_rmtcall_args, (char *) &a)) {
-+		if (debugging) {
-+			(void) xlog(LOG_DEBUG, "unable to free arguments\n");
-+			if (doabort) {
-+				rpcbind_abort();
-+			}
-+		}
-+	}
- 	if (local_uaddr)
- 		free(local_uaddr);
- 	if (buf_alloc)
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch b/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
deleted file mode 100644
index 4c23ee0..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c49a7ea639eb700823e174fd605bbbe183e229aa Mon Sep 17 00:00:00 2001
-From: Steve Dickson <steved@redhat.com>
-Date: Wed, 17 May 2017 10:52:25 -0400
-Subject: [PATCH] pmapproc_dump: Fixed typo in memory leak patch
-
-commit 7ea36eee introduce a typo that caused
-NIS (aka ypbind) to fail.
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- src/pmap_svc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: rpcbind-0.2.4/src/pmap_svc.c
-===================================================================
---- rpcbind-0.2.4.orig/src/pmap_svc.c
-+++ rpcbind-0.2.4/src/pmap_svc.c
-@@ -384,7 +384,7 @@ pmapproc_dump(struct svc_req *rqstp /*__
- 	}
- 
- done:
--	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)NULL)) {
-+	if (!svc_freeargs(xprt, (xdrproc_t) xdr_void, (char *)NULL)) {
- 		if (debugging) {
- 			/*(void) xlog(LOG_DEBUG, "unable to free arguments\n");*/
- 			if (doabort) {
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch
deleted file mode 100644
index 9a000d0..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 7c7590ad536c0e24bef790cb1e65702fc54db566 Mon Sep 17 00:00:00 2001
-From: Steve Dickson <steved@redhat.com>
-Date: Tue, 30 May 2017 11:27:22 -0400
-Subject: [PATCH] rpcbproc_callit_com: Stop freeing a static pointer
-
-commit 7ea36ee introduced a svc_freeargs() call
-that ended up freeing static pointer.
-
-It turns out the allocations for the rmt_args
-is not necessary . The xdr routines (xdr_bytes) will
-handle the memory management and the largest
-possible message size is UDPMSGSIZE (due to UDP only)
-which is smaller than RPC_BUF_MAX
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- src/rpcb_svc_com.c | 39 ++++++---------------------------------
- 1 file changed, 6 insertions(+), 33 deletions(-)
-
-diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index cb63afd..1fc2229 100644
---- a/src/rpcb_svc_com.c
-+++ b/src/rpcb_svc_com.c
-@@ -612,9 +612,9 @@ rpcbproc_callit_com(struct svc_req *rqstp, SVCXPRT *transp,
- 	struct netconfig *nconf;
- 	struct netbuf *caller;
- 	struct r_rmtcall_args a;
--	char *buf_alloc = NULL, *outbufp;
-+	char *outbufp;
- 	char *outbuf_alloc = NULL;
--	char buf[RPC_BUF_MAX], outbuf[RPC_BUF_MAX];
-+	char  outbuf[RPC_BUF_MAX];
- 	struct netbuf *na = (struct netbuf *) NULL;
- 	struct rpc_msg call_msg;
- 	int outlen;
-@@ -635,36 +635,10 @@ rpcbproc_callit_com(struct svc_req *rqstp, SVCXPRT *transp,
- 	}
- 	if (si.si_socktype != SOCK_DGRAM)
- 		return;	/* Only datagram type accepted */
--	sendsz = __rpc_get_t_size(si.si_af, si.si_proto, UDPMSGSIZE);
--	if (sendsz == 0) {	/* data transfer not supported */
--		if (reply_type == RPCBPROC_INDIRECT)
--			svcerr_systemerr(transp);
--		return;
--	}
--	/*
--	 * Should be multiple of 4 for XDR.
--	 */
--	sendsz = ((sendsz + 3) / 4) * 4;
--	if (sendsz > RPC_BUF_MAX) {
--#ifdef	notyet
--		buf_alloc = alloca(sendsz);		/* not in IDR2? */
--#else
--		buf_alloc = malloc(sendsz);
--#endif	/* notyet */
--		if (buf_alloc == NULL) {
--			if (debugging)
--				xlog(LOG_DEBUG,
--					"rpcbproc_callit_com:  No Memory!\n");
--			if (reply_type == RPCBPROC_INDIRECT)
--				svcerr_systemerr(transp);
--			return;
--		}
--		a.rmt_args.args = buf_alloc;
--	} else {
--		a.rmt_args.args = buf;
--	}
-+	sendsz = UDPMSGSIZE;
- 
- 	call_msg.rm_xid = 0;	/* For error checking purposes */
-+	memset(&a, 0, sizeof(a)); /* Zero out the input buffer */
- 	if (!svc_getargs(transp, (xdrproc_t) xdr_rmtcall_args, (char *) &a)) {
- 		if (reply_type == RPCBPROC_INDIRECT)
- 			svcerr_decode(transp);
-@@ -704,7 +678,8 @@ rpcbproc_callit_com(struct svc_req *rqstp, SVCXPRT *transp,
- 	if (rbl == (rpcblist_ptr)NULL) {
- #ifdef RPCBIND_DEBUG
- 		if (debugging)
--			xlog(LOG_DEBUG, "not found\n");
-+			xlog(LOG_DEBUG, "prog %lu vers %lu: not found\n", 
-+				a.rmt_prog, a.rmt_vers);
- #endif
- 		if (reply_type == RPCBPROC_INDIRECT)
- 			svcerr_noprog(transp);
-@@ -937,8 +912,6 @@ out:
- 	}
- 	if (local_uaddr)
- 		free(local_uaddr);
--	if (buf_alloc)
--		free(buf_alloc);
- 	if (outbuf_alloc)
- 		free(outbuf_alloc);
- 	if (na) {
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
similarity index 84%
rename from meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
index 3c6774c..7c96aca 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.5.bb
@@ -15,13 +15,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind.conf \
            file://rpcbind.socket \
            file://rpcbind.service \
-           file://0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch \
-           file://pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch \
-           file://rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch \
            file://rpcbind_add_option_to_fix_port_number.patch \
           "
-SRC_URI[md5sum] = "cf10cd41ed8228fc54c316191c1f07fe"
-SRC_URI[sha256sum] = "074a9a530dc7c11e0d905aa59bcb0847c009313f02e98d3d798aa9568f414c66"
+SRC_URI[md5sum] = "ed46f09b9c0fa2d49015f6431bc5ea7b"
+SRC_URI[sha256sum] = "2ce360683963b35c19c43f0ee2c7f18aa5b81ef41c3fdbd15ffcb00b8bffda7a"
 
 inherit autotools update-rc.d systemd pkgconfig
 
@@ -48,8 +45,6 @@ PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/
 EXTRA_OECONF += " --enable-warmstarts --with-rpcuser=rpc"
 
 do_install_append () {
-	mv ${D}${bindir} ${D}${sbindir}
-
 	install -d ${D}${sysconfdir}/init.d
 	sed -e 's,/etc/,${sysconfdir}/,g' \
 		-e 's,/sbin/,${sbindir}/,g' \
-- 
2.7.4


