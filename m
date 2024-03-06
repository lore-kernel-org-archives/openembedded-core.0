Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D4BC54E4A
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:20 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.15032.1709739736954209242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqJuuHAD;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-565ef8af2f5so8892078a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739735; x=1710344535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVuY3X2b9PHWFOiisU58iS2gRSdv6kioqt/K5jzNf4I=;
        b=hqJuuHADXldKKvdAgKTTwSBalPixVDFgAW6RWpAZ6PRKqAreC7tDZdspcoVSdEh1ZS
         M6icd3a+8kY/wuLjP3HplCAImcH0uu95/gUKraYk2E4rtGi3rWPmrS8+tkJc+CIrCnq0
         7VQRs69G/ilaSloQkeR9Wv+ygz7fpN+NGvHH1LTCtbHBw+TiKsf8nn6nSEea9aZ4CwIx
         0DPWJBuMTORYqnfzavVLIDmFD6aMzH1DOqv//3lP2GE8RQlLcxGSmsrvp2k0X83ayAn8
         w66GrYdOmTDXyjQyyxp+WNe7XT8iB2rL2nbc5jGL8g03p6139VEw3lpDm9oKqSdXXiit
         ZdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739735; x=1710344535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVuY3X2b9PHWFOiisU58iS2gRSdv6kioqt/K5jzNf4I=;
        b=pKHqk5Ji9OthQQ2nLAhhesOTMCgNdQy7JWCWE/UhSVyCmnLdU+fjbBl1lZ1Hwn4Xnd
         hMj7QK8aD9l05Cb9C5+8f5jn9AtdqtdhtdxkRbmXQWuiUbAhViFrqDD9r06bLSX6JhE+
         Wr0bHFQUijRcwghUVusgcTWTo5AgqUW+CZ5d2RfwO3kSrztzVd2QOhzFMD8jgPqrw4lA
         P7YvPboBvdpMuaOqrYpUs1OpVnLMAa814zJ85qbc64PZvUybCd8h6EVQ3iGl4TD74FaB
         opaJUumi0dVC/8UAQ8I067A5Opj8iFxvqm8eraVpR8qnVg9b/SB9mkcPADh+wdHrsI0f
         EM9A==
X-Gm-Message-State: AOJu0YztjTX2aJLb/n3waNmswkvxMcVuszXmHXhaZhI7Q05afYsDOPNt
	2AzAgth5NN97fgJzH3R7NR8U1F06E0r+FtDdaWGBiSRe7tMRNum92TDoxxZx
X-Google-Smtp-Source: AGHT+IEy9nQei5epsNFIdf+aNRkej5FBzfCIDgrA9kjNdwnOKwm7WqAf0ixJh7n4D3fPUEGL1ZZcCA==
X-Received: by 2002:a17:906:fc01:b0:a44:2ee1:eab3 with SMTP id ov1-20020a170906fc0100b00a442ee1eab3mr10736937ejb.31.1709739735213;
        Wed, 06 Mar 2024 07:42:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/47] mesa: upgrade 24.0.1 -> 24.0.2
Date: Wed,  6 Mar 2024 16:41:31 +0100
Message-Id: <20240306154151.3741709-27-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196710

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mesa/files/0001-gallium-Fix-build-with-llvm-17.patch | 3 +--
 ...01-meson-misdetects-64bit-atomics-on-mips-clang.patch | 3 +--
 ....build-check-for-all-linux-host_os-combinations.patch | 9 ++++-----
 .../mesa/{mesa-gl_24.0.1.bb => mesa-gl_24.0.2.bb}        | 0
 meta/recipes-graphics/mesa/mesa.inc                      | 2 +-
 .../mesa/{mesa_24.0.1.bb => mesa_24.0.2.bb}              | 0
 6 files changed, 7 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_24.0.1.bb => mesa-gl_24.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_24.0.1.bb => mesa_24.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
index 237f940f0bf..ceb0153f8d3 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
@@ -1,4 +1,4 @@
-From 6d07f6aa7f92f40d78a2db645f16f0f3e7d3c2e8 Mon Sep 17 00:00:00 2001
+From 3e1e5c475b52651657c906e6b03ee13567cccdd7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 23 Jun 2023 01:20:38 -0700
 Subject: [PATCH] gallium: Fix build with llvm 17
@@ -9,7 +9,6 @@ so add conditions to exclude them for llvm >= 17
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 9cd9bee2d2c..baa98a0d46b 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,11 +1,10 @@
-From 3ef37c63f03ad6f2af407de350486fdd25e9132a Mon Sep 17 00:00:00 2001
+From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/util/u_atomic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index b0be8d0febf..7be7d81eeb7 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From f2fe76d506f356de055b8eca83a7c9d0744a40af Mon Sep 17 00:00:00 2001
+From e8ec6b1cc5e401ba719095722d8b317d755ae613 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -14,16 +14,15 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 Signed-off-by: Alistair Francis <alistair@alistair23.me>
-
 ---
  meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 35cc5f1..9a49c0d 100644
+index 133fd9a..817861e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -128,7 +128,7 @@
+@@ -128,7 +128,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi = with_shared_glapi and with_any_opengl
  
@@ -32,7 +31,7 @@ index 35cc5f1..9a49c0d 100644
  
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
-@@ -998,7 +998,7 @@
+@@ -997,7 +997,7 @@ if cc.has_function('fmemopen')
  endif
  
  # TODO: this is very incomplete
diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_24.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_24.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e5fa0a76d2b..12d7a18eb82 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
 "
 
-SRC_URI[sha256sum] = "f387192b08c471c545590dd12230a2a343244804b5fe866fec6aea02eab57613"
+SRC_URI[sha256sum] = "94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_24.0.1.bb b/meta/recipes-graphics/mesa/mesa_24.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_24.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_24.0.2.bb
-- 
2.39.2


