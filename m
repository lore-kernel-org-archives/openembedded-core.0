Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7367BC83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 15:28:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.50574.1693841309784476017
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 08:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RNxl3TII;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: bbara93@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401d10e3e54so16023365e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693841308; x=1694446108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6QrEvoQ9W3biXPWGF3NSuxRouU2yq6w0FnLZ8u5HveE=;
        b=RNxl3TIITOYjPTvubJKdw0HrZsCktfldc4g6OaEN63Ku9v7gs3DTLyXhr/A0GZk4hj
         wZSBKpnPcD28U6jGLjPUGoDXVG6eMcygqftNAp2WmcaS1GDu6kGP5P3A+pMyVXiPQsCd
         T46JEHYKUcoKvhsEaMj6/Iodl4LKe+MpMcwub5cN8Tk7kx0+T959sBoyZcqFpE/0iEDI
         h0UaWTVMy/WKfeVOqJwy4lwpUKgCvPrsURLYSqavGsdXOpIQfGUBD7LPtdYdZLVuWN8u
         4SU31IF3i47UCUeDA92neX9A7shJ7pw/y7ooruFQOIJ4Rl86Yeahudd1X0ZjGIxFmzBf
         iUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693841308; x=1694446108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QrEvoQ9W3biXPWGF3NSuxRouU2yq6w0FnLZ8u5HveE=;
        b=Nr3xfeoT5HGrN7yMHs9BL1wBZMuTSAm/e8Q3zoj/sTKFDJnuJECsuLiAQQJo2KtUoa
         /RRR72sXGly7RRnu7Z8PHf5NmjOMSPQ0QmHDir1dBmlfF7rcDf8sLSQW14HsllNoW3vO
         LGUlef330pf+qZ4Ad3i3cE6otrspiddB6O7M+JbocpwzyGIa8/fshBWJYLJ73UeYymho
         YWmEviETSx/AlXYBTLEMR+P8gwhBS2+tLs6xNUyPWeUKrRtPLYJpX1YZx4TEuYsntEKS
         ggHqQSbffVaPZ2eFZ452jvBBlL7gtoxnC/zZ7YXO5Yn4VYPxyGPae/pXLQgJPlOVMckJ
         eJeA==
X-Gm-Message-State: AOJu0Yxoea2cvDZ0SR31fc+v5uO3/GOU6KJPhls0U1/Uc3J961KREwzz
	i/7uvXobBWM/plcWpqS6onpiF8t0UfqZ9w==
X-Google-Smtp-Source: AGHT+IHkL1xNDUkO/D0ZTdJ+gYYmisQ7cQn7AMvlvB1C9xyOn0NUbpBIwk8JXJNt3/kzECp7o5npug==
X-Received: by 2002:a05:600c:11c1:b0:401:b204:3b8d with SMTP id b1-20020a05600c11c100b00401b2043b8dmr7300320wmi.27.1693841307443;
        Mon, 04 Sep 2023 08:28:27 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id e16-20020a05600c219000b003fe2a40d287sm14382961wme.1.2023.09.04.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 08:28:27 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH v2] ghostscript: avoid neon on unsupported machines
Date: Mon,  4 Sep 2023 17:28:18 +0200
Message-Id: <20230904152818.4182573-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 15:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187189

From: Benjamin Bara <benjamin.bara@skidata.com>

Disable neon if the machine does not support it.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 ...dd-option-to-explicitly-disable-neon.patch | 99 +++++++++++++++++++
 .../ghostscript/ghostscript_10.01.2.bb        |  4 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch b/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
