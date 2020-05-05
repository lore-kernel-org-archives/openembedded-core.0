Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.1502.1588648822146943846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XrWZfQXF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id d184so221074pfd.4
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=B9ILbmHwYJGpLmaNaL6NipdzD/sKSWBb1EQe8PqqD+8=;
        b=XrWZfQXFH/itoG3QQx6KhlfMlXU9/0OS/VE3+8Owz99pbeafSzg3lKuMGqVohnQroh
         7eCKpTO/+9w2sgMRtf3wP6BcDaNnW71aElNWsT9KF9UEgqUVDEn1yKzk9Baw2Tit8qk5
         qQ14L2qRwYkmYk8MymVnLNjEopa5j8IH7PhD5op2vkC5sDQYJXAhojdEARWgESw9BaV1
         wauGQ7kUYjD8ftN7CnZiAPU++NhKW3QlmQ9IeWFjApog8y5RnlADsnkcqZkK5sx+5OtN
         hXT2bkvxq49oYOsN3Xv6wIiDarVhPTxDUfwGA5794O2QO5Ej+5gaKSxbqC0p+fytenHr
         EOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=B9ILbmHwYJGpLmaNaL6NipdzD/sKSWBb1EQe8PqqD+8=;
        b=Jhi8wE9pdP0NlTeVe3/XKXVVG5DdaVvj7slXfaCQhxbtrQsdQcVausbC06aD5ORAqj
         e1Cu8JJnIz+bDxuHBIT8TWnqIeKLzlBLd1IuU/p7UaoRsuG335vh60K/NZ1MLCcRmTLN
         bqQ+U4ImEUxEgw/GDlK/7YrEYh2H3RjbMnzhZ0OitdnLLuoAaPraYDXBjAEoqimbzSif
         3k+3h1jPD8ZB3c7schQAZnce+8sGJFgnOEvgoNJ0gTcJUjtKiNfcEBB4CsMIB7EpMjUU
         CTqDIMVuj9Pzz6qGoXEL/0N9Qc/1VB+Dt84DlxD5aKf0pNb+r6UDqI9Ma6BZy4Jy+zOY
         BclQ==
X-Gm-Message-State: AGi0PuZXaI9RXc8YOemOfD02ZFz1lAxKwzWZ+MkqZcKRcbmYGXiyyKzN
	omLD1QMnjilFqpOks1bInRVQ1b37QK7GXg==
X-Google-Smtp-Source: APiQypLwNlzPDfQMSPuuGXWFDMYVtnZopcv0Ypz3HWYARF4HV7XjpmUP9llXqwYVNRUhYNtutNyxEg==
X-Received: by 2002:a63:e314:: with SMTP id f20mr1179435pgh.285.1588648821109;
        Mon, 04 May 2020 20:20:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/28] binutils: Detect proper static-libstdc++ support when using clang
Date: Mon,  4 May 2020 17:19:03 -1000
Message-Id: <7e90a36e62ebddf287c2ef19e28f88426e061897.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Fixes configure time tests to ensure static-libstdc++ is enabled when
using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 ...or-clang-before-checking-gcc-version.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 4b085b6fe0..66a3850ef2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -40,6 +40,7 @@ SRC_URI = "\
      file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
+     file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://CVE-2020-0551.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
new file mode 100644
index 0000000000..c694b42dc3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before-checking-gcc-version.patch
@@ -0,0 +1,48 @@
+From 67590a44c1256491fa674426f0170d5d05377d05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Apr 2020 14:17:20 -0700
+Subject: [PATCH 16/16] Check for clang before checking gcc version
+
+Clang advertises itself to be gcc 4.2.1, so when compiling this test
+here fails since gcc < 4.4.5 did not support -static-libstdc++ but thats
+not true for clang, so its better to make an additional check for clang
+before resorting to gcc version check. This should let clang enable
+static libstdc++ linking
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 590b03c2da0..46f116fdb54 100755
+--- a/configure
++++ b/configure
+@@ -5140,7 +5140,7 @@ ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
+ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
+-#if (__GNUC__ < 4) || (__GNUC__ == 4 && __GNUC_MINOR__ < 5)
++#if !defined(__clang__) && ((__GNUC__ < 4) || (__GNUC__ == 4 && __GNUC_MINOR__ < 5))
+ #error -static-libstdc++ not implemented
+ #endif
+ int main() {}
+diff --git a/configure.ac b/configure.ac
+index d3f85e6f5d5..c0eb1343121 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1309,7 +1309,7 @@ if test "$GCC" = yes; then
+   AC_MSG_CHECKING([whether g++ accepts -static-libstdc++ -static-libgcc])
+   AC_LANG_PUSH(C++)
+   AC_LINK_IFELSE([AC_LANG_SOURCE([
+-#if (__GNUC__ < 4) || (__GNUC__ == 4 && __GNUC_MINOR__ < 5)
++#if !defined(__clang__) && ((__GNUC__ < 4) || (__GNUC__ == 4 && __GNUC_MINOR__ < 5))
+ #error -static-libstdc++ not implemented
+ #endif
+ int main() {}])],
+-- 
+2.26.1
+
-- 
2.17.1

