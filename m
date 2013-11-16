Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id E5A636DA11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 01:22:13 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id d51so1409637eek.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 17:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PmOE7BWj1VcZI80Qc60PMTn4xIFYLFXex0G0P57Hik0=;
	b=S952RNWugjcsBQghMnKQDhghrZuW1fYoMm218+aNGDgI5RmJJ8YOx+eDjvsnfwnmh+
	OxOnOdhnjYxqd0VWlVnzhjOgQpsnYpO+fLT4kk5BaKl3yfniBQBOSj640CjvSvoz65dE
	6PhLed3U00SIw3QQxbGz6r/4odb2VPe/So9Sgoss5u86YzDBTCZ9pfU+5CcF9fAuajdE
	Vd3USk0C1Iir6vgb13wfbOGPdk5IcU61IoxeRif20PkFZmafT6C8W2rYZL33SW1As2mk
	JCPkPqF+LKrBfmfwcYXmLQU7SIy/k0S1Tsr6KXWcL099F1W15z0Ru+LvX8kNJB6OPwOy
	ANRg==
X-Received: by 10.14.176.195 with SMTP id b43mr2178234eem.141.1384564935200;
	Fri, 15 Nov 2013 17:22:15 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z1sm11568764eeo.14.2013.11.15.17.22.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 17:22:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2013 02:22:39 +0100
Message-Id: <1384564959-21233-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] nfs-utils: Add new option to disable nfsidmap and PACKAGECONFIG for that
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
X-List-Received-Date: Sat, 16 Nov 2013 01:22:15 -0000

* it's autodetecting keyutils from meta-ivi

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...gure-Allow-to-explicitly-disable-nfsidmap.patch | 43 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.9.bb                   |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
new file mode 100644
index 0000000..7025fb5
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure-Allow-to-explicitly-disable-nfsidmap.patch
@@ -0,0 +1,43 @@
+From 9b84cff305866abd150cf1a4c6e7e5ebf8a7eb3a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 15 Nov 2013 23:21:35 +0100
+Subject: [PATCH] configure: Allow to explicitly disable nfsidmap
+
+* keyutils availability is autodetected and builds aren't reproducible
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index bf433d6..28a8f62 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -69,6 +69,12 @@ AC_ARG_ENABLE(nfsv4,
+ 	AC_SUBST(enable_nfsv4)
+ 	AM_CONDITIONAL(CONFIG_NFSV4, [test "$enable_nfsv4" = "yes"])
+ 
++AC_ARG_ENABLE(nfsidmap,
++        [AC_HELP_STRING([--enable-nfsidmap],
++                        [enable support for NFSv4 idmapper @<:@default=yes@:>@])],
++        enable_nfsidmap=$enableval,
++        enable_nfsidmap=yes)
++
+ AC_ARG_ENABLE(nfsv41,
+ 	[AC_HELP_STRING([--enable-nfsv41],
+                         [enable support for NFSv41 @<:@default=yes@:>@])],
+@@ -296,7 +302,7 @@ fi
+ 
+ dnl enable nfsidmap when its support by libnfsidmap
+ AM_CONDITIONAL(CONFIG_NFSDCLTRACK, [test "$enable_nfsdcltrack" = "yes" ])
+-AM_CONDITIONAL(CONFIG_NFSIDMAP, [test "$ac_cv_header_keyutils_h$ac_cv_lib_nfsidmap_nfs4_owner_to_uid" = "yesyes"])
++AM_CONDITIONAL(CONFIG_NFSIDMAP, [test "$enable_nfsidmap$ac_cv_header_keyutils_h$ac_cv_lib_nfsidmap_nfs4_owner_to_uid" = "yesyesyes"])
+ 
+ 
+ if test "$knfsd_cv_glibc2" = no; then
+-- 
+1.8.4.3
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
index 9fa972c..ea49146 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
@@ -13,6 +13,7 @@ RDEPENDS_${PN} = "rpcbind"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.bz2 \
+           file://0001-configure-Allow-to-explicitly-disable-nfsidmap.patch \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-sm-notify-res_init.patch \
            file://nfsserver \
@@ -54,6 +55,7 @@ EXTRA_OECONF = "--with-statduser=nobody \
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
+PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
 
 INHIBIT_AUTO_STAGE = "1"
 
-- 
1.8.4.3


