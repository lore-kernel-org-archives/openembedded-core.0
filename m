Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4C9C001B5
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 23:11:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2506.1698880279983380483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 16:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=BiBf9Zog;
 spf=pass (domain: essensium.com, ip: 209.85.221.51, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32ded3eb835so182565f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 16:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1698880278; x=1699485078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLymyTckY/0P8pSBxfSX5eIB5/EtSaUUZE5sJp67OzE=;
        b=BiBf9ZogoAP+TQJJqLjBnBqIHV9rx0HA6JvqfKyLCQXDsYV+egDFUquMBvyrrdo0os
         cprRyRvUna6FiQPQmjWpfz1hkzgfrF/CdaLFSgcPKdjs4RHDw+REYtjv9VgaghaZW8Q0
         E5MwYtQ9ir+McRf8GgbGWosCR3ZTu6I3kGcKxYmRgvaSWSX2RzZDYN7dJEmSsfV2AgT3
         LGn5OneVwZKsGcJznqE3pFFZ6zEvc+u3LJco8/I1ZgI+BTDvC7Uga3p8RIHS0eiOJDJ2
         fzh7LeeUxrOcM2ugPRfZqHM8S2FNoqRXanIRdif+F+hqNRCRAk3rtVwX0Py8VbG951qT
         Tdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698880278; x=1699485078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLymyTckY/0P8pSBxfSX5eIB5/EtSaUUZE5sJp67OzE=;
        b=p4ZzZGRoUbYmVmMwokcHMBx7HP8DS6ZbTAL4hexqG8UuEZzjb4KfdrrzN8JSaWOyQf
         R32S3p+qIoQblfJagNnvjfMmZ4Uh+pdx6Q6Rvy8SMF15cp11SYCQlbnrswpRraBJoQUI
         EwpZCZQNNcuyE+x/u04a26pCOhBDw4y+jJP0Douexjt8mKHOdPOY8NtBXlYtjH3ksfMw
         9RHOnyOE773GzXIKDtDmmoBGQz8zZVD3m98KhINLgQpfEfO2wDKo09RfQW/o7304JzI1
         2JHgtYGCIDqdg5jiL5x6lQXfqTfmRQaxcGArGE2M9UqeI4dzC3i+Fu2jFSxaa1tQDIhF
         cBMg==
X-Gm-Message-State: AOJu0YyXb4YjJrzhUOTdIPcCewrwmylsBrbWWUgh4l54msS+C7Z8F7q6
	GLnj7kIVkeqQte4//sE3UOOogJes3redFb0ApiU=
X-Google-Smtp-Source: AGHT+IFb14SVsoez9EEmy4eutAV+bZiaQ4QE/17Dd0/7OOHrAj8FOVt9jX6LAOYta8gR7jIryPcrvQ==
X-Received: by 2002:a05:6000:1052:b0:32d:aa20:3d05 with SMTP id c18-20020a056000105200b0032daa203d05mr13506887wrx.27.1698880278417;
        Wed, 01 Nov 2023 16:11:18 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id m11-20020adff38b000000b0032db4e660d9sm854601wro.56.2023.11.01.16.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 16:11:18 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 2/5 v3] image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image types
Date: Thu,  2 Nov 2023 00:10:51 +0100
Message-ID: <20231101231058.86928-3-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101231058.86928-1-charles-antoine.couret@mind.be>
References: <20231101231058.86928-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 23:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190050

If defined, this variable value overrides the size of ext* partition file created by mkfs.
Otherwise previous logic based on ROOTFS_SIZE variable is used.

It should be set when the final file size would not be above a specific value due to fixed
partitionning for example.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image_types.bbclass | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index be8197f1f6..fb1e33cf3e 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -79,24 +79,32 @@ IMAGE_CMD:cramfs = "mkfs.cramfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.cr
 
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
-	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
-	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
+	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$rootfs_file_size count=$COUNT bs=1024"
+	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype seek=$rootfs_file_size count=$COUNT bs=1024
 	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
 	bbdebug 1 "Actual Partition size: `stat -c '%s' ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype`"
 	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}.$fstype -d ${IMAGE_ROOTFS}"
@@ -105,9 +113,9 @@ oe_mkext234fs () {
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
2.41.0


