Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDC3CCD195
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 18:51:55 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.26341.1760554313154278753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 11:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KtmZyZA3;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7815092cd22so28488467b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 11:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760554312; x=1761159112; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xkn2U/8fZy/NJki65g+cq0s4QIDEKNZ4zdE4HmeemDY=;
        b=KtmZyZA3ILItuCtW8oAzJKIM6+SkCRDGNInpQQCqhDJDJ/7NSWzlYLzo8SIyGbv3ni
         Ux89ojnDMJlQ/HAHMALAO3knBsic/NHmwG7iX8YzX/ZOhPlINj5sLmhK9ld32Q5s7ziJ
         +daEDmQxAxJepX+mybVbHk7J1JFJtIitq/wdu3m0HWNeJUvzaLnTna27M3sC01L+ViMb
         1UK2c+9EE+y5MIgnZpe8l8KYdhgWmna9ptgIX76VK5oXU8bhXSntinY4GJNag3iHmfDw
         KpDAYSpkQe4ex2YyHn63CKqPVQZwDKyu7LLWtGjNKX3cVbfbjlkihPPpQlVmGWg2YSpX
         IX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554312; x=1761159112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xkn2U/8fZy/NJki65g+cq0s4QIDEKNZ4zdE4HmeemDY=;
        b=SzrG6icCJVCwSE/LTDGrIh3ofFON0htOBsOhDpt4ug8ihwYaVtI6OE9qCF4D/T+hda
         4x6nmn8H22Gn82khkjeGY2B4rJpCdls/O1rczCkXaZaY6rUgq/S5MOsCIaROQBGtZsRz
         ROKjl5zgEBvKmBP3F3ibN3Uvq/Ko67QSEg+tnDXZxdmtHAXj1/bhD7yDGOXnkBbBDeu5
         b7W8AwLH7ieuhX3P22hVi0/MTW+10xrvEWV3lHSxPf9XuL6qU4/kQiFipl31lUpp9HyQ
         5Kc3AU6Tj0WxZ93jP2mE3t7QDtjA6XuuNDElqUuEKLYmhcj442w+VDTZkrzEmOqcottI
         q+sw==
X-Gm-Message-State: AOJu0Yxjff+0lrRiUD+KE0x2yDYdTIlTwyo8KR3yx+h4ZbcHxG4HZNQ/
	7bM+GRTY33zNDii67oZBRQNgj48TDINVl6+XHX8joWSjMknaHwPInBsBP0kWoA870xgVs8+NnhQ
	SQ5gh4YVkR7GOSqUSyQ+/GjYeRaAACVvshEiF
X-Gm-Gg: ASbGncvKFiIWF5deqC4Uxi6skW0U+8RvYXlYSvZqtzIOkzp4gutObNqmBlA5p7/BOVO
	K5NOhOQaGd7O+miac7MOBp1G7Ef9VAyUqkVnocit8E8YegFgIwBrhmhJFwyxz/izmZ+MT3DANzP
	bd/fcrP9tpwQ92PYcyJQm2qBQp9BYsVU6A1ZjgE6/gkfmqBk0jDHpYWTZ7hGDstj7NnzzSFaut0
	Xv2FQCX9cu6Jz2dGLb+nnc1KhfpHa4VHiSofPHaoiQIR4+1yEf1sGbmOJeDwQkqJqis+N6Y6jK1
	zpWatKSZNWe4CbKKoMtPy2G9kmcPZMpc6K+kTbbxQCIH
X-Google-Smtp-Source: AGHT+IHCzpJ8kNABkwtlbehMbb/vWIdbatWsAV32yNni2KUY71SXmQLmdWGmIngVYRT2BeGH+zyFwMLgKfbcDvUYs5A=
X-Received: by 2002:a53:ed42:0:b0:63c:f70d:900 with SMTP id
 956f58d0204a3-63cf70d0992mr10130819d50.28.1760554311809; Wed, 15 Oct 2025
 11:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251015083804.623380-1-skandigraun@gmail.com>
In-Reply-To: <20251015083804.623380-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Oct 2025 11:51:25 -0700
X-Gm-Features: AS18NWCxY4g3yFaSQ8Ozp0JBBdsnvOXvgkEJ7b8LmJGfiChVLZVsnXO2vefpKg0
Message-ID: <CAMKF1soDVZuFMusfN7V_P4tj7Rq0-0GSY7cTp4jnQ61gJ1QSSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] webkitgtk: upgrade 2.48.5 -> 2.50.0
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 18:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224904

