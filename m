Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A369CF4486E
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:49:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156593.1775828961737152515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d1bXhaDt;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso22222915e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775828960; x=1776433760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=im7CKeloKwtcXKspvzXbyvNxFASluvvnokvwTTVYEO0=;
        b=d1bXhaDtBnJerXIgZvx/UJ0YmjM3z2I7tn1ht7z5HblF3q1m2SWluGMMH61XjlZ0zk
         FQvNgmiRqnLyTmdSBf9xrZhoQL0QBJ0wC//3fpWadHES2OLxYXI6UeoUDHfSnbZNa4aF
         +O6iW2MaVpJsfWTzT8MtG3Wg8RKCX3ltkjkh1O7qfRK2bFvB362POd/tYAFzIrU/Zucz
         +6QyEeUIoYlSpcparrkcZ2ntk4RkkJDrliNsUdPyiCFiKJXB0pTLyNPLmwICL58vNYUh
         a9WiySk1I+6lsqD1X+iwJcJtlSSr5uQf03xljqiCUV7QF8H2RNT7vhDM2yBUN8sUKHO3
         w52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828960; x=1776433760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im7CKeloKwtcXKspvzXbyvNxFASluvvnokvwTTVYEO0=;
        b=PrIm+dj1iTNwXTJQf6hO9pD24uQcsfaWJZ9caqqhNSS8PRHXANqj4z1M7kbt4w6YEI
         48lUuIF1U73HyaA2J6eAASEcF4JejydbZCt8c0Ofo4o1BJRmURbFsQrH4rWmGkFpmZY7
         VdkvNXzua8WvqFZTLVX5ICtVM/aNnZjN8X140Z3raX3ZvQ42vhfDKHg12Z1fSNqbRLj4
         TavULZCGrTAv+QRRVTlhUOCEZRaBq2dUvBsHAw5Nn80JoKuyaVggzzk5dJR90yjN7mK9
         PBz5ethxML54Z6tL98o+Ek3kPp7Z8tzAON6qzmuGKTkBHrn0aHIQDop0FNJN5bkVEcYN
         0xsw==
X-Gm-Message-State: AOJu0Yw0e6aI7t3pynS7HBhiwixBDEMrF5UkNGypaIYqWXLnUt0u3pkJ
	tips3vAqiCCEBtsImsDGAnNDEypzjo8E6A3aiAkiKktKFSzoeQJcmCSz2xSO8g==
X-Gm-Gg: AeBDiesGEuPn70DYUS672hIT3TEuAlMVa5dVNhu/e1xc/IJxE19Ub+C5cD2qpBQeQqv
	TauSmbnFOfPus0Qol4/tnNGEzSb4I/P5DCVd6Ktlx3hctBOho0HS8rNNqkBNoZtK1A/mFAwWBGR
	BVZhY3AfJszDTRwqdUljAQXwYXIhJFCVXkn4fKU7XohF+gmb7Uw8JVm7Oph9gjrFy+9/+0Ng+ep
	NfaqCX0Cuzzcv0sVTTVx9jNCh7Jv9pUycvwkMIVav4XzLdO+4UVe/Br1qoLehq/RbnIC1YVwaoQ
	t3lJE+ObQjSqU/viqCpJkAXbzF2uL1WZUW7CZ6tfMPwaBQLMp2uKehrm/jlFRg/YDxS623iY3+M
	oMofpoN/PlI+02PfLs866WlO/90YI1afUYzcncsLNvPcORyssM0qnOc4iJSn/G5prXdqknb0U56
	ErwVz/6OeMG9b1xu6XStxdTF55lum4AKThPvWoRuoQYB+OHJZBWJiAU6D0ngNUSOx+UnR/KiiZn
	ESzDHmv5g==
X-Received: by 2002:a05:600c:8585:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-488d684bcb0mr31790665e9.14.1775828959797;
        Fri, 10 Apr 2026 06:49:19 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e469ddsm7566169f8f.17.2026.04.10.06.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:49:19 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] apr: fix build with autoconf-2.73
Date: Fri, 10 Apr 2026 15:49:14 +0200
Message-ID: <20260410134915.3936107-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235032

From: Martin Jansa <martin.jansa@gmail.com>

