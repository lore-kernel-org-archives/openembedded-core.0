Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A46E9370E
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 13:40:18 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.15595.1696513209588258785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 06:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197, mailfrom: foss+yocto@0leil.net)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2620E1C0011;
	Thu,  5 Oct 2023 13:40:05 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] uboot-extlinux-config.bbclass: fix missed override syntax migration
Date: Thu,  5 Oct 2023 15:39:39 +0200
Message-ID: <20231005-dev-uboot-extlinux-config-sstate-invalidate-v1-1-0f63ac16e38d@theobroma-systems.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: foss@0leil.net
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 13:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188720

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

uboot-extlinux-config allows to specify multiple "labels" (entries in a
menu, à-la grub) and each of them have their own values for some fields.
Each "base" variable, e.g. UBOOT_EXTLINUX_FDT can be overridden for each
label. This is done via the OVERRIDES mechanism based on the label name,
e.g. UBOOT_EXTLINUX_FDT:linux if linux is a label.

However, OVERRIDES doesn't contain the label globally because it's only
necessary in one task. Therefore, the OVERRIDES itself is modified
within the task. This means that the sigdata will not be told the
dependency on UBOOT_EXTLINUX_FDT:linux, because it cannot know about it.

For this reason, we need to explicitly specify which variables this task
depends on via vardeps varflag for the task.

This was done in the past, but we missed updating it during the override
syntax migration so the cache wouldn't get invalidated if someone
modifies UBOOT_EXTLINUX_FDT:linux from a configuration file or a
bbappend for example.

Let's fix this by migrating it to the new syntax.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
Cc'ing Steve Sakoman for backporting to stable releases:
- kirkstone
- mickledore

Dunfell should be unnecessary since we support both syntaxes there.
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index 30bbea57de..0413e760bd 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -159,7 +159,7 @@ python do_create_extlinux_config() {
         bb.fatal('Unable to open %s' % (cfile))
 }
 UBOOT_EXTLINUX_VARS = "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDTDIR FDT KERNEL_ARGS INITRD"
-do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s_%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
+do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s:%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
 do_create_extlinux_config[vardepsexclude] += "OVERRIDES"
 
 addtask create_extlinux_config before do_install do_deploy after do_compile

---
base-commit: 2b9044361f2855866eed831f8bdb770f2c7d42dc
change-id: 20231005-dev-uboot-extlinux-config-sstate-invalidate-c464136a168b

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

