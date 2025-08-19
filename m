Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2134CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:16:21 +0000 (UTC)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
 by mx.groups.io with SMTP id smtpd.web11.8802.1755591377501788072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c5j8c0JSzz5dF;
	Tue, 19 Aug 2025 10:16:16 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4c5j8b3RT1zSVb;
	Tue, 19 Aug 2025 10:16:15 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 19 Aug 2025 10:16:01 +0200
Subject: [PATCH v5 1/9] mesa-gl: make mesa-gl really openGL-only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mesa-libclc-panfrost-v5-1-b8b89e6af908@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 08:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222077

From: Quentin Schulz <quentin.schulz@cherry.de>

The ??= operator for PACKAGECONFIG doesn't actually do anything because
the recipe includes mesa.inc which already sets this variable (with the
= operator).

This probably wasn't noticed until now because mesa-gl is likely only
ever built in its target flavor which was already set correctly thanks
to the :class-target override.

This essentially only make mesa-gl-native and nativesdk-mesa-gl follow
the same configuration as the target.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index e2f03c81c4588c6257ffec2892fef7fcbe9f82bf..35d6dc854cf4dfac7a757e333e25e4ddeab10b6e 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -9,6 +9,4 @@ S = "${UNPACKDIR}/mesa-${PV}"
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
-PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-
+PACKAGECONFIG = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"

-- 
2.50.1


