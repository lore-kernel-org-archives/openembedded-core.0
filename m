Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4C19E73D2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:15 +0000 (UTC)
Received: by ierf6 with SMTP id f6so26628879ier.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=67rfGWAltWYGc68tjcoY7dtEd+ylaRFUto2/MroUHOg=;
	b=d8KVGSSlNOzi1MA/ySNDWruHCkM7GNSX6K2/WD7sQNTi193Foyr6cp46S9zz3grS1I
	bMu19i5oX6hMDLeaAs2/3Wm53+s+T6augDKFRwP3qHYDKWIBaqMTxVmYMy/e1pv1Chej
	lmabYN9emnqAmvMPLEBzRrOQoIE/oDTvzCDHpQnPtK500c51ZNS8iG2Nn4SADhfMOdkL
	qfUqr68x3psZC6/LtwbS0vUnO/X6JNI0hIkx6Uv99nYj/KHtVqePzSmEhdpRiKDobXEN
	jTuZsASyTiJ5SRT/cfW1OX3Wgi07nX3Z3aOylgx/8tHZFxSsLAYqGL+VTUVc25lxYm2n
	e0Qg==
X-Received: by 10.43.163.129 with SMTP id mo1mr9441588icc.61.1428341837324;
	Mon, 06 Apr 2015 10:37:17 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:52 +0000
Message-Id: <f83772cc1ef685408396b5859761dd800c2cc1a4.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 24/24] rpcbind: Fix build with musl
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:16 -0000

most patches are just removing glibc'ism e.g. using sys/queue.h
of cdefs.h the one patch which is specific to musl
is housed with overrides

Change-Id: Ia15bf6c9c4b562c9392a704ef92e9090aa5f6381
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Avoid-use-of-glibc-sys-cdefs.h-header.patch | 224 +++++++++++++++++++++
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   6 +-
 .../rpcbind/rpcbind/musl-sunrpc.patch              |  29 +++
 .../rpcbind/rpcbind/remove-sys-queue.patch         |  22 ++
 meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb     |   6 +
 5 files changed, 284 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
