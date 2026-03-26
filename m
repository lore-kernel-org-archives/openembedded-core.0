Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A61910A1E78
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:06:11 +0000 (UTC)
Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch [83.166.143.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45540.1774523166546946166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=UKlhyr90;
 spf=pass (domain: 0leil.net, ip: 83.166.143.174, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fhLYS5cpxzPRV;
	Thu, 26 Mar 2026 12:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1774523164;
	bh=q4kWXSsZ2cOPTPtGeCNbR40S0AeXAZ3lkBOJpEK8eyQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UKlhyr90gx42FY4/mRr/+kdU8j1i9r6SzLrbRZ4q7Oq9B4McytPtGWLWBBB0u6oVC
	 7/r2ahNm7k64t/JNgrVJsnQGh54JR6oNkxm3t4OIK2u3EhRTPIFf9nJaUbRe9sH6q5
	 susM6wXl5W9VXMYdz2KBk/Jy1vKihGfzgAfy3zD+yZ+/CmFomMn76KYWrnl3V5/R39
	 aQMNeYvFgXMbzPpUrODkv67ERw3JJfyDxTNAVaxufc0SyghJxq7TkVJzTVca7382bJ
	 uNZGg42LaT1hL6zipqawJOSsCHN/2+fpQvSJyFrL2rF64kEBtaTbSrCF+y3GoZixl8
	 zF1RNneeiFv2w==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4fhLYS306nzTRw;
	Thu, 26 Mar 2026 12:06:04 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 26 Mar 2026 12:05:51 +0100
Subject: [PATCH 3/3] mesa: add missing libdrm dependency for vulkan drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-mesa-libdrm-imagination-v1-3-fe018f03be6a@cherry.de>
References: <20260326-mesa-libdrm-imagination-v1-0-fe018f03be6a@cherry.de>
In-Reply-To: <20260326-mesa-libdrm-imagination-v1-0-fe018f03be6a@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233975

From: Quentin Schulz <quentin.schulz@cherry.de>

Mesa explicitly requires libdrm for any Vulkan driver, see

https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.0.2/meson.build?ref_type=tags#L1774
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.0.2/meson.build?ref_type=tags#L636
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.0.2/meson.build?ref_type=tags#L300

but until now we haven't had the dependency when building only Vulkan
drivers. It was brought in by the gallium PACKAGECONFIG, which is by
default in mesa and mesa-gl recipes' PACKAGECONFIG but nothing forbids
us from removing it if we only need Vulkan drivers for some reason.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cc4937ae97..f985e9a676 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -144,7 +144,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', '${VULKAN_DRIVERS_VIRTIO}', '', d)}"
 
-PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
+PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers libdrm"
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
 
 # mesa development and testing tools support, per driver

-- 
2.53.0


