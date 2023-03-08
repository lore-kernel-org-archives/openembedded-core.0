Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFE0C74A4B
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 19:07:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1884.1678302460033667851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 11:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VyjMQgJK;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso1780418wmp.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678302458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2+3XLjNLJfdkL4d8aMq+9QJZ45CuRRrfY7LRLXpvDQ=;
        b=VyjMQgJK7kXIQHzJrJojX1CfZdqOv/IQ8rIiWLDOwDfed1ksTfD09f90iYkmaHZydP
         e0Q2f1BwzBCzqb/19ZVZzjCBeGhFZUtUZcxSs8033y2ZtTfcPDdngfk3jJ7RJGhDwT2Q
         scfZbd01oNnfbOtN9H7KmnWwBFm1sq7We/hWsNbshWUA3sJixm6SKNntekxmMLvwjHin
         aIMsLUXS6YMBtwOLxFAVIM40YVtQxs/bULocbshnSw05Iw6qAfG5/Dl0Jr2rFzgkDvSa
         pMxHwuiBSCAfUSnj7vDtZ16LpjH24YIzZn/z1CpHqjZEY8jj+eLsL4gMoDIWGrStgRnb
         eIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2+3XLjNLJfdkL4d8aMq+9QJZ45CuRRrfY7LRLXpvDQ=;
        b=PZnpZEDdeYqVTDTprsNTbs62AO8jT603q+g0SVt6/vDqb4pNY70+y7ScnTTclMezXj
         YKLHJsZ+wMPAu3jrUn8ufUwxEpJutZ/K8EUirWyNYlhEZ5iVVJX2V4Fc6/SOsdSuTOsi
         cCklLtSphw6p9fZAmnfgPlmgUL9Q64n2TVjiHFK1lK8zhuZc9Ph0r2ssiFfKtyBslDx4
         SeDQUzfQ9Rq8J6z3uTJdm07qeJLKW7kTN9gP5+U6IT+Ssg9lkyZrvBJGINglMtlV44Kx
         qFgMACWzrokR5k+uhdTawQRYzvOt1zuvS/hRGG9X4WjJsZQCjFSCBlZEYLuwoaMYZva0
         iIOg==
X-Gm-Message-State: AO0yUKUj7hBJUw4a+I+LQ9p7K90m9wMqbVc5pU+cdKeMxvYrLRADqjhd
	BZAB3Zg3gjoLAWiePWTb6Cino8+CUNM=
X-Google-Smtp-Source: AK7set+42yfyf9oBqGe5XavQe2bMrApNuoAZmInwQlb1iFsOqePy+ZijMls+O6Moo5FxzYbpWoRAUg==
X-Received: by 2002:a05:600c:5102:b0:3eb:f664:b6e with SMTP id o2-20020a05600c510200b003ebf6640b6emr5884998wms.24.1678302458496;
        Wed, 08 Mar 2023 11:07:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b003db03725e86sm356177wmo.8.2023.03.08.11.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:07:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 4/5] mesa: enable a rich set of drivers for native builds
Date: Wed,  8 Mar 2023 20:07:22 +0100
Message-Id: <20230308190723.2570522-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308190723.2570522-1-alex@linutronix.de>
References: <20230308190723.2570522-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 19:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178193

Without this, the only available driver would be swrast
(without llvmpipe) which is far too slow to be practical,
and so qemu wouldn't be able to perform accelerated graphics.

Note that mesa-native itself is guarded by presence of 'opengl'
in DISTRO_FEATURES_NATIVE, so building it is entirely opt-in.
The one major dependency is llvm-native which takes just under
three minutes on my machine.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8690df0bc2..95854f3010 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -88,6 +88,8 @@ PACKAGECONFIG = " \
 	${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'video-codecs', '', d)} \
 "
 
+PACKAGECONFIG:append:class-native = "gallium-llvm r600"
+
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 
@@ -101,8 +103,8 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
-VULKAN_DRIVERS:append:x86:class-target = ",intel"
-VULKAN_DRIVERS:append:x86-64:class-target = ",intel"
+VULKAN_DRIVERS:append:x86 = ",intel"
+VULKAN_DRIVERS:append:x86-64 = ",intel"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
@@ -148,8 +150,8 @@ PACKAGECONFIG[zink] = ""
 GALLIUMDRIVERS = "swrast"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS:x86-x32 = ""
-GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
 
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
@@ -161,8 +163,8 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVM = "r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
-GALLIUMDRIVERS_LLVM:append:x86:class-target = ",svga"
-GALLIUMDRIVERS_LLVM:append:x86-64:class-target = ",svga"
+GALLIUMDRIVERS_LLVM:append:x86 = ",svga"
+GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
 
 PACKAGECONFIG[r600] = ""
 PACKAGECONFIG[virgl] = ""
-- 
2.30.2


