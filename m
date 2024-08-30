Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A39BCA1012
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 20:22:20 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.1087.1725049337349408261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Aug 2024 13:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=VNGRn9BG;
 spf=pass (domain: siemens.com, ip: 185.136.65.228, mailfrom: alexander.sverdlin@siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2024083020221485b56ffcb2443c4b50
        for <openembedded-core@lists.openembedded.org>;
        Fri, 30 Aug 2024 22:22:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=o+dGjN6JywqRLCXgrCU7Pzv8lGJIFVQ58GYkwTAesmE=;
 b=VNGRn9BGHz8aaX24pscJ7kPZiJO0L4SWS0fnLR+ieMKjPsBdCVvVLBWX/w+Kzu0kNiQrKb
 MQ1ZJjEsn7gmvrbDtz1+yMyOwwY118qD01avlm6892MdvV3HJ+0nURZ60ITAmm3bMDhpKuxu
 VRyvxNEFXd/kyNIxy4jxruIBQsxkHuSaoh+TxAsK+11SGBeBatZePCHC1wwQln4RDjBonWBd
 j8+fq4yJtmwAA3WfqE/k49e/j2wPFaUHw25WxFIlnSaSlgCz5KjqAffHnzsM9tnCTMeXC+vN
 uCrKAbojUKKuknsW3a92GlMllmqaaPkyZ4nJXd/7dUNXTkfFrUN8yBOg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH] kernel-fitimage: make signing failure fatal
Date: Fri, 30 Aug 2024 22:21:34 +0200
Message-ID: <20240830202137.1054805-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2024 20:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203970

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

mkimage doesn't fail if it is not able to sign FIT nodes.
This may lead to unbootable images in secure boot configurations.
Make signing failures fatal by parsing the mkimage output.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 67c98adb232..fea9e4e19a7 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -753,11 +753,15 @@ fitimage_assemble() {
 	# Step 8: Sign the image
 	#
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
-		${UBOOT_MKIMAGE_SIGN} \
+		output=$(${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
 			-r ${KERNEL_OUTPUT_DIR}/$2 \
-			${UBOOT_MKIMAGE_SIGN_ARGS}
+			${UBOOT_MKIMAGE_SIGN_ARGS})
+		echo "$output"
+		if echo "$output" | grep -qE "Sign value:\s*unavailable"; then
+			bbfatal "${UBOOT_MKIMAGE_SIGN}: Failed to provide some signatures"
+		fi
 	fi
 }
 
-- 
2.46.0