On Wed, Oct 15, 2025 at 1:38=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Dropped fix-armv7-compilation.patch, because it is included in this
> release.
> Dropped no-musttail-arm.patch, because it has been solved by project
> (a bit differently)[1]
>

musttail issue was seen with clang compiler, I think it will be good
to verify that its gone for good.

> Added a new patch (related PR is under review currently), fix-musl-compil=
ation.patch
> to avoid build error when compiling with musl libc:
>
> .../Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_alloc=
ator.c:52:10: fatal error: execinfo.h: No such file or directory
> |    52 | #include <execinfo.h>
> |       |          ^~~~~~~~~~~~
>

I think you can depend on libexecinfo package for musl builds.

> [1]: https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.0/Source/WTF/wt=
f/Compiler.h#L280
>
> Changelog:
> 2.50.0:
> - Fix rendering with software rasterization enabled.
> - Fix WebAudio issues after idling for a minute.
> - Fix several crashes and rendering issues.
>
> 2.49.90:
> - Add support for font collection / fragment identifiers.
> - Fix web process deadlock on exit.
> - Fix stuttering when playing WebP animations
> - Fix CSS animations with cubic-bezier timing function.
> - Do not start the MemoryPressureMonitor if it's disabled
> - Translation updates: Polish, Slovenian.
> - Fix several crashes and rendering issues.
>
> 2.49.4:
> - Enable CSS property font-variant-emoji is now enabled by default.
> - Improve emoji font selection.
> - Add SVT-AV1 encoder support to media backend.
> - Show device scale factor in webkit://gpu.
> - Fix font rendering of composed characters with certain fonts.
> - Fix handling of font synthesis properties (bold/italic).
> - Fix documentation of WebKitDeviceInfoPermissionRequest.
> - Fix several crashes and rendering issues.
>
> 2.49.3:
> - Add new API to get the theme color of a WebKitWebView.
> - Fix rendering with GTK 3.
> - Notify automation session on abnormal disconnections.
> - Fix a crash by ensuring SkiaRecordingResult is destroyed on the main th=
read.
> - Fix build on s390x.
> - Fix the build with GTK 3.
> - Fix several crashes and rendering issues.
>
> 2.49.2:
> - Enable damage propagation to the UI process by default.
> - Pass available input devices from UI process to web process for Interac=
tion Media Features.
> - Always have a fallback when domain does not have known base.
> - Fix URL after HSTS upgrade in case of redirection.
> - Fix rendering when device scale factor change comes before the web view=
 geometry update.
