Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD07F45A17
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 00:29:44 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.170406.1775867376047416129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 17:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=id8rMGip;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2d17b8fbedaso1175002eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 17:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775867375; x=1776472175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsySCFgP3KszW0hpZP+9+68hgZ0LIrrU6/R7y0is69k=;
        b=id8rMGipRAmFOHplQ92VzqEpfLKgJadmh1GxOSxhuCNLVghziSOJ+OlbQVVvws3wwq
         l6GiMIxp3tmWoO4aTG1nFurq6wlhGA9l2DpFuf+kUutQkjvx+QPvMGChxW6XzlqLGoBE
         dNOYMtyDKqEeh+82hg5h7iQSr0dX0PhkYmTX/nciFjE6RHmc7kJkhw29/Er3SPTx9dTm
         sF+miLGJzwmTUcqm4M6XFUJHEV06uMhTVFwocg80PK7ZTMh7SdJwfd+/FXmXIvplmihV
         AhDSw97lLkNY/BHikOLjvVxmAv3oeSMv4cVRcLS4KOwSLpwTmNIO7xDd1cjvs9vTVjjm
         O4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775867375; x=1776472175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MsySCFgP3KszW0hpZP+9+68hgZ0LIrrU6/R7y0is69k=;
        b=sMORBrcoNnF/eA9d8y2eaKhg9viSn3FxwyD8m+LklW+uaEpQRno7AbSProjEedPHFD
         pEj97YAa/WSkJK07/pfuHa9L2CLFmoGjzdcWx87AvWciTKuvS9NzKHlWIZF+gpPzlLCr
         fICGNyAviP37QtcVlFSgQIyIeZY1efokZCumEwaB8XeJokrveyG+EMJjUVte6puyraHQ
         Hv12xL90b1pRFCL31lc5CtitDmqRjSYlob951TgA7PC+Z/vlQDFV38DPJawLfxRk9m3A
         r3DtG+c0Pbb+eHRaYITyTAANdjwmrIwMo0LPDPL/xDB3lKrGJ99SEfyZ27AuTnbEDTlP
         S5rw==
X-Gm-Message-State: AOJu0YxqxAVteNahJJNPc2x3ThJnamAOkNrKzMpR3tR3kZ04IFt38Kum
	xAtS+KrNDqNTMSLHRDVbMt2Jk/UoLN3BebGCRHJjh/RJn+iCfmPWHn7qp6yo3bAe
X-Gm-Gg: AeBDiesYYP+qKBxkYPtjj0YKf7fdhdyV6JsUSv20istL8eneMmE0Q0oTBujzhBd/fQF
	IJAk7GvIIcLsEGgkxAf3Ezxf3Oy5B2B6iw+kE0XUscgXub+B0COpkeC0mIED+EKD05a0Wt3/U9K
	GNQItWrp9GlplgMxnonHKs5L/6qXEVP1O3+jVzYxOIQJxYWpzr3OjhfJyNagozH4X0Oow5xeJAI
	ZkBKvkwvOt0QLJ2mqmFQgdyhoEy3lMkt+qDcGlZYCF7GKubFy+Z43EGV4D2GVCpmENmkOPoswsy
	xZalSFYAKlPe3gSmqNeCicFt9MuUzoNZoO41zN7ru42VFITENIBlZvzDBzL3M+iA5D0EOAGga5+
	IeY14iWoCMN2bJTuizeKwzejE+EyBkEj2brkUFJfmlk/1eJtFquvi5KUV6tRQsNVYGtzvMWg1FS
	iB/USiL6dwsnEQ48JXabPhAMkhrmLat8Nxul8BSz9f9FOksHp7gI+BqcO679drrsbmzm6pJBPPd
	aRXMkMkhNvxzOUh0xPAgUIpxViwfCXFRRHKeCaNzDXayWGry+4fi1Q995fp
X-Received: by 2002:a05:7300:1904:b0:2c6:7896:e2b2 with SMTP id 5a478bee46e88-2d40fce76afmr4668851eec.13.1775867375077;
        Fri, 10 Apr 2026 17:29:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde70csm8258009eec.15.2026.04.10.17.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 17:29:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 3/4] strace: Fix build with std=gnu23