new file mode 100644
index 0000000..6f5f5dd
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
@@ -0,0 +1,224 @@
+From 2a44d862233f2126581e290d568e1c8b8f2eb9f5 Mon Sep 17 00:00:00 2001
+From: Carlo Landmeter <clandmeter@gmail.com>
+Date: Thu, 19 Feb 2015 15:28:45 +0000
+Subject: [PATCH] Avoid use of glibc sys/cdefs.h header
+
+Upstream-Status: Pending
+---
+ src/check_bound.c  |  2 +-
+ src/pmap_svc.c     | 10 +++++-----
+ src/rpcb_svc.c     | 10 +++++-----
+ src/rpcb_svc_4.c   | 14 +++++++-------
+ src/rpcb_svc_com.c | 46 +++++++++++++++++++++++-----------------------
+ src/rpcbind.c      | 12 ++++++------
+ src/util.c         |  2 +-
+ src/warmstart.c    |  4 ++--
+ 8 files changed, 50 insertions(+), 50 deletions(-)
+
+Index: rpcbind-0.2.2/src/check_bound.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/check_bound.c
++++ rpcbind-0.2.2/src/check_bound.c
+@@ -70,7 +70,7 @@ static struct fdlist *fdhead;	/* Link li
+ static struct fdlist *fdtail;
+ static char *nullstring = "";
+ 
+-static bool_t check_bound __P((struct fdlist *, char *uaddr));
++static bool_t check_bound (struct fdlist *, char *uaddr);
+ 
+ /*
+  * Returns 1 if the given address is bound for the given addr & transport
+Index: rpcbind-0.2.2/src/pmap_svc.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/pmap_svc.c
++++ rpcbind-0.2.2/src/pmap_svc.c
+@@ -58,11 +58,11 @@ static	char sccsid[] = "@(#)pmap_svc.c 1
+ #endif
+ #include "rpcbind.h"
+ #include <rpc/svc_soc.h> /* svc_getcaller routine definition */
+-static struct pmaplist *find_service_pmap __P((rpcprog_t, rpcvers_t,
+-					       rpcprot_t));
+-static bool_t pmapproc_change __P((struct svc_req *, SVCXPRT *, u_long));
+-static bool_t pmapproc_getport __P((struct svc_req *, SVCXPRT *));
+-static bool_t pmapproc_dump __P((struct svc_req *, SVCXPRT *));
++static struct pmaplist *find_service_pmap (rpcprog_t, rpcvers_t,
++					       rpcprot_t);
++static bool_t pmapproc_change (struct svc_req *, SVCXPRT *, u_long);
++static bool_t pmapproc_getport (struct svc_req *, SVCXPRT *);
++static bool_t pmapproc_dump (struct svc_req *, SVCXPRT *);
+ 
+ /*
+  * Called for all the version 2 inquiries.
+Index: rpcbind-0.2.2/src/rpcb_svc.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/rpcb_svc.c
++++ rpcbind-0.2.2/src/rpcb_svc.c
+@@ -52,10 +52,10 @@
+ 
+ #include "rpcbind.h"
+ 
+-static void *rpcbproc_getaddr_3_local __P((void *, struct svc_req *, SVCXPRT *,
+-					   rpcvers_t));
+-static void *rpcbproc_dump_3_local __P((void *, struct svc_req *, SVCXPRT *,
+-					rpcvers_t));
++static void *rpcbproc_getaddr_3_local (void *, struct svc_req *, SVCXPRT *,
++					   rpcvers_t);
++static void *rpcbproc_dump_3_local (void *, struct svc_req *, SVCXPRT *,
++					rpcvers_t);
+ 
+ /*
+  * Called by svc_getreqset. There is a separate server handle for
+@@ -74,7 +74,7 @@ rpcb_service_3(struct svc_req *rqstp, SV
+ 	} argument;
+ 	char *result;
+ 	xdrproc_t xdr_argument, xdr_result;
+-	void *(*local) __P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
++	void *(*local) (void *, struct svc_req *, SVCXPRT *, rpcvers_t);
+ 	rpcprog_t setprog = 0;
+ 
+ 	rpcbs_procinfo(RPCBVERS_3_STAT, rqstp->rq_proc);
+Index: rpcbind-0.2.2/src/rpcb_svc_4.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/rpcb_svc_4.c
++++ rpcbind-0.2.2/src/rpcb_svc_4.c
+@@ -53,13 +53,13 @@
+ #include <stdlib.h>
+ #include "rpcbind.h"
+ 
+-static void *rpcbproc_getaddr_4_local __P((void *, struct svc_req *, SVCXPRT *,
+-				      rpcvers_t));
+-static void *rpcbproc_getversaddr_4_local __P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
++static void *rpcbproc_getaddr_4_local (void *, struct svc_req *, SVCXPRT *,
++				      rpcvers_t);
++static void *rpcbproc_getversaddr_4_local (void *, struct svc_req *, SVCXPRT *, rpcvers_t);
+ static void *rpcbproc_getaddrlist_4_local
+-	__P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
+-static void free_rpcb_entry_list __P((rpcb_entry_list_ptr *));
+-static void *rpcbproc_dump_4_local __P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
++	(void *, struct svc_req *, SVCXPRT *, rpcvers_t);
++static void free_rpcb_entry_list (rpcb_entry_list_ptr *);
++static void *rpcbproc_dump_4_local (void *, struct svc_req *, SVCXPRT *, rpcvers_t);
+ 
+ /*
+  * Called by svc_getreqset. There is a separate server handle for
+@@ -77,7 +77,7 @@ rpcb_service_4(struct svc_req *rqstp, SV
+ 	} argument;
+ 	char *result;
+ 	xdrproc_t xdr_argument, xdr_result;
+-	void *(*local) __P((void *, struct svc_req *, SVCXPRT *, rpcvers_t));
++	void *(*local) (void *, struct svc_req *, SVCXPRT *, rpcvers_t);
+ 	rpcprog_t setprog = 0;
+ 
+ 	rpcbs_procinfo(RPCBVERS_4_STAT, rqstp->rq_proc);
+Index: rpcbind-0.2.2/src/rpcb_svc_com.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/rpcb_svc_com.c
++++ rpcbind-0.2.2/src/rpcb_svc_com.c
+@@ -99,29 +99,29 @@ struct finfo {
+ static struct finfo     FINFO[NFORWARD];
+ 
+ 
+-static bool_t xdr_encap_parms __P((XDR *, struct encap_parms *));
+-static bool_t xdr_rmtcall_args __P((XDR *, struct r_rmtcall_args *));
+-static bool_t xdr_rmtcall_result __P((XDR *, struct r_rmtcall_args *));
+-static bool_t xdr_opaque_parms __P((XDR *, struct r_rmtcall_args *));
+-static int find_rmtcallfd_by_netid __P((char *));
+-static SVCXPRT *find_rmtcallxprt_by_fd __P((int));
+-static int forward_register __P((u_int32_t, struct netbuf *, int, char *,
+-    rpcproc_t, rpcvers_t, u_int32_t *));
+-static struct finfo *forward_find __P((u_int32_t));
+-static int free_slot_by_xid __P((u_int32_t));
+-static int free_slot_by_index __P((int));
+-static int netbufcmp __P((struct netbuf *, struct netbuf *));
+-static struct netbuf *netbufdup __P((struct netbuf *));
+-static void netbuffree __P((struct netbuf *));
+-static int check_rmtcalls __P((struct pollfd *, int));
+-static void xprt_set_caller __P((SVCXPRT *, struct finfo *));
+-static void send_svcsyserr __P((SVCXPRT *, struct finfo *));
+-static void handle_reply __P((int, SVCXPRT *));
+-static void find_versions __P((rpcprog_t, char *, rpcvers_t *, rpcvers_t *));
+-static rpcblist_ptr find_service __P((rpcprog_t, rpcvers_t, char *));
+-static char *getowner __P((SVCXPRT *, char *, size_t));
+-static int add_pmaplist __P((RPCB *));
+-static int del_pmaplist __P((RPCB *));
++static bool_t xdr_encap_parms (XDR *, struct encap_parms *);
++static bool_t xdr_rmtcall_args (XDR *, struct r_rmtcall_args *);
++static bool_t xdr_rmtcall_result (XDR *, struct r_rmtcall_args *);
++static bool_t xdr_opaque_parms (XDR *, struct r_rmtcall_args *);
++static int find_rmtcallfd_by_netid (char *);
++static SVCXPRT *find_rmtcallxprt_by_fd (int);
++static int forward_register (u_int32_t, struct netbuf *, int, char *,
++    rpcproc_t, rpcvers_t, u_int32_t *);
++static struct finfo *forward_find (u_int32_t);
++static int free_slot_by_xid (u_int32_t);
++static int free_slot_by_index (int);
++static int netbufcmp (struct netbuf *, struct netbuf *);
++static struct netbuf *netbufdup (struct netbuf *);
++static void netbuffree (struct netbuf *);
++static int check_rmtcalls (struct pollfd *, int);
++static void xprt_set_caller (SVCXPRT *, struct finfo *);
++static void send_svcsyserr (SVCXPRT *, struct finfo *);
++static void handle_reply (int, SVCXPRT *);
++static void find_versions (rpcprog_t, char *, rpcvers_t *, rpcvers_t *);
++static rpcblist_ptr find_service (rpcprog_t, rpcvers_t, char *);
++static char *getowner (SVCXPRT *, char *, size_t);
++static int add_pmaplist (RPCB *);
++static int del_pmaplist (RPCB *);
+ 
+ /*
+  * Set a mapping of program, version, netid
+Index: rpcbind-0.2.2/src/rpcbind.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/rpcbind.c
++++ rpcbind-0.2.2/src/rpcbind.c
+@@ -130,13 +130,13 @@ char *tcp_uaddr;	/* Universal TCP addres
+ static char servname[] = "rpcbind";
+ static char superuser[] = "superuser";
+ 
+-int main __P((int, char *[]));
++int main (int, char *[]);
+ 
+-static int init_transport __P((struct netconfig *));
+-static void rbllist_add __P((rpcprog_t, rpcvers_t, struct netconfig *,
+-			     struct netbuf *));
+-static void terminate __P((int));
+-static void parseargs __P((int, char *[]));
++static int init_transport (struct netconfig *);
++static void rbllist_add (rpcprog_t, rpcvers_t, struct netconfig *,
++			     struct netbuf *);
++static void terminate (int);
++static void parseargs (int, char *[]);
+ 
+ int
+ main(int argc, char *argv[])
+Index: rpcbind-0.2.2/src/util.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/util.c
++++ rpcbind-0.2.2/src/util.c
+@@ -70,9 +70,9 @@ static struct sockaddr_in *local_in4;
+ static struct sockaddr_in6 *local_in6;
+ #endif
+ 
+-static int bitmaskcmp __P((void *, void *, void *, int));
++static int bitmaskcmp (void *, void *, void *, int);
+ #ifdef INET6
+-static void in6_fillscopeid __P((struct sockaddr_in6 *));
++static void in6_fillscopeid (struct sockaddr_in6 *);
+ #endif
+ 
+ /*
+Index: rpcbind-0.2.2/src/warmstart.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/warmstart.c
++++ rpcbind-0.2.2/src/warmstart.c
+@@ -58,8 +58,8 @@
+ #define	PMAPFILE	RPCBIND_STATEDIR "/portmap.xdr"
+ #endif
+ 
+-static bool_t write_struct __P((char *, xdrproc_t, void *));
+-static bool_t read_struct __P((char *, xdrproc_t, void *));
++static bool_t write_struct (char *, xdrproc_t, void *);
++static bool_t read_struct (char *, xdrproc_t, void *);
+ 
+ static bool_t
+ write_struct(char *filename, xdrproc_t structproc, void *list)
diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch b/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
index c54fc96..6b11316 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
@@ -1,10 +1,10 @@
-Upstream-Status: Pending
-
 From 077add040c2e30d3ac507362f4afe350f47be027 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Tue, 2 Feb 2010 09:47:57 +0000
 Subject: [PATCH 2/2] uclibc-rpcsvc-defines
 
+Upstream-Status: Pending
+
 ---
  src/security.c |   28 ++++++++++++++++++++++++++++
  1 files changed, 28 insertions(+), 0 deletions(-)
@@ -17,7 +17,7 @@ index 0edeac6..e9fed55 100644
  /*
   * XXX for special case checks in check_callit.
   */
