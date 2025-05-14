Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E18C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:21 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.105640.1747238294250518864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EyINeAO1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b239763eeddso4968448a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238293; x=1747843093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5a4GgQc18D2NPYipRPufd6A8enVcAacVrJMuYwiFhQ=;
        b=EyINeAO1RhyGXbfefehRhLDoqU+aEdDYwPwZ5J9OkALsaovHdpXe09CiKk/jlF/eK4
         ADcVN80oqAEckrhbRwSmfYeR6InJ5ffSFjFsvgffggz+PvL4Wy+PfNVYEcud658epKgF
         U1NPDjjHp/8Q+0c5NQYTqKOBVQAf4/s7KqROQvgJ6Kh7+I32ku62VN6rivRIziNgJ3/E
         6QaHewKFw5mWj9aq6oogEzJ3xuK60S+LwlDYBCXTHvufPx5n7hLmenWdQw3NW2iuuE+V
         wqKEGqp/I34FlW2SpjAxlRMPxCH+PLKk+ssGvyyMt+3DeZqSAyTqUyr3zfWD3bUFkha8
         p7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238293; x=1747843093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5a4GgQc18D2NPYipRPufd6A8enVcAacVrJMuYwiFhQ=;
        b=IudKOIoE25Jp5LkKqQ3d4/vLMoj4baR956LQ0CWx897ev4P0+MZpc42VI/NvA/PKyf
         hyC4PfcB0Phh9nDcaPYm1zUqy7LxQLCQv25zqzbuDAOexutupi+7LyHUVZOAuF905utD
         oH9w3g/3nQ9/eoxpr4q/8dUxASLqPtIUf7F2mzHrrxtMSd8JxIKIGvLaj10mX1U0A3lp
         153Gc2lL62qHd32DFTWrvcI79G7ZmHrMhNzS8mF7ahT9z9VIV1wZFC7UeMCS1zlmhHz9
         LZXVft88L7Ev0bNpRxpTgJcGnivVjZG8eeIHQ+rRuupgltT5xRLmyllcbHZaPZ0ezDN2
         QLVA==
X-Gm-Message-State: AOJu0YyE4LDUrPWWqiQhFgJKmaPxhekGw2VAB6KMfRVZNB0n8shSbXNw
	TcFzqKiDpi5SGPxDWkbqXv2NWPyNR+4S7uel4DmGh4MZy63r5j9kCG/eQEUbo08FxKXppzNouo/
	9
X-Gm-Gg: ASbGnctoE7nSfm7ZyWUX6a9DTiUN+GkofQ49t9aSFXTx0iEaIhq5humA5Tm8Rmrb6F0
	U8HLD/gs3BCnbeogs8DnGisD65pvXUSpyJ9jDPkqJCAag3jtGA13oS0R/5H04yMA6ueCNtA07lb
	4IJ7cvvoUf19wQwkWLXMmeIMVtbEBa65O1tkpebgAiYfGzA/ormwiAGg8jZxZyHoj7CBYKG0eK5
	lyc1xX8lEqUNS1rAjrFoODzixFL4Mn2+mHFnEaFQrGQ3+QGZ2gaku4J2yrwOgL+C4FqB79hgYLC
	EGQOjj3gT5/3ZRnLxQelBLoxRULpB+AiKIrM6134
X-Google-Smtp-Source: AGHT+IHZ0YSyqzhVMVDk4ryAnZFSmOncmFXwxnbr2q77x3uykFA1gyrfGV4UyxIQpktxCFpqduLOqg==
X-Received: by 2002:a17:903:187:b0:225:adf8:8634 with SMTP id d9443c01a7336-23198402b69mr48077305ad.51.1747238293351;
        Wed, 14 May 2025 08:58:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/12] webkitgtk: upgrade 2.48.0 -> 2.48.1
Date: Wed, 14 May 2025 08:57:52 -0700
Message-ID: <2a1fd538e42a8721b4f49135e14771cc1d646588.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216508

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-54551, CVE-2025-24208, CVE-2025-24209,
CVE-2025-24213, CVE-2025-24216, CVE-2025-24264 and CVE-2025-30427

Changelog:
=========
- Limit the data stored in session state.
- Remove the empty area below the title bar in Web Inspector when not docked.
- Fix the build with GST_DISABLE_GST_DEBUG.
- Fix the build with GStreamer < 1.20.
- Fix the build with video disabled.
- Fix the build with clang 20.

Drop 0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
and 0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
which are part of upgrade.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...04-main-7ffc29624258-.-https-bugs.we.patch | 75 ------------------
 ...or-no-matching-function-for-call-to-.patch | 77 -------------------
 ...ebkitgtk_2.48.0.bb => webkitgtk_2.48.1.bb} |  4 +-
 3 files changed, 1 insertion(+), 155 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.0.bb => webkitgtk_2.48.1.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
