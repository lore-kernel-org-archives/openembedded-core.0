Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD3DC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 08:35:41 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.6437.1653035730866072435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 01:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=POZTRJUv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: kory.maincent@bootlin.com)
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 969FF1C0014;
	Fri, 20 May 2022 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653035729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kBWu3CquIp1DyV1jyJQMC7OtNan9F6lknXNPZa1TVuY=;
	b=POZTRJUvoU/75xQEkQydN9vNwrf68vjc5riIPC1hKt4JcUzOm/TY3nYB+PcASyogxuTz//
	KOhKIGFEOiGxdB7UpErLOf/q/7I6/DtitqWLUUeUTzXTl0+oeRDudAS61AIhq5VkQNd4Xd
	HQUDJdhXn/qTHvf2ZH5+JcDjG/E3wbVi83Gr86u0Ub2d/4BO1+H9VYF2ZNNFHp42AKUkWR
	8DDQK9j1PBXPfWWkVswvZCG1D4oNVwSRzzvBLt0yxx/gLLN4/byGx8aNOd3+OempC2njJP
	9rHNc5unCSGelUxZZbGM6tkjFrAW7bfIykVGpXscRJAJiTFBrWr5LqXXQIRr9Q==
From: kory.maincent@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	richard.purdie@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [OE-core][PATCH] images_types: isolate the write of UBI configuration
Date: Fri, 20 May 2022 10:35:28 +0200
Message-Id: <20220520083528.194295-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 08:35:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165921

From: Kory Maincent <kory.maincent@bootlin.com>

Isolate the writing of the UBI configuration in a separate function.
This allows to use a custom configuration easily by overriding the
function.

Replace the echo functions by a cat to have a more readable configuration.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 meta/classes/image_types.bbclass | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 89a9c92db7..0ffea91195 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -142,6 +142,24 @@ UBI_VOLNAME ?= "${MACHINE}-rootfs"
 UBI_VOLTYPE ?= "dynamic"
 UBI_IMGTYPE ?= "ubifs"
 
+write_ubi_config() {
+	if [ -z "$1" ]; then
+		local vname=""
+	else
+		local vname="_$1"
+	fi
+
+	cat <<EOF > ubinize${vname}-${IMAGE_NAME}.cfg
+[ubifs]
+mode=ubi
+image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.${UBI_IMGTYPE}
+vol_id=0
+vol_type=${UBI_VOLTYPE}
+vol_name=${UBI_VOLNAME}
+vol_flags=autoresize
+EOF
+}
+
 multiubi_mkfs() {
 	local mkubifs_args="$1"
 	local ubinize_args="$2"
@@ -151,19 +169,8 @@ multiubi_mkfs() {
             bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
         fi
 
-	if [ -z "$3" ]; then
-		local vname=""
-	else
-		local vname="_$3"
-	fi
+	write_ubi_config "$3"
 
-	echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cfg
-	echo mode=ubi >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo image=${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.${UBI_IMGTYPE} >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_id=0 >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_type=${UBI_VOLTYPE} >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_name=${UBI_VOLNAME} >> ubinize${vname}-${IMAGE_NAME}.cfg
-	echo vol_flags=autoresize >> ubinize${vname}-${IMAGE_NAME}.cfg
 	if [ -n "$vname" ]; then
 		mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
 	fi
-- 
2.25.1


