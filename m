Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62D1C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:44:48 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.web10.7290.1750769082959721965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 05:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bRPm92w8TzHnv;
	Tue, 24 Jun 2025 14:44:41 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bRPm85sRDzm7X;
	Tue, 24 Jun 2025 14:44:40 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 24 Jun 2025 14:44:24 +0200
Subject: [PATCH RFC 1/4] mesa: add asahi to TOOLS when selected in
 PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-mesa-libclc-panfrost-v1-1-9ed8ca980e21@cherry.de>
References: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
In-Reply-To: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219262

From: Quentin Schulz <quentin.schulz@cherry.de>

Similarly to panfrost and other PACKAGECONFIG, mesa has tools for asahi.
So let's build the tools whenever asked.

This will be useful for precompiled compilers in mesa-native for
example.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c3adb5ef78ac3a4d52ee0b8f45de0ece2d7fc237..1355c0c3ba5ee07ec24bc5e05f6adf0e17e9782a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -124,6 +124,7 @@ PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')},
 # mesa development and testing tools support, per driver
 TOOLS = ""
 TOOLS_DEPS = ""
+TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"

-- 
2.49.0