new file mode 100644
index 0000000000..7873396045
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
@@ -0,0 +1,99 @@
+From fd37229a17822c5ad21a369f670b8a6f6cc6b95b Mon Sep 17 00:00:00 2001
+From: Benjamin Bara <benjamin.bara@skidata.com>
+Date: Mon, 4 Sep 2023 12:16:39 +0200
+Subject: [PATCH] configure.ac: add option to explicitly disable neon
+
+Uncomment an already existing possibility to explicitly disable neon and
+use it on both implemented neon checks.
+
+Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=707097]
+
+Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
+---
+ configure.ac | 52 +++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 29 insertions(+), 23 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 09d881dd1..62718e15e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -749,6 +749,33 @@ SUBCONFIG_OPTS="--build=$build --host=$host"
+ #  SUBCONFIG_OPTS="$SUBCONFIG_OPTS --host=$host_alias"
+ #fi
+ 
++dnl --------------------------------------------------
++dnl Check for NEON support
++dnl --------------------------------------------------
++save_cflags=$CFLAGS
++AC_MSG_CHECKING([neon support])
++CFLAGS="$save_cflags $OPT_CFLAGS -mfpu=neon -mcpu=cortex-a53"
++HAVE_NEON=""
++AC_LINK_IFELSE(
++  [AC_LANG_PROGRAM([#include "arm_neon.h"], [
++  int32x4_t round = vdupq_n_s32(10);
++  return(0);
++  ])],
++  [HAVE_NEON="-DHAVE_NEON"], [HAVE_NEON=""])
++
++AC_ARG_ENABLE([neon], AS_HELP_STRING([--disable-neon],
++       [Do not use neon instrinsics]), [
++             if test "x$enable_neon" = xno; then
++                HAVE_NEON=""
++             fi])
++
++if test "x$HAVE_NEON" != x; then
++  AC_MSG_RESULT(yes)
++else
++  AC_MSG_RESULT(no)
++fi
++CFLAGS=$save_cflags
++
+ dnl --------------------------------------------------
+ dnl Check for libraries
+ dnl --------------------------------------------------
+@@ -971,11 +998,12 @@ if test x$with_tesseract != xno; then
+          [TESS_NEON="-mfpu=neon -mcpu=cortex-a53 -D__ARM_NEON__"],
+          [TESS_NEON=""])
+ 
+-        if test "x$TESS_NEON" != x; then
++        if test "x$TESS_NEON" != x && test "x$enable_neon" != xno; then
+           AC_MSG_RESULT(yes)
+           TESS_CXXFLAGS="$TESS_CXXFLAGS -DHAVE_NEON"
+         else
+           AC_MSG_RESULT(no)
++          TESS_NEON=""
+         fi
+ 
+         CXXFLAGS="$save_cxxflags"
+@@ -2387,28 +2415,6 @@ if test x$WITH_CAL != x0; then
+     AC_MSG_RESULT(no)
+   fi
+ 
+-  AC_MSG_CHECKING([neon support])
+-  CFLAGS="$save_cflags $OPT_CFLAGS -mfpu=neon -mcpu=cortex-a53"
+-  HAVE_NEON=""
+-  AC_LINK_IFELSE(
+-    [AC_LANG_PROGRAM([#include "arm_neon.h"], [
+-    int32x4_t round = vdupq_n_s32(10);
+-    return(0);
+-    ])],
+-    [HAVE_NEON="-DHAVE_NEON"], [HAVE_NEON=""])
+-
+-  #AC_ARG_ENABLE([neon], AS_HELP_STRING([--disable-neon],
+-  #       [Do not use neon instrinsics]), [
+-  #             if test "x$enable_neon" = xno; then
+-  #                HAVE_NEON=""
+-  #             fi])
+-
+-  if test "x$HAVE_NEON" != x; then
+-    AC_MSG_RESULT(yes)
+-  else
+-    AC_MSG_RESULT(no)
+-  fi
+-
+   #AC_SUBST(HAVE_SSE4_2)
+   #AC_SUBST(HAVE_NEON)
+   CFLAGS=$save_cflags
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
index 0ddf708f93..434170e34d 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
            file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch \
+           file://configure.ac-add-option-to-explicitly-disable-neon.patch \
 "
 
 SRC_URI[sha256sum] = "a4cd61a07fec161bee35da0211a5e5cde8ff8a0aaf942fc0176715e499d21661"
@@ -45,6 +46,9 @@ EXTRA_OECONF = "--with-jbig2dec \
 
 EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 
+EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
+EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
+
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig
 
-- 
2.34.1


