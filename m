Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C75C44509
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 12:36:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4207.1783773395694853252
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 05:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KiP2TZPz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ec555a26so12077965e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783773394; x=1784378194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6t1CxPluAxRvg/qbjCcREkAx8BZwFyoq1SvSlwHPE0=;
        b=KiP2TZPz7n8oPuvqvS2tEBz9Z84ztl/88/iY1/nZavLQwxdj0a7vpyyPATONZt54Pr
         bS9Yj5p+5t+MEQWi/p8X7OPeH/vYgyO6MuHHOBeAmyXvVwQZiaGzIcWE/YKzEFt83yiT
         qrhkPUz1HkL8EhbJQDbIV6jn3lUUow3wQuCpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773394; x=1784378194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x6t1CxPluAxRvg/qbjCcREkAx8BZwFyoq1SvSlwHPE0=;
        b=js0v7zAxkWsuKR88R3QUwlzU4gYFxomnlV5VY5ArFq3Td8eahc0nmFC4suuHwtViv7
         KHveoL08kGCVhfa4EW1zQZAxM3yiYe55RwffskiuEGC00EDxw+eMmVTweIMT3DRP+XpZ
         sFw8pqysMOwnDenoGYRtQYXR7nXazG45DRb5JFyEHzDYYUWQZp8QbnQ6rm8gzHYFdF2B
         hl7ONRktfW5UnfmB5xO5XDx+91d5Zos+uoUWKKHORkcF1ChOZA9wZ1JG/aXx39TYsIr9
         snD0H8GnxjNjsgu5zwhpC1P4B0Jhw9B19WpRFf3VfrV6KVA5GQyyI4Svw/wHlpIJrX2O
         9u4A==
X-Gm-Message-State: AOJu0Yx2jeb38mm07PkZSjAP8wz2dA/DrX2cSb62g5OKtlCKQ6yyoNvx
	aTKt0CjMON/7sXdeBRUZtIMKc3GoM/uXyyyxhDSzrwbmRsSBHCqY6dHY/F4C9pCsKB23Ijyi2Z+
	XXFWElZY=
X-Gm-Gg: AfdE7clJQUbfi8mWM0ii/0yU6VdwUIVvgVERg8ARMcDXQZO9JgafUXB3xA6GvHccZCR
	ohtYcmgrBI8jhG0iUqjVpPfvdwLaO1hRUjC70Qm4bEpqAyYpjKZz5HmsF8JcHDT8RlX718rVXAJ
	4Z3EMzbPjCBRTpI5rPRU0TaYVxwSmvMB1AeOiWbTuE3R7oo77ynZu/zK2kMqO3Nu2jFEm2eDr2o
	EKHOTt02FvDwZ3yv62A4u003+KT2HdbdLUBJFIhWayZTYnz7Go9XMnrOlD94w6qwedu/dTWeZho
	hxg68baOy74aNcyVohgU3IAOxw4uHixUZW1qFK4YSdU7kesPFddufnxi+3c9Kt3xCu54I7xtQ0g
	AxeqR/36uZ32j9lSelFpHm2PILas0QJmmYKJ0onUchhfYmYfBkg70LygHP3qVoX/0/E0XQLStW6
	v/+3bBx6BfW8+CfO15rNqJfvCoIUSoIUN5jK/T63DJEW2nfUAHS9W/
X-Received: by 2002:a05:600c:1f91:b0:493:e79e:daa6 with SMTP id 5b1f17b1804b1-493f8826e69mr22735495e9.33.1783773393906;
        Sat, 11 Jul 2026 05:36:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm77172097f8f.17.2026.07.11.05.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:36:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] webkitgtk: upgrade 2.52.4 -> 2.52.5
Date: Sat, 11 Jul 2026 13:36:24 +0100
Message-ID: <20260711123626.1583730-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
References: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 12:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240715

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch | 2 +-
 ...1-FindGObjectIntrospection.cmake-prefix-variables-obta.patch | 2 +-
 ...1-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch | 2 +-
 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch      | 2 +-
 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch        | 2 +-
 meta/recipes-sato/webkit/webkitgtk/sys_futex.patch              | 2 +-
 meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch        | 2 +-
 .../webkit/{webkitgtk_2.52.4.bb => webkitgtk_2.52.5.bb}         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.52.4.bb => webkitgtk_2.52.5.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 4aad11e3119..4680f7122a1 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 73c15fceb9bcb3896c56de0ab712e76d2eca0b19 Mon Sep 17 00:00:00 2001
+From 7fb043d96ff7439ce6449a6579d6fe3f1309c04d Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index b05ebe5fbb8..7af54167338 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 6ec23f12926c93746fdd30a9b5547a76878c9a4c Mon Sep 17 00:00:00 2001
+From 01b76242ff5a63c267faa58fbe64bb71038f6d6e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
index 03b3db24444..b9fc7253e54 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
@@ -1,4 +1,4 @@
-From e625e06202f992936b43790ee2c992611facba04 Mon Sep 17 00:00:00 2001
+From 0c8334d3b9b69f097546f5fb08310acced202e24 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 21 Jun 2026 22:57:24 +0200
 Subject: [PATCH] Source/cmake/FindGLib.cmake: do not set include dirs from
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index 8fff6f5f818..c8c4c55f655 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,4 +1,4 @@
-From 30ce10321a6f49aa27284139dafcf3517f95d13c Mon Sep 17 00:00:00 2001
+From cbfb155a4a5682d350aac6a1b8ff924ccfde7604 Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
 Date: Fri, 19 Dec 2025 10:10:41 +0000
 Subject: [PATCH] Use WTF_CPU_UNKNOWN when building for riscv64
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 1fc3ccaf62d..01682e277cd 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 983fe4a8fd6fb6512fdf78d9a32be345c252e64d Mon Sep 17 00:00:00 2001
+From 8f8fda07abd3ecf03584caf1364d25ef0df06d27 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
index dd9d93a662e..f1b76e51693 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,4 +1,4 @@
-From ddd3c2ff59abeea528d228ad5d5641fc3a3e5f83 Mon Sep 17 00:00:00 2001
+From 01add097b3e79f84778f83f676e4d4cffdbde0e9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Dec 2024 20:24:22 -0800
 Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit time_t
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index b37673293f0..9333b640a63 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From d2df5d7398dea93b4c7907299dc5030274894b15 Mon Sep 17 00:00:00 2001
+From d94e29f2f184b2d2a3503e248b2876deb0170281 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
index 6e1dd4fd19b..1a834733ce9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://fix-ftbfs-riscv64.patch \
            file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch \
            "
-SRC_URI[sha256sum] = "cf4076a1ca2a64788edca8c452d8ebb68d5e2965e588fe46a388a016513edce4"
+SRC_URI[sha256sum] = "8a531a9abd2215936e8a8a914c077b586c0228b31d652f205286a8ec90f3364b"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

