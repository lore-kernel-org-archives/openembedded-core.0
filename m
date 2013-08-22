Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFE661EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 04:31:55 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so1263801pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 21:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eKWbkvj7AhPcGW7aNXy4K3Yv/Ubxz+yax3RLgyDTU5A=;
	b=liX8Z7Wx8VF1yZbU1qK5UOf+jUjO3i51BHG/Qu7n1EUozx6P3rNsq4UeoyeVWAtiAr
	cPKwDL3muRfekkQatkhNeaUAYX5xri7/+ybYkY+Dx+T2NQ+LfjzdmxfShUlqslXkTr4B
	Z8zUddxsCC1Xfvrp+8vpXya5JAtTlH6NfRxVgFdtgri7aF+5sTdLQqbdfzwwb0of2Riq
	7YH/LtilZZk9W5tSFuYveTA2nDnKCuYOTsevkxzDUXVRJHsITnO0mPtun5Gx/Bk3uCzn
	zK4Hp9+CARK1J0W3gzfsob6vd94vf6+/qxo3FkUhCKLLEc+QxwIOTXn9u1rSkTvg5JxS
	/bsQ==
X-Received: by 10.68.236.168 with SMTP id uv8mr3273904pbc.124.1377145916686;
	Wed, 21 Aug 2013 21:31:56 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	hx1sm12017781pbb.35.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 21:31:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 21:31:14 -0700
Message-Id: <39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1377145501.git.raj.khem@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] kmod: Upgrade to version 14
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
X-List-Received-Date: Thu, 22 Aug 2013 04:31:55 -0000

The update is a requirement for systemd-206

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb        |  1 -
 meta/recipes-kernel/kmod/kmod.inc                  |  9 ++++----
 ...-man-page-generation-because-we-don-t-hav.patch | 26 ----------------------
 .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        | 16 ++++++-------
 meta/recipes-kernel/kmod/kmod_git.bb               |  3 +--
 5 files changed, 13 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index 8cbcdf8..afa3ad0 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -4,7 +4,6 @@
 require kmod.inc
 inherit native
 
-PR = "${INC_PR}.1"
 SRC_URI += "file://fix-undefined-O_CLOEXEC.patch"
 
 do_install_append (){
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index a780b6c..1728a4e 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -7,8 +7,6 @@ HOMEPAGE = "http://packages.profusion.mobi/kmod/"
 LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
-PV = "9"
-INC_PR = "r0"
 
 DEPENDS += "pkgconfig-native"
 
@@ -19,17 +17,18 @@ inherit autotools gtk-doc ptest
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
-           file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
            file://run-ptest \
            file://ptest.patch \
           "
 
-SRCREV = "62081c0f68905b22f375156d4532fd37fa5c8d33"
+SRCREV = "3b38c7fcb58be4ddc34f90454c5f5dc3693d2d85"
+# Lookout for PV bump too when SRCREV is changed
+PV = "14"
 
 S = "${WORKDIR}/git"
 
 EXTRA_AUTORECONF += "--install --symlink"
-EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools"
+EXTRA_OECONF +="--enable-debug --enable-logging --enable-tools --disable-manpages"
 
 do_configure_prepend () {
         gtkdocize --docdir ${S}/libkmod/docs || touch ${S}/libkmod/docs/gtk-doc.make
diff --git a/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch b/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
deleted file mode 100644
index 5361b84..0000000
--- a/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because-we-don-t-hav.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ce6f0cabb65e67dd4d31e1e555db8bc6eaf435d3 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 24 Feb 2012 07:35:38 +0100
-Subject: [PATCH] man: disable man page generation because we don't have
- working xsltproc
-
-Upstream-Status: Inappropriate [build system specific change]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 141c102..a8bdfd1 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = . libkmod/docs man
-+SUBDIRS = . libkmod/docs
- 
- DISTCLEAN_LOCAL_HOOKS =
- EXTRA_DIST =
--- 
-1.7.8.4
-
diff --git a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
index 3177e9a..0268216 100644
--- a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
+++ b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
@@ -2,16 +2,16 @@ Upstream-Status: Not applicable
 
 Index: git/libkmod/libkmod-private.h
 ===================================================================
---- git.orig/libkmod/libkmod-private.h
-+++ git/libkmod/libkmod-private.h
-@@ -1,6 +1,10 @@
- #ifndef _LIBKMOD_PRIVATE_H_
- #define _LIBKMOD_PRIVATE_H_
+--- git.orig/libkmod/libkmod-private.h	2013-08-21 10:07:51.000000000 -0700
++++ git/libkmod/libkmod-private.h	2013-08-21 14:34:04.558278849 -0700
+@@ -9,6 +9,10 @@
+ #include "macro.h"
+ #include "libkmod.h"
  
 +#ifndef O_CLOEXEC
 +# define O_CLOEXEC 0
 +#endif
 +
- #include <stdbool.h>
- #include <stdio.h>
- #include <syslog.h>
+ static _always_inline_ _printf_format_(2, 3) void
+ 	kmod_log_null(struct kmod_ctx *ctx, const char *format, ...) {}
+ 
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index f92ff72..b07c06e 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -3,8 +3,7 @@
 
 require kmod.inc
 
-PR = "${INC_PR}.0"
-PV = "9+git${SRCPV}"
+PV_append = "+git${SRCPV}"
 
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
-- 
1.8.3.4


