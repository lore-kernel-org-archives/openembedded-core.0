Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web08.12507.1624892812097000653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 08:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MjSLka12;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id b2so19942193oiy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f1G6nP6XeF2dG5HjucgBlmLxUwJl8TS56DO/qCk3ptY=;
        b=MjSLka12pc5p+ZbbAmGvX4sRtzWjMCunGtmSGVPevUHVjCWrN+UlKbRlmnQWktYkMu
         t9g7RzWdzCZfSKLOwOI5giIT68ElrgInKxO/vz/6n/lISOhUD6Nahdk/CEya8PMNZshW
         UYcirWWTzvpSONCp8dP+jOmSllsZTxx0agvNwKeUU/fYTKqERIxSXJ6kXhbz/O5EADbs
         /rzksow9TqL6junRi2mzpNFINjyjNd+j3WrPQ/WCyNrFXUuDFgWkLfVqXPtcDHpTytNi
         BYRhzuSviTp6NU/8CZW95yESRt4NoeiIHNuuezWZ8Ms+Pe/NBnoihgQKbMiNhheSnON7
         jHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1G6nP6XeF2dG5HjucgBlmLxUwJl8TS56DO/qCk3ptY=;
        b=Qh4oepPJzLngxiDfrskhJ8q00mqU9qg9XjqKbof7giqb/m5ZBN/hED3j1CC26PFlzd
         nNftkivmRjiU30hAOQDRHyhl+QGN+bsNT2woO2QSdkaLXrTG8BUaRSaVSrnOZBFNxe4Y
         qidkh2coTeJe8Wsql53LAVEZrO0IlnXdGr5xt2HH3kF5/S6m2/Nbr2vD4ObGX4pEJsmC
         /qruOZ+3l53KSGzhZ37e6sLZDXqXBR54FxuY7waXlgk2chsxL/G9QVTfWpi5DQXsBLmt
         KRzgGczh3IdiuKFEB0J/EUx/VcHdTBiowmBDae8NlPI0Z2dlodQnWg6gdhzJLDXJJH/g
         Lehg==
X-Gm-Message-State: AOAM5318+JZWJ7Zt/UfY6q25K2IxKiR5iLwAP9hRaE8zUOvZyXng9AyK
	i9tBZViLbuP1Zz2k93bggte7dSKnPwmHlkgJLso=
X-Google-Smtp-Source: ABdhPJwqWnjELsmFxQMlSK4jJDAsTPPBhMmkCS9cIaV3HhuQPgCR8dui/hOmZdgOmUYVFCk7OVvIww==
X-Received: by 2002:aca:4f16:: with SMTP id d22mr5673752oib.44.1624892810654;
        Mon, 28 Jun 2021 08:06:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id c21sm2095892otp.8.2021.06.28.08.06.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 08:06:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] powertop: fix aclocal error too many loops
Date: Mon, 28 Jun 2021 05:05:28 -1000
Message-Id: <5a7e1e531d70eb41638c247b70791f2f3aea8793.1624892565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624892565.git.steve@sakoman.com>
References: <cover.1624892565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@intel.com>

Backport configure.ac patches to fix
aclocal: error: too many loops

Adds build dependency on autoconf-archive

References:
https://bugzilla.redhat.com/show_bug.cgi?id=1826935

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...2-configure.ac-ax_add_fortify_source.patch | 70 +++++++++++++++++++
 ...003-configure-Use-AX_REQUIRE_DEFINED.patch | 29 ++++++++
 meta/recipes-kernel/powertop/powertop_2.10.bb |  8 ++-
 3 files changed, 104 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/powertop/powertop/0002-configure.ac-ax_add_fortify_source.patch
 create mode 100644 meta/recipes-kernel/powertop/powertop/0003-configure-Use-AX_REQUIRE_DEFINED.patch

