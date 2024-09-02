Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8A4CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 11:46:58 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.36703.1725277612513360116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 04:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=UvE/IHS/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-456497-2024090211464843b45cfd10cce243f3-eyzqke@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024090211464843b45cfd10cce243f3
        for <openembedded-core@lists.openembedded.org>;
        Mon, 02 Sep 2024 13:46:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=L8GOVrTsNlb5bFsX3SNKeOUuevvJvT8m1Q9PSJC9sBQ=;
 b=UvE/IHS/IZFJlez1JCRZ/grnieWiHKr9sald+XTggwRfnSD3FE5hTBlAc0RSVej/f7FpBY
 5F6jYpta51Sr2n3OFSeSkKrfHG5eOH5Mtnn8KWLB305s4YSu+mo1KlOMU5ZSMNwh6alrr1FP
 C3dy9E0Amq8qE6gXfOEShysbW8FozM/0vusv8dS/efaF+fSzQtoLXkXEHjlIFnaPJA5HZ6a9
 OhUMac4sIlDNxQcs8CMyEe7gZcHsG6c35OryADS9lQVE3XUvzRiSicDWbfvWds96do6ZpFBq
 NDMJACHnn1flUi4sH7R64FpF7nUHdN6028xwP6WKPJ2Mevd8sCniDV4A==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH v2] kernel-fitimage: make signing failure fatal
Date: Mon,  2 Sep 2024 13:45:20 +0200
Message-ID: <20240902114523.1168083-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 11:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204097

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

mkimage doesn't fail if it is not able to sign FIT nodes.
This may lead to unbootable images in secure boot configurations.
Make signing failures fatal by parsing the mkimage output.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changes in v2:
- bbfatal -> bbfatal_log

 meta/classes-recipe/kernel-fitimage.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 67c98adb232..cfda17f5e3b 100644
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
+			bbfatal_log "${UBOOT_MKIMAGE_SIGN}: Failed to provide some signatures"
+		fi
 	fi
 }
 
-- 
2.46.0


