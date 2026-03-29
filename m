Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDD1F3D608
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 13:47:56 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29637.1774792066935683222
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 06:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=XTDNyoXm;
 spf=pass (domain: essensium.com, ip: 209.85.221.43, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43cf906b007so284642f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 06:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1774792065; x=1775396865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjbc9bSep6kD7cASiOZg46P531+lHDOO0jQu2EObubg=;
        b=XTDNyoXmMy+0xjzzl/SdXLi34l+nuO6FmW+4MbwB/0/ijWYpTPOI9eFuTUg21o7lv6
         gVZZPp7KGcItYu+v1lHPu1EQPEAYE4BHY0StRxh70r2FZxohEZWOtHB4aQulasFvPgGK
         oxG/JeZ4QWSZjtaTwkJImpdtJ0KZCx40yYXkAyfhWUBDlSxwZavsqCzJoRcAGOX/h5cd
         LLUvNqkj2SBD8aYeJa7IMS/WWhaghzYU0/WA/ID8QeMgPoWA51w9ehwKg3Hz18YhS3/E
         H3csLSSjaFuPSEu7HUZOA7eup3VP3uoj+nJuQuUTkn8rHd+kJfWbQa4bIgyNia9ByeBB
         292A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774792065; x=1775396865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vjbc9bSep6kD7cASiOZg46P531+lHDOO0jQu2EObubg=;
        b=bs0ascjxFiCwhy/Ree6tTgf5ODrAnV8CXR8kpifGXpdGQ2S5DIiRTPCSjJFhHF/Mc2
         bUb9UmVQ5v6yprs1lKxkRoanOBh1sR/PXbgUaV4ifEXT9kDhAa86pI/1gfwzEMZdLCmu
         uPAgobeluy0lRZIRkw4r9eKK1RkJB1yoTEiDwN2niQNR9oR71lF+KhTDhBUlGQg39mBo
         UJC2dmwRajXVWG6wodRggW4ntzHmBbiwT0XUikX6OindatA0koHPYU9y6/yQi2jKWfEq
         p00ObMXjVSkttLg/eqrwI1qLAxt5F+pC19OJjr1OD1M17fjBB6RuxFpIltc8xWVVIEoE
         Cq2A==
X-Gm-Message-State: AOJu0Yx5YsCMaDkjTQlrBD+kkOQAJlzVMCVgd3+ef5rhc1XQCIEUBeAg
	OoTdKRMaLODh88NG63AmJIXpntK5dmRwZL4FWHd0Byakpy9bhlD2i8NTrRPK3ziTkQQuAhPaBI6
	KVWm3
X-Gm-Gg: ATEYQzzeeUdinvZFCgJuJ7bK65mSSuzmYME8dGKM+l8yDQ1wMonRiMjq8WTy81TyS6J
	+XRfi/LssDNKMQnk1zCfOBCN6zutkCNsQS4sFrMm6p3i1HNuTBcAHJ+pgYrG/DD5whCSrhVlhV0
	SDTAyvYV2G1XgpQx3y0LGb1abKszPQWWxPXkc85v+Fmq1QGkSI/z4CG72FcW9tL9LEhdmv3+hg/
	/R1tv69p4gggFCJlgbHMfYVjr8BXrTdwHpB7OC9r7vbzfghGMcZl3Hi0dyr6SrI2Mr0bZNZCRoC
	AL1YsW7VwSk1sZquJQl0vUpkSEp3+dC9hShPSp379QTyX1PaJBOwexGWJfwVVRJm9M3c18tNSUK
	8KDB1w/nYVZLNQqhMFC8XXvZTE4/M2vMFR8oX5Gkg9FofzRRm+Rtj0VFXJp721fdcALznLZSH7A
	2XlvBnOmG1crh86V0U4S7kd5wuq6YI6Zhp/1hdateonas=
X-Received: by 2002:a05:6000:25c8:b0:43b:48ab:5672 with SMTP id ffacd0b85a97d-43b9e9fb463mr14905991f8f.45.1774792065293;
        Sun, 29 Mar 2026 06:47:45 -0700 (PDT)
Received: from Jimmy.fritz.box ([2a02:578:85c6:1101:1ab9:445:1169:11e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm11162908f8f.9.2026.03.29.06.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:47:45 -0700 (PDT)
From: charles-antoine.couret@mind.be
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 2/5 v4] image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
Date: Sun, 29 Mar 2026 15:47:12 +0200
Message-ID: <20260329134716.3185469-3-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 13:47:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234145

From: Charles-Antoine Couret <charles-antoine.couret@mind.be>

If defined, this variable value overrides the size of ext* partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 2905c23d4e..bcb0c75b9f 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -77,24 +77,32 @@ IMAGE_CMD:cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.cr
 
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
+	if [ ${image_file_maxsize} -ne 0 ]; then
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
-	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
-	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
+	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$rootfs_file_size count=$COUNT bs=1024"
+	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$rootfs_file_size count=$COUNT bs=1024
 	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
 	bbdebug 1 "Actual Partition size: `stat -c '%s' ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype`"
 	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}"
@@ -103,9 +111,9 @@ oe_mkext234fs () {
 	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype || [ $? -le 3 ]
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
2.53.0