> - Ensure web view is focused on tap gesture.
> - Fix a crash when setting WEBKIT_SKIA_GPU_PAINTING_THREADS=3D0.
> - Fix several crashes and rendering issues.
> - Translation updates: Brazilian Portuguese, Swedish.
>
> 2.49.1:
> - Change threaded rendering implementation to use Skia API instead of Web=
Core display
>   list that is not thread safe. This also allowed to improve performance =
by recording
>   layers once and replaying every dirty region in different worker thread=
s.
> - Added hybrid rendering mode that tries to use the GPU worker threads, b=
ut if they
>   are all busy the CPU worker threads are used if possible.
> - Add volume locking support to media player.
> - Add support for tracing counters with Sysprof.
> - Fix several crashes and rendering issues.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../webkitgtk/fix-armv7-compilation.patch     | 32 -------
>  .../webkitgtk/fix-musl-compilation.patch      | 94 +++++++++++++++++++
>  .../webkit/webkitgtk/no-musttail-arm.patch    | 34 -------
>  ...ebkitgtk_2.48.5.bb =3D> webkitgtk_2.50.0.bb} |  5 +-
>  4 files changed, 96 insertions(+), 69 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilat=
ion.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-musl-compilati=
on.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.pa=
tch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.48.5.bb =3D> webkitgtk_2.50=
.0.bb} (97%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.pat=
ch b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
> deleted file mode 100644
> index a857d55ae4..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 7999ecd5ee4ea3123f7e75634d2bc57f57ca7070 Mon Sep 17 00:00:00 2001
> -From: Justin Michaud <jmichaud@igalia.com>
> -Date: Wed, 6 Aug 2025 21:14:26 +0300
> -Subject: [PATCH] REGRESSION(2.48.5): [WPE][GTK] Does not compile on ARMv=
7
> - https://bugs.webkit.org/show_bug.cgi?id=3D296921
> -
> -Unreviewed build fix.
> -
> -* Source/JavaScriptCore/llint/WebAssembly.asm: Replace addq with addp
> -  for sp on armv7
> -
> -Canonical link: https://commits.webkit.org/290945.344@webkitglib/2.48
> -
> -Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/7999e=
cd5ee4ea3123f7e75634d2bc57f57ca7070]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - Source/JavaScriptCore/llint/WebAssembly.asm | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaSc=
riptCore/llint/WebAssembly.asm
> -index 1ac3e2accf3c..bd9041404eb1 100644
> ---- a/Source/JavaScriptCore/llint/WebAssembly.asm
> -+++ b/Source/JavaScriptCore/llint/WebAssembly.asm
> -@@ -736,7 +736,7 @@ if JSVALUE64
> -     storep memoryBase, Callee[cfr]
> - else
> -     loadp [sp], ws0
> --    addq 2 * SlotSize, sp
> -+    addp 2 * SlotSize, sp
> -     storep ws0, Callee[cfr]
> - end
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patc=
h b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
> new file mode 100644
> index 0000000000..aba0f7cf4d
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
> @@ -0,0 +1,94 @@
> +From 820e4bb46d7e72ba2b14b15819166919c2e81205 Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Wed, 15 Oct 2025 00:58:59 +0300
> +Subject: [PATCH] [libpas] Build fails with libc implementations that lac=
k
> + execinfo.h https://bugs.webkit.org/show_bug.cgi?id=3D300701
> +
> +Reviewed by NOBODY (OOPS!).
> +
> +Change guards to use backtrace() and execinfo.h on Linux only when using
> +glibc as the C library. The PlayStation and Windows cases no longer need
> +to be matched, as they are neither Linux nor Darwin, both of which are n=
ow
> +explicitly listed. The Android check is kept as it was.
> +
> +* Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_alloca=
tor.c:
> +* Source/bmalloc/libpas/src/test/PGMTests.cpp:
> +(addPGMTests):
> +
> +
> +Fixes the following error in OE, when compiled with musl:
> +
> +| ${UNPACKDIR}/webkitgtk-2.50.0/Source/bmalloc/libpas/src/libpas/pas_pro=
babilistic_guard_malloc_allocator.c:52:10: fatal error: execinfo.h: No such=
 file or directory
