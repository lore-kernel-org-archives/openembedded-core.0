Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0097C54E5C
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.15047.1709739748060648590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A9RRjeKe;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso9350208a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739746; x=1710344546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUsLBqFWHw0F9SbvVbGz9/ler7e8viuzYIuXc5vxZvg=;
        b=A9RRjeKeARKRrRiOczDi5Pbzl6F/W1/JwKlea+Knvh6JwCNuxymIJdDtvDpEkvMPBS
         kOuhjmPQoKCAeg/n3bwB3GzAVBmiJaJbnreAGFo+aXchPSsU6thU0nEDQ8Z47yYkjDdx
         fLAGmWBk5lgGfgmqsWd1VE2qvUeRvEGY3A7XwtcXpUxBSTfJIZ3IDFffPsDyAc1HJ4Hf
         2JRkPtVNeIeJ6XTK4RIYexW+mp0a0ERpmwlnd+olE23Tzz8zpqg9JyBLRALNrl8J3b3R
         XWGrKmEBFBOuJQ/hKU3KJMhiYTkLVKJ8Z971UFAj6gIfDgIRvPdN17mSN4bpDXdhLmA2
         7lzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739746; x=1710344546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUsLBqFWHw0F9SbvVbGz9/ler7e8viuzYIuXc5vxZvg=;
        b=ZOtm91kTPK3n/O93U1sHZv4XCyAHFcx/Z3abNiy79VyvUuEHz/cXugyxBe49/Cb1JQ
         Y/uqvRF9/gAHfnFUrb/l5bTSlj4FDy8hAyLoG98t47w1Axe2fWHRm7p0IE4Zmrbc496c
         o9yNHjpIWuIXKt8zMaivd0F+D0creWjQA67EVo1Ocuunzl375yiAfVAFnrTnCeyHXqU6
         wyLD9QWROxrUY7SoHl8ZzcAGYDuloLMHkKD9uUF64gjOshKg79mzIcakvWm6gxfRLJn3
         4muSYauW+5s6Y+XlmTmMIiHRDcb5mtppNOfIa736DUNIoBawp/KkPDaahPUl4A+1fq3h
         n5Xw==
X-Gm-Message-State: AOJu0YyqcBW/wgPBu/A0UkaUQSCjnU0Dc0mMNP6ZgGMhZX9e8d1MzYxI
	MxV6hesf303SnKrDSnFcf6ogj5A5DW0QJ9d8ngdlhTTzhKgQP8L07NP4YEWO
X-Google-Smtp-Source: AGHT+IG7pvixTnZcF/zspMEowkWIsdH59rmmZJoUXcGtJOmp95qVBwhQDl/lAQhZ1CRqDT+J/wLaFA==
X-Received: by 2002:a17:906:2448:b0:a45:3308:560f with SMTP id a8-20020a170906244800b00a453308560fmr7022188ejb.64.1709739746344;
        Wed, 06 Mar 2024 07:42:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 47/47] webkitgtk: upgrade 2.42.2 -> 2.42.5
Date: Wed,  6 Mar 2024 16:41:51 +0100
Message-Id: <20240306154151.3741709-47-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196730

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch | 11 ++----
 ...spection.cmake-prefix-variables-obta.patch |  4 +-
 ...44e17d258106617b0e6d783d073b188a2548.patch |  3 +-
 .../webkit/webkitgtk/no-musttail-arm.patch    | 11 +++++-
 .../webkit/webkitgtk/reproducibility.patch    | 16 ++++++--
 .../webkit/webkitgtk/t6-not-declared.patch    | 37 +++++++++++++++++++
 ...ebkitgtk_2.42.2.bb => webkitgtk_2.42.5.bb} |  3 +-
 7 files changed, 68 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.42.2.bb => webkitgtk_2.42.5.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 4266d11e9e2..a819e221272 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,7 +1,7 @@
-From 73efe0ea75c3ac4cb088f300acc3de44d5dd3344 Mon Sep 17 00:00:00 2001
+From 575b848a3b3c14280679db80d0d518922c83d62a Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
-Subject: [PATCH] [CMake] Add a variable to control macro
+Subject: [PATCH] Add a variable to control macro
  __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
  https://bugs.webkit.org/show_bug.cgi?id=260065
 
