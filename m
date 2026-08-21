Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A169CC5DF93
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:10:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3648.1787303411970899601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gDyE9mcz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so389351f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787303410; x=1787908210; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQ23xZdSb6/h4GOWGRbjsNvsxotPVBsSoYDf+vVewY0=;
        b=gDyE9mczdg4KMbOkX0QaFiKtRuBgRS1+akyJNE963+/X4qocTGBKU09P5z7umwerMc
         RsUSZwBunOgl53LKVdOn/6/85ylnCf8f8mXgLdvWw5Pe6MOQeiqnRkl7U5Eqv1GJ4rrq
         FYvJD77L06+4R8/AKEAR/ORDBPgDdkwRcnWrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303410; x=1787908210;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQ23xZdSb6/h4GOWGRbjsNvsxotPVBsSoYDf+vVewY0=;
        b=PUf3R6rsaA5vWf1HTP0kAH+oRd9Ai+2RRRtoy0U7hPppVG3QHZMUQoaB7epDHo+XuT
         lse/n8FO5VbQ6KF9ESz7opIvlTkOBzx8RiwXvYTWNJLDtfTS7L26G4LVEliLi63ie8/8
         iJ+Q54SoO8nmEcwE9LzKksmQ66pmdn+W2BjoP5pGiwNuvRqj7xBkMl+Nf/wFRv4n04wS
         /2PJ+RKg245yd68uMslTaW8A1JVRqcsXRCRKMGYOWEFHfqrrmg4jR3AFHWdltaoE3tV3
         xeu8PnJnlIiQT+KyJJaSroq4o7ckWY7E0BWDzwdsACnxg2IidAn8M4FUxgdYyN7Vfguk
         +7Dw==
X-Gm-Message-State: AFuF++nZYDLMLeXCrFvmL6XBxMxcKRaufsJyOqJ2/rJDhEjhuyIuUVjW
	cUYf3wLIzrZc/QYORRqeKoDySSVjqOLp8EVtFhuqt4ye880St+XQbqgvyJFdwCBoPDLRzSm3bhO
	rT5gQ6rE=
X-Gm-Gg: AR+sD119vg7d++xm0co2K1pRWEVf6i36ItHWLIE3vCQpXxZjLr7ysh+hZBQTwJ6Es8G
	vtuzw444gxztB3A7EUHCnuViz3dtLt0lMo4eeuvGZcUjkpRcWO85RbiDdbWccWDhNRYH4bkyI2V
	pIihd7aLPtGtfThMXeOmpAmLAzqXZIDDpj7gNuqv6NG4JL9OyOU0rWDisT908DhVWu7P6lMpMGm
	kdkbEcoq9SweIaWKqGTD3/E1oyM9YEVzLoZwNV7W8K1YN/lwFIEthkQYqBFfDn8J1YsWJYmMLC3
	DqRKOXMoLBZKkrw62Z8qBtLpx/8tTMNvGhnqtcldcXXBL/TKlcjr3LBlIcw9+uGq+xJki8vbd9w
	PhVl2s8LwlmKepGBTLhtLpbwFuNCPDAxlag9jWkrFuWFL4Ly8C3rv7a/zRwhwj5LlBeF+GKq3Ct
	vXx5yWu3xTYOA2lnPomeildUkUxs2fm+rI6BqKiZaHoVcq1zjs+i0ca65SqIVlDvANFxNpRfGki
	X3xUQsyyCn1UwnUng==
X-Received: by 2002:a05:6000:3109:b0:47f:77dc:b066 with SMTP id ffacd0b85a97d-482c0b4a2femr6763058f8f.5.1787303410053;
        Fri, 21 Aug 2026 02:10:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d23sm17049620f8f.22.2026.08.21.02.10.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:10:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] webkitgtk: upgrade 2.52.5 -> 2.52.6
Date: Fri, 21 Aug 2026 10:09:58 +0100
Message-ID: <20260821090959.3859632-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
References: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243914

What’s new in the WebKitGTK 2.52.6 release?

    Improve memory usage in pages that use font variations.
    The webkit://gpu page now respects the dark theme user preference.
    Fix cross compilation due to failure to pick the correct gio-unix-2.0 headers in certain configurations.
    Fix calculating data sizes of reported through WebKitWebsiteData.
    Fix the build with CMake 4.4 or newer.
    Fix several crashes and rendering issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch | 2 +-
 ...1-FindGObjectIntrospection.cmake-prefix-variables-obta.patch | 2 +-
 ...1-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch | 2 +-
 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch      | 2 +-
 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch        | 2 +-
 meta/recipes-sato/webkit/webkitgtk/sys_futex.patch              | 2 +-
 meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch        | 2 +-
 .../webkit/{webkitgtk_2.52.5.bb => webkitgtk_2.52.6.bb}         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.52.5.bb => webkitgtk_2.52.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 4680f7122a1..3d8ef579a03 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 7fb043d96ff7439ce6449a6579d6fe3f1309c04d Mon Sep 17 00:00:00 2001
+From 891c2de3ea6a3399d0144824c35b2dae0b7a246d Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 7af54167338..f6449c29b03 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 01b76242ff5a63c267faa58fbe64bb71038f6d6e Mon Sep 17 00:00:00 2001
+From 3cec4a230abbe5c2f78f8966c06b009be7504354 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
index b9fc7253e54..334bf33fc1c 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
@@ -1,4 +1,4 @@
-From 0c8334d3b9b69f097546f5fb08310acced202e24 Mon Sep 17 00:00:00 2001
+From a6e91e04651dbd2d003dbaef0919284a8944184e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 21 Jun 2026 22:57:24 +0200
 Subject: [PATCH] Source/cmake/FindGLib.cmake: do not set include dirs from
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index c8c4c55f655..9d10603e0c6 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,4 +1,4 @@
-From cbfb155a4a5682d350aac6a1b8ff924ccfde7604 Mon Sep 17 00:00:00 2001
+From a7e4c23c7f6faf76307ecad5f879e47b96ca66c9 Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
 Date: Fri, 19 Dec 2025 10:10:41 +0000
 Subject: [PATCH] Use WTF_CPU_UNKNOWN when building for riscv64
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 01682e277cd..4a04b1393d4 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 8f8fda07abd3ecf03584caf1364d25ef0df06d27 Mon Sep 17 00:00:00 2001
+From 07ff0c87a0f584c7c6cc1cf723641707a16255f3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
index f1b76e51693..e9161ef037b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,4 +1,4 @@
-From 01add097b3e79f84778f83f676e4d4cffdbde0e9 Mon Sep 17 00:00:00 2001
+From 4ca8868a69eaf046db523a0fde869bfd46d9878c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Dec 2024 20:24:22 -0800
 Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit time_t
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 9333b640a63..46431d78f88 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From d94e29f2f184b2d2a3503e248b2876deb0170281 Mon Sep 17 00:00:00 2001
+From c480a5dc8491d1422994007b149ee08f8d2cc9c5 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
index 945d7b77cb2..cc7ccd55e8b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://fix-ftbfs-riscv64.patch \
            file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch \
            "
-SRC_URI[sha256sum] = "8a531a9abd2215936e8a8a914c077b586c0228b31d652f205286a8ec90f3364b"
+SRC_URI[sha256sum] = "179a2ea3f8f6edd4be7f31fdc55afc57bd0729f1fba648c61d4181539ac116fc"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

