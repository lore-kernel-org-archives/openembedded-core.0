Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74932CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 21:31:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.29759.1760563898413133743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 14:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GwwXNchV;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e52279279so266465e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 14:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760563897; x=1761168697; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxJO8SK1m+hCOLiwSNaKBmO1g41VD162aftpq+1LGys=;
        b=GwwXNchVRQ8beIj0mf3NP67XN9oKGdg6TQTMWypuzBfwjN4luBu3ZvEzgdgjPDjyx4
         7B6JYLFmi+eLjoJPl7c7rOZ1rR1u8IFvpK90xcVShy/hwrm0dtM6zAKgJiDRhNMhx9BR
         LylZkH39hMIiVriU5742eHeMUPkIIfuWbrqY3O/Y2EgoPnapZaOS0GTeBIhiYs46mFup
         QxeWnm+JyP0PF0k3s9uuYQWi3CebAwiX6Hnz8KFZ/zqcWys/rXHRVsi6pZySrre53aY6
         Gb4SwULMc6w20iNJhYK9Op4g65N6ZJKmH4U4Up5oWWcn1G0j7qmUelcfQCIaQxWViGoY
         eRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760563897; x=1761168697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxJO8SK1m+hCOLiwSNaKBmO1g41VD162aftpq+1LGys=;
        b=JDge7E6TtJYtbfjL3hiBUxSZuKohokJDA/dNvSh1oonGcbsPCTe2hEXxZITKLuCqP5
         EMYdJ5dIhMeGeSovcMjIw4EKbcyN/zb8ngySEJgK99wKIiSmRD/TYItcHtxM3UunZ1pr
         Eow/o5IpkkCx1CALPX79tcDFjeqoubjxJiYkNNUoav0kAV5UHUWvn3W6w/G5yTa4V+YW
         p/a4I0Kmy0rnU6fKt6i8ETf8BK+25i1wYpNjIZ3GVEgpyv+hSuaKGbgoMT5zH+A55s2I
         G72uV5ZieDr1/K8t5G03TdxyYWtgaJBe09mmk7hgUzQsdBkTbKPNQlF4/mTpPJ+hQ7Ud
         BX4w==
X-Gm-Message-State: AOJu0YxpHjO5P/TSMNJ+a50hSkmj5f6A5dFHq0oPTkK8jzcw4MMal0sS
	E5IWhT1+hGFXbbrWPUJEXPj9dWwGPpLFgtNofHpztgfBx7BLQmgmnZGk
X-Gm-Gg: ASbGncvksuGUL80HB7ecPWVoMNYRRgoNz982xN4oTF4iExfOBDy0hehPmpNVmnj6A/B
	njzQQ3dGpIj2i1UNgTfCQxPhd0uavoGqDJgvS6nJcsiIcRWMFAG9xxNUSqzIGiO29YuTQiDl+IO
	hK/P+2RCHdeXHU2CRXbNV2HeTflta/lR1wTtof8sjuclhmsCNMpjlQRxdEklHOKFo7PIM79gIBq
	ROpErXveTjtcVQcvlV2FwAUxTwdVbAqMGmUaK03XDRLq7nsSSswYdxAZxw3VYIBx6S29ArICwJc
	EV84Em5AZeVtVUCje1vE1hZPFiZLRiySYvZazkOQfX+FwTZS774DShye6KqzXz9kSVYbWgDIine
	Y8bq2ZvWfNpeRD2I180DBLh8aJVbLkdvxY5Mrpg+qMYU+GWOVBnIzc+VUaxFEf8itAMC+EQ0ylP
	NJORd7hts1pSUSYjDgAHQ=
X-Google-Smtp-Source: AGHT+IGFqL3gc19DAqR3lvLBTxpvh9+RJDePzzhuuJnKFKXmjM3rFASfs4hbwcA3MhxPcd6e3IQuYA==
X-Received: by 2002:a05:600c:3e87:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-46fa9b1089dmr228527135e9.32.1760563896291;
        Wed, 15 Oct 2025 14:31:36 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ca243a3sm2528385e9.0.2025.10.15.14.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 14:31:35 -0700 (PDT)
Message-ID: <c6ce02b0-1c34-4add-84b4-2559fb7ae6ec@gmail.com>
Date: Wed, 15 Oct 2025 23:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] webkitgtk: upgrade 2.48.5 -> 2.50.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251015083804.623380-1-skandigraun@gmail.com>
 <CAMKF1soDVZuFMusfN7V_P4tj7Rq0-0GSY7cTp4jnQ61gJ1QSSQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1soDVZuFMusfN7V_P4tj7Rq0-0GSY7cTp4jnQ61gJ1QSSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 21:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224907

