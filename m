Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7794C7EE30
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:44:48 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
 by mx.groups.io with SMTP id smtpd.web10.7292.1750769084985921029
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 05:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bRPmC4H1BzJX8;
	Tue, 24 Jun 2025 14:44:43 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bRPmB6z19zmv8;
	Tue, 24 Jun 2025 14:44:42 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 24 Jun 2025 14:44:27 +0200
Subject: [PATCH RFC 4/4] mesa: fix panfrost driver build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-mesa-libclc-panfrost-v1-4-9ed8ca980e21@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219265

From: Quentin Schulz <quentin.schulz@cherry.de>

Panfrost drivers require libclc, so let's force libclc to be present in
the PACKAGECONFIG to build the drivers.

This essentially only brings mesa-native as dependency for the target
recipe as the target libclc PACKAGECONFIG relies on libclc from
mesa-native (via the mesa-clc knob).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index eafe1697c48edc661b33a54c5856d8e577608fd5..1992e0a8c9fe4ee6dc7d0b46ff8ed7a220ec981e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -125,7 +125,7 @@ VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fr
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 # mesa development and testing tools support, per driver
@@ -226,7 +226,7 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima',
 # Panfrost requires precompiled compilers and libclc from mesa-native
 # Make sure libclc is in mesa-native AND mesa PACKAGECONFIG
 PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 
 PACKAGECONFIG[tegra] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"

-- 
2.49.0


