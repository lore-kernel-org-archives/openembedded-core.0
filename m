Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6661C6FD1F
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:03 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.67635.1678632661186513148
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gnq3DQ+4;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id o12so39012886edb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4N+AQ3L8QTnwHRbrY4LEFCfR5tJfxor1ui4lAHYoFA=;
        b=gnq3DQ+48aN4eExwidjP5SPqgsQhanw9SzJXPUP3UFNCCEGMi389B/SpwkwLMS6hh5
         JCLoB2uClwRWAErHU9BpKcnR0lN3RjWM6Y+p7RG++xp5RCfEn1NwDOGavr3olz1DqaPK
         RjOvz1lalTbMi8JpogJUK/+vaCuTYQlTFZbg7UU6gpaLv8J0bw7QyOK7XCCAuvR9EXZl
         FY2P51Uf0y5AQeWsalkN1ijJLdIRVT1dIMmiiWIaMRvRpyAF99fLtFdpP8y92Jpde/Vu
         U3+aTn9hZn7BhjnP24F+6w2plNuXkZ5GMt4l6f4MdYdo2NkJc/V17BJTMqdqW2fYLbdX
         FEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4N+AQ3L8QTnwHRbrY4LEFCfR5tJfxor1ui4lAHYoFA=;
        b=MkP5xr66qN76LpTz6nva7kP3uk0ePyXhKkbqeX8sMtUFdZhKesncVKOrXshoow2kQ1
         eaStxlRuTQbphPQnzqWg4xp4jARYHJ4YU4YNhyaOWy8uq1jy15LGa8jwWlTWEuyf/Cto
         Y4p0yVhWTXzRsD91USD+f0M4NBf28qk9KvH1E8WrnbYXe71eo1ED6Z/Aaoq6trhTPHga
         lisGjZcgn2SnkR/phWXI/AsHIFPDdlvrkhuRc3VNEb0fqUlrY5YBu5SQYEfD/Xa/0qXo
         19w/OcPU6rRPz5eUknqWTStsMcnUnLdIkUX9C+IorepnYb/nMlWNnhwzV9ofG2qHlsNs
         W6Dw==
X-Gm-Message-State: AO0yUKVgXNOe/xjJD2k9R98l8rAqmF2UkUzEbVJR4H+/ZTRe30Z9yDV4
	xQMMapASczXRrkFX2x83q0ndhSD9vkE=
X-Google-Smtp-Source: AK7set9lwbcotSjkD1KXP4/WY71AK/3Isx7czPafWULCEpP+eJckKhRUdKgK6nZOdXFnXZB9Iam+aA==
X-Received: by 2002:a17:907:7a86:b0:91f:f1b7:3673 with SMTP id mm6-20020a1709077a8600b0091ff1b73673mr5088129ejc.15.1678632659661;
        Sun, 12 Mar 2023 07:50:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2012255edj.79.2023.03.12.07.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:50:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/7] mesa: enable a rich set of drivers for native builds
Date: Sun, 12 Mar 2023 15:50:50 +0100
Message-Id: <20230312145053.1427377-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230312145053.1427377-1-alex@linutronix.de>
References: <20230312145053.1427377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178395

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
index 775aab9297..f06c1a31da 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -89,6 +89,8 @@ PACKAGECONFIG = " \
 	${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'video-codecs', '', d)} \
 "
 
+PACKAGECONFIG:append:class-native = "gallium-llvm r600"
+
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 
@@ -102,8 +104,8 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
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
@@ -149,8 +151,8 @@ PACKAGECONFIG[zink] = ""
 GALLIUMDRIVERS = "swrast"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS:x86-x32 = ""
-GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
 
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
@@ -162,8 +164,8 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '
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


