Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B98C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 13:22:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.7406.1666790545077906173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 06:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: afa@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1ongMQ-00052z-Qo; Wed, 26 Oct 2022 15:22:22 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1ongMQ-000W4y-B5; Wed, 26 Oct 2022 15:22:21 +0200
Received: from afa by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1ongMO-00DyQd-OS; Wed, 26 Oct 2022 15:22:20 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 2/2] kernel-fitimage: skip FDT section creation for applicable symlinks
Date: Wed, 26 Oct 2022 15:22:19 +0200
Message-Id: <20221026132219.3330056-2-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221026132219.3330056-1-a.fatoum@pengutronix.de>
References: <20221026132219.3330056-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 13:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172154

When building a FIT image with device trees, each device tree lands in a
FIT section and is referenced by a FIT configuration node.

FIT images however also allow referencing the same device tree from
multiple configurations. This can be useful to reduce FIT image size
while staying compatible with existing bootloaders. Allow
kernel-fitimage.bbclass users to take advantage of this by mapping
each symlink to a regular device tree included in the FIT to a
configuration that references a common device tree section.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 33 ++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 6307e3c50a3f..7980910aa8c4 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -354,6 +354,27 @@ EOF
 	fi
 }
 
+#
+# echoes symlink destination if it points below directory
+#
+# $1 ... file that's a potential symlink
+# $2 ... expected parent directory
+symlink_points_below() {
+	file="$2/$1"
+	dir=$2
+
+	if ! [ -L "$file" ]; then
+		return
+	fi
+
+	realpath="$(realpath --relative-to=$dir $file)"
+	if [ -z "${realpath%%../*}" ]; then
+		return
+	fi
+
+	echo "$realpath"
+}
+
 #
 # Emit the fitImage ITS configuration section
 #
@@ -392,7 +413,13 @@ fitimage_emit_section_config() {
 	setup_line=""
 	default_line=""
 
+	dtb_image_sect=$(symlink_points_below $dtb_image "${EXTERNAL_KERNEL_DEVICETREE}")
+	if [ -z "$dtb_image_sect" ]; then
+		dtb_image_sect=$dtb_image
+	fi
+
 	dtb_image=$(echo $dtb_image | tr '/' '_')
+	dtb_image_sect=$(echo "${dtb_image_sect}" | tr '/' '_')
 
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
@@ -411,7 +438,7 @@ fitimage_emit_section_config() {
 	if [ -n "$dtb_image" ]; then
 		conf_desc="$conf_desc${sep}FDT blob"
 		sep=", "
-		fdt_line="fdt = \"fdt-$dtb_image\";"
+		fdt_line="fdt = \"fdt-$dtb_image_sect\";"
 	fi
 
 	if [ -n "$ramdisk_id" ]; then
@@ -568,6 +595,10 @@ fitimage_assemble() {
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
 
 			DTBS="$DTBS $DTB"
+
+			# Also skip if a symlink. We'll later have each config section point at it
+			[ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] && continue
+
 			DTB=$(echo $DTB | tr '/' '_')
 			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
 		done
-- 
2.30.2


