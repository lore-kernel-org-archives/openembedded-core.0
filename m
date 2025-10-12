Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DF8CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 18:16:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.23682.1760292973966182661
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 11:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTHjfSPJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so31535165e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 11:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292972; x=1760897772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibIz2jv4sNnqoHiVy/Kc53vNSYgaU7GAGtccohI8ERU=;
        b=MTHjfSPJ42OGxk5VPFM2UdauBwif/up9GEEMpCEaSACQUkiKIlxi05sC9ZDwZz0T9a
         ecC6/rfyt3HOrGPmq74TzUL0V7ZxbmLVkx4gDBN7UtOttU/SAEuLlMJZexowL/aY9UJy
         aqSfvfOSSQweq7JuJhm31+H3DTWe+JniJFe0kTspNV+EfmnGx4NrlEdaVbDWoXvgvkBz
         0/ETjSFnsaskcUSYCUDXNrhpuqQmNLYCOIa9vWVVN7+JIR7esW9argX4MuIGIC74MAHc
         Bg9N/KCZ5jMuAYQoI+bxBzELQIN+yOO1jYKoOh0Gs+ue+8Xv8aeg85Y7kyrEUgQ8micU
         6MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292972; x=1760897772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ibIz2jv4sNnqoHiVy/Kc53vNSYgaU7GAGtccohI8ERU=;
        b=OosXWH7OiDYo1lO13lYCxjjpquCxPt5UNwGjHnYyaWPnAqpOrECqyudjH1iDWji//m
         NXzpWgkIJ5noCcn+weAI+ON1LNblVZL0IwXV9M43vDoz7Ayln1OvogtH3ix0mZd1fd8t
         y6db2sJoieWoooZpvmODqqMb3mrqu/JfxLIo1gRSaAGWDahkHGXA8fj83OFYKm3eDyPP
         HXsy3I99XkasXT+bHPYdkU/sp0MHVyZ2h0sEegXNJwMYcRVvTJ8s77nXx7ANk9LPZDWI
         /7v0Hyc2VrrOGi7kmBUnukzTCcq/zrU/eyLaujqhLZ3r9WOkesRUbAYIHDUU61wm3uuW
         tJZg==
X-Gm-Message-State: AOJu0YyuwOJwzfqzb8yM7u9vx1RFtj6JcG94BFbMdOXiyZkfpdXaO7wi
	NLmkku/LKYsnTnTxcy2dTF3PdtaIBW3ouyKGkEHM19om2zCVmnkmuk4avEH/TA==
X-Gm-Gg: ASbGncvROwEt2+xbjVFWlPQ7qm5atomC/RpvW9sUt7b4p2H96UViWjvS2J0jQ1xYB/+
	rX/Bfymz7HYwGkeOCXQiLIk+rQU/3V1NRSiNb/dLyFAhaOeGVtknFToI+kRR+FphWcU/RhHwWMH
	VwqZ4v9XleCoGbxG22mRbYZYY94T6uGV5QmpYk9lRNAnmy4BBuutTOg7VI4CTFwKfqNi6l+8+if
	rgb2KSzHRK+YGX1LHpHnRDN7bxvkwowj5ZCReskVNwtUME5dwZyiNAt1ezu4LhOiS7wau8jVMgL
	q5B+/GayA7z+ckyw7et524LhxA4abUG5QoR/YeXpT7+IrhQAbGeGFEK8k7xCMHTq75e/ONP0Su5
	AoVk9dleaKX7quzonjhHXUjTJ+nYTTKcrBNAvWUuq4t43Wy/vyA==
X-Google-Smtp-Source: AGHT+IEhWJcDvBteE8HQenEC44MRfU1WTcBtHxj0ikAgY1WubN4M9xov3Mcy6cm4by1hsnfiOK/cJA==
X-Received: by 2002:a05:600c:3b29:b0:46e:7e22:ff6a with SMTP id 5b1f17b1804b1-46fa9aa1d79mr137423815e9.15.1760292971864;
        Sun, 12 Oct 2025 11:16:11 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb497aec2sm150781085e9.1.2025.10.12.11.16.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:16:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] webkitgtk: upgrade 2.48.5 -> 2.50.0
Date: Sun, 12 Oct 2025 20:16:10 +0200
Message-ID: <20251012181610.1626721-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 18:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224745

Dropped fix-armv7-compilation.patch, because it is included in this
release.
Dropped no-musttail-arm.patch, because it has been solved by project
(a bit differently)[1]

[1]: https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.0/Source/WTF/wtf/Compiler.h#L280

Changelog:
2.50.0:
- Fix rendering with software rasterization enabled.
- Fix WebAudio issues after idling for a minute.
- Fix several crashes and rendering issues.

2.49.90:
- Add support for font collection / fragment identifiers.
- Fix web process deadlock on exit.
- Fix stuttering when playing WebP animations
- Fix CSS animations with cubic-bezier timing function.
- Do not start the MemoryPressureMonitor if it's disabled
- Translation updates: Polish, Slovenian.
- Fix several crashes and rendering issues.

