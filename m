Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C24F73D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 07:29:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T7TvpA027172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 00:29:57 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 00:29:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 00:29:56 -0700
Message-ID: <b1d517121b5c734479d24c14e6b8e24ec0289844.1430292533.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430292533.git.liezhi.yang@windriver.com>
References: <cover.1430292533.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] rpcbind: 0.2.2 -> 0.2.3
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
X-List-Received-Date: Wed, 29 Apr 2015 07:29:57 -0000
Content-Type: text/plain

* Updated 0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
* Removed 0002-uclibc-rpcsvc-defines.patch since it is already in the
  source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...001-Avoid-use-of-glibc-sys-cdefs.h-header.patch |  109 ++++++++++----------
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   60 -----------
 .../rpcbind/{rpcbind_0.2.2.bb => rpcbind_0.2.3.bb} |   10 +-
 3 files changed, 57 insertions(+), 122 deletions(-)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.2.bb => rpcbind_0.2.3.bb} (87%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
index 6f5f5dd..eeef9f1 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
@@ -5,21 +5,21 @@ Subject: [PATCH] Avoid use of glibc sys/cdefs.h header
 
 Upstream-Status: Pending
 ---
- src/check_bound.c  |  2 +-
- src/pmap_svc.c     | 10 +++++-----
- src/rpcb_svc.c     | 10 +++++-----
- src/rpcb_svc_4.c   | 14 +++++++-------
- src/rpcb_svc_com.c | 46 +++++++++++++++++++++++-----------------------
- src/rpcbind.c      | 12 ++++++------
- src/util.c         |  2 +-
- src/warmstart.c    |  4 ++--
+ src/check_bound.c  |    2 +-
+ src/pmap_svc.c     |   10 +++++-----
+ src/rpcb_svc.c     |   10 +++++-----
+ src/rpcb_svc_4.c   |   14 +++++++-------
+ src/rpcb_svc_com.c |   46 +++++++++++++++++++++++-----------------------
+ src/rpcbind.c      |   12 ++++++------
+ src/util.c         |    2 +-
+ src/warmstart.c    |    4 ++--
  8 files changed, 50 insertions(+), 50 deletions(-)
 
-Index: rpcbind-0.2.2/src/check_bound.c
-===================================================================
---- rpcbind-0.2.2.orig/src/check_bound.c
-+++ rpcbind-0.2.2/src/check_bound.c
-@@ -70,7 +70,7 @@ static struct fdlist *fdhead;	/* Link li
+diff --git a/src/check_bound.c b/src/check_bound.c
+index c70b845..5d21730 100644
+--- a/src/check_bound.c
++++ b/src/check_bound.c
+@@ -70,7 +70,7 @@ static struct fdlist *fdhead;	/* Link list of the check fd's */
  static struct fdlist *fdtail;
  static char *nullstring = "";
  
@@ -28,13 +28,13 @@ Index: rpcbind-0.2.2/src/check_bound.c
  
  /*
   * Returns 1 if the given address is bound for the given addr & transport
-Index: rpcbind-0.2.2/src/pmap_svc.c
-===================================================================
---- rpcbind-0.2.2.orig/src/pmap_svc.c
-+++ rpcbind-0.2.2/src/pmap_svc.c
-@@ -58,11 +58,11 @@ static	char sccsid[] = "@(#)pmap_svc.c 1
- #endif
+diff --git a/src/pmap_svc.c b/src/pmap_svc.c
+index ad28b93..9c7d409 100644
+--- a/src/pmap_svc.c
++++ b/src/pmap_svc.c
+@@ -60,11 +60,11 @@ static	char sccsid[] = "@(#)pmap_svc.c 1.23 89/04/05 Copyr 1984 Sun Micro";
  #include "rpcbind.h"
+ #include "xlog.h"
  #include <rpc/svc_soc.h> /* svc_getcaller routine definition */
 -static struct pmaplist *find_service_pmap __P((rpcprog_t, rpcvers_t,
 -					       rpcprot_t));
@@ -49,13 +49,13 @@ Index: rpcbind-0.2.2/src/pmap_svc.c
  
  /*
   * Called for all the version 2 inquiries.
-Index: rpcbind-0.2.2/src/rpcb_svc.c
-===================================================================
---- rpcbind-0.2.2.orig/src/rpcb_svc.c
-+++ rpcbind-0.2.2/src/rpcb_svc.c
-@@ -52,10 +52,10 @@
- 
+diff --git a/src/rpcb_svc.c b/src/rpcb_svc.c
+index bd92201..6c7f7fe 100644
+--- a/src/rpcb_svc.c
++++ b/src/rpcb_svc.c
+@@ -53,10 +53,10 @@
  #include "rpcbind.h"
+ #include "xlog.h"
  
 -static void *rpcbproc_getaddr_3_local __P((void *, struct svc_req *, SVCXPRT *,
 -					   rpcvers_t));
@@ -68,7 +68,7 @@ Index: rpcbind-0.2.2/src/rpcb_svc.c
  
  /*
   * Called by svc_getreqset. There is a separate server handle for
-@@ -74,7 +74,7 @@ rpcb_service_3(struct svc_req *rqstp, SV
+@@ -75,7 +75,7 @@ rpcb_service_3(struct svc_req *rqstp, SVCXPRT *transp)
  	} argument;
  	char *result;
  	xdrproc_t xdr_argument, xdr_result;
@@ -77,13 +77,13 @@ Index: rpcbind-0.2.2/src/rpcb_svc.c
  	rpcprog_t setprog = 0;
  
  	rpcbs_procinfo(RPCBVERS_3_STAT, rqstp->rq_proc);
-Index: rpcbind-0.2.2/src/rpcb_svc_4.c
-===================================================================
---- rpcbind-0.2.2.orig/src/rpcb_svc_4.c
-+++ rpcbind-0.2.2/src/rpcb_svc_4.c
-@@ -53,13 +53,13 @@
- #include <stdlib.h>
+diff --git a/src/rpcb_svc_4.c b/src/rpcb_svc_4.c
+index b673452..6764c0a 100644
+--- a/src/rpcb_svc_4.c
++++ b/src/rpcb_svc_4.c
+@@ -54,13 +54,13 @@
  #include "rpcbind.h"
+ #include "xlog.h"
  
 -static void *rpcbproc_getaddr_4_local __P((void *, struct svc_req *, SVCXPRT *,
 -				      rpcvers_t));
@@ -101,7 +101,7 @@ Index: rpcbind-0.2.2/src/rpcb_svc_4.c
  
  /*
   * Called by svc_getreqset. There is a separate server handle for
-@@ -77,7 +77,7 @@ rpcb_service_4(struct svc_req *rqstp, SV
+@@ -78,7 +78,7 @@ rpcb_service_4(struct svc_req *rqstp, SVCXPRT *transp)
  	} argument;
  	char *result;
  	xdrproc_t xdr_argument, xdr_result;
@@ -110,11 +110,11 @@ Index: rpcbind-0.2.2/src/rpcb_svc_4.c
  	rpcprog_t setprog = 0;
  
  	rpcbs_procinfo(RPCBVERS_4_STAT, rqstp->rq_proc);
-Index: rpcbind-0.2.2/src/rpcb_svc_com.c
-===================================================================
---- rpcbind-0.2.2.orig/src/rpcb_svc_com.c
-+++ rpcbind-0.2.2/src/rpcb_svc_com.c
-@@ -99,29 +99,29 @@ struct finfo {
+diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
+index ff9ce6b..8aef9e5 100644
+--- a/src/rpcb_svc_com.c
++++ b/src/rpcb_svc_com.c
+@@ -100,29 +100,29 @@ struct finfo {
  static struct finfo     FINFO[NFORWARD];
  
  
@@ -167,11 +167,11 @@ Index: rpcbind-0.2.2/src/rpcb_svc_com.c
  
  /*
   * Set a mapping of program, version, netid
-Index: rpcbind-0.2.2/src/rpcbind.c
-===================================================================
---- rpcbind-0.2.2.orig/src/rpcbind.c
-+++ rpcbind-0.2.2/src/rpcbind.c
-@@ -130,13 +130,13 @@ char *tcp_uaddr;	/* Universal TCP addres
+diff --git a/src/rpcbind.c b/src/rpcbind.c
+index 045daa1..137011b 100644
+--- a/src/rpcbind.c
++++ b/src/rpcbind.c
+@@ -135,13 +135,13 @@ char *tcp_uaddr;	/* Universal TCP address */
  static char servname[] = "rpcbind";
  static char superuser[] = "superuser";
  
@@ -191,26 +191,23 @@ Index: rpcbind-0.2.2/src/rpcbind.c
  
  int
  main(int argc, char *argv[])
-Index: rpcbind-0.2.2/src/util.c
-===================================================================
---- rpcbind-0.2.2.orig/src/util.c
-+++ rpcbind-0.2.2/src/util.c
-@@ -70,9 +70,9 @@ static struct sockaddr_in *local_in4;
+diff --git a/src/util.c b/src/util.c
+index a6c835b..33b9e4f 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -70,7 +70,7 @@ static struct sockaddr_in *local_in4;
  static struct sockaddr_in6 *local_in6;
  #endif
  
 -static int bitmaskcmp __P((void *, void *, void *, int));
 +static int bitmaskcmp (void *, void *, void *, int);
- #ifdef INET6
--static void in6_fillscopeid __P((struct sockaddr_in6 *));
-+static void in6_fillscopeid (struct sockaddr_in6 *);
- #endif
  
  /*
-Index: rpcbind-0.2.2/src/warmstart.c
-===================================================================
---- rpcbind-0.2.2.orig/src/warmstart.c
-+++ rpcbind-0.2.2/src/warmstart.c
+  * For all bits set in "mask", compare the corresponding bits in
+diff --git a/src/warmstart.c b/src/warmstart.c
+index b6eb73e..42dd3af 100644
+--- a/src/warmstart.c
++++ b/src/warmstart.c
 @@ -58,8 +58,8 @@
  #define	PMAPFILE	RPCBIND_STATEDIR "/portmap.xdr"
  #endif
diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch b/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
deleted file mode 100644
index 6b11316..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 077add040c2e30d3ac507362f4afe350f47be027 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Tue, 2 Feb 2010 09:47:57 +0000
-Subject: [PATCH 2/2] uclibc-rpcsvc-defines
-
-Upstream-Status: Pending
-
----
- src/security.c |   28 ++++++++++++++++++++++++++++
- 1 files changed, 28 insertions(+), 0 deletions(-)
-
-diff --git a/src/security.c b/src/security.c
-index 0edeac6..e9fed55 100644
---- a/src/security.c
-+++ b/src/security.c
-@@ -20,6 +20,32 @@
- /*
-  * XXX for special case checks in check_callit.
-  */
-+#if defined(__UCLIBC__) || !defined(__GLIBC__)
-+
-+#define MOUNTPROC_MNT 1
-+#define MOUNTPROC_UMNT 3
-+
-+#define NFS_PROGRAM	100003
-+#define YPPROG		100004
-+#define MOUNTPROG	100005
-+#define YPBINDPROG	100007
-+#define YPPASSWDPROG	100009
-+#define RQUOTAPROG	100011
-+
-+#define YPPROC_NULL	0
-+#define YPPROC_DOMAIN 	1
-+#define YPPROC_DOMAIN_NONACK 2
-+#define YPPROC_MATCH	3
-+#define YPPROC_FIRST	4
-+#define YPPROC_NEXT	5
-+#define YPPROC_XFR	6
-+#define YPPROC_CLEAR	7
-+#define YPPROC_ALL	8
-+
-+#define YPBINDPROC_SETDOM	2
-+
-+#else
-+
- #include <rpcsvc/mount.h>
- #include <rpcsvc/rquota.h>
- #include <rpcsvc/nfs_prot.h>
-@@ -27,6 +53,8 @@
- #include <rpcsvc/ypclnt.h>
- #include <rpcsvc/yppasswd.h>
- 
-+#endif
-+
- #include "rpcbind.h"
- 
- #ifdef LIBWRAP
--- 
-1.6.6.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
similarity index 87%
rename from meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
rename to meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
index 51e456e..3336021 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
@@ -12,9 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
-	   file://0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch \
-	   file://0002-uclibc-rpcsvc-defines.patch \
-	   file://remove-sys-queue.patch \
+           file://0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch \
+           file://remove-sys-queue.patch \
            ${UCLIBCPATCHES} \
            ${MUSLPATCHES} \
            file://rpcbind.conf \
@@ -24,13 +23,12 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
 MUSLPATCHES_libc-musl = "file://musl-sunrpc.patch"
 
 UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
-                             file://0002-uclibc-rpcsvc-defines.patch \
                             "
 UCLIBCPATCHES ?= ""
 MUSLPATCHES ?= ""
 
-SRC_URI[md5sum] = "8acf839bfef2364a05fbd6be5f8edf9a"
-SRC_URI[sha256sum] = "13dbc8c796dbe0ce8df873007bea0490c8460b56202d918c9eb6fa0358a08f29"
+SRC_URI[md5sum] = "c8875246b2688a1adfbd6ad43480278d"
+SRC_URI[sha256sum] = "9897823a9d820ea011d9ea02054d5ab99469b9ca5346265fee380713c8fed27b"
 
 inherit autotools update-rc.d systemd pkgconfig
 
-- 
1.7.9.5


