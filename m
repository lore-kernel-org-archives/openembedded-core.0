Return-Path: <r.czerwinski@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31766C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 10:24:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.12073.1714472695585755111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 03:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: rcz@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <rcz@pengutronix.de>)
	id 1s1kfN-0000Ua-18; Tue, 30 Apr 2024 12:24:53 +0200
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rcz@pengutronix.de>)
	id 1s1kfL-00F92R-Tk; Tue, 30 Apr 2024 12:24:51 +0200
Received: from rcz by dude05.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <rcz@pengutronix.de>)
	id 1s1kfL-004Trv-2o;
	Tue, 30 Apr 2024 12:24:51 +0200
From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: [PATCH] kernel-fitImage: use IMAGE_NAME_SUFFIX
Date: Tue, 30 Apr 2024 12:24:48 +0200
Message-Id: <20240430102448.1068114-1-r.czerwinski@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: rcz@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 10:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198759

Without taking IMAGE_NAME_SUFFIX into account, the kernel-fitimage class
will always fail to find the initramfs, fix the search path and error
message to include IMAGE_NAME_SUFFIX.

Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 4b74ddc201..e0a26d26b9 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -683,7 +683,7 @@ fitimage_assemble() {
 		# Find and use the first initramfs image archive type we find
 		found=
 		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
-			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
+			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$img"
 			if [ -e "$initramfs_path" ]; then
 				bbnote "Found initramfs image: $initramfs_path"
 				found=true
@@ -695,7 +695,7 @@ fitimage_assemble() {
 		done
 
 		if [ -z "$found" ]; then
-			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_NAME}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
+			bbfatal "Could not find a valid initramfs type for ${INITRAMFS_IMAGE_NAME}${IMAGE_NAME_SUFFIX}, the supported types are: ${FIT_SUPPORTED_INITRAMFS_FSTYPES}"
 		fi
 	fi
 

base-commit: 7ef767d84d56b25498e45db83bb8f9d9caebeaf9
-- 
2.39.2


