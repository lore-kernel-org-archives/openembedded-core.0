Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B534E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 15:25:44 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web10.131195.1734621937263725660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 07:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YDZB73WyPz6rT;
	Thu, 19 Dec 2024 16:25:35 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YDZB63K2BzltK;
	Thu, 19 Dec 2024 16:25:34 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] uboot-extlinux-config.bbclass: add support for DTBOs
Date: Thu, 19 Dec 2024 16:25:15 +0100
Message-Id: <20241219-extlinux-overlays-v1-0-9a2eb81c1efa@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANs6ZGcC/x3MQQqAIBBA0avErBMaC4quEi3SxhoQDS0xorsnL
 d/i/wciBaYIY/VAoMSRvSvAugK9L24jwWsxyEZ2KLEXlE/L7srCJwp2uaNAUkapvjV6QCjdEch
 w/p/T/L4fpI5JHGMAAAA=
X-Change-ID: 20241217-extlinux-overlays-1ebfbb73fc81
To: Quentin Schulz <quentin.schulz@cherry.de>, 
 openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 15:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208920

Currently, Yocto only supports FIT setups in extlinux for providing and
applying Device Tree Overlays. It even has an additional requirement of
needing the base FDT image node to have a load property outside of the
DRAM location where the FIT data is stored. This is being fixed in
U-Boot, c.f.
https://lore.kernel.org/u-boot/20241219-extlinux-relocate-dtb-when-dtbo-v1-1-fe5eeb8fd4f1@cherry.de/
Until that is merged, one needs to set UBOOT_DTB_LOADADDRESS (not
UBOOT_DTBO_LOADADDRESS!) when building the FIT image. One can then boot
a FIT image and apply FDTOs by setting UBOOT_EXTLINUX_KERNEL_IMAGE to
the path to the fitimage on disk followed by (no space!)
'#<conf-1>#<conf-2>' with <conf-1> being the name of the config node
with the base FDT, and <conf-2> the name of the config node with the
FDTO to apply.

For FIT-less setups, the FDTOVERLAYS (or devicetree-overlay) property
needs to be set per label. This is what this patch series does.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      uboot-extlinux-config.bbclass: simplify FDT/FDTDIR logic
      uboot-extlinux-config.bbclass: add support for DTBOs

 meta/classes-recipe/uboot-extlinux-config.bbclass | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 783347d27b179d85098dc2166bc8234a08b7811b
change-id: 20241217-extlinux-overlays-1ebfbb73fc81

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


