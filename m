Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C01C0218A
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 16:40:39 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.web11.15117.1737132034042020695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 08:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10:40ca:feff:fe05:1])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YZQTD4WnbzHdZ;
	Fri, 17 Jan 2025 17:40:32 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YZQTD1htPzhC5;
	Fri, 17 Jan 2025 17:40:32 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 17 Jan 2025 17:40:19 +0100
Subject: [PATCH RFC kirkstone scarthgap styhead 1/2]
 uboot-extlinux-config.bbclass: simplify FDT/FDTDIR logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-extlinux-overlays-backport-v1-1-dad9fdb81777@cherry.de>
References: <20250117-extlinux-overlays-backport-v1-0-dad9fdb81777@cherry.de>
In-Reply-To: <20250117-extlinux-overlays-backport-v1-0-dad9fdb81777@cherry.de>
To: openembedded-core@lists.openembedded.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 16:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209993

From: Quentin Schulz <quentin.schulz@cherry.de>

The three blocks share the same LABEL and KERNEL content, so let's
factor that part out.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 544c0f72774e17d1dca4664c0bc21f8281dade5b)
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
2.48.0