-+#if defined(__UCLIBC__)
++#if defined(__UCLIBC__) || !defined(__GLIBC__)
 +
 +#define MOUNTPROC_MNT 1
 +#define MOUNTPROC_UMNT 3
diff --git a/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch b/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
new file mode 100644
index 0000000..9c72a1b
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/musl-sunrpc.patch
@@ -0,0 +1,29 @@
+The musl implementation of getaddrinfo and getservbyname does not
+aliases. As a workaround we use "sunprc" instead of "portmapper"
+
+ported from alpine linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: rpcbind-0.2.2/src/rpcbind.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/rpcbind.c
++++ rpcbind-0.2.2/src/rpcbind.c
+@@ -491,7 +491,7 @@ init_transport(struct netconfig *nconf)
+ 			if ((aicode = getaddrinfo(hosts[nhostsbak],
+ 			    servname, &hints, &res)) != 0) {
+ 			  if ((aicode = getaddrinfo(hosts[nhostsbak],
+-						    "portmapper", &hints, &res)) != 0) {
++						    "sunrpc", &hints, &res)) != 0) {
+ 				syslog(LOG_ERR,
+ 				    "cannot get local address for %s: %s",
+ 				    nconf->nc_netid, gai_strerror(aicode));
+@@ -564,7 +564,7 @@ init_transport(struct netconfig *nconf)
+ 		if ((strcmp(nconf->nc_netid, "local") != 0) &&
+ 		    (strcmp(nconf->nc_netid, "unix") != 0)) {
+ 			if ((aicode = getaddrinfo(NULL, servname, &hints, &res))!= 0) {
+-			  if ((aicode = getaddrinfo(NULL, "portmapper", &hints, &res))!= 0) {
++			  if ((aicode = getaddrinfo(NULL, "sunrpc", &hints, &res))!= 0) {
+ 			  printf("cannot get local address for %s: %s",  nconf->nc_netid, gai_strerror(aicode));
+ 			  syslog(LOG_ERR,
+ 				    "cannot get local address for %s: %s",
diff --git a/meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch b/meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch
new file mode 100644
index 0000000..84fc974
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/remove-sys-queue.patch
@@ -0,0 +1,22 @@
+musl does not provide this header and here is reasoning
+http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_sys.2Fqueue.h_not_included_.3F
+
+So include it only when __GLIBC__ is defined which is true for uclibc and glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: rpcbind-0.2.2/src/util.c
+===================================================================
+--- rpcbind-0.2.2.orig/src/util.c
++++ rpcbind-0.2.2/src/util.c
+@@ -41,7 +41,9 @@
+ 
+ #include <sys/types.h>
+ #include <sys/socket.h>
++#ifdef __GLIBC__
+ #include <sys/queue.h>
++#endif
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <ifaddrs.h>
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
index 1952b2a..51e456e 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
@@ -12,16 +12,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
+	   file://0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch \
+	   file://0002-uclibc-rpcsvc-defines.patch \
+	   file://remove-sys-queue.patch \
            ${UCLIBCPATCHES} \
+           ${MUSLPATCHES} \
            file://rpcbind.conf \
            file://rpcbind.socket \
            file://rpcbind.service \
           "
+MUSLPATCHES_libc-musl = "file://musl-sunrpc.patch"
 
 UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
                              file://0002-uclibc-rpcsvc-defines.patch \
                             "
 UCLIBCPATCHES ?= ""
+MUSLPATCHES ?= ""
 
 SRC_URI[md5sum] = "8acf839bfef2364a05fbd6be5f8edf9a"
 SRC_URI[sha256sum] = "13dbc8c796dbe0ce8df873007bea0490c8460b56202d918c9eb6fa0358a08f29"
-- 
2.1.4


