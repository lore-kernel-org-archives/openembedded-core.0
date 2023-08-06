Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD998C3DA40
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 21:14:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.19656.1691356442447119628
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 14:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=cPDzJxkl;
 spf=pass (domain: essensium.com, ip: 209.85.128.45, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe1e1142caso38952515e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 14:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1691356441; x=1691961241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6An0wH99JHOGFPer94PqRj8JhNlTy2QEcU9rLas5jno=;
        b=cPDzJxkl4HRcbvsAwInX8qR5Uy8I6lMmDdY676OSpuOAYYCKWf47XJa3sz3rDSGMWO
         +FvrPINyO8KjLwV+xgbkK0oFd7qqAMcD/5VuSe+GAWOClrtfpFD0jN8BG1jSCu3WoDiW
         DVH9j6rnw4u+j4C8E56Zbzxbr81e9EN/ZuDNwS+szTeP8iV9k8iOv5ycCPqeVSszXP7p
         FALKpeGPZCSoYcp2AwqG+pH//rpSGyGjg5mxciomkNt9OxTrxFqsbu6NR6HUQoWEiJUU
         J3XdAClKsKgKRgVz8eZ5hjBy15DHaIOezqJed7Pxe/SpyLfF/ycJ58XqwJSRJP00tUGO
         IOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691356441; x=1691961241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6An0wH99JHOGFPer94PqRj8JhNlTy2QEcU9rLas5jno=;
        b=Mj8yS0Ppu5X/xD4jHxyZrcPbiMMhtpLSHrk+IYRyzAhDp8/WrmJFCCNSoss6P26+Bd
         v2b2n4KOxKWZjEpZVyffx2nQL+Hwc7mV9xyMT45Cn6cUJyMidKRDWQBlgqF48/tsgSYg
         ClE9CGcdOigLbIBVXSWeYIOuQrOAOJfRouQTKFZE82OndavTKJjL3zRtDcgy1rhHHUyN
         BWSi/qQBBP6EdIEb70Ku3Otv75EqhXTKbC7O7NE1X4WmXfSKu91BrRh3s5f4KALA4KFq
         5q5y9AUAcWfS1KJuQ+KSPMOO4wHr8mKWGocmEZpsWLD+bVevZtktKH1l6Z4HEV7a98xS
         E37w==
X-Gm-Message-State: AOJu0Yzu2uMru1XEdwDEs3womJdnR98svGBh3xLuCZmt6MO01QMPsmJx
	TDHvEH/UQvbENhL63tvi7L50XeJBdASTdRE9d9Q=
X-Google-Smtp-Source: AGHT+IGVwGWh+Smfq6vZbWdfimvxxsEd1PsOVByTaIPHXOyO42sLxdQYsit9ToGIQKbS4yOTeMh8gw==
X-Received: by 2002:a7b:c453:0:b0:3fc:d5:dc14 with SMTP id l19-20020a7bc453000000b003fc00d5dc14mr5536654wmi.5.1691356441035;
        Sun, 06 Aug 2023 14:14:01 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c021500b003fe1a092925sm8612055wmi.19.2023.08.06.14.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 14:14:00 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 2/5 v2] image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
Date: Sun,  6 Aug 2023 23:13:43 +0200
Message-ID: <20230806211348.1191553-3-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
References: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 21:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185576

If defined, this variable value overrides the size of ext* partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 33c65e8282..2ec41c6e54 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -79,24 +79,32 @@ IMAGE_CMD:cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${I
 
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
+	if [[ "${image_file_maxsize}" -ne 0 ]]; then
+		rootfs_file_size=${image_file_maxsize}
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
@@ -105,9 +113,9 @@ oe_mkext234fs () {
 	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype || [ $? -le 3 ]
 }
 
-IMAGE_CMD:ext2 = "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
-IMAGE_CMD:ext3 = "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
-IMAGE_CMD:ext4 = "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
+IMAGE_CMD:ext2 = "oe_mkext234fs ext2 ${@get_max_image_size(d, 'ext2')} ${EXTRA_IMAGECMD}"
+IMAGE_CMD:ext3 = "oe_mkext234fs ext3 ${@get_max_image_size(d, 'ext3')} ${EXTRA_IMAGECMD}"
+IMAGE_CMD:ext4 = "oe_mkext234fs ext4 ${@get_max_image_size(d, 'ext4')} ${EXTRA_IMAGECMD}"
 
 MIN_BTRFS_SIZE ?= "16384"
 IMAGE_CMD:btrfs () {
-- 
2.41.0


