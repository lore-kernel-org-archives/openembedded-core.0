Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4049C28B2F
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:00 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.4304.1742272730898777606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GXqwDslL;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22359001f1aso50782775ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272730; x=1742877530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewqRR8VT87B87puFMp0A5okGQAGn48mMmTxWndsFaxg=;
        b=GXqwDslLockdBlc84KXUi3L7XsrK/jmL3jfc91kfNIs/TZE0klbHKLJzvJvY2pu+zs
         OroSPsF7P8WvdeCGXk198e33ijSMJqVJODxM8Y62D6mo06MzFsexs2V4ct8fSBITcMnq
         FKqQQy1/qp2EBdppid+anEuoUu69Yj1bJahtvcTNq032QNS9wcTaFkX/Eyl1bCETuNu6
         +lm5ZzavH3zqrvFR+cFN5celplldrjnMPVw2Ui0tQoKA3UcGWLc1QgYq+C8Gc+4slMnK
         RqXFAlTVmomjx66go/0qeflLIxlLuFlwbug44SB0Th7510LVaQ9BpvmIQMG3bdX1u8Pq
         o5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272730; x=1742877530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewqRR8VT87B87puFMp0A5okGQAGn48mMmTxWndsFaxg=;
        b=tFzF7rCoXOAipg45wKGD8jO10vxvG2pWwJGMUhCROiYcWBEemLh7hcUwEEp1FXkkaH
         rNEU9o9OrykarSdOA/nB/jwZG/vrF10i/9cYqsi+w00IbozWVyY3ujbgBFhMpLTn/k34
         gzqQtnAIGr+wXIqmccOJUEoTg2m2ydgKZ3wCQI5Z9+d1kpw+5eM7fed0L+smtjemI9eY
         UAbENbzxOx5T890f8GKEsSqhMSi8b0vZBOEIq+yY9IhQLF10w7WEejSREKJ5MN/xH7b5
         lLY0g/fcTgp4/HmoTRoV5cDQJJ3maTBI9C6lcF+c6kzQ9ZcgHW8DBLNOmITF2bOVXZy9
         539w==
X-Gm-Message-State: AOJu0YxvFECfQMuWFQb49YItTLL/tFvfgdSt55fUA0bbWaGCUnYAf2VW
	eRKaNmq+FleRqyNM1TFEWoOWaYYmNuBq7YOu+VD4q0hRhvU6MF90G+5LNUgu
X-Gm-Gg: ASbGncunenY4vOYo3fzohOJIvYaWEmZ4ZPA4NZb8zyRaO1BgkT0dAUGxK3aTTjBa3lV
	EHLWTbSK7NASsvYDxmmtVqqwz00b6muMGXj1sWqW3fxCIAR8SQPgyNv1j1E0rlkQJEV8N5Z/hwm
	Q0o/WbmmRRjHH223Xl6FFDMupuyMvnbgzPBBZpwYwLZ+xK0RclGHAIdvnbsG9EpXY0tm+2HNl6f
	XkoZDgU1d3z5iJEHPRspAEj1HKQ8gxWC7pZv2fEpJyHdTRTiHKAqzaJOZALSj0uiq48rsi7YN0K
	PPzB7hkvwQ3UkHjRo2P772uiJtOjoYgH0CGW
X-Google-Smtp-Source: AGHT+IHw0VXr9TLm3A/rzj+HZotEURh7UUw5DpQ+FdpVY2JPMOKbKOwedUhKlsKpejCWJSQhfd/aXA==
X-Received: by 2002:a17:902:ccc3:b0:224:a79:5fe9 with SMTP id d9443c01a7336-2262c580f3cmr27675505ad.30.1742272729851;
        Mon, 17 Mar 2025 21:38:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kai Kang <kai.kang@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 01/24] webkitgtk: 2.46.6 -> 2.48.0
Date: Mon, 17 Mar 2025 21:38:21 -0700
Message-ID: <20250318043846.2422141-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213135

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