deleted file mode 100644
index 5cbb1035b2..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Tue, 18 Mar 2025 07:39:01 -0700
-Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
- https://bugs.webkit.org/show_bug.cgi?id=289953
-
-    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
-    https://bugs.webkit.org/show_bug.cgi?id=289953
-
-    Reviewed by Alicia Boya Garcia.
-
-    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc++
-      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MODE
-      macro, otherwise for older versions keep _LIBCPP_ENABLE_ASSERTIONS.
-
-    Canonical link: https://commits.webkit.org/292304@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2c105443d41e5ce3de3a4cac2ed8a07ebd134459]
-
-Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
- 1 file changed, 19 insertions(+), 5 deletions(-)
-
-diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
-index f6cf5ee..3178674 100644
---- a/Source/cmake/OptionsCommon.cmake
-+++ b/Source/cmake/OptionsCommon.cmake
-@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
- ")
- check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP)
- if (CXX_STDLIB_IS_LIBCPP)
--    set(CXX_STDLIB_VARIANT "LIBCPP")
--    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
-+    set(CXX_STDLIB_TEST_SOURCE "
-+        #include <utility>
-+        #if _LIBCPP_VERSION >= 190000
-+        int main() { }
-+        #else
-+        #error libc++ is older than 19.x
-+        #endif
-+    ")
-+    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
-+    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
-+        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_EXTENSIVE)
-+    else ()
-+        set(CXX_STDLIB_VARIANT "LIBCPP <19")
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=1)
-+    endif ()
- else ()
-     set(CXX_STDLIB_TEST_SOURCE "
-     #include <utility>
-@@ -239,7 +253,7 @@ else ()
-     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_GLIBCXX)
-     if (CXX_STDLIB_IS_GLIBCXX)
-         set(CXX_STDLIB_VARIANT "GLIBCXX")
--        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=1)
-     endif ()
- endif ()
- message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
-@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
- 
- if (USE_CXX_STDLIB_ASSERTIONS)
-     if (CXX_STDLIB_ASSERTIONS_MACRO)
--        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}=1")
--        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=1")
-+        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}")
-+        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
-     else ()
-         message(STATUS "  Assertions disabled, CXX_STDLIB_ASSERTIONS_MACRO undefined")
-     endif ()
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
deleted file mode 100644
index 5b83d9e7eb..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00 2001
-From: Fujii Hironori <Hironori.Fujii@sony.com>
-Date: Tue, 18 Mar 2025 10:25:47 +0900
-Subject: [PATCH] EnumTraits.h: error: no matching function for call to
- 'enumName' with Clang 20 https://bugs.webkit.org/show_bug.cgi?id=289669
-
-Reviewed by NOBODY (OOPS!).
-
-Clang 20 couldn't compile EnumTraits.h.
-
-> wtf/EnumTraits.h:212:33: note: candidate template ignored: invalid explicitly-specified argument for template parameter 'V'
-
-An invalid enum value can't be specifed to the template parameter `V`.
-
-> template<auto V> constexpr std::span<const char> enumName()
-
-The upstream Magic Enum C++ has a template variable `is_enum_constexpr_static_cast_valid<E, V>` to check a enum value is valid.
-<https://github.com/Neargye/magic_enum/blob/a413fcc9c46a020a746907136a384c227f3cd095/include/magic_enum/magic_enum.hpp#L624-L634>
-
-Imported the template variable.
-
-* Source/WTF/wtf/EnumTraits.h:
-(WTF::enumName):
-(WTF::makeEnumNames):
-
-Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42597]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-
- 1 file changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTraits.h
-index 0d33e39a..95e6318b 100644
---- a/Source/WTF/wtf/EnumTraits.h
-+++ b/Source/WTF/wtf/EnumTraits.h
-@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()
- #pragma clang diagnostic ignored "-Wenum-constexpr-conversion"
- #endif
- 
-+#if COMPILER(CLANG) && __clang_major__ >= 16
-+template <typename E, auto V, typename = void>
-+inline constexpr bool isEnumConstexprStaticCastValid = false;
-+template <typename E, auto V>
-+inline constexpr bool isEnumConstexprStaticCastValid<E, V, std::void_t<std::integral_constant<E, static_cast<E>(V)>>> = true;
-+#else
-+template <typename, auto>
-+inline constexpr bool isEnumConstexprStaticCastValid = true;
-+#endif
-+
- template<typename E>
- constexpr std::span<const char> enumTypeNameImpl()
- {
-@@ -215,6 +225,15 @@ constexpr std::span<const char> enumName()
-     return result;
- }
- 
-+template<typename E, auto V>
-+constexpr std::span<const char> enumName()
-+{
-+    if constexpr (isEnumConstexprStaticCastValid<E, V>)
-+        return enumName<static_cast<E>(V)>();
-+    else
-+        return { };
-+}
-+
- template<typename E>
- constexpr std::underlying_type_t<E> enumNamesMin()
- {
-@@ -264,7 +283,7 @@ constexpr auto makeEnumNames(std::index_sequence<Is...>)
- {
-     constexpr auto min = enumNamesMin<E>();
-     return std::array<std::span<const char>, sizeof...(Is)> {
--        enumName<static_cast<E>(static_cast<std::underlying_type_t<E>>(Is) + min)>()...
-+        enumName<E, static_cast<std::underlying_type_t<E>>(Is) + min>()...
-     };
- }
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
index 58b78b5f28..58d0a11202 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -16,12 +16,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
-           file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
-           file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
            "
-SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
+SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


