Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U8D9H-00007M-B9
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 18:08:04 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Feb 2013 08:51:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,702,1355126400"; d="scan'208";a="265172033"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 20 Feb 2013 08:51:25 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2013 18:51:47 +0200
Message-Id: <1361379107-29373-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libtirpc: upgrade to 0.2.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 17:08:05 -0000

- libtirpc-0.2.2-rpc-des-prot.patch removed;
- remove-des-crypt.patch removed;
both included in base distribution.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libtirpc-0.2.2-rpc-des-prot.patch              |   39 --------------------
 .../libtirpc/libtirpc-0.2.2/remove-des-crypt.patch |   17 ---------
 .../libtirpc-0.2.1-fortify.patch                   |    0
 .../obsolete_automake_macros.patch                 |    0
 .../remove-des-uclibc.patch                        |    0
 .../{libtirpc_0.2.2.bb => libtirpc_0.2.3.bb}       |    8 ++--
 6 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.2 => libtirpc-0.2.3}/libtirpc-0.2.1-fortify.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.2 => libtirpc-0.2.3}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.2 => libtirpc-0.2.3}/remove-des-uclibc.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc_0.2.2.bb => libtirpc_0.2.3.bb} (81%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
deleted file mode 100644
index c38a55b..0000000
--- a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f2f43212b33dea42635061c82645287454a70107 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sat, 11 Jun 2011 15:21:55 -0400
-Subject: [PATCH] add multiple inclusion protection to rpc/des.h
-
-If you try to include this file multiple times, you get a build failure
-due to redefinitions of enums and such.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
----
- tirpc/rpc/des.h |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
-
-
-Upstream-Status: Backport
-
-diff --git a/tirpc/rpc/des.h b/tirpc/rpc/des.h
-index e3d6897..d2881ad 100644
---- a/tirpc/rpc/des.h
-+++ b/tirpc/rpc/des.h
-@@ -33,6 +33,9 @@
-  * Copyright (c) 1986 by Sun Microsystems, Inc.
-  */
- 
-+#ifndef _RPC_DES_H_
-+#define _RPC_DES_H_
-+
- #define DES_MAXLEN 	65536	/* maximum # of bytes to encrypt  */
- #define DES_QUICKLEN	16	/* maximum # of bytes to encrypt quickly */
- 
-@@ -80,3 +83,5 @@ struct desparams {
-  * Software DES.
-  */
- extern int _des_crypt( char *, int, struct desparams * );
-+
-+#endif
--- 
-1.7.5.3
-
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
deleted file mode 100644
index d94a585..0000000
--- a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-http://sourceforge.net/mailarchive/message.php?msg_id=27636466
-
-Upstream-Status: Backport
-
-Index: libtirpc-0.2.2/src/Makefile.am
-===================================================================
---- libtirpc-0.2.2.orig/src/Makefile.am
-+++ libtirpc-0.2.2/src/Makefile.am
-@@ -50,7 +50,7 @@ libtirpc_la_SOURCES = auth_none.c auth_u
-         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
-         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_generic.c \
-         svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c auth_des.c authdes_prot.c des_crypt.c
-+        auth_time.c auth_des.c authdes_prot.c
- 
- ## XDR
- libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.3/libtirpc-0.2.1-fortify.patch
similarity index 100%
rename from meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
rename to meta/recipes-extended/libtirpc/libtirpc-0.2.3/libtirpc-0.2.1-fortify.patch
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/obsolete_automake_macros.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
similarity index 100%
rename from meta/recipes-extended/libtirpc/libtirpc-0.2.2/obsolete_automake_macros.patch
rename to meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-uclibc.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch
similarity index 100%
rename from meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-uclibc.patch
rename to meta/recipes-extended/libtirpc/libtirpc-0.2.3/remove-des-uclibc.patch
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
similarity index 81%
rename from meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
rename to meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
index 36591bf..ed838b7 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.3.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
                     file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
-PR = "r1"
+PR = "r0"
 
 DEPENDS += "xz-native"
 PROVIDES = "virtual/librpc"
@@ -14,15 +14,13 @@ PROVIDES = "virtual/librpc"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2;name=libtirpc \
            ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
            file://libtirpc-0.2.1-fortify.patch \
-           file://libtirpc-0.2.2-rpc-des-prot.patch \
-           file://remove-des-crypt.patch \
            file://obsolete_automake_macros.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-uclibc.patch"
 
-SRC_URI[libtirpc.md5sum] = "74c41c15c2909f7d11d9c7bfa7db6273"
-SRC_URI[libtirpc.sha256sum] = "f05eb17c85d62423858b8f74512cfe66a9ae1cedf93f03c2a0a32e04f0a33705"
+SRC_URI[libtirpc.md5sum] = "b70e6c12a369a91e69fcc3b9feb23d61"
+SRC_URI[libtirpc.sha256sum] = "4f29ea0491b4ca4c29f95f3c34191b857757873bbbf4b069f9dd4da01a6a923c"
 SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
 SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
 inherit autotools pkgconfig
-- 
1.7.10.4



