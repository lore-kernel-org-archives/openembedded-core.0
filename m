Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1FCC4708D
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.208337.1672329681125638983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZHLIUPUW;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso10343577wms.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6FuXfzyc3OA/yPVVqZ47zOyRDTAJUa7yZK85WPZ8P4=;
        b=ZHLIUPUWmO4HLrwKLShu0Dl5Km2XTv+Z2dIEbuDuLIDfitevG0VZOFaJkxjU+a8UNI
         nbq4zyf6y4jQcnscCDFV3PxktORey+uo7hV+b3jdcem7wEJN1TyYQQaocNgy8doTqmN1
         NgTeQjXUVGC5bgdCmRIzYSlDD52csBGck8A/xeh9IPPm/lJTWlpCm07fqWx8RSmPYUdy
         qUjpwiqU+EC1y0TLXR8fJG2IpRfVJFOzjqGgdPGWjj6mzWMqaoHTP2AUWm92C5vdT5cY
         hIxCvGq0te5UVIN/lBS4pDBZrQmVg509AkXs8DXenUYd0eOqftL1j8dr+fK5E5pE2ZFL
         uvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6FuXfzyc3OA/yPVVqZ47zOyRDTAJUa7yZK85WPZ8P4=;
        b=N0Ex/f6p2JuXYE1JGNZjqZRGcJV3fDtiINE4kAl4bzZqXnAfGeAx+ERCGFjjyoBqpz
         d6U8X0heM6uSFyq2THlBkCrxZzvl89ojG6CgzH9YRSxLxvRIruYL/hajzOrZdWN9W2gq
         7UDFPXVSzgq4BELLe92UbWEXSK3Gy+fGw69/852Fdkp1do4z2yXS1J7HD4CnueyAp7aM
         acjEunv+Cm4JLd/WV92H50CMidL3pXd4zWMX4D5LTiyXBv//LkuAf3Ha6BQuaW1mLgGT
         cLqslz7R2bUq1xaJJ98ueaJb8x7yXeSi+c0u/hQKmINDp1v5ikWRj9D8/YxgVLsdAnly
         XqBg==
X-Gm-Message-State: AFqh2kpLS390icOF4UPcGIn3eya5Lt1R8CHmCuPp/ALnLWTyseiWtLOy
	HGuRJ5h34E0AyyUm4khjO1x2TkC05T8=
X-Google-Smtp-Source: AMrXdXvualvGETCN9L2tx+8/jRJvX4aZ8NuvxIiGC72Ms8E7HYd1cTSJti6pua69QqU5wr44PSZqbg==
X-Received: by 2002:a05:600c:3485:b0:3d0:761b:f86 with SMTP id a5-20020a05600c348500b003d0761b0f86mr20368043wmq.28.1672329679647;
        Thu, 29 Dec 2022 08:01:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/10] qemux86-64: build for x86-64-v3 (2013 Haswell and later) rather than Core 2 from 2006
Date: Thu, 29 Dec 2022 17:01:03 +0100
Message-Id: <20221229160110.255775-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175109

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


