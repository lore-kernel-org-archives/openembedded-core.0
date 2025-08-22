Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E22CCA0FED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 12:53:34 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.web11.9380.1755867212167376568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 05:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c7g9650RBz95G;
	Fri, 22 Aug 2025 14:53:30 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4c7g961N33zlxN;
	Fri, 22 Aug 2025 14:53:30 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 22 Aug 2025 14:53:19 +0200
Subject: [PATCH v6 13/14] mesa: fix panfrost driver build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-mesa-libclc-panfrost-v6-13-393cf47e2fa2@cherry.de>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
In-Reply-To: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 12:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222328

From: Quentin Schulz <quentin.schulz@cherry.de>

Panfrost drivers require libclc, so let's force libclc to be present in
the PACKAGECONFIG to build the drivers.

Reported-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b38386977da2a2fa2409afaef036cd2c09a0cdbf..6a586c55363959fa6bc4405f5d810d85ca307bf5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -95,7 +95,7 @@ VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fr
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
 VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
-VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
 # mesa development and testing tools support, per driver
@@ -185,7 +185,7 @@ PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
 PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 
 PACKAGECONFIG[tegra] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"

-- 
2.50.1


