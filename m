Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B853CCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:38:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.10963.1760517487466529872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZqZVuF76;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so3742577f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760517486; x=1761122286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGteUdf16zpfP1l0OrP4solmpwvqMyGZFa/ppsraKcM=;
        b=ZqZVuF76Y827zz43zu9yhsISgIlXhDozis+lZxPMnp6gk/DzIOeuYZ8e1FcUC8SfL3
         XDuTq2T0WxoQ3CnxHI1+s+JIrer9+OSMtHR3Cx2HF5okTH/VDT7U7vsBStyiCSDJiyBd
         AK1JFtDFegzl3UJFwKo0dSP1XFb3BLvkguym6/U8jEZdeSkzibeERjN8818ZBtNzd8D1
         aqgfEZeCKoZFkfd8EybQMNUugm/wfapCOy4PL7hOPzg5A56Z+qIczijoBPgPz950KD5q
         deCwC/txdcpWkHE+854BWIaw6fw45flVjDPHTEBsdA2I7demvgvR5MLO/kDN+yyzSQAt
         ZGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760517486; x=1761122286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGteUdf16zpfP1l0OrP4solmpwvqMyGZFa/ppsraKcM=;
        b=wGx4nzekBuUUVzElrPvtufBmlBdvTPkNvu0wGj/bXGfY2I9HCjlxW3CktEgFCQa/Cn
         1bUrsmPSdXeYjJPyVHbyZ8JyrxyHovyD3E5yOa+mWZxTvIdrLjd5V3DR3Ov6kqniRlr0
         lNIsWsuSawaQoQczJrYO0sZPaFupZ6oKJXr2SUzhl05uMgU3Iiwe47scJoO5k6rFZaz5
         MhCM+qarrwGubYNKqOPly1IaDMi6QC03tE5Cmyvs0tZwmYHsrRVtBSMZpWPMENARCeaK
         56e6cX8vn3sQ0PJjzVQp80jOe+5dgpYg917FVzF5UfUOlgpSute4Nwh2bMw+syWOcPEa
         z/NQ==
X-Gm-Message-State: AOJu0Yz76b3YAVriTrENLSvXy/0AqYubWMOGanfc9qUxCbd1l9ihzGNI
	f9w9xydCfoVZVwIJduFCGKeMYqvdtUoOOHwIGIcWZi9OldlsWBPpbImwN2o52A==
X-Gm-Gg: ASbGncuvqicMQH7gYooObg4BBh1rbsl4UHtJMzbkYYYcRVTSlXnyUYBYGRu+Z2OEViI
	hZAmLrbQpfTwIGB63/Ixo1bnuss5eO5/O9EZrHfsMdrifZqxmIEPYNbuXY0sN02eyBkKb2hVxsb
	5YyOo6i1MsgkpWNWOIAU4xVZL5lsZoJEGF3GZtPfAzDOOqshtr6zCwH0xYfk5xFOpoEISIE7pc3
	Wkv97fwXqaKJCd5ghRzBzpzK776uhpndN2THm/2splk2I1hW9V63lBMP8DQ93gi2aVCyioy1gYy
	jvsWf/psNKXh9yTG6xUOv7BjXN6KX+YVzxWw098CxJWeFARcvGB+aDsXw+ffkBfyE6liYuAdmnm
	3HBvz5HSCG5Ja1Guj8vqmOhcflVfAlwXQ5u6bLY0=
X-Google-Smtp-Source: AGHT+IFDFsvKEDqamxVnQqjEhXOoFqd8sl5Dd8hLaK4pjuHbpR7qaMQUg+A3/Ykfmx5vh2EG0pf9Jg==
X-Received: by 2002:a05:6000:3111:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-42667177d9fmr18746000f8f.14.1760517485401;
        Wed, 15 Oct 2025 01:38:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426dac8691fsm19258166f8f.50.2025.10.15.01.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 01:38:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] webkitgtk: upgrade 2.48.5 -> 2.50.0
Date: Wed, 15 Oct 2025 10:38:04 +0200
Message-ID: <20251015083804.623380-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224883

Dropped fix-armv7-compilation.patch, because it is included in this
release.
Dropped no-musttail-arm.patch, because it has been solved by project
(a bit differently)[1]

Added a new patch (related PR is under review currently), fix-musl-compilation.patch
to avoid build error when compiling with musl libc:

.../Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:52:10: fatal error: execinfo.h: No such file or directory
|    52 | #include <execinfo.h>
|       |          ^~~~~~~~~~~~

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
 .../webkitgtk/fix-armv7-compilation.patch     | 32 -------
 .../webkitgtk/fix-musl-compilation.patch      | 94 +++++++++++++++++++
 .../webkit/webkitgtk/no-musttail-arm.patch    | 34 -------
 ...ebkitgtk_2.48.5.bb => webkitgtk_2.50.0.bb} |  5 +-
 4 files changed, 96 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
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
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
new file mode 100644
index 0000000000..aba0f7cf4d
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
@@ -0,0 +1,94 @@
+From 820e4bb46d7e72ba2b14b15819166919c2e81205 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 15 Oct 2025 00:58:59 +0300
+Subject: [PATCH] [libpas] Build fails with libc implementations that lack
+ execinfo.h https://bugs.webkit.org/show_bug.cgi?id=300701
+
+Reviewed by NOBODY (OOPS!).
+
+Change guards to use backtrace() and execinfo.h on Linux only when using
+glibc as the C library. The PlayStation and Windows cases no longer need
+to be matched, as they are neither Linux nor Darwin, both of which are now
+explicitly listed. The Android check is kept as it was.
+
+* Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:
+* Source/bmalloc/libpas/src/test/PGMTests.cpp:
+(addPGMTests):
+
+
+Fixes the following error in OE, when compiled with musl:
+
+| ${UNPACKDIR}/webkitgtk-2.50.0/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:52:10: fatal error: execinfo.h: No such file or directory
+|    52 | #include <execinfo.h>
+
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/52300]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ .../pas_probabilistic_guard_malloc_allocator.c      |  4 ++--
+ Source/bmalloc/libpas/src/test/PGMTests.cpp         | 13 ++++++-------
+ 2 files changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
+index ff3adefa7dcc..58ec32eb4fed 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
++++ b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
+@@ -43,8 +43,8 @@
+ #include <unistd.h>
+ #endif
+ 
+-/* PlayStation does not currently support the backtrace API. Android API versions < 33 don't, either. Windows does not either. */
+-#if !PAS_PLATFORM(PLAYSTATION) && (!PAS_OS(ANDROID) || __ANDROID_API__ >= 33) && !PAS_OS(WINDOWS)
++/* PlayStation does not currently support the backtrace API. Android API versions < 33 don't, either. Windows does not either. Linux only with GLibc and not uCLibc/Musl. */
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ #include <execinfo.h>
+ #else
+ size_t backtrace(void** buffer, size_t size)
+diff --git a/Source/bmalloc/libpas/src/test/PGMTests.cpp b/Source/bmalloc/libpas/src/test/PGMTests.cpp
+index 0432f46ba3b0..dfbf957a3421 100644
+--- a/Source/bmalloc/libpas/src/test/PGMTests.cpp
++++ b/Source/bmalloc/libpas/src/test/PGMTests.cpp
+@@ -43,9 +43,9 @@
+ #include "pas_report_crash.h"
+ #include "pas_root.h"
+ 
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ #include <execinfo.h>
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ 
+ using namespace std;
+ 
+@@ -383,8 +383,7 @@ void testPGMMetadataVectorManagementFewDeallocations()
+     pas_heap_lock_unlock();
+ }
+ 
+-/* Backtrace API is currently not supported on PlayStation. */
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ void testPGMMetadataDoubleFreeBehavior()
+ {
+     pas_probabilistic_guard_malloc_initialize_pgm_as_enabled(1);
+@@ -583,7 +582,7 @@ void testPGMAllocMetadataOnly()
+         CHECK(!dealloc_metadata);
+     }
+ }
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ 
+ } // anonymous namespace
+ 
+@@ -598,9 +597,9 @@ void addPGMTests()
+     ADD_TEST(testPGMMetadataVectorManagement());
+     ADD_TEST(testPGMMetadataVectorManagementFewDeallocations());
+     ADD_TEST(testPGMMetadataVectorManagementRehash());
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+     ADD_TEST(testPGMMetadataDoubleFreeBehavior());
+     ADD_TEST(testPGMBmallocAllocationBacktrace());
+     ADD_TEST(testPGMAllocMetadataOnly());
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ }
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
index 46031322b9..4dc6d4700e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
@@ -13,14 +13,13 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
-           file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://fix-armv7-compilation.patch \
+           file://fix-musl-compilation.patch \
            "
-SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
+SRC_URI[sha256sum] = "e564b8099f9a3ae32409539b290bbd2ad084e99b6d22d4aac5e51e4554df8bc2"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

