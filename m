Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E482CD6E4A
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 02:37:26 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2834.1779935839784438743
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 19:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q7+mLZ3h;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8acb856a674so148808366d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 19:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779935839; x=1780540639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY11u/o1XnVApuUGMEhaIyCe7gba1Qzv7XO1yt4GUmE=;
        b=Q7+mLZ3h+XdwHaaKO9ok98vkEPdbcHqlBa2UnCYfuQY/+Vyk5esrdkVnsaCZluJwZr
         nt7KZrWHSAwYJrJUMIJhQp7Hrkq52P3E0rbPUNCVlgY/pe23J201DBQaU3Ms4UYQhqLL
         OHZHB0ZOZ8HiOzJQCsoyIyCgrJav2sA1IZ1HR/0/PBP5IwrVst0VUWjl1dTvtCFlxwKA
         EAs7TzlDDIVeJpUC8mo/04wCFPv4mjsHMU06bvl/RGc3UL1y5Wad3BNH68CBk7AqhaPj
         F5yzLCijS57kcueLUR4qapEfAEQd21TGglIuTiFhpps6EH+tRK9E9nWNURIJqyZXR6cP
         MvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935839; x=1780540639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DY11u/o1XnVApuUGMEhaIyCe7gba1Qzv7XO1yt4GUmE=;
        b=VvdtXiHs0ps41bVlUasAnfuqmlAdhaDlrxLetQZaN7zp+uurc2GV+y/JDL8PJIazyA
         MkTeYV1VaizkK8bXcDc8jXDvFLKx8Tn2GYbBkDB/0Eu6bhkd7IyA9B1Yi82e49csabuZ
         lW9EiB6fW4xEYeZskl3OhuqOwt80b/BWGW4oYKw9h/3bM/H6sM8U0hNPWwEZrxYIvaLl
         SHY6vz2Q0zP810B7ul4X9xhE2iHX4XlnpVSQWQf2SbNXpfS7L+CElQNiE/4wDLNBMJ+z
         9SLpqn48bfYrsiV1V1c3tsfu5xXBHPML0Vi4FWPGPquyrcFBvGL0KhdDEIwa6sh6UL+N
         eqyA==
X-Gm-Message-State: AOJu0YwsOTJNI0gpImnk42iGPiLRBUe6WX3BJK95oK20ReA0ZRC8kRzV
	NkEguJ+Yy1O1L1OeXDvDfOIYk4aUfE7fuMwjC35fO1/gcc0Mk1k7+kgJ
X-Gm-Gg: Acq92OE+fzp+ZN8BIVESTA9hqTSroX3UMegWgMyOudG8X6lna6uW1IqFfxCOXT+mimq
	CpRM+Zo3P6qKI3rCMXApAFG9vAvf3I2iKNOW6tg3Vl4k0VhJUoFFIXfhpP0U4SNT7TTx1Z0ri93
	GNqpt8arVMm1YsFtrSQYBBwipXgUsqtv0+IxbQ78EUvNDIafli3HwlBeww7TsgX1R4r0ZAVOp0O
	RHJ7ehs8vrf0wzow7NTR/fwI/FNFrikaXYOLaWCIIbKmHqitmiY8N3N/niZw+rcKJd+NR1SL5/Q
	e1zHfEw3Ih03XjUymIIAttyLCujhPf/+/CcHBoiVDsjBVgXed39gyvStGCvTUW0LC2x68p1i5FK
	NtAUswAGeLRPhhWEdxBkFKsVWZcS7Obq/Ys5tAR10ILrPzUvBTOHFzI/lPn4Ab2pMFiVT3zpy47
	BQSOyDjQVfy5FEoFWxdmVYOm9Evhp2QXmpDuYIEXqc50DO3EfgcY0o82QskUa4hlMGFnSN3myhN
	Dy2HHAt7/97YcGuoH6HDcPzQX7lbSwtwqetvItiIPJJKOUWP6ZWPUWGIzeG32FoJz0sqoxRy5sm
	e7PU1F2Uq5PyRp3Gtu8jpu9sO1Wx2Gfu2o/w89CBgJNPW8bFvh3YRxQ=
X-Received: by 2002:a05:6214:5e03:b0:8cc:d6a6:f54d with SMTP id 6a1803df08f44-8ccd6a6f60bmr2016406d6.8.1779935838753;
        Wed, 27 May 2026 19:37:18 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcec8esm186146436d6.7.2026.05.27.19.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:37:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 03/07] linux-yocto-dev: bump to v7.1
Date: Wed, 27 May 2026 22:37:07 -0400
Message-ID: <20260528023714.4026613-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237684

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 668cd35473..fca353a865 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v7.0/standard/base"
+KBRANCH = "v7.1/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "7.0"
+LINUX_VERSION ?= "7.1"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


