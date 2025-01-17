Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED738C02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 16:51:19 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web10.15624.1737132670142824415
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 08:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YZQjS2yMHzKwS;
	Fri, 17 Jan 2025 17:51:08 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4YZQjR5mhxzPmx;
	Fri, 17 Jan 2025 17:51:07 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 17 Jan 2025 17:50:54 +0100
Subject: [PATCH] uboot-extlinux-config.bbclass: invalidate
 do_create_extlinux_config on changes to UBOOT_EXTLINUX_FDTOVERLAYS:x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-extlinux-overlays-vardeps-v1-1-803fedcfcf3c@cherry.de>
X-B4-Tracking: v=1; b=H4sIAG2KimcC/x3MywrCQAxG4VcpWRto6t1XERdT51cDZVqSOkwpf
 XcHl9/inJUcpnC6NSsZsrqOqUJ2DT0/Ib3BGqupa7tjK3JmlHnQ9C08ZtgQFuccLGJyPh1E9pd
 rDLEH1X4yvLT83/fHtv0AvGeba2sAAAA=
X-Change-ID: 20250117-extlinux-overlays-vardeps-6411389dadbe
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 16:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209995

From: Quentin Schulz <quentin.schulz@cherry.de>

do_create_extlinux_config is using a bit of an odd mechanism which
doesn't work well with sstate cache invalidation.

BitBake will detect changes to UBOOT_EXTLINUX_FDTOVERLAYS because it's
explicitly mentioned in the task, but it'll miss changes to
UBOOT_EXTLINUX_FDTOVERLAYS:label because this OVERRIDES is set within
the task, so the value of UBOOT_EXTLINUX_FDTOVERLAYS for the label
OVERRIDES will only ever change from within the task, while it is
running, much later than during parsing.

For that to work properly, we need to add the entire variable (including
the OVERRIDES part) to the vardeps varflag of the task so that its value
is monitored. This is already done for all possible label variables but
FDTOVERLAYS was forgotten.

Fixes: 3ac21b32b5f5 ("uboot-extlinux-config.bbclass: add support for DTBOs")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index 2fa83b2c8b5c90ced37048d9051493e31837b305..099476f5d6f747dfbab01644ddd1632a2bf22b92 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -162,7 +162,7 @@ python do_create_extlinux_config() {
     except OSError:
         bb.fatal('Unable to open %s' % (cfile))
 }
-UBOOT_EXTLINUX_VARS = "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDTDIR FDT KERNEL_ARGS INITRD"
+UBOOT_EXTLINUX_VARS = "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDTDIR FDT FDTOVERLAYS KERNEL_ARGS INITRD"
 do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s:%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
 do_create_extlinux_config[vardepsexclude] += "OVERRIDES"
 

---
base-commit: ba492417cf8712ca8009154cfadeb494c1a6064f
change-id: 20250117-extlinux-overlays-vardeps-6411389dadbe

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