On hosts with gcc-13 it was trying to use -std=gnu23 and failing
with unrecognized command-line option (gnu23 needs gcc-14 and newer)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...rog_cc_for_build.m4-update-to-latest.patch | 189 ++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.6.bb         |   1 +
 2 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-latest.patch

diff --git a/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-latest.patch b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-latest.patch
new file mode 100644
index 0000000000..2607f6f860
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0001-ax_prog_cc_for_build.m4-update-to-latest.patch
@@ -0,0 +1,189 @@
+From 24eb9fd3469e610b6887517a80b8e038c200e807 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 10 Apr 2026 15:04:43 +0200
+Subject: [PATCH] ax_prog_cc_for_build.m4: update to latest
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+After the autoconf update to 2.73 this was using -std=gnu23
+even on hosts with gcc-13 which doesn't support it:
+
+ac_cv_prog_ac_ct_CC_FOR_BUILD='gcc '
+CC_FOR_BUILD='gcc  -std=gnu23'
+ac_ct_CC_FOR_BUILD='gcc '
+
+Leading to:
+gcc: error: unrecognized command-line option ‘-std=gnu23’; did you mean ‘-std=gnu2x’?
+
+Needs the updated ac_cv_prog_cc_c23 from:
+https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721f516fef4226e5eca8da341159765
+
+Upstream-Status: Submitted [https://github.com/apache/apr/pull/72]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ build/ax_prog_cc_for_build.m4 | 99 ++++++++++++++++++++++++++---------
+ 1 file changed, 74 insertions(+), 25 deletions(-)
+
+diff --git a/build/ax_prog_cc_for_build.m4 b/build/ax_prog_cc_for_build.m4
+index 26daf36..4d1de99 100644
+--- a/build/ax_prog_cc_for_build.m4
++++ b/build/ax_prog_cc_for_build.m4
+@@ -32,28 +32,32 @@
+ #   and this notice are preserved. This file is offered as-is, without any
+ #   warranty.
+ 
+-#serial 9
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
+@@ -67,27 +71,58 @@ pushdef([ac_cv_host_alias], ac_cv_build_alias)dnl
+ pushdef([ac_cv_host_cpu], ac_cv_build_cpu)dnl
+ pushdef([ac_cv_host_vendor], ac_cv_build_vendor)dnl
+ pushdef([ac_cv_host_os], ac_cv_build_os)dnl
+-pushdef([ac_cpp], ac_build_cpp)dnl
+-pushdef([ac_compile], ac_build_compile)dnl
+-pushdef([ac_link], ac_build_link)dnl
++pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
++pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
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
+-save_cross_compiling=$cross_compiling
+-save_ac_tool_prefix=$ac_tool_prefix
+-cross_compiling=no
+-ac_tool_prefix=
++cross_compiling_build=no
+ 
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
+ 
+-ac_tool_prefix=$save_ac_tool_prefix
+-cross_compiling=$save_cross_compiling
++BUILD_EXEEXT=$ac_cv_exeext
++BUILD_OBJEXT=$ac_cv_objext
+ 
+ dnl Restore the old definitions
+ dnl
+-popdef([ac_link])dnl
+-popdef([ac_compile])dnl
+-popdef([ac_cpp])dnl
++popdef([cross_compiling])dnl
++popdef([am_cv_prog_cc_c_o])dnl
++popdef([am_cv_CC_dependencies_compiler_type])dnl
++popdef([ac_tool_prefix])dnl
+ popdef([ac_cv_host_os])dnl
+ popdef([ac_cv_host_vendor])dnl
+ popdef([ac_cv_host_cpu])dnl
+@@ -101,26 +136,40 @@ popdef([host])dnl
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
+ ])
+-
diff --git a/meta/recipes-support/apr/apr_1.7.6.bb b/meta/recipes-support/apr/apr_1.7.6.bb
index 13fa5daa3c..86fac1e4c8 100644
--- a/meta/recipes-support/apr/apr_1.7.6.bb
+++ b/meta/recipes-support/apr/apr_1.7.6.bb
@@ -22,6 +22,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            file://autoconf-2.73.patch \
            file://0001-dso-Check-for-NULL-handle-in-apr_dso_sym.patch \
+           file://0001-ax_prog_cc_for_build.m4-update-to-latest.patch \
            "
 
 SRC_URI[sha256sum] = "49030d92d2575da735791b496dc322f3ce5cff9494779ba8cc28c7f46c5deb32"

