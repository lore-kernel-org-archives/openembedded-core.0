Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZscR-0007cQ-7A
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 00:43:29 +0200
Received: by pwi1 with SMTP id 1so1623315pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 15:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=ghLopTebxE3vumW11i83JX8TbWpKc76vIFXLui/toeo=;
	b=d6DPu6Tysy6ygk6MKOKEqBUY7DEETPURFW5zSzLmIfI9aEUZNuIzgX8tC8r1/J1IQX
	t1iA+5tqy+s/uxR1nAIyMF7xLIPxxHstsgrise5YgIfZVlfFwgng7y+NMbLSQBTS8x43
	GqTF6KUAuYMb0kChKlqbYuIbbwwVOes0sdacs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ut5gxobu9wwMIgeoc5FelthxeItUpt9FNnn373n5VDwMhtYiS9pWGo8LSztW7QTs3V
	uGtUGME87ijTc7r8FIy/UOV+PaHO/w4wEIgBk/F+Dk3a5nEStdUQOER4LAiHsnlwP942
	UUM/0KVhcsnXFZbrlGrSsiLeWi0fV1h/PCW4g=
Received: by 10.142.178.2 with SMTP id a2mr537795wff.136.1308868790492;
	Thu, 23 Jun 2011 15:39:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n8sm1540123pbh.89.2011.06.23.15.39.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 15:39:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2011 15:39:47 -0700
Message-Id: <1308868787-814-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] libtirpc: Upgrade 0.2.1 -> 0.2.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2011 22:43:29 -0000

Additionally bring in the nis headers which will be
required when using eglibc 2.14 where rpc support
is removed.

Make it provide virtual/librpc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch    |   26 +++++++++++++
 .../libtirpc-0.2.2-rpc-des-prot.patch              |   39 ++++++++++++++++++++
 .../libtirpc/libtirpc-0.2.2/remove-des-crypt.patch |   17 +++++++++
 meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb   |   21 -----------
 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |   33 +++++++++++++++++
 5 files changed, 115 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb

diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
new file mode 100644
index 0000000..32644b5
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
@@ -0,0 +1,26 @@
+Fix a possible overflow (reported by _FORTIFY_SOURCE=2)
+
+Ported from Gentoo
+
+Upstream-Status: Unknown
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libtirpc-0.2.1/src/getrpcport.c
+===================================================================
+--- libtirpc-0.2.1.orig/src/getrpcport.c
++++ libtirpc-0.2.1/src/getrpcport.c
+@@ -54,11 +54,11 @@ getrpcport(host, prognum, versnum, proto
+ 
+ 	if ((hp = gethostbyname(host)) == NULL)
+ 		return (0);
++	if (hp->h_length != sizeof(addr.sin_addr.s_addr))
++		return (0);
+ 	memset(&addr, 0, sizeof(addr));
+ 	addr.sin_family = AF_INET;
+ 	addr.sin_port =  0;
+-	if (hp->h_length > sizeof(addr))
+-	  hp->h_length = sizeof(addr);
+ 	memcpy(&addr.sin_addr.s_addr, hp->h_addr, (size_t)hp->h_length);
+ 	/* Inconsistent interfaces need casts! :-( */
+ 	return (pmap_getport(&addr, (u_long)prognum, (u_long)versnum, 
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
new file mode 100644
index 0000000..c38a55b
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.2-rpc-des-prot.patch
@@ -0,0 +1,39 @@
+From f2f43212b33dea42635061c82645287454a70107 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sat, 11 Jun 2011 15:21:55 -0400
+Subject: [PATCH] add multiple inclusion protection to rpc/des.h
+
+If you try to include this file multiple times, you get a build failure
+due to redefinitions of enums and such.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+---
+ tirpc/rpc/des.h |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+
+Upstream-Status: Backport
+
+diff --git a/tirpc/rpc/des.h b/tirpc/rpc/des.h
+index e3d6897..d2881ad 100644
+--- a/tirpc/rpc/des.h
++++ b/tirpc/rpc/des.h
+@@ -33,6 +33,9 @@
+  * Copyright (c) 1986 by Sun Microsystems, Inc.
+  */
+ 
++#ifndef _RPC_DES_H_
++#define _RPC_DES_H_
++
+ #define DES_MAXLEN 	65536	/* maximum # of bytes to encrypt  */
+ #define DES_QUICKLEN	16	/* maximum # of bytes to encrypt quickly */
+ 
+@@ -80,3 +83,5 @@ struct desparams {
+  * Software DES.
+  */
+ extern int _des_crypt( char *, int, struct desparams * );
++
++#endif
+-- 
+1.7.5.3
+
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
new file mode 100644
index 0000000..d94a585
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/remove-des-crypt.patch
@@ -0,0 +1,17 @@
+http://sourceforge.net/mailarchive/message.php?msg_id=27636466
+
+Upstream-Status: Backport
+
+Index: libtirpc-0.2.2/src/Makefile.am
+===================================================================
+--- libtirpc-0.2.2.orig/src/Makefile.am
++++ libtirpc-0.2.2/src/Makefile.am
+@@ -50,7 +50,7 @@ libtirpc_la_SOURCES = auth_none.c auth_u
+         rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
+         rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_generic.c \
+         svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
+-        auth_time.c auth_des.c authdes_prot.c des_crypt.c
++        auth_time.c auth_des.c authdes_prot.c
+ 
+ ## XDR
+ libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
deleted file mode 100644
index 6170e65..0000000
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Transport-Independent RPC library"
-DESCRIPTION = "Libtirpc is a port of Suns Transport-Independent RPC library to Linux"
-SECTION = "libs/network"
-PRIORITY = "optional"
-HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1c32c8e351f97e43e1ad6cf7f62de3bf \
-                    file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libtirpc/libtirpc-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "d77eb15f464bf9d6e66259eaf78b2a4e"
-SRC_URI[sha256sum] = "ea77cadd63941fc4edbee7863d2c7094e6a18263d2a2c8922319aee91352ff41"
-
-inherit autotools
-
-do_install_append() {
-	chown root:root ${D}${sysconfdir}/netconfig
-}
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
new file mode 100644
index 0000000..f1f66e3
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Transport-Independent RPC library"
+DESCRIPTION = "Libtirpc is a port of Suns Transport-Independent RPC library to Linux"
+SECTION = "libs/network"
+PRIORITY = "optional"
+HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
+                    file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
+PR = "r0"
+
+DEPENDS += "xz-native"
+PROVIDES = "virtual/librpc"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2;name=libtirpc \
+           ${GENTOO_MIRROR}/${PN}-glibc-nfs.tar.xz;name=glibc-nfs \
+           file://libtirpc-0.2.1-fortify.patch \
+           file://libtirpc-0.2.2-rpc-des-prot.patch \
+           file://remove-des-crypt.patch \
+          "
+SRC_URI[libtirpc.md5sum] = "74c41c15c2909f7d11d9c7bfa7db6273"
+SRC_URI[libtirpc.sha256sum] = "f05eb17c85d62423858b8f74512cfe66a9ae1cedf93f03c2a0a32e04f0a33705"
+SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
+SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+        cp -r ${S}/../tirpc ${S}
+}
+
+do_install_append() {
+        chown root:root ${D}${sysconfdir}/netconfig
+}
-- 
1.7.4.1



