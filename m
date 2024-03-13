Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8725FC54E68
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.2097.1710351233318632377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mDTeGj2G;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-413ef770149so565445e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351232; x=1710956032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmZVNriWY6PrEjUAvLT2K1f7FKV4KQCEJOp5n9k6jW4=;
        b=mDTeGj2G8/n4rqroF6a4O6MmqH0eALwmC1rrqFUnk8d8NTXgPmyF/MXyIgSs3w8w5X
         6txQBu24hwiPjEeg6BPTs82HlaPhmC/VBzwbXmPXDLDYj8jjRShca5ACwK7Z/7/w4vrQ
         7dHSHcMv26R8Rc6RY/rmy9RnT7He5xnE10p/YL5aBdJ6L1ugDcIfAI3+UeaSC3E4pzzq
         qImxfLDgMdYNn8MHM7uotIOOzJX4WsCQGdk2LMUjgeo/wpXs6BP7ChjKxmF9kkV8hGZT
         FASB5DV9CX4NegBDQfQPCGlj1FUOkCdkPqaoZPzopIaK9kNoaMXvtyyGlqEy2SNBhi40
         6K4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351232; x=1710956032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmZVNriWY6PrEjUAvLT2K1f7FKV4KQCEJOp5n9k6jW4=;
        b=QUV/sGJjLInnBJnSztUPkwS/G4pY3LziqR6hFOLW8CvhcOjE9Evi6QwHisdq+MrJGp
         sZ3bXjZ0I6se0qiJ6luJnEPLX7s62qevWqlDArlUHEk0bllR//+NZ7ftEuKK1MDt2JCY
         MlVRsgTQkomM2uREUyfnkE01t92xs5/LTLNgvO5qr+prFMG6PsM/Vos/Wbh4/Guwi8Ec
         t/IPtOwv+rqO7Q/L+Dthzlej7XJd11QktkAhP0z0Gg1/s3c4YETYj7V2Jlub6CXAgNka
         wj95AsFfvyCG2fkBsWmf7WIKBVDpc/lZlg51kfYvQzqAEiWPgcs8zeCLLk9mGwQilS71
         rviw==
X-Gm-Message-State: AOJu0YwAMyEq+vL1ifOzEo/CuteyLCG/7txIvt5ogUCUUkSzcIq8Me5o
	QH4zEzHdQgXs7CwAnHvl31BN0HroQpSFns6bxPlNuZTCco0A6Migtfxh5tRg
X-Google-Smtp-Source: AGHT+IHmqSoo24kLij0dlwmaZ8yRBfYad6c0VO0A0f3gtfbMGwnrf9sqgvsGhmJ6GpJnWJhBdLTbhQ==
X-Received: by 2002:a05:600c:470f:b0:412:e3aa:8f69 with SMTP id v15-20020a05600c470f00b00412e3aa8f69mr499864wmo.30.1710351231708;
        Wed, 13 Mar 2024 10:33:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/21] waffle: update 1.7.2 -> 1.8.0
Date: Wed, 13 Mar 2024 18:33:35 +0100
Message-Id: <20240313173336.3900178-20-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197072

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...build-request-native-wayland-scanner.patch | 28 -------------------
 ...-make-core-protocol-into-the-library.patch |  9 +++---
 .../{waffle_1.7.2.bb => waffle_1.8.0.bb}      |  5 ++--
 3 files changed, 6 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
 rename meta/recipes-graphics/waffle/{waffle_1.7.2.bb => waffle_1.8.0.bb} (93%)

diff --git a/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch b/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
deleted file mode 100644
index 4b3a0e7c4a9..00000000000
--- a/meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0961787d2bf0d359a3ead89e9cec642818b32dea Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 5 Jul 2022 11:51:39 +0200
-Subject: [PATCH] meson.build: request native wayland-scanner
-
-This matters in cross compilation, as otherwise meson will
-try to use a cross-binary, and fail.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/waffle/-/merge_requests/110]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index ca6a212..3177bde 100644
---- a/meson.build
-+++ b/meson.build
-@@ -110,7 +110,7 @@ else
-     'wayland-egl', version : '>= 9.1', required : get_option('wayland'),
-   )
-   dep_wayland_scanner = dependency(
--    'wayland-scanner', version : '>= 1.15', required : get_option('wayland'),
-+    'wayland-scanner', version : '>= 1.15', required : get_option('wayland'), native: true,
-   )
-   if dep_wayland_scanner.found()
-     prog_wayland_scanner = find_program(dep_wayland_scanner.get_variable(pkgconfig: 'wayland_scanner'))
diff --git a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch b/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
index 60e6318f7a4..31ac3e0dd19 100644
--- a/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
+++ b/meta/recipes-graphics/waffle/waffle/0001-waffle-do-not-make-core-protocol-into-the-library.patch
@@ -1,4 +1,4 @@
-From 71f9399d6cea1e2e885a98b98d82eb628832a86e Mon Sep 17 00:00:00 2001
+From 79b9e4338f803d79449e53a40b1ecc0a5a5889e4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 26 Oct 2021 08:52:17 +0200
 Subject: [PATCH] waffle: do not make core protocol into the library
@@ -9,16 +9,15 @@ wayland.xml from the host.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  src/waffle/meson.build | 7 -------
  1 file changed, 7 deletions(-)
 
 diff --git a/src/waffle/meson.build b/src/waffle/meson.build
-index e2636c7..3ff5762 100644
+index 1cc99f6..022745a 100644
 --- a/src/waffle/meson.build
 +++ b/src/waffle/meson.build
-@@ -88,12 +88,6 @@ if build_surfaceless
+@@ -89,12 +89,6 @@ if build_surfaceless
  endif
  
  if build_wayland
@@ -31,7 +30,7 @@ index e2636c7..3ff5762 100644
    wl_xdg_shell_proto_c = custom_target(
      'wl-xdg-shell-proto.c',
      input: wayland_xdg_shell_xml,
-@@ -114,7 +108,6 @@ if build_wayland
+@@ -115,7 +109,6 @@ if build_wayland
      'wayland/wayland_wrapper.c',
    )
    files_libwaffle += [
diff --git a/meta/recipes-graphics/waffle/waffle_1.7.2.bb b/meta/recipes-graphics/waffle/waffle_1.8.0.bb
similarity index 93%
rename from meta/recipes-graphics/waffle/waffle_1.7.2.bb
rename to meta/recipes-graphics/waffle/waffle_1.8.0.bb
index cb917d88943..12b31dcff1c 100644
--- a/meta/recipes-graphics/waffle/waffle_1.7.2.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.8.0.bb
@@ -9,11 +9,10 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
                     file://include/waffle-1/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=maint-1.7 \
+SRC_URI = "git://gitlab.freedesktop.org/mesa/waffle.git;protocol=https;branch=master \
            file://0001-waffle-do-not-make-core-protocol-into-the-library.patch \
-           file://0001-meson.build-request-native-wayland-scanner.patch \
            "
-SRCREV = "f3b42a7216105498842bc6ba77d8481b90d6f5f9"
+SRCREV = "580b912a30085528886603942c100c7b309b3bdb"
 S = "${WORKDIR}/git"
 
 inherit meson features_check lib_package bash-completion pkgconfig
-- 
2.39.2


