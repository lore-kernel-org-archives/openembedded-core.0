Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95681C10F1B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.25194.1672425543251833829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dVAHqXP6;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso12601585wms.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6FuXfzyc3OA/yPVVqZ47zOyRDTAJUa7yZK85WPZ8P4=;
        b=dVAHqXP6ajkDj5YmXx8mgxon+aAWsVoomx9l8GtWI2Jer5A7uWkbJn7vY8nBbzN1+T
         Ht+XYRmHWKvSqhbvxXjk6VWuAl/vNXc9vqjJQcWj1f1UNewNMqWg471+Xs6xCvdYSAld
         e9zU8dsM/F+Kv0I4ED/+nMzFwY7MgFHJwrLrHr8j/aVeUqLnvDld+Gz1BPeoguU+taIk
         Vx4FVP++qQVmVMOjtr2CSD051DAIM0fFbCC4mboPH5ZQ6xrO6+ZugkT+Ib7jD7RhFfei
         KM5H2Uhf7ZBkh/nPjF//pyV1GQqpLOoEgzLhQ4iareC6Fyujcy3UuC1d5l+aw1/mIv2u
         Mdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6FuXfzyc3OA/yPVVqZ47zOyRDTAJUa7yZK85WPZ8P4=;
        b=Gw3m02zIfBRRKvvpstpGDlRvcATku1wqez6oLwHTqO4xi3QMZskz2ASZX220BJWRk5
         D7EqTt2bepV+cweVdnDV4VW2oUS53XnkRzBSOm82AlAIm/EsOZJ43M3n/pUfXQE9glX1
         tqLpnQruxPlwYvvIgzEN9mZRLBD6DlSQ/rfMNa93E9c2FPV2BmqVLGdfOOBnvenPjk0E
         12X4+uenMwIP6DU9g/tTf4pE+0NN87UalcglU9eLbIzv2XWKQUYRbKx2U5AfCPUSwn7H
         3s2HIce+X7vGObmQqGuOvebj1LxEGp1ohKPYQF+uYM7pbsgQl5ndNBExhi3Bl2lC7FBH
         +hOw==
X-Gm-Message-State: AFqh2kotdrOaN9Rs0hFvgKWj5gpt0GS4AoHzyhhgLn6rSfGuvjCtLnCe
	mFwod5s/s3AGHAA8mLRmVnOADtMQhXc=
X-Google-Smtp-Source: AMrXdXtzfKl6MEOQcO/+B+rMjPLYeVSvpNcs5lCgwC3uVmUSDZmL3Ff0inOpbDCg6QQBPWGomxmP4g==
X-Received: by 2002:a05:600c:3d12:b0:3d0:bd9:edd4 with SMTP id bh18-20020a05600c3d1200b003d00bd9edd4mr23323886wmb.0.1672425541530;
        Fri, 30 Dec 2022 10:39:01 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/11] qemux86-64: build for x86-64-v3 (2013 Haswell and later) rather than Core 2 from 2006
Date: Fri, 30 Dec 2022 19:38:41 +0100
Message-Id: <20221230183850.3089510-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175165

This allows us to
- test those more recent instruction sets (AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE)
- benefit from improved performance across the stack both in kvm-driven system emulation and when running
on real silicon.
For example, glibc:
https://www.phoronix.com/news/Glibc-strcasecmp-AVX2-EVEX

v4 level is adding AVX-512, which is far less established, particularly Intel has famously backtracked
from supporting it in Alder Lake/Raport Lake client CPUs and AMD has only implemented it in very recent Zen4 products:
https://www.phoronix.com/news/GCC-11-x86-64-Feature-Levels

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--
 meta/conf/machine/qemux86-64.conf              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
index 3953679366..31db1b2a61 100644
--- a/meta/conf/machine/include/x86/qemuboot-x86.inc
+++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
@@ -4,8 +4,8 @@ QB_SMP = "-smp 4"
 QB_CPU:x86 = "-cpu IvyBridge -machine q35,i8042=off"
 QB_CPU_KVM:x86 = "-cpu IvyBridge -machine q35,i8042=off"
 
-QB_CPU:x86-64 = "-cpu IvyBridge -machine q35,i8042=off"
-QB_CPU_KVM:x86-64 = "-cpu IvyBridge -machine q35,i8042=off"
+QB_CPU:x86-64 = "-cpu Skylake-Client -machine q35,i8042=off"
+QB_CPU_KVM:x86-64 = "-cpu Skylake-Client -machine q35,i8042=off"
 
 QB_AUDIO_DRV = "alsa"
 QB_AUDIO_OPT = "-device AC97"
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 8640867911..d355375f13 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -9,8 +9,8 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
 
 require conf/machine/include/qemu.inc
-DEFAULTTUNE ?= "core2-64"
-require conf/machine/include/x86/tune-corei7.inc
+DEFAULTTUNE ?= "x86-64-v3"
+require conf/machine/include/x86/tune-x86-64-v3.inc
 require conf/machine/include/x86/qemuboot-x86.inc
 
 UBOOT_MACHINE ?= "qemu-x86_64_defconfig"
-- 
2.30.2