Date: Fri, 10 Apr 2026 17:29:28 -0700
Message-ID: <20260411002929.571805-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411002929.571805-1-khem.raj@oss.qualcomm.com>
References: <20260411002929.571805-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 00:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235042

This does not build on hosts with gcc <= 13 which does not have std=gnu23
dialect option e.g. ubuntu 24.04, especially with clang which does not
default to gnu23 yet like gcc-15, so autoconf 2.73 decided to enforce the
standard with clang which then spills into CC_FOR_BUILD as well without
this patch

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...kport-ax_prog_cc_for_build.m4-macros.patch | 229 ++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.19.bb   |   1 +
 2 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
new file mode 100644
index 0000000000..68a1a4230a
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -0,0 +1,229 @@
+From 00de0004bbb7c0816f9f899345971c148c9e59d9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 10 Apr 2026 23:39:47 +0000
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
+ m4/ax_prog_cc_for_build.m4 | 133 ++++++++++++++++++++-----------------
+ 1 file changed, 72 insertions(+), 61 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index afd7261..4d1de99 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -26,45 +26,41 @@
+ # LICENSE
+ #
+ #   Copyright (c) 2008 Paolo Bonzini <bonzini@gnu.org>
+-#   Copyright (c) 2008-2025 The strace developers.
+ #
+ #   Copying and distribution of this file, with or without modification, are
+ #   permitted in any medium without royalty provided the copyright notice
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 9
+-#modified for strace project
++#serial 26
+ 
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+ AC_REQUIRE([AC_PROG_CC])dnl
+ AC_REQUIRE([AC_PROG_CPP])dnl
+-AC_REQUIRE([AC_EXEEXT])dnl
+-AC_REQUIRE([AC_CANONICAL_HOST])dnl
++AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+ 
+ dnl Use the standard macros, but make them use other variable names
+ dnl
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
+ pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
++pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
++pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+-pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+-pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
+-pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
+-pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
+-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
+-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+ pushdef([CPP], CPP_FOR_BUILD)dnl
++pushdef([GCC], GCC_FOR_BUILD)dnl
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
+-pushdef([WARN_CFLAGS], WARN_CFLAGS_FOR_BUILD)dnl
+-pushdef([TEST_WARN_CFLAGS], TEST_WARN_CFLAGS_FOR_BUILD)dnl
+ pushdef([host], build)dnl
+ pushdef([host_alias], build_alias)dnl
+ pushdef([host_cpu], build_cpu)dnl
+@@ -75,51 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
+ pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
+ pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
+ pushdef([ac_cv_host_os], ac_cv_build_os)dnl
+-pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
+ pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
+-pushdef([gl_unknown_warnings_are_errors], gl_build_unknown_warnings_are_errors)dnl
+-pushdef([st_cv_enable_Werror], st_cv_build_enable_Werror)dnl
+-pushdef([st_cv_cc_enable_Werror], st_cv_build_cc_enable_Werror)dnl
++pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
++pushdef([cross_compiling], cross_compiling_build)dnl
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
+-st_SAVE_VAR([ac_c_decl_warn_flag])
+-st_SAVE_VAR([ac_c_preproc_warn_flag])
+-st_SAVE_VAR([ac_c_werror_flag])
+-st_SAVE_VAR([ac_compile])
+-st_SAVE_VAR([ac_compiler_gnu])
+-st_SAVE_VAR([ac_cpp])
+-st_SAVE_VAR([ac_cv_c_compiler_gnu])
+-st_SAVE_VAR([ac_cv_c_decl_report])
+-st_SAVE_VAR([ac_link])
+-st_SAVE_VAR([ac_tool_prefix])
+-st_SAVE_VAR([cross_compiling])
+-cross_compiling=no
++cross_compiling_build=no
+ 
+-AC_MSG_NOTICE([looking for a C compiler that generates native executables])
++ac_build_tool_prefix=
++AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
++      [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
++
++AC_LANG_PUSH([C])
+ AC_PROG_CC
++_AC_COMPILER_EXEEXT
++_AC_COMPILER_OBJEXT
+ AC_PROG_CPP
+-AC_EXEEXT
+-
+-st_WARN_CFLAGS
+ 
+-st_RESTORE_VAR([cross_compiling])
+-st_RESTORE_VAR([ac_tool_prefix])
+-st_RESTORE_VAR([ac_link])
+-st_RESTORE_VAR([ac_cv_c_decl_report])
+-st_RESTORE_VAR([ac_cv_c_compiler_gnu])
+-st_RESTORE_VAR([ac_cpp])
+-st_RESTORE_VAR([ac_compiler_gnu])
+-st_RESTORE_VAR([ac_compile])
+-st_RESTORE_VAR([ac_c_werror_flag])
+-st_RESTORE_VAR([ac_c_preproc_warn_flag])
+-st_RESTORE_VAR([ac_c_decl_warn_flag])
++BUILD_EXEEXT=$ac_cv_exeext
++BUILD_OBJEXT=$ac_cv_objext
+ 
+ dnl Restore the old definitions
+ dnl
+-popdef([st_cv_cc_enable_Werror])dnl
+-popdef([st_cv_enable_Werror])dnl
+-popdef([gl_unknown_warnings_are_errors])dnl
+-popdef([am_cv_CC_dependencies_compiler_type])dnl
++popdef([cross_compiling])dnl
+ popdef([am_cv_prog_cc_c_o])dnl
++popdef([am_cv_CC_dependencies_compiler_type])dnl
++popdef([ac_tool_prefix])dnl
+ popdef([ac_cv_host_os])dnl
+ popdef([ac_cv_host_vendor])dnl
+ popdef([ac_cv_host_cpu])dnl
+@@ -130,35 +133,43 @@ popdef([host_vendor])dnl
+ popdef([host_cpu])dnl
+ popdef([host_alias])dnl
+ popdef([host])dnl
+-popdef([TEST_WARN_CFLAGS])dnl
+-popdef([WARN_CFLAGS])dnl
+ popdef([LDFLAGS])dnl
+ popdef([CPPFLAGS])dnl
+ popdef([CFLAGS])dnl
++popdef([GCC])dnl
+ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
+-popdef([ac_cv_objext])dnl
+-popdef([ac_cv_exeext])dnl
+-popdef([ac_cv_prog_cc_c89])dnl
+-popdef([ac_cv_prog_cc_c99])dnl
+-popdef([ac_cv_prog_cc_c11])dnl
+-popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_prog_cc_stdc])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_cv_prog_cc_c23])dnl
++popdef([ac_cv_prog_cc_c11])dnl
++popdef([ac_cv_prog_cc_c99])dnl
++popdef([ac_cv_prog_cc_c89])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
++dnl
++ac_cv_exeext=$ac_cv_host_exeext
++EXEEXT=$ac_cv_host_exeext
++ac_cv_objext=$ac_cv_host_objext
++OBJEXT=$ac_cv_host_objext
++ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
++ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
++
++dnl restore global variables ac_ext, ac_cpp, ac_compile,
++dnl ac_link, ac_compiler_gnu (dependent on the current
++dnl language after popping):
++AC_LANG_POP([C])
+ 
+ dnl Finally, set Makefile variables
+ dnl
+-BUILD_EXEEXT=$ac_build_exeext
+-BUILD_OBJEXT=$ac_build_objext
+-AC_SUBST(BUILD_EXEEXT)dnl
+-AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([BUILD_EXEEXT])dnl
++AC_SUBST([BUILD_OBJEXT])dnl
+ AC_SUBST([CFLAGS_FOR_BUILD])dnl
+ AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
+ AC_SUBST([LDFLAGS_FOR_BUILD])dnl
+-AC_SUBST([WARN_CFLAGS_FOR_BUILD])dnl
+ ])
diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_6.19.bb
index dfe14e2a39..9dcf9d14d5 100644
--- a/meta/recipes-devtools/strace/strace_6.19.bb
+++ b/meta/recipes-devtools/strace/strace_6.19.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://skip-bpf.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \

