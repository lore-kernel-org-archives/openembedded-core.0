Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF388C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:36:39 +0000 (UTC)
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
 by mx.groups.io with SMTP id smtpd.web10.3138.1753781799118860969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 02:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.169, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4brqx13ddZzrRB;
	Tue, 29 Jul 2025 11:36:37 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4brqx10DFvz8gs;
	Tue, 29 Jul 2025 11:36:37 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 29 Jul 2025 11:36:30 +0200
Subject: [PATCH RFC v3 9/9] mesa: fix panfrost driver build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-mesa-libclc-panfrost-v3-9-42559ddc93ef@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221054

From: Quentin Schulz <quentin.schulz@cherry.de>

Panfrost drivers require libclc, so let's force libclc to be present in
the PACKAGECONFIG to build the drivers.

Reported-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9b77c6f2f478ae85aad43385e79b27cf5bb31028..14e636de995e8c1232f33fbcb1cfbef91840efca 100644
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
@@ -184,7 +184,7 @@ PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
 PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
 
 PACKAGECONFIG[tegra] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"

-- 
2.50.1


