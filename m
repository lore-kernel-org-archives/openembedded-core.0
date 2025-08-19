Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09373CA0EFB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:16:22 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.web11.8807.1755591380515785887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c5j8g0x3Xz8hQ;
	Tue, 19 Aug 2025 10:16:19 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4c5j8f3xvszT54;
	Tue, 19 Aug 2025 10:16:18 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 19 Aug 2025 10:16:06 +0200
Subject: [PATCH v5 6/9] mesa-gl: make recipe target only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mesa-libclc-panfrost-v5-6-b8b89e6af908@cherry.de>
References: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
In-Reply-To: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Otavio Salvador <otavio.salvador@ossystems.com.br>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 08:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222083

From: Quentin Schulz <quentin.schulz@cherry.de>

According to the introducing commit log[1] and Dmitry's recollection[2],
the whole point of mesa-gl recipe is to provide GL library in case there
are vendor-provided GLES libraries.

Therefore, let's make this recipe target only by removing the
BBCLASSEXTEND variable.

No intended change in behavior for the target recipe.

[1] https://git.yoctoproject.org/poky/commit/?id=015cb13a67c672de30f5384dab5ab4b8db305281
[2] https://lore.kernel.org/openembedded-core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn/

Suggested-by: Ross Burton <ross.burton@arm.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 979a6f97374741f5fd8716c87039af0a6ad37749..86ea21d5c6daf39dd48905ff31eb5c5a5759c686 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -12,6 +12,3 @@ PACKAGECONFIG = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
 PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
-
-BBCLASSEXTEND = "native nativesdk"

-- 
2.50.1


