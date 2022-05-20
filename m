Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99176C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 19:58:19 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.1985.1653076696400877180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:58:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C/nH2t7O;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id er5so12025283edb.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+e/XqXDfjExDopXLGWD04KnJCyNhbfHNacVfHImYRvU=;
        b=C/nH2t7Ogb1kYh4B/PrWX0s4MrqsdgAcmzGr1bghtyPvLwHc8IOd5c3A6TeL/vJON0
         vppTFXfWJjn2YH+Ax3WK6Dq6R/zHJ6nyjHFB+7LV6sj4TeWGSJ3d/r1wf2H6kBELUX1H
         rJ4eprzvfpXkZq7mDsXaLVvm6O/J+GcKSOxOU5TaJe9v1VxQhrTJXym8UTFyWsS/5JJf
         7tKtZWEZIVHmDkc5ezLDdtKkeGYK3Q53xiICAlC9MlKvoENJtH9KjfOJahJ326ZqGN/n
         t73+HofOFrJCKVuWQgZbyVwk1ljTWJRG/fNcW6WLKPcibxaIrT0bT1Vo+/ikHejIjjrl
         F3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+e/XqXDfjExDopXLGWD04KnJCyNhbfHNacVfHImYRvU=;
        b=wz4IVjeRub17iWc9lK8X7DQF8alT9ojDnEc8Iqq3bCIu7h6JIlApy8qMxBij1Cp8Ct
         AadKz2fRMABLqNviEut3ntXd+TpHIWTRVoiEuNxZVxoTHuKeL7LgddXUP/22smQ+Smx0
         fNKOv7PsaJixTXu2woxZQQfG3U7CYAfugsMqTf3BMdrSkdiw7wcRqvCmDhBDEebg01rW
         e93SZafBf2BHMLAOXyrbO62Vppfiz5VUSEsrZjZOhBfV/+Lqv/dKs9IdkyLUkswmb7vX
         TDvbJUxJp7tjsjJWb5b/naiH9kpIa+ZBSFp+7f0GUBGmwkCcFlgeYxeAjOoCxM55mqeR
         zvmQ==
X-Gm-Message-State: AOAM531tviLbmsa0ItbjD+bmvsvIrbTiurBwpcsPibaUvyA//HXltQuI
	zkIkto5gm4wb/Ut56On1Fs94B/gsmX8=
X-Google-Smtp-Source: 
 ABdhPJwkuLXgMTElsf/YuIvstfE5hjxbtWVWMRJYRTVBxON0gj/IpPgVJX9qa+rkvwfhh2hepqeLmQ==
X-Received: by 2002:aa7:dbd0:0:b0:427:4e6e:d779 with SMTP id
 v16-20020aa7dbd0000000b004274e6ed779mr12624477edt.27.1653076694426;
        Fri, 20 May 2022 12:58:14 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 gx5-20020a1709068a4500b006f3ef214de6sm3448448ejc.76.2022.05.20.12.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 12:58:13 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH v3 1/3] eudev: Convert dependencies to PACKAGECONFIG
Date: Fri, 20 May 2022 20:58:07 +0100
Message-Id: <20220520195809.4855-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 19:58:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165950