2.49.4:
- Enable CSS property font-variant-emoji is now enabled by default.
- Improve emoji font selection.
- Add SVT-AV1 encoder support to media backend.
- Show device scale factor in webkit://gpu.
- Fix font rendering of composed characters with certain fonts.
- Fix handling of font synthesis properties (bold/italic).
- Fix documentation of WebKitDeviceInfoPermissionRequest.
- Fix several crashes and rendering issues.

2.49.3:
- Add new API to get the theme color of a WebKitWebView.
- Fix rendering with GTK 3.
- Notify automation session on abnormal disconnections.
- Fix a crash by ensuring SkiaRecordingResult is destroyed on the main thread.
- Fix build on s390x.
- Fix the build with GTK 3.
- Fix several crashes and rendering issues.

2.49.2:
- Enable damage propagation to the UI process by default.
- Pass available input devices from UI process to web process for Interaction Media Features.
- Always have a fallback when domain does not have known base.
- Fix URL after HSTS upgrade in case of redirection.
- Fix rendering when device scale factor change comes before the web view geometry update.
- Ensure web view is focused on tap gesture.
- Fix a crash when setting WEBKIT_SKIA_GPU_PAINTING_THREADS=0.
- Fix several crashes and rendering issues.
- Translation updates: Brazilian Portuguese, Swedish.

2.49.1:
- Change threaded rendering implementation to use Skia API instead of WebCore display
  list that is not thread safe. This also allowed to improve performance by recording
  layers once and replaying every dirty region in different worker threads.
- Added hybrid rendering mode that tries to use the GPU worker threads, but if they
  are all busy the CPU worker threads are used if possible.
- Add volume locking support to media player.
- Add support for tracing counters with Sysprof.
- Fix several crashes and rendering issues.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../webkitgtk/fix-armv7-compilation.patch     | 32 -----------------
 .../webkit/webkitgtk/no-musttail-arm.patch    | 34 -------------------
 ...ebkitgtk_2.48.5.bb => webkitgtk_2.50.0.bb} |  4 +--
 3 files changed, 1 insertion(+), 69 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.5.bb => webkitgtk_2.50.0.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
deleted file mode 100644
index a857d55ae4..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7999ecd5ee4ea3123f7e75634d2bc57f57ca7070 Mon Sep 17 00:00:00 2001
-From: Justin Michaud <jmichaud@igalia.com>
-Date: Wed, 6 Aug 2025 21:14:26 +0300
-Subject: [PATCH] REGRESSION(2.48.5): [WPE][GTK] Does not compile on ARMv7
- https://bugs.webkit.org/show_bug.cgi?id=296921
-
-Unreviewed build fix.
-
-* Source/JavaScriptCore/llint/WebAssembly.asm: Replace addq with addp
-  for sp on armv7
-
-Canonical link: https://commits.webkit.org/290945.344@webkitglib/2.48
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/7999ecd5ee4ea3123f7e75634d2bc57f57ca7070]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- Source/JavaScriptCore/llint/WebAssembly.asm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaScriptCore/llint/WebAssembly.asm
-index 1ac3e2accf3c..bd9041404eb1 100644
---- a/Source/JavaScriptCore/llint/WebAssembly.asm
-+++ b/Source/JavaScriptCore/llint/WebAssembly.asm
-@@ -736,7 +736,7 @@ if JSVALUE64
-     storep memoryBase, Callee[cfr]
- else
-     loadp [sp], ws0
--    addq 2 * SlotSize, sp
-+    addp 2 * SlotSize, sp
-     storep ws0, Callee[cfr]
- end
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
deleted file mode 100644
index 367e6b8342..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 12 Jan 2024 09:21:39 -0800
-Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
-
-This causes clang-17 to crash see [1]
-this code is new in webkit 2.42[2] thats why we do not see the crash in older webkit
-
-[1] https://github.com/llvm/llvm-project/issues/67767
-[2] https://github.com/WebKit/WebKit/commit/4d816460b765acd8aef90ab474615850b91ecc35
-
-Upstream-Status: Inappropriate [work around to avoid clang compiler crash]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Update context for webkitgtk 2.48.0.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- Source/WTF/wtf/Compiler.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index 16e416d..68dd9a0 100644
---- a/Source/WTF/wtf/Compiler.h
-+++ b/Source/WTF/wtf/Compiler.h
-@@ -293,7 +293,7 @@
- #if COMPILER(CLANG)
- #if __SIZEOF_POINTER__ == 8
- #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
--#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32)
-+#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
- #define MUST_TAIL_CALL [[clang::musttail]]
- #define HAVE_MUST_TAIL_CALL 1
- #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
index 46031322b9..879ef647cd 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
@@ -13,14 +13,12 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
-           file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://fix-armv7-compilation.patch \
            "
-SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
+SRC_URI[sha256sum] = "e564b8099f9a3ae32409539b290bbd2ad084e99b6d22d4aac5e51e4554df8bc2"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

