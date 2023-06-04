Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8619C7EE2D
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 12:38:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.16121.1685882288057615368
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 05:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mind.be header.s=google header.b=fnKRwK7U;
 spf=pass (domain: essensium.com, ip: 209.85.221.53, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3094910b150so3926109f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 05:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1685882286; x=1688474286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px2K5IvFbVWvrhvOe+Ngk5I0s3FWg6a8hld3CHaYb/w=;
        b=fnKRwK7UQCFBGd3P5VFqTMsHKb6uZq3A2OwCOu15WjdcNIDLc+O/RsXF2ofgedaFzg
         XwWd1LEMfX/1fKgSCCHT88Q+eubNrRDZIa3UsHrv7TkEJbxW3SCRB5KVzQ8/JQaIhssa
         Yg/ggR5RGQvrkfXdRBiDFBhY2VKF0q1nWVhf1yAe5t9jKwYweV1s+SRz+IXOg0J0u7rc
         +2NeZFLPaDqWSzhyA2e83S5JxQo+2qvgVgkJR/6HESC4piq/yaQutpWTt5sj8EqtIbNH
         omoubWlAyHb5PFzHAcBUbl2inpbIvc8v61FmbIRF5v1beV6T81yBNiPOBfbgVvgO9/ne
         Tg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882286; x=1688474286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px2K5IvFbVWvrhvOe+Ngk5I0s3FWg6a8hld3CHaYb/w=;
        b=QPkASzSBmvgav4gGZ1MMSOLOHmKDfO6Zy4lyLle+OEJfxghDyqOTvmysDk+tQkNc7q
         9gXPCtUA3VYNM9feY/yME0JVyLWGY+1mflwS+xJgajcER0S6jttGAy4hF0SFx21whL5l
         9jGfbgK/NFyARwGqPi8fj4gnPFhdnVEY8uHVg2TcGnfYJeSUF18jLEWKJqRex9RGbgXu
         7JVpG+fIX5FAe7W20CsIyNsEjl6ga8heNDuZvWh3ulaS+zSCBWmEXDfh55jvTXC1Z88D
         aHti4Ihlq5J6w/hyQ/JmT19Nf7JbkfErvwQ/B6mQYpBXX/VSRiUd/s4MzS08zT+XdkvE
         UmGg==
X-Gm-Message-State: AC+VfDx9vnoFY2/Ur8RC8wggKe6ce6lmp7T0MO5AnIPFQYPDaSweGmej
	nx/cqNvbSWTsjNxacOKNjggzl5LMN3FRYZyoORE=
X-Google-Smtp-Source: ACHHUZ5rSPtpDT50V0ZVjMDma5LkCSry5hADkgOOnqHi0SXuJe9ooKlfjJ3VpxH5s1DJiPcM4CgwlQ==
X-Received: by 2002:a5d:5552:0:b0:30e:3f37:1995 with SMTP id g18-20020a5d5552000000b0030e3f371995mr733664wrw.71.1685882286582;
        Sun, 04 Jun 2023 05:38:06 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.googlemail.com with ESMTPSA id w16-20020adfd4d0000000b0030aefa3a957sm6967673wrk.28.2023.06.04.05.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 05:38:06 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 1/3] image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
Date: Sun,  4 Jun 2023 14:37:53 +0200
Message-Id: <20230604123755.2541295-2-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
References: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 12:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182360

If defined, this variable value overrides the size of ext* partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index e4939af459..cebbb61545 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -68,24 +68,33 @@ IMAGE_CMD:cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${I
 
 oe_mkext234fs () {
 	fstype=$1
+	image_file_maxsize=$2
 	extra_imagecmd=""
+	rootfs_file_size=$ROOTFS_SIZE
 
-	if [ $# -gt 1 ]; then
-		shift
+	if [ $# -gt 2 ]; then
+		shift 2
 		extra_imagecmd=$@
 	fi
 
+
+	if [[ "${image_file_maxsize}" != "\"\"" ]]; then
+		# Remove quotes to get numbers only
+		rootfs_file_size=$(echo "${image_file_maxsize}" | tr -d '"')
+	fi
+
 	# If generating an empty image the size of the sparse block should be large
 	# enough to allocate an ext4 filesystem using 4096 bytes per inode, this is
 	# about 60K, so dd needs a minimum count of 60, with bs=1024 (bytes per IO)
 	eval local COUNT=\"0\"
 	eval local MIN_COUNT=\"60\"
-	if [ $ROOTFS_SIZE -lt $MIN_COUNT ]; then
+	if [ $rootfs_file_size -lt $MIN_COUNT ]; then
 		eval COUNT=\"$MIN_COUNT\"
 	fi
+
 	# Create a sparse image block
-	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
-	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
+	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$rootfs_file_size count=$COUNT bs=1024"
+	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$rootfs_file_size count=$COUNT bs=1024
 	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
 	bbdebug 1 "Actual Partition size: `stat -c '%s' ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
 	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
@@ -94,9 +103,9 @@ oe_mkext234fs () {
 	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
 }
 
-IMAGE_CMD:ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD:ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
-IMAGE_CMD:ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
+IMAGE_CMD:ext2 = "oe_mkext234fs ext2 \"${IMAGE_FILE_MAXSIZE:ext2}\" ${EXTRA_IMAGECMD}"
+IMAGE_CMD:ext3 = "oe_mkext234fs ext3 \"${IMAGE_FILE_MAXSIZE:ext3}\" ${EXTRA_IMAGECMD}"
+IMAGE_CMD:ext4 = "oe_mkext234fs ext4 \"${IMAGE_FILE_MAXSIZE:ext4}\" ${EXTRA_IMAGECMD}"
 
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD:btrfs () {
-- 
2.40.1


