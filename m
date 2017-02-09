Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E055771DED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:46:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v196k0mO028891
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 8 Feb 2017 22:46:00 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 22:45:59 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 01:45:39 -0500
Message-ID: <2bf713fb9c35e085924a2943d5176e10f77d55e9.1486622007.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486622006.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] rpcbind: 0.2.3 -> 0.2.4
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
X-List-Received-Date: Thu, 09 Feb 2017 06:46:05 -0000
Content-Type: text/plain

Drop obsolete patch
- 0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch

Drop backport patches:
- 0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
- cve-2015-7236.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...001-Avoid-use-of-glibc-sys-cdefs.h-header.patch | 221 ---------------------
 ...ly-Don-t-use-the-xp_auth-pointer-directly.patch |  43 ----
 .../rpcbind/rpcbind/cve-2015-7236.patch            |  84 --------
 .../rpcbind/{rpcbind_0.2.3.bb => rpcbind_0.2.4.bb} |   7 +-
 4 files changed, 2 insertions(+), 353 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.3.bb => rpcbind_0.2.4.bb} (87%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
deleted file mode 100644
index eeef9f1..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-From 2a44d862233f2126581e290d568e1c8b8f2eb9f5 Mon Sep 17 00:00:00 2001
-From: Carlo Landmeter <clandmeter@gmail.com>
-Date: Thu, 19 Feb 2015 15:28:45 +0000
-Subject: [PATCH] Avoid use of glibc sys/cdefs.h header
-
-Upstream-Status: Pending
----
- src/check_bound.c  |    2 +-
- src/pmap_svc.c     |   10 +++++-----
- src/rpcb_svc.c     |   10 +++++-----
- src/rpcb_svc_4.c   |   14 +++++++-------
- src/rpcb_svc_com.c |   46 +++++++++++++++++++++++-----------------------
- src/rpcbind.c      |   12 ++++++------
- src/util.c         |    2 +-
- src/warmstart.c    |    4 ++--
- 8 files changed, 50 insertions(+), 50 deletions(-)
-
-diff --git a/src/check_bound.c b/src/check_bound.c
-index c70b845..5d21730 100644
---- a/src/check_bound.c
-+++ b/src/check_bound.c
-@@ -70,7 +70,7 @@ static struct fdlist *fdhead;	/* Link list of the check fd's */
- static struct fdlist *fdtail;
- static char *nullstring = "";
- 
--static bool_t check_bound __P((struct fdlist *, char *uaddr));
-+static bool_t check_bound (struct fdlist *, char *uaddr);
- 
- /*
-  * Returns 1 if the given address is bound for the given addr & transport
-diff --git a/src/pmap_svc.c b/src/pmap_svc.c
-index ad28b93..9c7d409 100644
---- a/src/pmap_svc.c
-+++ b/src/pmap_svc.c
-@@ -60,11 +60,11 @@ static	char sccsid[] = "@(#)pmap_svc.c 1.23 89/04/05 Copyr 1984 Sun Micro";
- #include "rpcbind.h"
- #include "xlog.h"
- #include <rpc/svc_soc.h> /* svc_getcaller routine definition */
--static struct pmaplist *find_service_pmap __P((rpcprog_t, rpcvers_t,
--					       rpcprot_t));
--static bool_t pmapproc_change __P((struct svc_req *, SVCXPRT *, u_long));
--static bool_t pmapproc_getport __P((struct svc_req *, SVCXPRT *));
--static bool_t pmapproc_dump __P((struct svc_req *, SVCXPRT *));
-+static struct pmaplist *find_service_pmap (rpcprog_t, rpcvers_t,
-+					       rpcprot_t);
-+static bool_t pmapproc_change (struct svc_req *, SVCXPRT *, u_long);
-+static bool_t pmapproc_getport (struct svc_req *, SVCXPRT *);
-+static bool_t pmapproc_dump (struct svc_req *, SVCXPRT *);
- 
- /*
-  * Called for all the version 2 inquiries.
-diff --git a/src/rpcb_svc.c b/src/rpcb_svc.c
-index bd92201..6c7f7fe 100644
---- a/src/rpcb_svc.c
-+++ b/src/rpcb_svc.c
-@@ -53,10 +53,10 @@
- #include "rpcbind.h"
- #include "xlog.h"
- 
--static void *rpcbproc_getaddr_3_local __P((void *, struct svc_req *, SVCXPRT *,
--					   rpcvers_t));
--static void *rpcbproc_dump_3_local __P((void *, struct svc_req *, SVCXPRT *,
--					rpcvers_t));
-+static void *rpcbproc_getaddr_3_local (void *, struct svc_req *, SVCXPRT *,
-+					   rpcvers_t);
-+static void *rpcbproc_dump_3_local (void *, struct svc_req *, SVCXPRT *,
-+					rpcvers_t);
- 
- /*
-  * Called by svc_getreqset. There is a separate server handle for
-@@ -75,7 +75,7 @@ rpcb_service_3(struct svc_req *rqstp, SVCXPRT *transp)
- 	} argument;
- 	char *result;
- 	xdrproc_t xdr_argument, xdr_result;
--	void *(*local) __P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
-+	void *(*local) (void *, struct svc_req *, SVCXPRT *, rpcvers_t);
- 	rpcprog_t setprog = 0;
- 
- 	rpcbs_procinfo(RPCBVERS_3_STAT, rqstp->rq_proc);
-diff --git a/src/rpcb_svc_4.c b/src/rpcb_svc_4.c
-index b673452..6764c0a 100644
---- a/src/rpcb_svc_4.c
-+++ b/src/rpcb_svc_4.c
-@@ -54,13 +54,13 @@
- #include "rpcbind.h"
- #include "xlog.h"
- 
--static void *rpcbproc_getaddr_4_local __P((void *, struct svc_req *, SVCXPRT *,
--				      rpcvers_t));
--static void *rpcbproc_getversaddr_4_local __P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
-+static void *rpcbproc_getaddr_4_local (void *, struct svc_req *, SVCXPRT *,
-+				      rpcvers_t);
-+static void *rpcbproc_getversaddr_4_local (void *, struct svc_req *, SVCXPRT *, rpcvers_t);
- static void *rpcbproc_getaddrlist_4_local
--	__P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
--static void free_rpcb_entry_list __P((rpcb_entry_list_ptr *));
--static void *rpcbproc_dump_4_local __P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
-+	(void *, struct svc_req *, SVCXPRT *, rpcvers_t);
-+static void free_rpcb_entry_list (rpcb_entry_list_ptr *);
-+static void *rpcbproc_dump_4_local (void *, struct svc_req *, SVCXPRT *, rpcvers_t);
- 
- /*
-  * Called by svc_getreqset. There is a separate server handle for
-@@ -78,7 +78,7 @@ rpcb_service_4(struct svc_req *rqstp, SVCXPRT *transp)
- 	} argument;
- 	char *result;
- 	xdrproc_t xdr_argument, xdr_result;
--	void *(*local) __P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
-+	void *(*local) (void *, struct svc_req *, SVCXPRT *, rpcvers_t);
- 	rpcprog_t setprog = 0;
- 
- 	rpcbs_procinfo(RPCBVERS_4_STAT, rqstp->rq_proc);
-diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index ff9ce6b..8aef9e5 100644
---- a/src/rpcb_svc_com.c
-+++ b/src/rpcb_svc_com.c
-@@ -100,29 +100,29 @@ struct finfo {
- static struct finfo     FINFO[NFORWARD];
- 
- 
--static bool_t xdr_encap_parms __P((XDR *, struct encap_parms *));
--static bool_t xdr_rmtcall_args __P((XDR *, struct r_rmtcall_args *));
--static bool_t xdr_rmtcall_result __P((XDR *, struct r_rmtcall_args *));
--static bool_t xdr_opaque_parms __P((XDR *, struct r_rmtcall_args *));
--static int find_rmtcallfd_by_netid __P((char *));
--static SVCXPRT *find_rmtcallxprt_by_fd __P((int));
--static int forward_register __P((u_int32_t, struct netbuf *, int, char *,
--    rpcproc_t, rpcvers_t, u_int32_t *));
--static struct finfo *forward_find __P((u_int32_t));
--static int free_slot_by_xid __P((u_int32_t));
--static int free_slot_by_index __P((int));
--static int netbufcmp __P((struct netbuf *, struct netbuf *));
--static struct netbuf *netbufdup __P((struct netbuf *));
--static void netbuffree __P((struct netbuf *));
--static int check_rmtcalls __P((struct pollfd *, int));
--static void xprt_set_caller __P((SVCXPRT *, struct finfo *));
--static void send_svcsyserr __P((SVCXPRT *, struct finfo *));
--static void handle_reply __P((int, SVCXPRT *));
--static void find_versions __P((rpcprog_t, char *, rpcvers_t *, rpcvers_t *));
--static rpcblist_ptr find_service __P((rpcprog_t, rpcvers_t, char *));
--static char *getowner __P((SVCXPRT *, char *, size_t));
--static int add_pmaplist __P((RPCB *));
--static int del_pmaplist __P((RPCB *));
-+static bool_t xdr_encap_parms (XDR *, struct encap_parms *);
-+static bool_t xdr_rmtcall_args (XDR *, struct r_rmtcall_args *);
-+static bool_t xdr_rmtcall_result (XDR *, struct r_rmtcall_args *);
-+static bool_t xdr_opaque_parms (XDR *, struct r_rmtcall_args *);
-+static int find_rmtcallfd_by_netid (char *);
-+static SVCXPRT *find_rmtcallxprt_by_fd (int);
-+static int forward_register (u_int32_t, struct netbuf *, int, char *,
-+    rpcproc_t, rpcvers_t, u_int32_t *);
-+static struct finfo *forward_find (u_int32_t);
-+static int free_slot_by_xid (u_int32_t);
-+static int free_slot_by_index (int);
-+static int netbufcmp (struct netbuf *, struct netbuf *);
-+static struct netbuf *netbufdup (struct netbuf *);
-+static void netbuffree (struct netbuf *);
-+static int check_rmtcalls (struct pollfd *, int);
-+static void xprt_set_caller (SVCXPRT *, struct finfo *);
-+static void send_svcsyserr (SVCXPRT *, struct finfo *);
-+static void handle_reply (int, SVCXPRT *);
-+static void find_versions (rpcprog_t, char *, rpcvers_t *, rpcvers_t *);
-+static rpcblist_ptr find_service (rpcprog_t, rpcvers_t, char *);
-+static char *getowner (SVCXPRT *, char *, size_t);
-+static int add_pmaplist (RPCB *);
-+static int del_pmaplist (RPCB *);
- 
- /*
-  * Set a mapping of program, version, netid
-diff --git a/src/rpcbind.c b/src/rpcbind.c
-index 045daa1..137011b 100644
---- a/src/rpcbind.c
-+++ b/src/rpcbind.c
-@@ -135,13 +135,13 @@ char *tcp_uaddr;	/* Universal TCP address */
- static char servname[] = "rpcbind";
- static char superuser[] = "superuser";
- 
--int main __P((int, char *[]));
-+int main (int, char *[]);
- 
--static int init_transport __P((struct netconfig *));
--static void rbllist_add __P((rpcprog_t, rpcvers_t, struct netconfig *,
--			     struct netbuf *));
--static void terminate __P((int));
--static void parseargs __P((int, char *[]));
-+static int init_transport (struct netconfig *);
-+static void rbllist_add (rpcprog_t, rpcvers_t, struct netconfig *,
-+			     struct netbuf *);
-+static void terminate (int);
-+static void parseargs (int, char *[]);
- 
- int
- main(int argc, char *argv[])
-diff --git a/src/util.c b/src/util.c
-index a6c835b..33b9e4f 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -70,7 +70,7 @@ static struct sockaddr_in *local_in4;
- static struct sockaddr_in6 *local_in6;
- #endif
- 
--static int bitmaskcmp __P((void *, void *, void *, int));
-+static int bitmaskcmp (void *, void *, void *, int);
- 
- /*
-  * For all bits set in "mask", compare the corresponding bits in
-diff --git a/src/warmstart.c b/src/warmstart.c
-index b6eb73e..42dd3af 100644
---- a/src/warmstart.c
-+++ b/src/warmstart.c
-@@ -58,8 +58,8 @@
- #define	PMAPFILE	RPCBIND_STATEDIR "/portmap.xdr"
- #endif
- 
--static bool_t write_struct __P((char *, xdrproc_t, void *));
--static bool_t read_struct __P((char *, xdrproc_t, void *));
-+static bool_t write_struct (char *, xdrproc_t, void *);
-+static bool_t read_struct (char *, xdrproc_t, void *);
- 
- static bool_t
- write_struct(char *filename, xdrproc_t structproc, void *list)
diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
deleted file mode 100644
index 16b763e..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 9194122389f2a56b1cd1f935e64307e2e963c2da Mon Sep 17 00:00:00 2001
-From: Steve Dickson <steved@redhat.com>
-Date: Mon, 2 Nov 2015 17:05:18 -0500
-Subject: [PATCH] handle_reply: Don't use the xp_auth pointer directly
-
-In the latest libtirpc version to access the xp_auth
-one must use the SVC_XP_AUTH macro. To be backwards
-compatible a couple ifdefs were added to use the
-macro when it exists.
-
-Upstream-Status: Backport
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- src/rpcb_svc_com.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
-index 4ae93f1..22d6c84 100644
---- a/src/rpcb_svc_com.c
-+++ b/src/rpcb_svc_com.c
-@@ -1295,10 +1295,17 @@ handle_reply(int fd, SVCXPRT *xprt)
- 	a.rmt_localvers = fi->versnum;
- 
- 	xprt_set_caller(xprt, fi);
-+#if defined(SVC_XP_AUTH)
-+	SVC_XP_AUTH(xprt) = svc_auth_none;
-+#else 
- 	xprt->xp_auth = &svc_auth_none;
-+#endif
- 	svc_sendreply(xprt, (xdrproc_t) xdr_rmtcall_result, (char *) &a);
-+#if !defined(SVC_XP_AUTH)
- 	SVCAUTH_DESTROY(xprt->xp_auth);
- 	xprt->xp_auth = NULL;
-+#endif
-+
- done:
- 	if (buffer)
- 		free(buffer);
--- 
-2.4.0
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch b/meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
deleted file mode 100644
index 741a990..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-commit 06f7ebb1dade2f0dbf872ea2bedf17cff4734bdd
-Author: Olaf Kirch <okir@...e.de>
-Date:   Thu Aug 6 16:27:20 2015 +0200
-
-    Fix memory corruption in PMAP_CALLIT code
-    
-     - A PMAP_CALLIT call comes in on IPv4 UDP
-     - rpcbind duplicates the caller's address to a netbuf and stores it in
-       FINFO[0].caller_addr. caller_addr->buf now points to a memory region A
-       with a size of 16 bytes
-     - rpcbind forwards the call to the local service, receives a reply
-     - when processing the reply, it does this in xprt_set_caller:
-         xprt->xp_rtaddr = *FINFO[0].caller_addr
-       It sends out the reply, and then frees the netbuf caller_addr and
-       caller_addr.buf.
-       However, it does not clear xp_rtaddr, so xp_rtaddr.buf now refers
-       to memory region A, which is free.
-     - When the next call comes in on the UDP/IPv4 socket, svc_dg_recv will
-       be called, which will set xp_rtaddr to the client's address.
-       It will reuse the buffer inside xp_rtaddr, ie it will write a
-       sockaddr_in to region A
-    
-    Some time down the road, an incoming TCP connection is accepted,
-    allocating a fresh SVCXPRT. The memory region A is inside the
-    new SVCXPRT
-    
-     - While processing the TCP call, another UDP call comes in, again
-       overwriting region A with the client's address
-     - TCP client closes connection. In svc_destroy, we now trip over
-       the garbage left in region A
-    
-    We ran into the case where a commercial scanner was triggering
-    occasional rpcbind segfaults. The core file that was captured showed
-    a corrupted xprt->xp_netid pointer that was really a sockaddr_in.
-    
-    Signed-off-by: Olaf Kirch <okir@...e.de>
-
-    Upstream-Status: Backport
-    CVE: CVE-2015-7236
-
-    Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- src/rpcb_svc_com.c |   23 ++++++++++++++++++++++-
- 1 file changed, 22 insertions(+), 1 deletion(-)
-
-Index: rpcbind-0.1.6+git20080930/src/rpcb_svc_com.c
-===================================================================
---- rpcbind-0.1.6+git20080930.orig/src/rpcb_svc_com.c
-+++ rpcbind-0.1.6+git20080930/src/rpcb_svc_com.c
-@@ -1298,12 +1298,33 @@ check_rmtcalls(struct pollfd *pfds, int
- 	return (ncallbacks_found);
- }
- 
-+/*
-+ * This is really a helper function defined in libtirpc, but unfortunately, it hasn't
-+ * been exported yet.
-+ */
-+static struct netbuf *
-+__rpc_set_netbuf(struct netbuf *nb, const void *ptr, size_t len)
-+{
-+	if (nb->len != len) {
-+		if (nb->len)
-+			mem_free(nb->buf, nb->len);
-+		nb->buf = mem_alloc(len);
-+		if (nb->buf == NULL)
-+			return NULL;
-+
-+		nb->maxlen = nb->len = len;
-+	}
-+	memcpy(nb->buf, ptr, len);
-+	return nb;
-+}
-+
- static void
- xprt_set_caller(SVCXPRT *xprt, struct finfo *fi)
- {
-+	const struct netbuf *caller = fi->caller_addr;
- 	u_int32_t *xidp;
- 
--	*(svc_getrpccaller(xprt)) = *(fi->caller_addr);
-+	__rpc_set_netbuf(svc_getrpccaller(xprt), caller->buf, caller->len);
- 	xidp = __rpcb_get_dg_xidp(xprt);
- 	*xidp = fi->caller_xid;
- }
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
similarity index 87%
rename from meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
rename to meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
index c19a197..53cd59d 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
@@ -12,23 +12,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
-           file://0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch \
            file://remove-sys-queue.patch \
-           file://0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch \
            ${UCLIBCPATCHES} \
            ${MUSLPATCHES} \
            file://rpcbind.conf \
            file://rpcbind.socket \
            file://rpcbind.service \
-           file://cve-2015-7236.patch \
           "
 MUSLPATCHES_libc-musl = "file://musl-sunrpc.patch"
 
 UCLIBCPATCHES ?= ""
 MUSLPATCHES ?= ""
 
-SRC_URI[md5sum] = "c8875246b2688a1adfbd6ad43480278d"
-SRC_URI[sha256sum] = "9897823a9d820ea011d9ea02054d5ab99469b9ca5346265fee380713c8fed27b"
+SRC_URI[md5sum] = "cf10cd41ed8228fc54c316191c1f07fe"
+SRC_URI[sha256sum] = "074a9a530dc7c11e0d905aa59bcb0847c009313f02e98d3d798aa9568f414c66"
 
 inherit autotools update-rc.d systemd pkgconfig
 
-- 
2.8.1


