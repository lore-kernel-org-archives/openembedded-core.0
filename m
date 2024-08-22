Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C090FC5320E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.9520.1724319345814080557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYCWpPRL;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f409c87b07so2653021fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319344; x=1724924144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIMc4WMA8M68F+HR/DU/Iur6Pxqkl8v7mXqKqVWYAr8=;
        b=TYCWpPRLWhRYnmZf5wKV7kNQ7VgrTDJ/eJ4rovYLFl97jLt27HbKvYA31yAKVaCtf3
         8ZwDUxoS7Ja6Fc9W8mkQESJCyluwprdXrpJFyL/GgQqiR7LMvLcBRb35DxQkuW+io/cP
         eTQQp7/pG7zrNbd7UfLmOGDj/48Xun7XUtSQxw7ZosY6KyWFV8RflUCYllg+W9CVf42u
         7UTPuG8WjFn/m4Xx9K0b7knTJGCcsMKixz4nWytkJZngzs/KAQfU5MrpgGjS1im+qlhf
         iDgwVBsEUS/G2/Qmq2loXyW3n3XnL5p/FbYFGZSAEmB6Nmrr7HDIYoDgI1dLaqnGlabw
         kzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319344; x=1724924144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIMc4WMA8M68F+HR/DU/Iur6Pxqkl8v7mXqKqVWYAr8=;
        b=QFubkXKqaVPyFXNUhtT7F5Go6lN5wypxW+e7Rh9B7xZ/ux3V3hiarSf1eXiuPsg5vL
         uM6koa9mecGpNzBXYYxNYmDK1bjs8gsBe5/n3xP4kCbgbOSZDH62/Ie9/ZDDyOPQqHot
         whrxYIO4J+KLtFIViWLHGiAOjeQLUpYqgzbe+LIsKKYstUW4bZwCRaBL6yoP2JnND5K0
         FHqmlI+v842lIqZJm5Ld9Fu++caa2lTNFRiiI1mtSvfwNyfXzbliK9ji0Pb3dxsh6hVn
         GdfVfU1252r+l34KJkTyeOvTh/gnItgrpcfoVwwBLVCGS3J5aBusXtgDwiHrQaBVNL73
         zFKA==
X-Gm-Message-State: AOJu0Yy6SOCZVitdQlNn3iPtreJtJffpFuilekk9cw++y1gvRWb85Ywf
	86ETVdD9rP1vWBMnskXpoRR7RTcWMCgmpnIkL2Rm8eLwNi6/1FIPLO+7gg==
X-Google-Smtp-Source: AGHT+IF2fDfowDVFRo82lCRL3Ah/1i3U4cnAmx/f5i2X7YPqk/F2weoPGMeQ9e1Bqcnq3YOTvn7gHQ==
X-Received: by 2002:a2e:b894:0:b0:2ef:290e:4a39 with SMTP id 38308e7fff4ca-2f3f8953040mr36755711fa.35.1724319343267;
        Thu, 22 Aug 2024 02:35:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/32] webkitgtk: upgrade 2.44.1 -> 2.44.3
Date: Thu, 22 Aug 2024 11:35:18 +0200
Message-Id: <20240822093521.36790-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203645

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-a-variable-to-control-macro-__PAS_ALWAYS_I.patch |  6 +++---
 ...ctIntrospection.cmake-prefix-variables-obta.patch |  2 +-
 .../30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch   |  2 +-
 .../webkit/webkitgtk/no-musttail-arm.patch           |  6 +++---
 .../webkit/webkitgtk/reproducibility.patch           |  2 +-
 .../webkit/webkitgtk/t6-not-declared.patch           | 12 +++++-------
 .../{webkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb}     |  2 +-
 7 files changed, 15 insertions(+), 17 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb} (99%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index a819e221272..a19008a41fc 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 575b848a3b3c14280679db80d0d518922c83d62a Mon Sep 17 00:00:00 2001
+From 99a21305ae683a216e9299e5dbdd763190a8cfe3 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -57,10 +57,10 @@ index 5d5fb38c..a554f700 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index 9b2fecf9..7cdc2b6a 100644
+index 0732785e..4879ec40 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -453,3 +453,10 @@ endif ()
+@@ -452,3 +452,10 @@ endif ()
  
  # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
  set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 8e29ce17edf..dda20a7b25b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 6348f91c29e2350ad3fec5264aa57dd4994d4583 Mon Sep 17 00:00:00 2001
+From d1f6a1b6a1298f6ef2f1677e9996aa60a002134a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
index 76bcb3df99e..0d8976c5020 100644
--- a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
@@ -1,4 +1,4 @@
-From 1523e00a2a76e285262c8aa3721b5d99f3f2d612 Mon Sep 17 00:00:00 2001
+From 2ee948191de1c561b72ebf462605376cfb3ce7af Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Mon, 16 Jan 2023 17:03:30 +0100
 Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index 8ce37a01cc0..793be48df2e 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,4 @@
-From a9c874f7418cefbe78f7cd26505ae495cb59bbcf Mon Sep 17 00:00:00 2001
+From 31dca9601888f2a539dfb22693ffd62c22ee8912 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Jan 2024 09:21:39 -0800
 Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index 0ea5cb76..c5480dbc 100644
+index 449ca502..daac29d7 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -284,7 +284,7 @@
+@@ -321,7 +321,7 @@
  /* MUST_TAIL_CALL */
  
  #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 93a431a0b1e..d614a1ee4f6 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From d096b945113ddecaf33062296e20b6d5a007cab3 Mon Sep 17 00:00:00 2001
+From cb5458b5d15aafa3543a47a33975609026d45d32 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index d4720e4f289..064925dace9 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,10 +1,9 @@
-From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
+From 36c092723ec6d4908039341c9d157db8ab1c0a59 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
-Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
- =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
- =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
- =?UTF-8?q?=3D268739?=
+Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
+ =?UTF-8?q?=E2=80=98t6=E2=80=99=20was=20not=20declared=20in=20this=20scope?=
+ =?UTF-8?q?=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid=3D268739?=
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -22,7 +21,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 5064ead6cd2e7..9a2e2653b1219 100644
+index 75cecbbd..b1020ea4 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 @@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
@@ -34,4 +33,3 @@ index 5064ead6cd2e7..9a2e2653b1219 100644
  
      struct StackPointerScope {
          StackPointerScope(CLoopStack& stack)
-
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
similarity index 99%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
index d927d81a436..a79a9c38247 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            "
-SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
+SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.39.2


