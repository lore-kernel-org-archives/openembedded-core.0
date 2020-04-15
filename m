Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.7.1586992713717074929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 16:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D5LTdQaz;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id x3so744530pfp.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 16:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tljqC+yGz/d/8yUkeDnufoBpaVDumJbCDrbloHYHZIA=;
        b=D5LTdQazPFt8MIJ+BQ87SrNKVWVzmr204GvwayarjkeUehCbyDeyy9stSMH+lFqa5S
         Ft9cuu7cFhH4xqTo6QtNziHSpVh03QUkMCYoPnnsEgWPkmKkzkgWS09w5jSGtMcluetD
         J5boOm2IkR1YyxffzV8T0aZHTz82K/ey4H4GzA0es9WsTxGtlxk5Njz7zEOLpK8/ztPm
         aNo54b0RU6A4oRirgwwyJjmP+qHTSfNctgDjOmds/8FdXAJSDzTKUrMXQBTxMbbmax6v
         oqJZEzNwzJ40ijTNaF3yJEP7yCAAkyIejU0TI5JtdKw4BQ95KqRLd4yxqAwvToK7A5mz
         Mhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tljqC+yGz/d/8yUkeDnufoBpaVDumJbCDrbloHYHZIA=;
        b=ff3nYxTZtD+z0F0WKLTYUxlZib3H7xivPJugBHOW3Gibf/jZnhqjn+0GBWue0RlBzH
         1/qEt7k/zkrI2pUuDa6qjfBM6BRw4ycWPlj1aV9yNxF2A/31gCZWW3zHvQXJTGTkgWlr
         guq/Nwu+K7zOeuor9dIbotRuajpmq8ZWrRAUt09AV455ne9kEbe7tOs7JKAlU4DYKyES
         pf3bidgsVy5r+RoUtVUNdyHNbzF/FuufhjNvGwzCIbuv2eMMRrllOU/E/ZABvilNl4WO
         upLi+ziDZRaZ7nqfYGj8e3PcEUejB10ZYlULa69rGlKU5OJwg59bQMVL8qna+8v3lA0i
         y3kA==
X-Gm-Message-State: AGi0PuZqt1IvDJruVwrv3CMsQ9xlmuT6945mpFSYjldqpWUMW8J7ajF9
	wtu3CtbR7FKSYFPav44T17QVdgmxyic=
X-Google-Smtp-Source: APiQypJCcJYJDwL8nOvdsge80G/LoSoGn1JBAEARxV4M/B6EPJKiNxNRXFmMoCQljb4SfDXkFI0zKg==
X-Received: by 2002:a63:f13:: with SMTP id e19mr28011384pgl.135.1586992712707;
        Wed, 15 Apr 2020 16:18:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id a1sm14902161pfi.182.2020.04.15.16.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 16:18:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] binutils: Detect proper static-libstdc++ support when using clang
Date: Wed, 15 Apr 2020 16:18:28 -0700
Message-Id: <20200415231829.4090244-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200415231829.4090244-1-raj.khem@gmail.com>
References: <20200415231829.4090244-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes configure time tests to ensure static-libstdc++ is enabled when
using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.26.1

