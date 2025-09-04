Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9C4CAC586
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 14:04:01 +0000 (UTC)
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
 by mx.groups.io with SMTP id smtpd.web10.40455.1756994638215383558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 07:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cHh6N6fbnztSd;
	Thu,  4 Sep 2025 16:03:56 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cHh6N3G6RzlT0;
	Thu,  4 Sep 2025 16:03:56 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 04 Sep 2025 16:03:37 +0200
Subject: [PATCH v7 08/13] mesa: add asahi to TOOLS when selected in
 PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mesa-libclc-panfrost-v7-8-e921a65412f7@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222941

From: Quentin Schulz <quentin.schulz@cherry.de>

Similarly to panfrost and other PACKAGECONFIG, mesa has tools for asahi.
So let's build the tools whenever asked.

While the tools are often built regardless of their presence in the
"tools" mesa option whenever the appropriate gallium or vulkan driver is
built, this allows to build the tool(s) without building the drivers
which can be beneficial for native recipes where it makes little sense
to build drivers.

This will be useful for building asahi_clc precomp-compiler in native
mesa for example which only builds if:
 - one enables the asahi gallium driver, or
 - one enables the asahi vulkan driver, or
 - one builds the asahi tools
c.f. https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-25.1.5/src/asahi/meson.build?ref_type=tags#L12-L17

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 45499f6c421e7fb0b06ef95179168c6cb9fff1cf..81b099bf6e5fe624e91e6a780f8bb55854580c2d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -100,6 +100,7 @@ PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')},
 # mesa development and testing tools support, per driver
 TOOLS = ""
 TOOLS_DEPS = ""
+TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"

-- 
2.51.0


