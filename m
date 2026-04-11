Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBE1F45A14
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 00:29:34 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.170825.1775867373822805331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 17:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mNNiwVPc;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2cf1646bd11so4696011eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 17:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775867373; x=1776472173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r7uPs32EEmv5bOXSweqZzAokE00l1c+/2/Zb2ky4HCQ=;
        b=mNNiwVPcXeWkCCdclyOPYbg0joXBzTaj80lzJjYe1/Ebbs3cMf0na+a2D47Zg5tN5Z
         adFUgv58159YZE+WqvtaxDdi1FsJMW3WPkmr+7g+nCl+wQIleq/vWO7xAGIbBmsWR9mT
         Ht+J8jx3Jhroheq8NDiXai1yLRW59+cIHqdANupa3zZKz/N+tr7ATcDzKFgP5a7tlNRN
         LYBf8wUrFs/9erEaeO1K+D2O/s6QIi2zkkFsG8tyOhNw9xO9h1rJsmvA+rLqUs6I7+SZ
         f3o9sHQ17+Y5g6IHFNevUjhmYtSU7LCw0RTzj9K4AhTQZev0DyHzng/SATIjSmbNt3L1
         0x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775867373; x=1776472173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7uPs32EEmv5bOXSweqZzAokE00l1c+/2/Zb2ky4HCQ=;
        b=jSVc2MC2INZyj7LP2CLDLtcHOPpPvFqsPmRLlJLwj6pk0f+1SQ9Dlwcxrd5CXV/biw
         b2u1y88zFSU1X/CMahwz8/tkAdT2mNFvkEoNyPS3k43jpoFLV1hjZnOFMSfYM/aCp/7c
         jJckTSZSbHBWKZrbnRG+INP+VBgqZsw8JGLh4KRVZQadm6ul50Q3oY6lf0YOp2dtDVxF
         zHfPCa+iKRRb1egCkeQDjjARJf099Fm0cGhoyVqH6AWTFfjpbU7/Xv41oJI2Ib6qooSo
         6odQZJzJf8jT0R7DTJDJOxKmV5jhj2Qf+QNTdZT7NZgJlpO/bAn+uBmlZB5LTo1aH1MJ
         8gkg==
X-Gm-Message-State: AOJu0YyKqRAyrheiuU79qC1BbHO0YjHeTCPswzyRRR+TXLTYTubP6BQH
	inRCpWsMqpeMUkMQwPdfCH9tF/mKDvMRd6naiqiCsnCcCkZDEIvFmmLDwtfCsCMO
X-Gm-Gg: AeBDiesNG/OAOtqPyTZmlpowQe8pHnGUqMtQfEzS9Hw9No2uDKWfcEo4B0CBbst5rrG
	8ob8e0ejSaD/de2QO+MKrEEL/8ObjPtyX1SWct6cOOaZ2+N9SAG/oRdNEfp9z36R0Zn10QJjDuH
	LVjq2Zn8q7RAMwTQ0L3Efs8Y9NyqgjK/WvrFjjlw/9tyWyoBpRk0RWjAVzYdhINx3M29kXrngM1
	HW1XUgpuyH9+acK2Sdw5ixnbbiQa/JDxMhQ6l5wjKSL+nmTRCENkhwm4UA78e2zoaQGt6BvdBbs
	JGOysFJi0eKId9l6jNE7S39Ng3lAbk9UfY7AwiGuPX+gGhfVufQkcrGQ8A7k+gz1f/1RmF2RPTa
	JDkFJi0FMDnYWIsLeNPgvWeUKbSNJLPO27kcnn26SPfTAEUKx2r+bHdgVbL/kp7jwSnKokzm/uh
	pPExwHkGyuOulA29G2IgSqllcBIlZ4SYZDpCS7r71Y/pUV7r3FEDJ0nPYy2NA7RCbZ94H40uhaq
	g/Q5amkZjmCzGJpT17GydmJE6BCXUtFL5lJvVO+9X8XbawQsodB4auRhojbsluBat307iA=
X-Received: by 2002:a05:7300:8606:b0:2d3:9c91:6c49 with SMTP id 5a478bee46e88-2d58ab831acmr3060399eec.30.1775867372696;
        Fri, 10 Apr 2026 17:29:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde70csm8258009eec.15.2026.04.10.17.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 17:29:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/4] sudo: Fix build with std=gnu23
Date: Fri, 10 Apr 2026 17:29:26 -0700
Message-ID: <20260411002929.571805-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 00:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235040

This does not build on hosts with gcc <= 13 which does not have std=gnu23
dialect option e.g. ubuntu 24.04, especially with clang which does not
default to gnu23 yet like gcc-15, so autoconf 2.73 decided to enforce the
standard with clang which then spills into CC_FOR_BUILD as well without
this patch

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...kport-ax_prog_cc_for_build.m4-macros.patch | 174 ++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch

diff --git a/meta/recipes-extended/sudo/files/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-extended/sudo/files/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
new file mode 100644
index 0000000000..df6deed591
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -0,0 +1,174 @@
+From f1ce0cf393a13dff1b42955ade1e9ad11155cc23 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 10 Apr 2026 23:22:38 +0000
+Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
+
+autoconf-2.73 has logic to use C23 which spills into CC_FOR_BUILD [1]
+Bring back the upstream fix from autoconf-archives, this should not
+be needed when sudo is updated to next version as it might have
+regenerated its autotools files and it would have it.
+
+[1] https://savannah.gnu.org/support/index.php?111401
+
+Upstream-Status: Inappropriate [Already in autoconf-archive ]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 76 ++++++++++++++++++++++++--------------
+ 1 file changed, 48 insertions(+), 28 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 33eaa38..4d1de99 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -32,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 21
++#serial 26
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+@@ -43,16 +43,16 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+ dnl Use the standard macros, but make them use other variable names
+ dnl
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
+ pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
+ pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
+ pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
+-pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+-pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl
+-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
+-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+@@ -60,9 +60,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl
+ pushdef([GCC], GCC_FOR_BUILD)dnl
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
+-pushdef([EXEEXT], BUILD_EXEEXT)dnl
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
+-pushdef([OBJEXT], BUILD_OBJEXT)dnl
+ pushdef([host], build)dnl
+ pushdef([host_alias], build_alias)dnl
+ pushdef([host_cpu], build_cpu)dnl
+@@ -77,6 +75,32 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
+ pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
+ pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
+ pushdef([cross_compiling], cross_compiling_build)dnl
++dnl
++dnl These variables are problematic to rename by M4 macros, so we save
++dnl their values in alternative names, and restore the values later.
++dnl
++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
++dnl variables. It's not a good idea to rename ac_cv_exeext and
++dnl ac_cv_objext either as they're related.
++dnl Renaming ac_exeext and ac_objext is safe though.
++dnl
++ac_cv_host_exeext=$ac_cv_exeext
++AS_VAR_SET_IF([ac_cv_build_exeext],
++  [ac_cv_exeext=$ac_cv_build_exeext],
++  [AS_UNSET([ac_cv_exeext])])
++ac_cv_host_objext=$ac_cv_objext
++AS_VAR_SET_IF([ac_cv_build_objext],
++  [ac_cv_objext=$ac_cv_build_objext],
++  [AS_UNSET([ac_cv_objext])])
++dnl
++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
++dnl AC_PROG_CC) indirectly.
++dnl
++ac_cv_host_c_compiler_gnu=$ac_cv_c_compiler_gnu
++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
++  [ac_cv_c_compiler_gnu=$ac_cv_build_c_compiler_gnu],
++  [AS_UNSET([ac_cv_c_compiler_gnu])])
+ 
+ cross_compiling_build=no
+ 
+@@ -85,25 +109,14 @@ AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
+       [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
+ 
+ AC_LANG_PUSH([C])
+-
+-dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover
+-dnl the use of this variable in _AC_LANG_COMPILER_GNU called by
+-dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.
+-was_set_c_compiler_gnu=${[ac_cv_c_compiler_gnu]+y}
+-AS_IF([test ${was_set_c_compiler_gnu}],
+-    [saved_c_compiler_gnu=$[ac_cv_c_compiler_gnu]
+-    AS_UNSET([[ac_cv_c_compiler_gnu]])])
+-
+ AC_PROG_CC
+-
+-dnl Restore ac_cv_c_compiler_gnu
+-AS_IF([test ${was_set_c_compiler_gnu}],
+-  [[ac_cv_c_compiler_gnu]=$[saved_c_compiler_gnu]])
+-
+ _AC_COMPILER_EXEEXT
+ _AC_COMPILER_OBJEXT
+ AC_PROG_CPP
+ 
++BUILD_EXEEXT=$ac_cv_exeext
++BUILD_OBJEXT=$ac_cv_objext
++
+ dnl Restore the old definitions
+ dnl
+ popdef([cross_compiling])dnl
+@@ -120,9 +133,7 @@ popdef([host_vendor])dnl
+ popdef([host_cpu])dnl
+ popdef([host_alias])dnl
+ popdef([host])dnl
+-popdef([OBJEXT])dnl
+ popdef([LDFLAGS])dnl
+-popdef([EXEEXT])dnl
+ popdef([CPPFLAGS])dnl
+ popdef([CFLAGS])dnl
+ popdef([GCC])dnl
+@@ -130,15 +141,24 @@ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
+-popdef([ac_cv_objext])dnl
+-popdef([ac_cv_exeext])dnl
+-popdef([ac_cv_c_compiler_gnu])dnl
++popdef([ac_prog_cc_stdc])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_cv_prog_cc_c23])dnl
++popdef([ac_cv_prog_cc_c11])dnl
++popdef([ac_cv_prog_cc_c99])dnl
+ popdef([ac_cv_prog_cc_c89])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
++dnl
++ac_cv_exeext=$ac_cv_host_exeext
++EXEEXT=$ac_cv_host_exeext
++ac_cv_objext=$ac_cv_host_objext
++OBJEXT=$ac_cv_host_objext
++ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
++ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
+ 
+ dnl restore global variables ac_ext, ac_cpp, ac_compile,
+ dnl ac_link, ac_compiler_gnu (dependent on the current
+@@ -147,8 +167,8 @@ AC_LANG_POP([C])
+ 
+ dnl Finally, set Makefile variables
+ dnl
+-AC_SUBST(BUILD_EXEEXT)dnl
+-AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([BUILD_EXEEXT])dnl
++AC_SUBST([BUILD_OBJEXT])dnl
+ AC_SUBST([CFLAGS_FOR_BUILD])dnl
+ AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
+ AC_SUBST([LDFLAGS_FOR_BUILD])dnl
diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 3a5c111961..d6ee881f8c 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
+		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"

