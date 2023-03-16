Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9F3C761A6
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 09:41:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.8408.1678959669659635423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 02:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h62XIAtx;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id cy23so4948203edb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678959668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WprWMwGmRDHOqzmvPNh/rpZr+OLpAM3z+UfkN8tqm0s=;
        b=h62XIAtxPI0UV+Jg7qxlf/9Dc416CjPwhIRznjVPkh+jzhfzzQdURRaqHK7T6r4/3Y
         xpbq0GEg1WhheZwRBqbYC0xnOmWmyMhA0snYFx3CqaBzyCmTtWjW4db92TatPF6oSpjY
         3/MewuOnasvJjh1QN/aiC+HjyMxGgcSKn1zDDNmNqfYcnv4MgJRCp7yYOqOyG4Us/zM9
         ooBWUfaD72ZsWgAdaegytEwf+ep6dVQUmc9g3VQkLpzmMC4anNNzQA2vFBg3Ecrzy10d
         6PEBBzvZhQ3h4b4FVdbZ81kcMiWkA2eqkIuOIaV9E2sk+auVQjaUEvYUJMInu4ADeP07
         5E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678959668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WprWMwGmRDHOqzmvPNh/rpZr+OLpAM3z+UfkN8tqm0s=;
        b=einkyAmgCtQiEZxb5lXwlatU+hgH6TBLBuUeAImuTp7fAbk32b39lU6KMMJ0b+Jf4y
         LD1jGDx3ZXcwroMtoJPLKw3NlrTg29/wKLDQsFy3ePTWqK6MbjJz18B/uzsyIHNcv/UA
         Wia87EvtRMu+vHTQ5bt1i53HC54hKpQzH+dO6ss2yVP14g1c1IohL1fzpSjFdMHWBcfl
         +C9fxCCDthNcelgUUwy/5qd/Ni3qwSVLT8jZ0dJ4pHaiIq7oh5Qty04uJ8edtt4wnmwN
         mzXCrGXB46mFxqWFZ9y2E7pahyGpk35UFzubBTXpAnKRaqnypGxtuG4ZvfJ9vPZ5s2I1
         Gcrg==
X-Gm-Message-State: AO0yUKXO3UHQUZh9V1aIeMnUnolcmkYDz5gBXQCMkgCOdUOcHN+3v6ev
	lA6eURW1HA7r/iLNsO5TJDc9mR/zH0s=
X-Google-Smtp-Source: AK7set+8hb6787paSTPdYGeahqeH80xZsPRN7cKehD5otEDXIpY1Xtleau1BVUyJvTbcF7fdmXE9Tw==
X-Received: by 2002:a05:6402:204:b0:4fc:73dc:5def with SMTP id t4-20020a056402020400b004fc73dc5defmr5201207edv.41.1678959668112;
        Thu, 16 Mar 2023 02:41:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lf28-20020a170907175c00b00923221f4062sm3621661ejc.112.2023.03.16.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 02:41:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/6] mesa: enable a rich set of drivers for native builds
Date: Thu, 16 Mar 2023 10:40:59 +0100
Message-Id: <20230316094102.2628727-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316094102.2628727-1-alex@linutronix.de>
References: <20230316094102.2628727-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178693

Without this, the only available driver would be swrast
(without llvmpipe) which is far too slow to be practical,
and so qemu wouldn't be able to perform accelerated graphics.

The one major dependency pulled in by this change is llvm-native
which takes just under three minutes on my machine. If this is
undesitable, opengl can be removed from DISTRO_FEATURES_NATIVE.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 775aab9297..dd15046438 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -89,6 +89,8 @@ PACKAGECONFIG = " \
 	${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'video-codecs', '', d)} \
 "
 
+PACKAGECONFIG:append:class-native = "gallium-llvm r600"
+
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 
@@ -102,8 +104,10 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
-VULKAN_DRIVERS:append:x86:class-target = ",intel"
-VULKAN_DRIVERS:append:x86-64:class-target = ",intel"
+VULKAN_DRIVERS:append:x86 = ",intel"
+VULKAN_DRIVERS:append:x86-64 = ",intel"
+# i686 is a 32 bit override for mesa-native
+VULKAN_DRIVERS:append:i686 = ",intel"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
@@ -149,8 +153,10 @@ PACKAGECONFIG[zink] = ""
 GALLIUMDRIVERS = "swrast"
 # gallium swrast was found to crash Xorg on startup in x32 qemu
 GALLIUMDRIVERS:x86-x32 = ""
-GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86 = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86-64 = ",i915,iris,crocus"
+# i686 is a 32 bit override for mesa-native
+GALLIUMDRIVERS:append:i686 = ",i915,iris,crocus"
 
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
@@ -162,8 +168,10 @@ GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '
 # radeonsi requires LLVM
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVM = "r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
-GALLIUMDRIVERS_LLVM:append:x86:class-target = ",svga"
-GALLIUMDRIVERS_LLVM:append:x86-64:class-target = ",svga"
+GALLIUMDRIVERS_LLVM:append:x86 = ",svga"
+GALLIUMDRIVERS_LLVM:append:x86-64 = ",svga"
+# i686 is a 32 bit override for mesa-native
+GALLIUMDRIVERS_LLVM:append:i686 = ",svga"
 
 PACKAGECONFIG[r600] = ""
 PACKAGECONFIG[virgl] = ""
-- 
2.30.2


