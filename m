Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF44F45A15
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 00:29:44 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.170405.1775867375037446474
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 17:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rmvX/e4T;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2d64c756111so1487777eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 17:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775867374; x=1776472174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rT3qBZsV0beuPzMaDZHV12TGnRj4VRxmsc4Kn9HxuI=;
        b=rmvX/e4TDdwdBpvIiY4bc1+p14/YHHPYqBXEAPdTjCcrjTDICGqTfmRFY3hMOA3cJO
         QfoATAq0L8Vf0gD7tcnnOIbP97v7W5XGuCziGnjfTY4vSyC+nLl5hJzuEE7BMlmxG1+T
         ED+hUvYUQKQq27W/pFp1H7KeBR3O2+/nofrqyNLbyrpD6Nht/xEamsoBAXwCCf994t8Z
         yXDizluvYUoi1YCYB5ELC7QLh92t9GEHvTLin28N67bh3kiHbjPP1vb8DL32WzbXUpMn
         aFg426Zs78NO+5jLpJ7m5A7xQLIQ92bZigL4tpxkDcPGOpVBiv6k40G9DP2xBG6Ihwed
         K2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775867374; x=1776472174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7rT3qBZsV0beuPzMaDZHV12TGnRj4VRxmsc4Kn9HxuI=;
        b=fl4rHjB3y/9dr9UCy+/I6gggQrQlWMGAHeanBXFXVOEx1gbZYKhYYVuRiidI1752Po
         cZ34KyR73/GVEKgP4dwUd2qk93IGKTd7ccOm/FzF5FQ83CKVZzdgULrbeMV1UFNdZu6Q
         EFw3vmG9MtkncdelJ+w9xkTR05PibKEqDtV6PmlyqxHqxcv+Ic2EPsORxlFazvTnZ+Pa
         /meFUJ0I6q8Sr5a3vApoC9Wi+qUohaM6JadE8WpIEtKKMOe4HpJfne3wCwkLwatbtA7f
         niDEaXaALJPv5DCVaeLUnyewC3kOkTv3pcD7WDrHN3cXHRvQwmQVW5K2wjvqOS1U0wV5
         dphA==
X-Gm-Message-State: AOJu0YyTUBLyrbLsB2Xvy7ox0msogdeBuC9z4qRDIeHSUiA7UZ1cAkyV
	w6lvs3FFeMT5PXtIzViJOVyjRimiPwkU4xVX5qR39uwL7cT1fQsOcjefsWa2q2SL
X-Gm-Gg: AeBDieuw/CzQkKhXSHcKZzYNg+Djnx7zMoWFwsTJPhgbHYyd7fxcdoYaWA+mA9osLqh
	MDsptR4YUECxgY1o0DyjAbr0diqQtdyJEnAf1d+S9r/YAoet/IgMejOwuY1vNI1dS/OKlgcOvio
	2BqOwUcyYrQRzsxdqAQJCiuovuCew6BbByFi0YWM4TrL9Q02VWvU6PrkDC7JO7wPQSsfpgehFAl
	VRjWm7MONECfn/p9/bsHmw0bdEvPTrgKLxILiE6B0U5Ox+642EVFB+75WTabbTZrht1QSIDXGQB
	N0JsXj4y8YV34nJzcFpY749i85O28ekovKAa4igIH7FOwojAgID2qAIzQfgFqcJAc8RYj20dZYi
	Ow4jzPFf4utKzabc9sg4GcpUcKQUC6nUp6k+B1Budpx6KlTMMgHctJYvrbXyNuDXiEuHoyBymbg
	vQ0uN9kIv/Om2Ak8CUcxzcXsYds6z9xho57iuN8LanZk7HGs+NwF0SqkVasmAlf2sZgRwWk5Rul
	7Y2/SHhTqDSmqY5xBO/zEe2otM5Q0dFAODnVXn0uHHRSNQiNzERTdoLli1g
X-Received: by 2002:a05:7300:6d03:b0:2c1:778:d897 with SMTP id 5a478bee46e88-2d5888a07c5mr3087695eec.21.1775867373968;
        Fri, 10 Apr 2026 17:29:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde70csm8258009eec.15.2026.04.10.17.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 17:29:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/4] bind: Fix build with std=gnu23
Date: Fri, 10 Apr 2026 17:29:27 -0700
Message-ID: <20260411002929.571805-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411002929.571805-1-khem.raj@oss.qualcomm.com>
References: <20260411002929.571805-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 00:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235041

This does not build on hosts with gcc <= 13 which does not have std=gnu23
dialect option e.g. ubuntu 24.04, especially with clang which does not
default to gnu23 yet like gcc-15, so autoconf 2.73 decided to enforce the
standard with clang which then spills into CC_FOR_BUILD as well without
this patch

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...kport-ax_prog_cc_for_build.m4-macros.patch | 182 ++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.20.20.bb |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch

diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
new file mode 100644
index 0000000000..7279a73e87
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -0,0 +1,182 @@
+From 77f8fafab0cc91c3ad8fbf1382b1d0f2d2cd99a6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 10 Apr 2026 23:33:49 +0000
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
+ m4/ax_prog_cc_for_build.m4 | 80 +++++++++++++++++++++++---------------
+ 1 file changed, 49 insertions(+), 31 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 5168ae4..4d1de99 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -1,5 +1,3 @@
+-# SPDX-License-Identifier: FSFAP
+-#
+ # ===========================================================================
+ #   https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
+ # ===========================================================================
+@@ -34,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 20
++#serial 26
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+@@ -45,16 +43,16 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl
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
+@@ -62,9 +60,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl
+ pushdef([GCC], GCC_FOR_BUILD)dnl
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
+-pushdef([EXEEXT], BUILD_EXEEXT)dnl
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
+-pushdef([OBJEXT], BUILD_OBJEXT)dnl
+ pushdef([host], build)dnl
+ pushdef([host_alias], build_alias)dnl
+ pushdef([host_cpu], build_cpu)dnl
+@@ -79,6 +75,32 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
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
+@@ -87,25 +109,14 @@ AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
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
+@@ -122,9 +133,7 @@ popdef([host_vendor])dnl
+ popdef([host_cpu])dnl
+ popdef([host_alias])dnl
+ popdef([host])dnl
+-popdef([OBJEXT])dnl
+ popdef([LDFLAGS])dnl
+-popdef([EXEEXT])dnl
+ popdef([CPPFLAGS])dnl
+ popdef([CFLAGS])dnl
+ popdef([GCC])dnl
+@@ -132,25 +141,34 @@ popdef([CPP])dnl
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
+-dnl ac_link, ac_compiler_gnu (dependant on the current
++dnl ac_link, ac_compiler_gnu (dependent on the current
+ dnl language after popping):
+ AC_LANG_POP([C])
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
diff --git a/meta/recipes-connectivity/bind/bind_9.20.20.bb b/meta/recipes-connectivity/bind/bind_9.20.20.bb
index b42c109105..dd51c3a808 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.20.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.20.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
 SRC_URI[sha256sum] = "19b8335d25305231d5eb8f7d924240d1ac97c4da7c93eaa6273503133aa6106a"

