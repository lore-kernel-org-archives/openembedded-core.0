Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79F1FA373E
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 13:22:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.7405.1666790545015380078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 06:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: afa@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <afa@pengutronix.de>)
	id 1ongMQ-000530-I1; Wed, 26 Oct 2022 15:22:22 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1ongMQ-000W50-BX; Wed, 26 Oct 2022 15:22:21 +0200
Received: from afa by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <afa@pengutronix.de>)
	id 1ongMO-00DyQa-Ns; Wed, 26 Oct 2022 15:22:20 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 1/2] kernel-fitimage: mangle slashes to underscores as late as possible
Date: Wed, 26 Oct 2022 15:22:18 +0200
Message-Id: <20221026132219.3330056-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172155

This introduces no functional change, but will come in handy in a later
commit where a file lookup will have us using the device tree name. If
we keep it like it's now, we will lose the information whether an
underscore is an original underscore or a mangled slash.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index befdf2568cb1..6307e3c50a3f 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -392,6 +392,8 @@ fitimage_emit_section_config() {
 	setup_line=""
 	default_line=""
 
+	dtb_image=$(echo $dtb_image | tr '/' '_')
+
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
 	if [ -n "$dtb_image" ]; then
@@ -550,12 +552,11 @@ fitimage_assemble() {
 				DTB_PATH="${KERNEL_OUTPUT_DIR}/$DTB"
 			fi
 
-			DTB=$(echo "$DTB" | tr '/' '_')
-
 			# Skip DTB if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
 
 			DTBS="$DTBS $DTB"
+			DTB=$(echo $DTB | tr '/' '_')
 			fitimage_emit_section_dtb $1 $DTB $DTB_PATH
 		done
 	fi
@@ -563,12 +564,11 @@ fitimage_assemble() {
 	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
 		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \( -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
-			DTB=$(echo "$DTB" | tr '/' '_')
-
 			# Skip DTB if we've picked it up previously
 			echo "$DTBS" | tr ' ' '\n' | grep -xq "$DTB" && continue
 
 			DTBS="$DTBS $DTB"
+			DTB=$(echo $DTB | tr '/' '_')
 			fitimage_emit_section_dtb $1 $DTB "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
 		done
 	fi
-- 
2.30.2