@@ -44,7 +44,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-index 5d5fb38cddbd..a554f70064eb 100644
+index 5d5fb38c..a554f700 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 @@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
@@ -57,7 +57,7 @@ index 5d5fb38cddbd..a554f70064eb 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index 9b2fecf9a0d3..7cdc2b6afbe0 100644
+index 9b2fecf9..7cdc2b6a 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
 @@ -453,3 +453,10 @@ endif ()
@@ -71,6 +71,3 @@ index 9b2fecf9a0d3..7cdc2b6afbe0 100644
 +if (WEBKIT_NO_INLINE_HINTS)
 +    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
 +endif ()
--- 
-2.34.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 8ae39f14e11..8e29ce17edf 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
+From 6348f91c29e2350ad3fec5264aa57dd4994d4583 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
-index af039cbb..b3e810cd 100644
+index fdc56b21..d42eca52 100644
 --- a/Source/cmake/FindGI.cmake
 +++ b/Source/cmake/FindGI.cmake
 @@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
index e5ece82ed31..a4ef565db0e 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -1,4 +1,4 @@
-From 95398982f4a120147a98a27e176facf6d95b2bf7 Mon Sep 17 00:00:00 2001
+From a180f6821f81c65e320be0cebac72b4dcf86342e Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Thu, 2 Jun 2022 11:19:06 +0300
 Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
@@ -33,7 +33,6 @@ left for a follow-up fix.
 
 Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/1233]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  .../cpu/arm/filters/FELightingNEON.cpp        |  4 +-
  .../graphics/cpu/arm/filters/FELightingNEON.h | 52 +++++++++----------
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index a6d67c1d703..8ce37a01cc0 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,7 @@
-clang/arm: Do not use MUST_TAIL_CALL
+From a9c874f7418cefbe78f7cd26505ae495cb59bbcf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Jan 2024 09:21:39 -0800
+Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
 
 This causes clang-17 to crash see [1]
 this code is new in webkit 2.42[2] thats why we do not see the crash in older webkit
@@ -8,6 +11,12 @@ this code is new in webkit 2.42[2] thats why we do not see the crash in older we
 
 Upstream-Status: Inappropriate [work around to avoid clang compiler crash]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WTF/wtf/Compiler.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
+index 0ea5cb76..c5480dbc 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
 @@ -284,7 +284,7 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index e866a1a193a..93a431a0b1e 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,3 +1,8 @@
+From d096b945113ddecaf33062296e20b6d5a007cab3 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 3 Jan 2022 14:18:34 +0000
+Subject: [PATCH] webkitgtk: Add reproducibility fix
+
 Injection a year based on the current date isn't reproducible. Hack this
 to a specific year for now for reproducibilty and to avoid autobuilder failures.
 
@@ -6,11 +11,14 @@ then this could be submitted upstream, sadly my ruby isn't up to that.
 
 Upstream-Status: Pending [could be reworked]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ Source/JavaScriptCore/generator/GeneratedFile.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
-===================================================================
---- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
-+++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+diff --git a/Source/JavaScriptCore/generator/GeneratedFile.rb b/Source/JavaScriptCore/generator/GeneratedFile.rb
+index 6ed2b6e4..86a28286 100644
+--- a/Source/JavaScriptCore/generator/GeneratedFile.rb
++++ b/Source/JavaScriptCore/generator/GeneratedFile.rb
 @@ -25,7 +25,7 @@ require 'date'
  require 'digest'
  
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
new file mode 100644
index 00000000000..d4720e4f289
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -0,0 +1,37 @@
+From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 5 Feb 2024 11:00:49 -0600
+Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
+ =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
+ =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
+ =?UTF-8?q?=3D268739?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Unreviewed build fix. Seems a backport went badly, and we didn't notice
+because the code is architecture-specific.
+
+* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
+(JSC::CLoop::execute):
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+index 5064ead6cd2e7..9a2e2653b1219 100644
+--- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
++++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+     UNUSED_VARIABLE(t2);
+     UNUSED_VARIABLE(t3);
+     UNUSED_VARIABLE(t5);
+-    UNUSED_VARIABLE(t6);
+-    UNUSED_VARIABLE(t7);
+ 
+     struct StackPointerScope {
+         StackPointerScope(CLoopStack& stack)
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.42.5.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.42.5.bb
index 997aa5575b0..6790814958b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.42.5.bb
@@ -15,8 +15,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            file://no-musttail-arm.patch \
+           file://t6-not-declared.patch \
            "
-SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
+SRC_URI[sha256sum] = "b64278c1f20b8cfdbfb5ff573c37d871aba74a1db26d9b39f74e8953fe61e749"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.39.2


