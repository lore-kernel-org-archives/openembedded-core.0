Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE528CAC581
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 14:04:00 +0000 (UTC)
Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
 by mx.groups.io with SMTP id smtpd.web10.40453.1756994635931440206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 07:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.171, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cHh6L0VyxzsCM;
	Thu,  4 Sep 2025 16:03:54 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cHh6K3VWmzmn5;
	Thu,  4 Sep 2025 16:03:53 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 04 Sep 2025 16:03:31 +0200
Subject: [PATCH v7 02/13] mesa-gl: use bb.utils.filter to improve
 readability
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mesa-libclc-panfrost-v7-2-e921a65412f7@cherry.de>
References: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
In-Reply-To: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 14:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222935

From: Quentin Schulz <quentin.schulz@cherry.de>

${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" is
exactly the same as ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} so
use the latter to make it easier on the eyes.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 35d6dc854cf4dfac7a757e333e25e4ddeab10b6e..e11758767f02efd38e2d7b90738424b9ec825120 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -9,4 +9,4 @@ S = "${UNPACKDIR}/mesa-${PV}"
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
-PACKAGECONFIG = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG = "opengl gallium ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"

-- 
2.51.0


