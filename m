Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AF810A1E7A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:06:11 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45539.1774523166193252616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=bXzY8kee;
 spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fhLYS388MzMVN;
	Thu, 26 Mar 2026 12:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1774523164;
	bh=OZHGrhZdEHWrgNOZOgHATGaHTtWfGBziHT+Qm/h4piM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bXzY8keelZS07m5NdWHwdLgdRfo2wdCdXSkcA5ntLfgIPDFf7KeBF4eW4GTpjqcj0
	 TYonWOEzwKgvBF92hl0t9e2oUMrEwgthDCG7YLuGqXEkqrm3uC1hQDYGfti0cztYLU
	 muZY36GvPGoXelBlu//U+C9CJQBuuI+/C8atSn2IUuAEAgKxueA3JaAf0qrOot6a2B
	 zXS/eioa6H9l6SzJRtahJVcvd64cd8bbuee52RVUAGqLAA8y0UimtFFbtnM4o+nXzu
	 vg3pHpaaf9GFDG3lqF22YB24VLOTZsDK7XbFDlXbf9Dbhp3DIOGq1+hSaOykhCDCaZ
	 uBzZzDKq4GUzw==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4fhLYS0CGRzRr7;
	Thu, 26 Mar 2026 12:06:04 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 26 Mar 2026 12:05:50 +0100
Subject: [PATCH 2/3] mesa: fix building imagination Vulkan driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-mesa-libdrm-imagination-v1-2-fe018f03be6a@cherry.de>
References: <20260326-mesa-libdrm-imagination-v1-0-fe018f03be6a@cherry.de>
In-Reply-To: <20260326-mesa-libdrm-imagination-v1-0-fe018f03be6a@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233973

From: Quentin Schulz <quentin.schulz@cherry.de>

The imagination Vulkan driver requires a precomp-compiler from
mesa-tools-native since we've decoupled libclc from target mesa in
commit ac5e0160df78 ("mesa: depend on mesa-tools-native for less
expensive libclc dependency"). This is achieved by building the
imagination precomp-compiler tool in mesa-tools-native and making use of
it via the libclc PACKAGECONFIG for the Vulkan driver such that
mesa-tools-native dependency (and its imagination precomp-compiler) are
brought in.

Fixes: ac5e0160df78 ("mesa: depend on mesa-tools-native for less expensive libclc dependency")
Reported-by: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.inc             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 50d2f5cbb0..0fff6ef1dd 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -3,7 +3,7 @@ inherit_defer native
 
 SUMMARY += " (tools only)"
 
-PACKAGECONFIG = "tools asahi panfrost"
+PACKAGECONFIG = "tools asahi imagination panfrost"
 # llvm required for libclc
 PACKAGECONFIG += "gallium-llvm"
 # Doesn't compile without wayland-scanner if PLATFORMS has wayland in, and,
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e5ee4ad259..cc4937ae97 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -137,7 +137,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination libclc', ',imagination', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"

-- 
2.53.0