diff --git a/meta/recipes-kernel/powertop/powertop/0002-configure.ac-ax_add_fortify_source.patch b/meta/recipes-kernel/powertop/powertop/0002-configure.ac-ax_add_fortify_source.patch
new file mode 100644
index 0000000000..4ccbdbfcd1
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0002-configure.ac-ax_add_fortify_source.patch
@@ -0,0 +1,70 @@
+From 0d833743954ac1c58773cbf7a78fe0dc8105ae4a Mon Sep 17 00:00:00 2001
+From: Joe Konno <joe.konno@linux.intel.com>
+Date: Tue, 11 Feb 2020 14:15:42 -0800
+Subject: [PATCH] configure.ac: ax_add_fortify_source
+
+Use a maintained autoconf-archive macro to determine whether we need to
+add -D_FORTIFY_SOURCE=3D2, or if the underlying OS (or toolchain) has it
+baked in.
+
+Signed-off-by: Joe Konno <joe.konno@intel.com>
+
+Fixes:
+  aclocal: error: too many loops
+
+Upstream-Status: Backport from 2.12
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
+---
+ configure.ac                |  2 +-
+ m4/gcc_fortify_source_cc.m4 | 29 -----------------------------
+ 2 files changed, 1 insertion(+), 30 deletions(-)
+ delete mode 100644 m4/gcc_fortify_source_cc.m4
+
+diff --git a/configure.ac b/configure.ac
+index d6a15e1..d68369c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -36,7 +36,7 @@ AC_PROG_LIBTOOL
+ AC_PROG_CC
+ AC_PROG_INSTALL
+ AM_PROG_CC_C_O
+-GCC_FORTIFY_SOURCE_CC
++AX_ADD_FORTIFY_SOURCE
+ AX_CXX_COMPILE_STDCXX_11([noext], [mandatory])
+ 
+ # Checks for libraries.
+diff --git a/m4/gcc_fortify_source_cc.m4 b/m4/gcc_fortify_source_cc.m4
+deleted file mode 100644
+index 1206672..0000000
+--- a/m4/gcc_fortify_source_cc.m4
++++ /dev/null
+@@ -1,29 +0,0 @@
+-dnl GCC_FORTIFY_SOURCE_CC
+-dnl checks -D_FORTIFY_SOURCE with the C++ compiler, if it exists then
+-dnl updates CXXCPP
+-AC_DEFUN([GCC_FORTIFY_SOURCE_CC],[
+-  AC_LANG_ASSERT([C++])
+-  AS_IF([test "X$CXX" != "X"], [
+-    AC_MSG_CHECKING([for FORTIFY_SOURCE support])
+-    fs_old_cxxcpp="$CXXCPP"
+-    fs_old_cxxflags="$CXXFLAGS"
+-    CXXCPP="$CXXCPP -D_FORTIFY_SOURCE=2"
+-    CXXFLAGS="$CXXFLAGS -Werror"
+-    AC_COMPILE_IFELSE([
+-      AC_LANG_PROGRAM([[]], [[
+-        int main(void) {
+-        #if !(__GNUC_PREREQ (4, 1) )
+-        #error No FORTIFY_SOURCE support
+-        #endif
+-          return 0;
+-        }
+-      ]], [
+-        AC_MSG_RESULT([yes])
+-      ], [
+-        AC_MSG_RESULT([no])
+-        CXXCPP="$fs_old_cxxcpp"
+-      ])
+-    ])
+-    CXXFLAGS="$fs_old_cxxflags"
+-  ])
+-])
diff --git a/meta/recipes-kernel/powertop/powertop/0003-configure-Use-AX_REQUIRE_DEFINED.patch b/meta/recipes-kernel/powertop/powertop/0003-configure-Use-AX_REQUIRE_DEFINED.patch
new file mode 100644
index 0000000000..ac728f4a39
--- /dev/null
+++ b/meta/recipes-kernel/powertop/powertop/0003-configure-Use-AX_REQUIRE_DEFINED.patch
@@ -0,0 +1,29 @@
+From fbf74492236676e844b021b0dbb45b1ca43a0410 Mon Sep 17 00:00:00 2001
+From: David King <amigadave@amigadave.com>
+Date: Thu, 15 Apr 2021 11:45:13 +0100
+Subject: [PATCH] configure: Use AX_REQUIRE_DEFINED
+
+Require additional macros to be defined early, to avoid an aclocal
+"too many loops" error when copying macros.
+
+Upstream-Status: Backport from tip
+
+Signed-off-by: Tim Orling <ticotimo@gmail.com>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index d68369c..b90831b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29,6 +29,9 @@ AM_GNU_GETTEXT([external])
+ AM_GNU_GETTEXT_VERSION([0.18.2])
+ 
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
++AX_REQUIRE_DEFINED([AX_ADD_FORTIFY_SOURCE])
++AX_REQUIRE_DEFINED([AX_CXX_COMPILE_STDCXX])
++AX_REQUIRE_DEFINED([AX_PTHREAD])
+ # Checks for programs.
+ AC_PROG_CPP
+ AC_PROG_CXX
diff --git a/meta/recipes-kernel/powertop/powertop_2.10.bb b/meta/recipes-kernel/powertop/powertop_2.10.bb
index f1b0e92b2b..ffa3b4685c 100644
--- a/meta/recipes-kernel/powertop/powertop_2.10.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -2,13 +2,15 @@ SUMMARY = "Power usage tool"
 DESCRIPTION = "Linux tool to diagnose issues with power consumption and power management."
 HOMEPAGE = "https://01.org/powertop/"
 BUGTRACKER = "https://app.devzing.com/powertopbugs/bugzilla"
-DEPENDS = "ncurses libnl pciutils"
+DEPENDS = "ncurses libnl pciutils autoconf-archive"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
-    file://0001-wakeup_xxx.h-include-limits.h.patch \
-"
+           file://0001-wakeup_xxx.h-include-limits.h.patch \
+           file://0002-configure.ac-ax_add_fortify_source.patch \
+           file://0003-configure-Use-AX_REQUIRE_DEFINED.patch \
+           "
 SRCREV = "e8765b5475b22b7a2b6e9e8a031c68a268a0b0b3"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

