Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2A6C07C79
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 11:03:31 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.15821.1713783807354260516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 04:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Te+Ba9FO;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso6483567a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 04:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713783805; x=1714388605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxtzfP8XizmV4oG82/jvij9xX6garRv/wxyh0WtLLus=;
        b=Te+Ba9FO/+veGUh7r5GTv7Mafi7A98fvRM7UmusvhGDMrMrTCzVaGic8Al/N0kgn7D
         m4Y8x/IlPySHsrrRYspti+IYVZ5E5CKaewYS6a/nWXD5VOY5s9BG7os0ANKGVmMy00/k
         Wzb57E7Tq+Yd/wETHO5/0CR3Drd0Pq1MHTsftWg9eZc/tfFvH5oaCgjzgDceKQxZVcUN
         x+z857Vq/vtfQod2pU1Nfqh/AciQN10pNtbEAblAo4vsPFMDEQDo7clgOgF7LnOakkue
         4TDQNJ3NVpTdqf72u35HPyop9OcsrY1sF2aWrL556VgpHQU7T1cMHLMNopIUWYUXsnT+
         Jc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713783805; x=1714388605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxtzfP8XizmV4oG82/jvij9xX6garRv/wxyh0WtLLus=;
        b=TSinhSy7SrwQv2181Xth1+vv1nyWZJZ2zbMy5pO3PlQ72Z4rgiXOWPBaW/ZP9JG0hu
         ENCCwYVaWo+QVTZGF0oOtHfZggt9HF/49f6MqfKpDoiq1TSD1GJIcgtXii4IEhfL1IJV
         wy4Cu9Sk4JB9uhFIRWeaeTURzu/xNrrvno1F5ArSSAv6Zh+ZCKdFxvwnmUcpo0UJNJVm
         TTUwwwcNb1o0zN505enFUYxy0zzDpHMsRnYs/EVm8HJO3+JGi8p2qnwXudPm1Ow6NrbV
         O1J1rS8MPYznu4sy26A0qbcQvF+hD1uB299AYHt8CdzbVS3W8Fd6xBwK7f1QqGaDARcC
         8k5g==
X-Gm-Message-State: AOJu0YzB1f/P05+IA8IpKdr9UwXsjQOdobN+bF/WrbVW4yreiHwwf2Y0
	n9oNJkgdY2xa8KqBFDJmNj5791D9PL4hhFYUMBwIyilEf5IlV53iwY6aAg==
X-Google-Smtp-Source: AGHT+IHqNBqjVZ+32+48zOADDOog3lg9z559hL7tlQ7x12IovfoNYOIVn6GkrfygEFzXJ3jPsmOk7g==
X-Received: by 2002:a50:a45d:0:b0:570:1ea6:e98a with SMTP id v29-20020a50a45d000000b005701ea6e98amr6624437edb.39.1713783805301;
        Mon, 22 Apr 2024 04:03:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7d0cf000000b005704b18ed2fsm5416508edo.83.2024.04.22.04.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 04:03:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/2] swig: convert from autotools to cmake
Date: Mon, 22 Apr 2024 13:03:18 +0200
Message-Id: <20240422110318.181856-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240422110318.181856-1-alex.kanavin@gmail.com>
References: <20240422110318.181856-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 11:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198585

From: Alexander Kanavin <alex@linutronix.de>

Drop patches:
0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
(superseded long time ago by native wrapper)

0001-configure-use-pkg-config-for-pcre-detection.patch
(autotools-specific)

Drop all autoconf options and native python dependency as cmake configuration doesn't contain those.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-for-swig-swiglib-on-non-Win32-plat.patch | 65 -------------------
 ...re-use-pkg-config-for-pcre-detection.patch | 63 ------------------
 meta/recipes-devtools/swig/swig_4.2.1.bb      | 45 +++----------
 3 files changed, 9 insertions(+), 164 deletions(-)
 delete mode 100644 meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
 delete mode 100644 meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch

diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
deleted file mode 100644
index 5e83e92725e..00000000000
--- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From b88a98348b3841f0b702e314631883d46f9f362d Mon Sep 17 00:00:00 2001
-From: "NODA, Kai" <nodakai@gmail.com>
-Date: Sun, 22 Apr 2012 17:01:02 +0900
-Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
- platforms.
-
-If it wasn't found, then fall back to a fixed string just as before.
-
-Upstream-Status: Submitted
-http://sourceforge.net/mailarchive/message.php?msg_id=29179733
----
- Source/Modules/main.cxx | 24 ++++++++++++++++++++++--
- 1 file changed, 22 insertions(+), 2 deletions(-)
-
-diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index 76b4f9d..de0a512 100644
---- a/Source/Modules/main.cxx
-+++ b/Source/Modules/main.cxx
-@@ -25,6 +25,11 @@
- #include <ctype.h>
- #include <errno.h>
- #include <limits.h>		// for INT_MAX
-+#ifndef _WIN32
-+#include <cstddef>
-+#include <unistd.h>		// for readlink
-+#include <sys/stat.h>		// for stat
-+#endif
- 
- // Global variables
- 
-@@ -895,9 +900,9 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
- 
-   // Check for SWIG_LIB environment variable
-   if ((c = getenv("SWIG_LIB")) == (char *) 0) {
-+    char *p;
- #if defined(_WIN32)
-     char buf[MAX_PATH];
--    char *p;
-     if (!(GetModuleFileName(0, buf, MAX_PATH) == 0 || (p = strrchr(buf, '\\')) == 0)) {
-       *(p + 1) = '\0';
-       SwigLib = NewStringf("%sLib", buf); // Native windows installation path
-@@ -907,7 +912,22 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
-     if (Len(SWIG_LIB_WIN_UNIX) > 0)
-       SwigLibWinUnix = NewString(SWIG_LIB_WIN_UNIX); // Unix installation path using a drive letter (for msys/mingw)
- #else
--    SwigLib = NewString(SWIG_LIB);
-+    char buf[PATH_MAX];
-+    if (0 < ::readlink("/proc/self/exe", buf, sizeof(buf)) &&
-+        (p = ::strstr(buf, "/bin/swig"))) {
-+        int major, minor, patch;
-+        const int ret = ::sscanf(VERSION, "%d.%d.%d", &major, &minor, &patch);
-+        if (3 == ret) {
-+            const ::ptrdiff_t dir_part_len = p - buf;
-+            ::snprintf(p, PATH_MAX - dir_part_len, "/share/swig/%d.%d.%d", major, minor, patch);
-+            struct ::stat stat_res;
-+            if (0 == ::stat(buf, &stat_res) && S_ISDIR(stat_res.st_mode)) {
-+                SwigLib = NewString(buf);
-+            }
-+        }
-+    }
-+    if (NULL == SwigLib)
-+        SwigLib = NewString(SWIG_LIB);
- #endif
-   } else {
-     SwigLib = NewString(c);
diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
deleted file mode 100644
index 9e16caecca1..00000000000
--- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 57a15651b46a0f1f84a4dd15d67d104fbfbe3f6e Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Tue, 17 Jun 2014 08:18:17 +0200
-Subject: [PATCH] configure: use pkg-config for pcre detection
-
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-Status: Pending
-
----
- configure.ac | 39 +++++++--------------------------------
- 1 file changed, 7 insertions(+), 32 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c060028..a330266 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -49,39 +49,14 @@ AC_MSG_RESULT([$with_pcre])
- 
- dnl To make configuring easier, check for a locally built PCRE using the Tools/pcre-build.sh script
- if test x"${with_pcre}" = xyes ; then
--  AC_MSG_CHECKING([whether to use local PCRE2])
--  local_pcre_config=no
--  if test -z "$PCRE2_CONFIG"; then
--    if test -f `pwd`/pcre/pcre-swig-install/bin/pcre2-config; then
--      PCRE2_CONFIG=`pwd`/pcre/pcre-swig-install/bin/pcre2-config
--      local_pcre_config=$PCRE2_CONFIG
--    fi
--  fi
--  AC_MSG_RESULT([$local_pcre_config])
--fi
--AS_IF([test "x$with_pcre" != xno],
--  [AX_PATH_GENERIC([pcre2],
--    [], dnl Minimal version of PCRE we need -- accept any
--    [], dnl custom sed script for version parsing is not needed
--    [AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE2 library])
--     LIBS="$LIBS $PCRE2_LIBS"
--     CPPFLAGS="$CPPFLAGS $PCRE2_CFLAGS"
--    ],
--    [AC_MSG_FAILURE([
--        Cannot find pcre2-config script from PCRE2 (Perl Compatible Regular Expressions)
--        library package. This dependency is needed for configure to complete,
--        Either:
--        - Install the PCRE2 developer package on your system (preferred approach).
--        - Download the PCRE2 source tarball, build and install on your system
--          as you would for any package built from source distribution.
--        - Use the Tools/pcre-build.sh script to build PCRE2 just for SWIG to statically
--          link against. Run 'Tools/pcre-build.sh --help' for instructions.
--          (quite easy and does not require privileges to install PCRE2 on your system)
--        - Use configure --without-pcre to disable regular expressions support in SWIG
--          (not recommended).])
--    ],
--    [],[],[--libs8])
-+  PKG_CHECK_MODULES([PCRE], [libpcre2], [
-+    AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
-+    LIBS="$LIBS $PCRE_LIBS"
-+    CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
-+  ], [
-+    AC_MSG_WARN([$PCRE_PKG_ERRORS])
-   ])
-+fi
- 
- 
- dnl CCache
diff --git a/meta/recipes-devtools/swig/swig_4.2.1.bb b/meta/recipes-devtools/swig/swig_4.2.1.bb
index 7062d4e9aa3..b564be9b36d 100644
--- a/meta/recipes-devtools/swig/swig_4.2.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.2.1.bb
@@ -13,51 +13,16 @@ SECTION = "devel"
 DEPENDS = "libpcre2 bison-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-            file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
-            file://0001-configure-use-pkg-config-for-pcre-detection.patch \
             file://determinism.patch \
            "
 SRC_URI[sha256sum] = "fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
 UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
 
-inherit autotools python3native pkgconfig
-
-EXTRA_OECONF = " \
-    --with-python3=${PYTHON} \
-    --without-allegrocl \
-    --without-android \
-    --without-boost \
-    --without-chicken \
-    --without-clisp \
-    --without-csharp \
-    --without-d \
-    --without-gcj \
-    --without-go \
-    --without-guile \
-    --without-java \
-    --without-lua \
-    --without-mzscheme \
-    --without-ocaml \
-    --without-octave \
-    --without-perl5 \
-    --without-pike \
-    --without-php \
-    --without-r \
-    --without-ruby \
-    --without-tcl \
-"
-
-EXTRA_AUTORECONF += "-I Tools/config"
+inherit cmake pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
 
-# necessary together with bison dependency until a new upstream version after
-# 3.0.12 includes 0001-Fix-generated-code-for-constant-expressions-containi.patch
-do_configure:append() {
-    mkdir -p ${B}/Source/CParse
-}
-
 do_install:append:class-nativesdk() {
     cd ${D}${bindir}
     ln -s swig swig2.0
@@ -70,3 +35,11 @@ def swiglib_relpath(d):
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/swig SWIG_LIB='`dirname $''realpath`'/${@swiglib_relpath(d)}
 }
+
+PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
+src_package_preprocess () {
+        # Trim build paths from comments and defines in generated sources to ensure reproducibility
+        sed -i -e "s,${WORKDIR},,g" \
+            -e "s,YY_YY_.*_CPARSE_PARSER_H_INCLUDED,YY_YY_CPARSE_PARSER_H_INCLUDED,g" \
+            ${B}/Source/CParse/parser.*
+}
-- 
2.39.2