On 10/15/25 20:51, Khem Raj wrote:
> On Wed, Oct 15, 2025 at 1:38 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> Dropped fix-armv7-compilation.patch, because it is included in this
>> release.
>> Dropped no-musttail-arm.patch, because it has been solved by project
>> (a bit differently)[1]
>>
> musttail issue was seen with clang compiler, I think it will be good
> to verify that its gone for good.

I was able to compile the recipe successfully for qemuarm with clang
toolchain, without this patch.
(But only with using "-fno-integrated-as", coming from this issue[1]
which otherwise blocks using clang with arm still)

However now there seem to a brand new 32-bit issue which made it fail in
a novel way, unless I applied another patch also[2]. Will send a v3 in
the morning with the new patch...

[1]: https://github.com/llvm/llvm-project/issues/132322
[2]: https://bugs.webkit.org/show_bug.cgi?id=299166 - patch v3

>> Added a new patch (related PR is under review currently), fix-musl-compilation.patch
>> to avoid build error when compiling with musl libc:
>>
>> .../Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:52:10: fatal error: execinfo.h: No such file or directory
>> |    52 | #include <execinfo.h>
>> |       |          ^~~~~~~~~~~~
>>
> I think you can depend on libexecinfo package for musl builds.

The related patch meanwhile became "backport", now I see that it got
merged since the morning when I sent this email. Due to this, I'd say to
keep the patch for now, and can be dropped with the next update.
(But it's good to know that there is an alternative, thanks - will be
useful for the next recipe with this issue)