GObject support was dropped in 252150e181c5 ("src/gudev: remove Gobject
libudev support."), drop all g-i-r support which appears to be dead
upstream.

Fill out PACKAGECONFIG options.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...uild-Remove-dead-g-i-r-configuration.patch | 155 ++++++++++++++++++
 meta/recipes-core/udev/eudev_3.2.11.bb        |   8 +-
 2 files changed, 161 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/udev/eudev/0001-build-Remove-dead-g-i-r-configuration.patch

diff --git a/meta/recipes-core/udev/eudev/0001-build-Remove-dead-g-i-r-configuration.patch b/meta/recipes-core/udev/eudev/0001-build-Remove-dead-g-i-r-configuration.patch
new file mode 100644
index 000000000000..2836f30c3adf
--- /dev/null
+++ b/meta/recipes-core/udev/eudev/0001-build-Remove-dead-g-i-r-configuration.patch
@@ -0,0 +1,155 @@
+From 520c4d451efc488573746f169d8e47d5a131afc2 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 20 May 2022 09:35:08 +0100
+Subject: [PATCH] build: Remove dead g-i-r configuration
+
+g-i-r support was removed in 2015 as part of removal of Gobject libudev
+support, but the autoconf support wasn't removed but is dead.
+
+Fixes: 252150e181c5 ("src/gudev: remove Gobject libudev support.")
+Upstream-Status: Submitted [https://github.com/eudev-project/eudev/pull/231]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alex.kiernan@zuma.ai>
+---
+ configure.ac        | 12 ------
+ m4/introspection.m4 | 96 ---------------------------------------------
+ 2 files changed, 108 deletions(-)
+ delete mode 100644 m4/introspection.m4
+
+diff --git a/configure.ac b/configure.ac
+index 85a524a618ae..987d5037ae77 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -183,17 +183,8 @@ AC_SUBST([udevrulesdir],[${udevlibexecdir}/rules.d])
+ AC_SUBST([pkgconfiglibdir], [${libdir}/pkgconfig])
+ AC_SUBST([sharepkgconfigdir],[${datadir}/pkgconfig])
+ 
+-# introspection paths
+-AC_SUBST([girdir], [${datadir}/gir-1.0])
+-AC_SUBST([typelibsdir], [${libdir}/girepository-1.0])
+-
+ AC_SUBST([rootrundir],[${with_rootrundir}])
+ 
+-# ------------------------------------------------------------------------------
+-
+-GOBJECT_INTROSPECTION_CHECK([1.31.1])
+-AM_CONDITIONAL([HAVE_INTROSPECTION], [test "$enable_introspection" = "yes"])
+-
+ # ------------------------------------------------------------------------------
+ AC_ARG_ENABLE([programs],
+ 	AS_HELP_STRING([--disable-programs], [disable programs (udevd, udevadm and helpers)]),
+@@ -349,9 +340,6 @@ AC_MSG_RESULT([
+ 
+ 	pkgconfiglibdir:         ${libdir}/pkgconfig
+ 	sharepkgconfigdir        ${datadir}/pkgconfig
+-
+-	girdir                   ${datadir}/gir-1.0
+-	typelibsdir              ${libdir}/girepository-1.0
+ ])
+ 
+ # ------------------------------------------------------------------------------
+diff --git a/m4/introspection.m4 b/m4/introspection.m4
+deleted file mode 100644
+index d89c3d907d9c..000000000000
+--- a/m4/introspection.m4
++++ /dev/null
+@@ -1,96 +0,0 @@
+-dnl -*- mode: autoconf -*-
+-dnl Copyright 2009 Johan Dahlin
+-dnl
+-dnl This file is free software; the author(s) gives unlimited
+-dnl permission to copy and/or distribute it, with or without
+-dnl modifications, as long as this notice is preserved.
+-dnl
+-
+-# serial 1
+-
+-m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
+-[
+-    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
+-    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
+-    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
+-
+-    dnl enable/disable introspection
+-    m4_if([$2], [require],
+-    [dnl
+-        enable_introspection=yes
+-    ],[dnl
+-        AC_ARG_ENABLE(introspection,
+-                  AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
+-                                 [Enable introspection for this build]),, 
+-                                 [enable_introspection=auto])
+-    ])dnl
+-
+-    AC_MSG_CHECKING([for gobject-introspection])
+-
+-    dnl presence/version checking
+-    AS_CASE([$enable_introspection],
+-    [no], [dnl
+-        found_introspection="no (disabled, use --enable-introspection to enable)"
+-    ],dnl
+-    [yes],[dnl
+-        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
+-                         AC_MSG_ERROR([gobject-introspection-1.0 is not installed]))
+-        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
+-                         found_introspection=yes,
+-                         AC_MSG_ERROR([You need to have gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
+-    ],dnl
+-    [auto],[dnl
+-        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1], found_introspection=yes, found_introspection=no)
+-	dnl Canonicalize enable_introspection
+-	enable_introspection=$found_introspection
+-    ],dnl
+-    [dnl	
+-        AC_MSG_ERROR([invalid argument passed to --enable-introspection, should be one of @<:@no/auto/yes@:>@])
+-    ])dnl
+-
+-    AC_MSG_RESULT([$found_introspection])
+-
+-    INTROSPECTION_SCANNER=
+-    INTROSPECTION_COMPILER=
+-    INTROSPECTION_GENERATE=
+-    INTROSPECTION_GIRDIR=
+-    INTROSPECTION_TYPELIBDIR=
+-    if test "x$found_introspection" = "xyes"; then
+-       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+-       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+-       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
+-       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+-       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+-    fi
+-    AC_SUBST(INTROSPECTION_SCANNER)
+-    AC_SUBST(INTROSPECTION_COMPILER)
+-    AC_SUBST(INTROSPECTION_GENERATE)
+-    AC_SUBST(INTROSPECTION_GIRDIR)
+-    AC_SUBST(INTROSPECTION_TYPELIBDIR)
+-    AC_SUBST(INTROSPECTION_CFLAGS)
+-    AC_SUBST(INTROSPECTION_LIBS)
+-    AC_SUBST(INTROSPECTION_MAKEFILE)
+-
+-    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" = "xyes")
+-])
+-
+-
+-dnl Usage:
+-dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
+-
+-AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
+-[
+-  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
+-])
+-
+-dnl Usage:
+-dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
+-
+-
+-AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
+-[
+-  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
+-])
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 841039f6d745..a841a6a86cc1 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -5,13 +5,14 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:libudev = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod util-linux"
+DEPENDS = "gperf-native"
 
 PROVIDES = "udev"
 
 SRC_URI = "https://github.com/eudev-project/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://init \
            file://local.rules \
+           file://0001-build-Remove-dead-g-i-r-configuration.patch \
 "
 
 SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b"
@@ -30,11 +31,14 @@ EXTRA_OECONF = " \
     --with-rootprefix= \
 "
 
-PACKAGECONFIG ?= "hwdb \
+PACKAGECONFIG ?= "blkid hwdb kmod \
                   ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
 "
+PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-linux"
 PACKAGECONFIG[hwdb] = "--enable-hwdb,--disable-hwdb"
+PACKAGECONFIG[kmod] = "--enable-kmod,--disable-kmod,kmod"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages"
+PACKAGECONFIG[rule-generator] = "--enable-rule-generator,--disable-rule-generator"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
 do_install:append() {
-- 
2.35.1


