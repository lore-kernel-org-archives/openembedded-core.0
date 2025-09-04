Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309F4CA101F
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 14:04:01 +0000 (UTC)
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
 by mx.groups.io with SMTP id smtpd.web11.40126.1756994637744832682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 07:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cHh6N3LwfzrlL;
	Thu,  4 Sep 2025 16:03:56 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cHh6M6krpzlDb;
	Thu,  4 Sep 2025 16:03:55 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 04 Sep 2025 16:03:36 +0200
Subject: [PATCH v7 07/13] mesa-gl: make recipe target only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mesa-libclc-panfrost-v7-7-e921a65412f7@cherry.de>
References: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
In-Reply-To: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 14:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222940

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 7b283415dd26a4dc73713a8bed1f794b02c979a9..832137c8188f1253c9924e4c8410e5fae40f10fb 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -12,6 +12,3 @@ PACKAGECONFIG = "opengl gallium ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}
 PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
-
-BBCLASSEXTEND = "native nativesdk"

-- 
2.51.0


