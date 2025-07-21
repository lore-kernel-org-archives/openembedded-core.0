Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64578C87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 07:54:31 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.35275.1753084461097346242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 00:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pG1nBZ47;
 spf=pass (domain: konsulko.com, ip: 209.85.218.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae360b6249fso616861366b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 00:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1753084459; x=1753689259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eGC4RUl48NH3CmgltGhcqABKQEPXC6a922zavAiyrf0=;
        b=pG1nBZ47MMLGiKHysNRPFGVG0BD0LorPs76ImpgolJTNLKtTSSPvI9V/ErMr66ZBp8
         w8qiQ7mPppSrRHt6OEiRfTlBMyVHxojxBpQoHO94UaK5zW/uaIDPyyQ365GiDAcjsyys
         z5l3UFKr5mkwjCNsvfhdL/B+pzZExVpJuDqsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753084459; x=1753689259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGC4RUl48NH3CmgltGhcqABKQEPXC6a922zavAiyrf0=;
        b=PH3/z2gQ/1fH/8BQE/1+egFiqAf15WbYaF4gGGtHtVJFdCCJc7VDLuC/D2AGrHgWVh
         hfnGohNCDrdZHgO0svR1tFKZFuh6IsHVUmgd5zJASoh09Zg4IesPZfET80QtiHbEt5PH
         W7fN1gubvbewOwDaGBIdbJFj/HjaVyyLjuqQVefn6VOGTV9zTUHAe937GqDc7IL5J9F0
         VN4qIq7YS4dVwbm6pN1BFBa9nR+PxkMdMGh7F+MZiYTBS8ScGAl7h6dzMas4uaiipUVD
         VZ+Im0ca9iJzU6DiJXydCMD9YzkGvFf/vRD3kATPfpiUh0kxLcDsFfmwohSFEva8QfK6
         D0ZA==
X-Gm-Message-State: AOJu0YwtQ/UeSm0D2dTa+N6/5yVSKyDdGtD0nJbGioBA0ngiK2gRTCJT
	U262Cu03zV7h2q7jKnGOPiPfE6julg6y519VyqFUDJ75kSpiLJUWokZQjfHb+CT7DTZeowYZfGE
	C5iQ0
X-Gm-Gg: ASbGncsraI74fpyxGueXuqPVjQu+KX0d37/AGEb3xl055PLGNc7p0ljO1F0XQEgtacU
	2d+Jr/tpjLkDYO0MApDcEsGC4evLfn5Ai59m0RNAEQD6MQXYv+AM1K492CnGKtF0kk4gktTpNsM
	ASgqA1wanLZwi6ZmtUbLnEUfSFEInh3ZU+b37rYKcGatNt5AkSAq/pu2651iCojy99G+lV7IBbW
	YRsnG6Rv3RpiP7DIqQ137efHH3xXqBvk8zRQJLc6DYl1lkJ8anBlw96N0CSVTgCYXTMNQa1X5Ks
	XiJqhXnDEE0Yx69p1oCFU9axczYTnShixVV0XejydT59sLrWn45vYRNNnsGYLNUFUnvWfl3Mu30
	UYCnNOJTiMokasuBMDPIpfgCQmRRm2KTCpuio
X-Google-Smtp-Source: AGHT+IHRtyzbz5Iz3nbTji5DGqADDFH0990E5/Eg0tHcTnHoh4Pc7mCYVWdW9YlNDhfaTobZF6hsYQ==
X-Received: by 2002:a17:907:6e8f:b0:ae3:a604:b1fe with SMTP id a640c23a62f3a-ae9c9aca97fmr1896215966b.38.1753084458981;
        Mon, 21 Jul 2025 00:54:18 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cad5cedsm625122766b.146.2025.07.21.00.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:54:18 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] mesa: Upgrade 25.1.5 -> 25.1.6
Date: Mon, 21 Jul 2025 10:54:16 +0300
Message-Id: <20250721075416.764360-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 07:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220662

- v3dv: regression in vkAllocateMemory importing gbm bo
- Vulkan WSI (and zink) use threads on X11 even when the X
  connection isn't thread-safe
- sddm-greeter-qt segfault when using nvk+zink
- [regression][bisected] [FirePro W4100]: crashing/rebooting
- Descriptor set layout with binding flags fails due to indices
  not matching bindings
- piglit bindless texture tests crash
- [radeonsi] Artifacts in Team Fortress 2 (bisected)
- eglgears_wayland segfault on zink+nvk with PRIME
- vn_renderer_virtgpu.c:13:10: fatal error: 'xf86drm.h' file not
  found
- brw: mad instruction printing broken on Gfx11
- radv: RGB9E5 rendering does not ignore alpha write mask

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 47b95728e0..58e3d9f745 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-dont-build-clover-frontend.patch \
 "
 
-SRC_URI[sha256sum] = "3c4f6b10ff6ee950d0ec6ea733cc6e6d34c569454e3d39a9b276de9115a3b363"
-PV = "25.1.5"
+SRC_URI[sha256sum] = "9f2b69eb39d2d8717d30a9868fdda3e0c0d3708ba32778bbac8ddb044538ce84"
+PV = "25.1.6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.5


