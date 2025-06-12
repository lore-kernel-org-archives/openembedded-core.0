Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBF2C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:15:14 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
 by mx.groups.io with SMTP id smtpd.web10.11524.1749730503722129441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 05:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bJ1gV1mxRzqkK;
	Thu, 12 Jun 2025 14:15:02 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bJ1gT5H22zVhH;
	Thu, 12 Jun 2025 14:15:01 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 12 Jun 2025 14:14:31 +0200
Subject: [PATCH 1/2] mesa: do not build r300 AMD gallium-llvm driver if not
 requested
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-1-479632e13175@cherry.de>
References: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-0-479632e13175@cherry.de>
In-Reply-To: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-0-479632e13175@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 12:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218517

From: Quentin Schulz <quentin.schulz@cherry.de>

It doesn't make much sense to always build the r300 AMD gallium LLVM
driver as that's HW-specific.

Instead, let's guard it with the amd PACKAGECONFIG.

This will only disable R300 for target mesa on non-x86/i686 machines
where gallium-llvm PACKAGECONFIG is selected but not amd, otherwise
behavior is left unchanged.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b222e72fdddd7e17dfbefdb776eead027a216f2d..291124f29f5fe755abb327874129cc39d8c7d994 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -171,13 +171,14 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', ''
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 GALLIUMDRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc opencl', ',asahi', '', d)}"
+GALLIUMDRIVERS_AMD = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r300', '', d)}"
 GALLIUMDRIVERS_IRIS = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',iris', '', d)}"
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
 # llvmpipe crashes on x32
 GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
 GALLIUMDRIVERS_SVGA = "${@bb.utils.contains('PACKAGECONFIG', 'svga', ',svga', '', d)}"
-GALLIUMDRIVERS_LLVM = ",r300,nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_ASAHI}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"
+GALLIUMDRIVERS_LLVM = ",nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_AMD}${GALLIUMDRIVERS_ASAHI}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"
 
 PACKAGECONFIG[amd] = ""
 PACKAGECONFIG[svga] = ""

-- 
2.49.0


