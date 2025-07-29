Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6F8C87FCA
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:36:39 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
 by mx.groups.io with SMTP id smtpd.web10.3137.1753781797813854232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 02:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4brqx045Hszq4L;
	Tue, 29 Jul 2025 11:36:36 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4brqx00SWSz9GQ;
	Tue, 29 Jul 2025 11:36:36 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 29 Jul 2025 11:36:28 +0200
Subject: [PATCH RFC v3 7/9] mesa: add asahi to TOOLS when selected in
 PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-mesa-libclc-panfrost-v3-7-42559ddc93ef@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221052

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

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f3bae50ebb3cffa9b3c1123096190143e1972228..810d78651899b7782adb85c16fc2185ddd20c97f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -101,6 +101,7 @@ PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')},
 # mesa development and testing tools support, per driver
 TOOLS = ""
 TOOLS_DEPS = ""
+TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"

-- 
2.50.1