> +|    52 | #include <execinfo.h>
> +
> +
> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/52300]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +
> +---
> + .../pas_probabilistic_guard_malloc_allocator.c      |  4 ++--
> + Source/bmalloc/libpas/src/test/PGMTests.cpp         | 13 ++++++-------
> + 2 files changed, 8 insertions(+), 9 deletions(-)
> +
> +diff --git a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_ma=
lloc_allocator.c b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard=
_malloc_allocator.c
> +index ff3adefa7dcc..58ec32eb4fed 100644
> +--- a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_al=
locator.c
> ++++ b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_al=
locator.c
> +@@ -43,8 +43,8 @@
> + #include <unistd.h>
> + #endif
> +
> +-/* PlayStation does not currently support the backtrace API. Android AP=
I versions < 33 don't, either. Windows does not either. */
> +-#if !PAS_PLATFORM(PLAYSTATION) && (!PAS_OS(ANDROID) || __ANDROID_API__ =
>=3D 33) && !PAS_OS(WINDOWS)
> ++/* PlayStation does not currently support the backtrace API. Android AP=
I versions < 33 don't, either. Windows does not either. Linux only with GLi=
bc and not uCLibc/Musl. */
> ++#if (PAS_OS(ANDROID) && __ANDROID_API__ >=3D 33) || PAS_OS(DARWIN) || (=
PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
> + #include <execinfo.h>
> + #else
> + size_t backtrace(void** buffer, size_t size)
> +diff --git a/Source/bmalloc/libpas/src/test/PGMTests.cpp b/Source/bmallo=
c/libpas/src/test/PGMTests.cpp
> +index 0432f46ba3b0..dfbf957a3421 100644
> +--- a/Source/bmalloc/libpas/src/test/PGMTests.cpp
> ++++ b/Source/bmalloc/libpas/src/test/PGMTests.cpp
> +@@ -43,9 +43,9 @@
> + #include "pas_report_crash.h"
> + #include "pas_root.h"
> +
> +-#if !PAS_PLATFORM(PLAYSTATION)
> ++#if (PAS_OS(ANDROID) && __ANDROID_API__ >=3D 33) || PAS_OS(DARWIN) || (=
PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
> + #include <execinfo.h>
> +-#endif // !PAS_PLATFORM(PLAYSTATION)
> ++#endif
> +
> + using namespace std;
> +
> +@@ -383,8 +383,7 @@ void testPGMMetadataVectorManagementFewDeallocations=
()
> +     pas_heap_lock_unlock();
> + }
> +
> +-/* Backtrace API is currently not supported on PlayStation. */
> +-#if !PAS_PLATFORM(PLAYSTATION)
> ++#if (PAS_OS(ANDROID) && __ANDROID_API__ >=3D 33) || PAS_OS(DARWIN) || (=
PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
> + void testPGMMetadataDoubleFreeBehavior()
> + {
> +     pas_probabilistic_guard_malloc_initialize_pgm_as_enabled(1);
> +@@ -583,7 +582,7 @@ void testPGMAllocMetadataOnly()
> +         CHECK(!dealloc_metadata);
> +     }
> + }
> +-#endif // !PAS_PLATFORM(PLAYSTATION)
> ++#endif
> +
> + } // anonymous namespace
> +
> +@@ -598,9 +597,9 @@ void addPGMTests()
> +     ADD_TEST(testPGMMetadataVectorManagement());
> +     ADD_TEST(testPGMMetadataVectorManagementFewDeallocations());
> +     ADD_TEST(testPGMMetadataVectorManagementRehash());
> +-#if !PAS_PLATFORM(PLAYSTATION)
> ++#if (PAS_OS(ANDROID) && __ANDROID_API__ >=3D 33) || PAS_OS(DARWIN) || (=
PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
> +     ADD_TEST(testPGMMetadataDoubleFreeBehavior());
> +     ADD_TEST(testPGMBmallocAllocationBacktrace());
> +     ADD_TEST(testPGMAllocMetadataOnly());
> +-#endif // !PAS_PLATFORM(PLAYSTATION)
> ++#endif
> + }
> diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/m=
eta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
> deleted file mode 100644
> index 367e6b8342..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 12 Jan 2024 09:21:39 -0800
> -Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
> -
> -This causes clang-17 to crash see [1]
> -this code is new in webkit 2.42[2] thats why we do not see the crash in =
older webkit
> -
> -[1] https://github.com/llvm/llvm-project/issues/67767
> -[2] https://github.com/WebKit/WebKit/commit/4d816460b765acd8aef90ab47461=
5850b91ecc35
> -
> -Upstream-Status: Inappropriate [work around to avoid clang compiler cras=
h]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Update context for webkitgtk 2.48.0.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - Source/WTF/wtf/Compiler.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
> -index 16e416d..68dd9a0 100644
> ---- a/Source/WTF/wtf/Compiler.h
> -+++ b/Source/WTF/wtf/Compiler.h
> -@@ -293,7 +293,7 @@
> - #if COMPILER(CLANG)
> - #if __SIZEOF_POINTER__ =3D=3D 8
> - #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_c=
pp_attribute)
> --#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !d=
efined(_WIN32)
> -+#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !d=
efined(_WIN32) && !defined(__arm__)
> - #define MUST_TAIL_CALL [[clang::musttail]]
> - #define HAVE_MUST_TAIL_CALL 1
> - #endif
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.50.0.bb
> similarity index 97%
> rename from meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
> index 46031322b9..4dc6d4700e 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
> @@ -13,14 +13,13 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN=
}-${PV}.tar.xz \
>             file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
>             file://reproducibility.patch \
>             file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAY=
S_I.patch \
> -           file://no-musttail-arm.patch \
>             file://t6-not-declared.patch \
>             file://sys_futex.patch \
>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
>             file://fix-ftbfs-riscv64.patch \
> -           file://fix-armv7-compilation.patch \
> +           file://fix-musl-compilation.patch \
>             "
> -SRC_URI[sha256sum] =3D "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695=
031ad0b668e1987c"
> +SRC_URI[sha256sum] =3D "e564b8099f9a3ae32409539b290bbd2ad084e99b6d22d4aa=
c5e51e4554df8bc2"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224883): https://lists.openembedded.org/g/openembedde=
d-core/message/224883
> Mute This Topic: https://lists.openembedded.org/mt/115767514/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