>> [1]: https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.0/Source/WTF/wtf/Compiler.h#L280
>>
>> Changelog:
>> 2.50.0:
>> - Fix rendering with software rasterization enabled.
>> - Fix WebAudio issues after idling for a minute.
>> - Fix several crashes and rendering issues.
>>
>> 2.49.90:
>> - Add support for font collection / fragment identifiers.
>> - Fix web process deadlock on exit.
>> - Fix stuttering when playing WebP animations
>> - Fix CSS animations with cubic-bezier timing function.
>> - Do not start the MemoryPressureMonitor if it's disabled
>> - Translation updates: Polish, Slovenian.
>> - Fix several crashes and rendering issues.
>>
>> 2.49.4:
>> - Enable CSS property font-variant-emoji is now enabled by default.
>> - Improve emoji font selection.
>> - Add SVT-AV1 encoder support to media backend.
>> - Show device scale factor in webkit://gpu.
>> - Fix font rendering of composed characters with certain fonts.
>> - Fix handling of font synthesis properties (bold/italic).
>> - Fix documentation of WebKitDeviceInfoPermissionRequest.
>> - Fix several crashes and rendering issues.
>>
>> 2.49.3:
>> - Add new API to get the theme color of a WebKitWebView.
>> - Fix rendering with GTK 3.
>> - Notify automation session on abnormal disconnections.
>> - Fix a crash by ensuring SkiaRecordingResult is destroyed on the main thread.
>> - Fix build on s390x.
>> - Fix the build with GTK 3.
>> - Fix several crashes and rendering issues.
>>
>> 2.49.2:
>> - Enable damage propagation to the UI process by default.
>> - Pass available input devices from UI process to web process for Interaction Media Features.
>> - Always have a fallback when domain does not have known base.
>> - Fix URL after HSTS upgrade in case of redirection.
>> - Fix rendering when device scale factor change comes before the web view geometry update.
>> - Ensure web view is focused on tap gesture.
>> - Fix a crash when setting WEBKIT_SKIA_GPU_PAINTING_THREADS=0.
>> - Fix several crashes and rendering issues.
>> - Translation updates: Brazilian Portuguese, Swedish.
>>
>> 2.49.1:
>> - Change threaded rendering implementation to use Skia API instead of WebCore display
>>   list that is not thread safe. This also allowed to improve performance by recording
>>   layers once and replaying every dirty region in different worker threads.
>> - Added hybrid rendering mode that tries to use the GPU worker threads, but if they
>>   are all busy the CPU worker threads are used if possible.
>> - Add volume locking support to media player.
>> - Add support for tracing counters with Sysprof.
>> - Fix several crashes and rendering issues.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  .../webkitgtk/fix-armv7-compilation.patch     | 32 -------
>>  .../webkitgtk/fix-musl-compilation.patch      | 94 +++++++++++++++++++
>>  .../webkit/webkitgtk/no-musttail-arm.patch    | 34 -------
>>  ...ebkitgtk_2.48.5.bb => webkitgtk_2.50.0.bb} |  5 +-
>>  4 files changed, 96 insertions(+), 69 deletions(-)
>>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
>>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
>>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
>>  rename meta/recipes-sato/webkit/{webkitgtk_2.48.5.bb => webkitgtk_2.50.0.bb} (97%)
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
>> deleted file mode 100644
>> index a857d55ae4..0000000000
>> --- a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From 7999ecd5ee4ea3123f7e75634d2bc57f57ca7070 Mon Sep 17 00:00:00 2001
>> -From: Justin Michaud <jmichaud@igalia.com>
>> -Date: Wed, 6 Aug 2025 21:14:26 +0300
>> -Subject: [PATCH] REGRESSION(2.48.5): [WPE][GTK] Does not compile on ARMv7
>> - https://bugs.webkit.org/show_bug.cgi?id=296921
>> -
>> -Unreviewed build fix.
>> -
>> -* Source/JavaScriptCore/llint/WebAssembly.asm: Replace addq with addp
>> -  for sp on armv7
>> -
>> -Canonical link: https://commits.webkit.org/290945.344@webkitglib/2.48
>> -
>> -Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/7999ecd5ee4ea3123f7e75634d2bc57f57ca7070]
>> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ----
>> - Source/JavaScriptCore/llint/WebAssembly.asm | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaScriptCore/llint/WebAssembly.asm
>> -index 1ac3e2accf3c..bd9041404eb1 100644
>> ---- a/Source/JavaScriptCore/llint/WebAssembly.asm
>> -+++ b/Source/JavaScriptCore/llint/WebAssembly.asm
>> -@@ -736,7 +736,7 @@ if JSVALUE64
>> -     storep memoryBase, Callee[cfr]
>> - else
>> -     loadp [sp], ws0
>> --    addq 2 * SlotSize, sp
>> -+    addp 2 * SlotSize, sp
>> -     storep ws0, Callee[cfr]
>> - end
>> -
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
>> new file mode 100644
>> index 0000000000..aba0f7cf4d
>> --- /dev/null
>> +++ b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
>> @@ -0,0 +1,94 @@
>> +From 820e4bb46d7e72ba2b14b15819166919c2e81205 Mon Sep 17 00:00:00 2001
>> +From: Adrian Perez de Castro <aperez@igalia.com>
>> +Date: Wed, 15 Oct 2025 00:58:59 +0300
>> +Subject: [PATCH] [libpas] Build fails with libc implementations that lack
>> + execinfo.h https://bugs.webkit.org/show_bug.cgi?id=300701
>> +
>> +Reviewed by NOBODY (OOPS!).
>> +
>> +Change guards to use backtrace() and execinfo.h on Linux only when using
>> +glibc as the C library. The PlayStation and Windows cases no longer need
>> +to be matched, as they are neither Linux nor Darwin, both of which are now
>> +explicitly listed. The Android check is kept as it was.
>> +
>> +* Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:
>> +* Source/bmalloc/libpas/src/test/PGMTests.cpp:
>> +(addPGMTests):
>> +
>> +
>> +Fixes the following error in OE, when compiled with musl:
>> +
>> +| ${UNPACKDIR}/webkitgtk-2.50.0/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:52:10: fatal error: execinfo.h: No such file or directory
>> +|    52 | #include <execinfo.h>
>> +
>> +
>> +Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/52300]
>> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> +
>> +---
>> + .../pas_probabilistic_guard_malloc_allocator.c      |  4 ++--
>> + Source/bmalloc/libpas/src/test/PGMTests.cpp         | 13 ++++++-------
>> + 2 files changed, 8 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
>> +index ff3adefa7dcc..58ec32eb4fed 100644
>> +--- a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
>> ++++ b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
>> +@@ -43,8 +43,8 @@
>> + #include <unistd.h>
>> + #endif
>> +
>> +-/* PlayStation does not currently support the backtrace API. Android API versions < 33 don't, either. Windows does not either. */
>> +-#if !PAS_PLATFORM(PLAYSTATION) && (!PAS_OS(ANDROID) || __ANDROID_API__ >= 33) && !PAS_OS(WINDOWS)
>> ++/* PlayStation does not currently support the backtrace API. Android API versions < 33 don't, either. Windows does not either. Linux only with GLibc and not uCLibc/Musl. */
>> ++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
>> + #include <execinfo.h>
>> + #else
>> + size_t backtrace(void** buffer, size_t size)
>> +diff --git a/Source/bmalloc/libpas/src/test/PGMTests.cpp b/Source/bmalloc/libpas/src/test/PGMTests.cpp
>> +index 0432f46ba3b0..dfbf957a3421 100644
>> +--- a/Source/bmalloc/libpas/src/test/PGMTests.cpp
>> ++++ b/Source/bmalloc/libpas/src/test/PGMTests.cpp
>> +@@ -43,9 +43,9 @@
>> + #include "pas_report_crash.h"
>> + #include "pas_root.h"
>> +
>> +-#if !PAS_PLATFORM(PLAYSTATION)
>> ++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
>> + #include <execinfo.h>
>> +-#endif // !PAS_PLATFORM(PLAYSTATION)
>> ++#endif
>> +
>> + using namespace std;
>> +
>> +@@ -383,8 +383,7 @@ void testPGMMetadataVectorManagementFewDeallocations()
>> +     pas_heap_lock_unlock();
>> + }
>> +
>> +-/* Backtrace API is currently not supported on PlayStation. */
>> +-#if !PAS_PLATFORM(PLAYSTATION)
>> ++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
>> + void testPGMMetadataDoubleFreeBehavior()
>> + {
>> +     pas_probabilistic_guard_malloc_initialize_pgm_as_enabled(1);
>> +@@ -583,7 +582,7 @@ void testPGMAllocMetadataOnly()
>> +         CHECK(!dealloc_metadata);
>> +     }
>> + }
>> +-#endif // !PAS_PLATFORM(PLAYSTATION)
>> ++#endif
>> +
>> + } // anonymous namespace
>> +
>> +@@ -598,9 +597,9 @@ void addPGMTests()
>> +     ADD_TEST(testPGMMetadataVectorManagement());
>> +     ADD_TEST(testPGMMetadataVectorManagementFewDeallocations());
>> +     ADD_TEST(testPGMMetadataVectorManagementRehash());
>> +-#if !PAS_PLATFORM(PLAYSTATION)
>> ++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
>> +     ADD_TEST(testPGMMetadataDoubleFreeBehavior());
>> +     ADD_TEST(testPGMBmallocAllocationBacktrace());
>> +     ADD_TEST(testPGMAllocMetadataOnly());
>> +-#endif // !PAS_PLATFORM(PLAYSTATION)
>> ++#endif
>> + }
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
>> deleted file mode 100644
>> index 367e6b8342..0000000000
>> --- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Fri, 12 Jan 2024 09:21:39 -0800
>> -Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
>> -
>> -This causes clang-17 to crash see [1]
>> -this code is new in webkit 2.42[2] thats why we do not see the crash in older webkit
>> -
>> -[1] https://github.com/llvm/llvm-project/issues/67767
>> -[2] https://github.com/WebKit/WebKit/commit/4d816460b765acd8aef90ab474615850b91ecc35
>> -
>> -Upstream-Status: Inappropriate [work around to avoid clang compiler crash]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> -Update context for webkitgtk 2.48.0.
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> - Source/WTF/wtf/Compiler.h | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
>> -index 16e416d..68dd9a0 100644
>> ---- a/Source/WTF/wtf/Compiler.h
>> -+++ b/Source/WTF/wtf/Compiler.h
>> -@@ -293,7 +293,7 @@
>> - #if COMPILER(CLANG)
>> - #if __SIZEOF_POINTER__ == 8
>> - #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
>> --#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32)
>> -+#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
>> - #define MUST_TAIL_CALL [[clang::musttail]]
>> - #define HAVE_MUST_TAIL_CALL 1
>> - #endif
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
>> similarity index 97%
>> rename from meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
>> rename to meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
>> index 46031322b9..4dc6d4700e 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
>> @@ -13,14 +13,13 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>>             file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
>>             file://reproducibility.patch \
>>             file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
>> -           file://no-musttail-arm.patch \
>>             file://t6-not-declared.patch \
>>             file://sys_futex.patch \
>>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
>>             file://fix-ftbfs-riscv64.patch \
>> -           file://fix-armv7-compilation.patch \
>> +           file://fix-musl-compilation.patch \
>>             "
>> -SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
>> +SRC_URI[sha256sum] = "e564b8099f9a3ae32409539b290bbd2ad084e99b6d22d4aac5e51e4554df8bc2"
>>
>>  inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224883): https://lists.openembedded.org/g/openembedded-core/message/224883
>> Mute This Topic: https://lists.openembedded.org/mt/115767514/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


