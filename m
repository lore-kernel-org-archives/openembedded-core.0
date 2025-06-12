Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCE5C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:15:14 +0000 (UTC)
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
 by mx.groups.io with SMTP id smtpd.web10.11525.1749730504207892225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 05:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bJ1gV5rLSznhF;
	Thu, 12 Jun 2025 14:15:02 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bJ1gV20cczW7r;
	Thu, 12 Jun 2025 14:15:02 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 12 Jun 2025 14:14:32 +0200
Subject: [PATCH 2/2] mesa: do not build nouveau NVIDIA gallium-llvm driver
 if not requested
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-2-479632e13175@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218516

From: Quentin Schulz <quentin.schulz@cherry.de>

The Nouveau driver is used for NVIDIA GPUs and thus doesn't really need
to be always enabled when building gallium-llvm drivers.

So let's guard it with a nouveau PACKAGECONFIG.

The only intended change is nouveau not being build on target mesa on
non-x86/i686 machines when building gallium-llvm drivers as I assume
NVIDIA GPUs aren't that common on other CPU architectures (tegra already
bringing in the nouveau driver should handle the NVIDIA SoCs that would
benefit from nouveau driver and thus are not impacted by this change).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 291124f29f5fe755abb327874129cc39d8c7d994..56ac18ea534bea0bc0c25d940987d8633264ca69 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -93,10 +93,10 @@ PACKAGECONFIG = " \
 # skip all Rust dependencies if we are not building OpenCL"
 INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
 
-PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd svga"
-PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd svga"
-PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd svga"
+PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
 
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
@@ -173,14 +173,16 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink',
 GALLIUMDRIVERS_ASAHI = "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc opencl', ',asahi', '', d)}"
 GALLIUMDRIVERS_AMD = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r300', '', d)}"
 GALLIUMDRIVERS_IRIS = "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',iris', '', d)}"
+GALLIUMDRIVERS_NOUVEAU = "${@bb.utils.contains('PACKAGECONFIG', 'nouveau', ',nouveau', '', d)}"
 GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
 # llvmpipe crashes on x32
 GALLIUMDRIVERS_LLVMPIPE:x86-x32 = ""
 GALLIUMDRIVERS_SVGA = "${@bb.utils.contains('PACKAGECONFIG', 'svga', ',svga', '', d)}"
-GALLIUMDRIVERS_LLVM = ",nouveau${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_AMD}${GALLIUMDRIVERS_ASAHI}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"
+GALLIUMDRIVERS_LLVM = "${GALLIUMDRIVERS_LLVMPIPE}${GALLIUMDRIVERS_AMD}${GALLIUMDRIVERS_ASAHI}${GALLIUMDRIVERS_IRIS}${GALLIUMDRIVERS_NOUVEAU}${GALLIUMDRIVERS_RADEONSI}${GALLIUMDRIVERS_SVGA}"
 
 PACKAGECONFIG[amd] = ""
+PACKAGECONFIG[nouveau] = ""
 PACKAGECONFIG[svga] = ""
 PACKAGECONFIG[virgl] = ""
 

-- 
2.49.0


