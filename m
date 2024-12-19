Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77820E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 15:25:44 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.web11.131235.1734621937560313378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 07:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YDZB811hfz8YJ;
	Thu, 19 Dec 2024 16:25:36 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YDZB73kZszlwc;
	Thu, 19 Dec 2024 16:25:35 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 19 Dec 2024 16:25:16 +0100
Subject: [PATCH 1/2] uboot-extlinux-config.bbclass: simplify FDT/FDTDIR
 logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-extlinux-overlays-v1-1-9a2eb81c1efa@cherry.de>
References: <20241219-extlinux-overlays-v1-0-9a2eb81c1efa@cherry.de>
In-Reply-To: <20241219-extlinux-overlays-v1-0-9a2eb81c1efa@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, 
 openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 15:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208921

From: Quentin Schulz <quentin.schulz@cherry.de>

The three blocks share the same LABEL and KERNEL content, so let's
factor that part out.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/classes-recipe/uboot-extlinux-config.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
index 0413e760bd1392df5c4cec5b8888d350c5044647..a6938ab0631ac0d0a06828a721d5da4d0a77199a 100644
--- a/meta/classes-recipe/uboot-extlinux-config.bbclass
+++ b/meta/classes-recipe/uboot-extlinux-config.bbclass
@@ -137,14 +137,12 @@ python do_create_extlinux_config() {
 
                 fdt = localdata.getVar('UBOOT_EXTLINUX_FDT')
 
+                cfgfile.write('LABEL %s\n\tKERNEL %s\n' % (menu_description, kernel_image))
+
                 if fdt:
-                    cfgfile.write('LABEL %s\n\tKERNEL %s\n\tFDT %s\n' %
-                                 (menu_description, kernel_image, fdt))
+                    cfgfile.write('\tFDT %s\n' % (fdt))
                 elif fdtdir:
-                    cfgfile.write('LABEL %s\n\tKERNEL %s\n\tFDTDIR %s\n' %
-                                 (menu_description, kernel_image, fdtdir))
-                else:
-                    cfgfile.write('LABEL %s\n\tKERNEL %s\n' % (menu_description, kernel_image))
+                    cfgfile.write('\tFDTDIR %s\n' % (fdtdir))
 
                 kernel_args = localdata.getVar('UBOOT_EXTLINUX_KERNEL_ARGS')
 

-- 
2.47.1


