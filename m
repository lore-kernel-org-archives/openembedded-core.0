Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55565C433FE
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 08:25:29 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.3634.1653121527612477957
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 01:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UkDEa+na;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id g12so13248246edq.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 01:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7miLT0tjr1MWFfi98k0PQtuytDrXY1PvSc+JlGISceQ=;
        b=UkDEa+naXbbhmJ32FgJbWROC9xlxLpdd9z9OE1x7+2FNG/JwtsL+uhBI0WK5lSRfHX
         h/Hr7VZW+Od/bM3AAxsxovatPr3O8Q7nl5M5sV+wsCZIQgb949GrxrdG1mvt73KH74RM
         YQ5AmpTblpwiUDJAw4uutTnneAYZsQGoAFlaP2zen+iYMgNID5/LcYWXPmYc816YDbUB
         UVMXdJijGC56eqMGdqBfelkGC/gstDbzvy1bb5eKoi3jYo7PNgx57h8HJzOBm/6V6zQP
         a5surrAaZO1FuVip4TmJ9NQG4lLzcjyskPtHOLbHXCN5aZgeecf8BOpTJ4RYlfdhrgUB
         lCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7miLT0tjr1MWFfi98k0PQtuytDrXY1PvSc+JlGISceQ=;
        b=exZC5p0cGDmbkfOWZ5QmO2KrP/uHyChbd2kv9sdHRqWAWhykdmbFGtnkXW53Q6fk3g
         YiCyyYCtrf9dNJ8SUWCJm1vP/mhHWdESB80rjEp9YXrse6omu5Wro0xZKddIIRVpOMA9
         Gs63cpSp9yQQJilqh9b+ORttp++fIWz79bPkWHXM4gYviZGU4se412LFZKppbeH1jGgO
         t2mjPonxjrMynUcW/EjXEXiAxR8v2HVCUN+ZQ05CvoL5H1OhWGAUYC4C4tf8nLoh9g95
         +J6HtH2NH1Cg3LtxbuzvwTbdmLkze3P3+2rNVELXHqUp2tWEJyoE+Y0h65n1E7JMLeLo
         li2g==
X-Gm-Message-State: AOAM533tVsGrj7BgSvgponGJ/kRcgu1qiV+7OMwtFPMFb2D2mjC/gwDY
	9NeSrmZ8eXUZouW1RyYsvc2fSf4/f90=
X-Google-Smtp-Source: 
 ABdhPJybEQbQTqm5ks0fWaYSeuMKOVU0946BfLhr9lVmXYwfRGsZD8QgWX2EP9CJojc6BuyWjHtkyA==
X-Received: by 2002:a05:6402:3787:b0:42a:ea83:ad25 with SMTP id
 et7-20020a056402378700b0042aea83ad25mr14611167edb.233.1653121525820;
        Sat, 21 May 2022 01:25:25 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 v21-20020a17090651d500b006f3ef214e2asm4101438ejk.144.2022.05.21.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 01:25:25 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH v4 1/3] eudev: Convert dependencies to PACKAGECONFIG
Date: Sat, 21 May 2022 09:25:18 +0100
Message-Id: <20220521082520.5473-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 08:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165956

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
index a0a19e501d33..7e34d5b4758c 100644
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


