Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD57C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2934.1742372175396683612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gC/fYuO5;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-226185948ffso60435795ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372174; x=1742976974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewqRR8VT87B87puFMp0A5okGQAGn48mMmTxWndsFaxg=;
        b=gC/fYuO5f0GZVrmBJ2eDR7oXs8Spv+vMS/RHl9ct3shqwt11y7098q2Tx76LiW1Rsp
         2RzwmpWxp3kfHFamhGAe24UWRmrJnWf921mMS+4ofv0pjlrWLqAJwMAFQTMlbjp2pBau
         5WXzJ7JctcKRtzRNyQoPaxjI2pQINjgeRrbFOzH9Is/3Ix1Lwz6WWhz8lx7Jt5x8UYNj
         lFsOpXu7XXXO83fwE5l4JZtbbhout4fe67O+19DgcRBYJvP0u8SP7AAmjHeu4z8sRSKL
         xtarfH1Vk1p6R6rfqS4fM9p4+fifNrEqFLOiB77iqamEQNTy6v6XMCtFvRJZpVeTfo/B
         99PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372174; x=1742976974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewqRR8VT87B87puFMp0A5okGQAGn48mMmTxWndsFaxg=;
        b=mk+qI3bFgyJAQyPEb96wboSGJm2S8piSRJ+GFHG3T+X1ch8BRnljxYjB7dxIAuGSPF
         ET0jKdUzNmvVSXFkJrKrJDhYPgI8EO1pC0y88JZAHWBqFqFWscpHaSixJyQVQW7+WOzb
         v4h9zRdWSYCOzDAfOuWw54cg2kxprrMqzJ/gMJgIUxwLWIU/zWuFTriXEvqExdiAGWZC
         oVYEWgqLPJF7M0G1SWHmNHtDSBtO7M5ofNP3fn24Z2t5+uSTZYN7sUetQOKriqaqgbDS
         pTUv1aTlxB+lJ0erRLElHCHY6S0cF5gc+pXsrdHHQtEw8cFQk6K6Qs5cf3Ae75DxhD01
         fsBQ==
X-Gm-Message-State: AOJu0YyOi4rIi6R4g96Ix30HN+FlrGymm8FTEWmoPCjCCBaKOnUGMxlE
	68D5PSs0iAhkxHTyZXV5Sgx0V3LNQZb9pElifo1Mb5vcpE5+lroNqqHmVYxU
X-Gm-Gg: ASbGncubuofoNC4JtaA5qiqqfKxZM/BHOvGq+yGn2dNSca/xulCLx9B0CcZ84IY2iR8
	9dW1c6fIUyl9hFlRPyFwQsM1pSXsmAySHX20V5is3rOlC+9NhgqdU04jwOx6zKqx+lpcf5iH1au
	uxnKZ61josjJzgsYbTlE6f4DBNqb5gIcS8pfsQDg4Fh+1O8gQIFLtL9onpQ7wS6dXvKhCYnIkUT
	bwCLTZfIJjK75EeEum8pzhN0M3Rw5JtfqbfMQ2OUBUjQ3KUkPFn8vGAA9POj1JZ8NkdyH3D2PyA
	wGmQBKLauyJAzLePE9q3AQBzU/J/Xlbqqd5i
X-Google-Smtp-Source: AGHT+IFBeGPtS6ZZleoFqii3Fw7GkvWlZhNRciqmwgZlLJ509KdbLi1FNNTQ49AJXJmwm02YlrAD9g==
X-Received: by 2002:a05:6a21:62c6:b0:1f5:75a9:5257 with SMTP id adf61e73a8af0-1fbeb4a330amr3347746637.13.1742372174288;
        Wed, 19 Mar 2025 01:16:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kai Kang <kai.kang@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 01/27] webkitgtk: 2.46.6 -> 2.48.0
Date: Wed, 19 Mar 2025 01:15:29 -0700
Message-ID: <20250319081610.3536475-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213267

From: Kai Kang <kai.kang@windriver.com>

Upgrade webkitgtk from 2.46.6 to 2.48.0:

* remove backported patch bmalloc-fix.patch
* update context of no-musttail-arm.patch
* add PACKAGECONFIG speech

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/webkitgtk/bmalloc-fix.patch        | 36 -------------------
 .../webkit/webkitgtk/no-musttail-arm.patch    | 14 +++++---
 ...ebkitgtk_2.46.6.bb => webkitgtk_2.48.0.bb} |  4 +--
 3 files changed, 11 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.46.6.bb => webkitgtk_2.48.0.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch b/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
deleted file mode 100644
index 37e0fdcbbdc..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/bmalloc-fix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6ab7d3f7d8d0d8e1ab401d0fb13f60bbc64279a2 Mon Sep 17 00:00:00 2001
-From: Thomas Klausner <wiz@gatalith.at>
-Date: Thu, 7 Nov 2024 11:54:30 -0800
-Subject: [PATCH] bmalloc: Build problem in bmalloc when X11/X.h is in the same
- namespace https://bugs.webkit.org/show_bug.cgi?id=282693
-
-This avoids a build problem when the X11/X.h is included,
-which defines Success to '0'.
-
-Reviewed by Fujii Hironori.
-
-* Source/bmalloc/bmalloc/EligibilityResult.h:
-
-Canonical link: https://commits.webkit.org/286295@main
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/6ab7d3f7d8d0d8e1ab401d0fb13f60bbc64279a2]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Source/bmalloc/bmalloc/EligibilityResult.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Source/bmalloc/bmalloc/EligibilityResult.h b/Source/bmalloc/bmalloc/EligibilityResult.h
-index ead7dbb52c07a..48f9e5bfe8a80 100644
---- a/Source/bmalloc/bmalloc/EligibilityResult.h
-+++ b/Source/bmalloc/bmalloc/EligibilityResult.h
-@@ -29,6 +29,11 @@
- 
- #if !BUSE(LIBPAS)
- 
-+/* avoid conflict with symbol from X11 headers */
-+#ifdef Success
-+#undef Success
-+#endif
-+
- namespace bmalloc {
- 
- enum class EligibilityKind {
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index c98d8b7727b..367e6b8342a 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -11,20 +11,24 @@ this code is new in webkit 2.42[2] thats why we do not see the crash in older we
 
 Upstream-Status: Inappropriate [work around to avoid clang compiler crash]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Update context for webkitgtk 2.48.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Source/WTF/wtf/Compiler.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index c01ed849..b69b1527 100644
+index 16e416d..68dd9a0 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -290,7 +290,7 @@
+@@ -293,7 +293,7 @@
  #if COMPILER(CLANG)
  #if __SIZEOF_POINTER__ == 8
  #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
--#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__)
-+#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(__arm__)
+-#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32)
++#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
  #define MUST_TAIL_CALL [[clang::musttail]]
- #endif
+ #define HAVE_MUST_TAIL_CALL 1
  #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.46.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index d1f24bbbf70..cb4e09662f7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.46.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -15,10 +15,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
-           file://bmalloc-fix.patch \
            file://sys_futex.patch \
            "
-SRC_URI[sha256sum] = "f2b31de693220ba9bab76ce6ddfe5b0bfab2515cb2b0a70f3c54d4050766c32b"
+SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -81,6 +80,7 @@ PACKAGECONFIG[jpegxl] = "-DUSE_JPEGXL=ON,-DUSE_JPEGXL=OFF,libjxl"
 PACKAGECONFIG[backtrace] = "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
 PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 PACKAGECONFIG[sysprof-capture] = "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
+PACKAGECONFIG[speech] = "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
 
 EXTRA_OECMAKE = " \
                  -DPORT=GTK \

