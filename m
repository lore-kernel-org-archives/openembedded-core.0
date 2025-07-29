Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C959BC87FCC
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:36:39 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web10.3136.1753781797063892121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 02:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4brqwz4LfZzr67;
	Tue, 29 Jul 2025 11:36:35 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4brqwz0Wb4z9YY;
	Tue, 29 Jul 2025 11:36:35 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 29 Jul 2025 11:36:26 +0200
Subject: [PATCH RFC v3 5/9] mesa-gl: make recipe target only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-mesa-libclc-panfrost-v3-5-42559ddc93ef@cherry.de>
References: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
In-Reply-To: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 09:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221050

From: Quentin Schulz <quentin.schulz@cherry.de>

According to the introducing commit log[1] and Dmitry's recollection[2],
the whole point of mesa-gl recipe is to provide GL library in case there
are vendor-provided GLES libraries.

Therefore, let's make this recipe target only by removing the
BBCLASSEXTEND variable.

[1] https://git.yoctoproject.org/poky/commit/?id=015cb13a67c672de30f5384dab5ab4b8db305281
[2] https://lore.kernel.org/openembedded-core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn/

Suggested-by: Ross Burton <ross.burton@arm.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index bdb4920572fa0777067b499dbe84152856538ed0..865b032fb0865ad0e76c3b3690eeec3d96def921 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -20,5 +20,3 @@ PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
-
-BBCLASSEXTEND = "native nativesdk"

-- 
2.50.1


