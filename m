Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA01C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:11:43 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.138304.1692115894351361150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ViQ/0qLD;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so3923285fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692115893; x=1692720693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JpygJGErPHsaUQ//s3BA0fSd+ODgrSBzwAAhVE+MaGg=;
        b=ViQ/0qLDuQcjSq/aqGTAmwps0Zd4NruLYT7C+yMjZpuUUBr5/kdghI2g21lSDgZ+JD
         YTnv1OYbOJoME79il9UguslViU/8wXnh1vXT9xwW4uyLqMDP0gxWjhpICq/QOv7mxZt5
         yKDjrtYFsEMRi5LPTlHF4QQMW4txzlVXwDx2eIEGadY6YrBTTo9UuOpOJ3zLKoudEDQL
         tVO9dN5vrtXnCMWL1G39lEX/ghEElr9U3D7VFVPrON1n7PxLs156TPWUIziVB8RrROHf
         iXduH0uAP1WIegu341yJmntd+pxgP5Tsuzp9A1kOsmTdxBT0ep5vwivCQFvneEXPls1Y
         D1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692115893; x=1692720693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpygJGErPHsaUQ//s3BA0fSd+ODgrSBzwAAhVE+MaGg=;
        b=HnbsClHCQcFWibwcgjcPvtwKTF8+Dy45eXMYwiaKIaU7KFVqaE7eHdL6MgseRqz9Nr
         LQkSCes0qKwIt2/vFDPQF6Qs2Bt3xok3T1VfQIcHJb3ydInrV+Jr10phMJfLPwLSdQHR
         OOuz64hI7af3xZAb3E4QWHsdY/OFJlMCJ3AhAHhIyyNCJ+gVdXeXiA4T+h/kwpJI5dYX
         jBE6Acpp2k0GTifOOLgeuu/VjX4lFxnDLrMwmpIXrLKI86+akYgwvg4LEo/SgXQEEmGe
         6VCBrws+XSZUGVr3oe2/cf12OLRoVq9Mux99heECn/kQhIcpmU1JiaoZ3bNNpisi0PpO
         nI/w==
X-Gm-Message-State: AOJu0YwPlwqySqINJgKJ7WTxqlrkeq3fkSe9/8cTUHqm1A+eFLl5L0ny
	VFeczMNFkyEcItspptKj2sTtClxwZQU=
X-Google-Smtp-Source: AGHT+IEuKMZHHVnWgHC840tNa1RsovrvAM9j6UEecp9Apfu9yEet+32vMsAn3M+qZybvEQ5z1vKnrA==
X-Received: by 2002:a05:6870:a711:b0:1b0:b13:c16 with SMTP id g17-20020a056870a71100b001b00b130c16mr15479558oam.2.1692115892861;
        Tue, 15 Aug 2023 09:11:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::6897])
        by smtp.gmail.com with ESMTPSA id zc13-20020a056871270d00b001c03d1a519fsm6440115oab.39.2023.08.15.09.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:11:32 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <Joshua.Watt@garmin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/image_types: Add vfat image type
Date: Tue, 15 Aug 2023 10:11:26 -0600
Message-Id: <20230815161126.1513219-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186078

From: Joshua Watt <Joshua.Watt@garmin.com>

Adds support for creating FAT formatted file system images (useful for
boot partitions on some SoCs).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/image_types.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index fdee835e7c8..c75fd212703 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -131,6 +131,12 @@ IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.er
 IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4 ${IMAGE_ROOTFS}"
 IMAGE_CMD:erofs-lz4hc = "mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4hc ${IMAGE_ROOTFS}"
 
+oe_mkvfatfs () {
+    mkfs.vfat $@ -C ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.vfat ${ROOTFS_SIZE}
+    mcopy -i "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.vfat" -vsmpQ ${IMAGE_ROOTFS}/* ::/
+}
+
+IMAGE_CMD:vfat = "oe_mkvfatfs ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
@@ -266,6 +272,10 @@ EXTRA_IMAGECMD:ext4 ?= "-i 4096"
 EXTRA_IMAGECMD:btrfs ?= "-n 4096 --shrink"
 EXTRA_IMAGECMD:f2fs ?= ""
 
+# If a specific FAT size is needed, set it here (e.g. "-F 32"/"-F 16"/"-F 12")
+# otherwise mkfs.vfat will automatically pick one
+EXTRA_IMAGECMD:vfat ?= ""
+
 do_image_cpio[depends] += "cpio-native:do_populate_sysroot"
 do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
@@ -285,6 +295,7 @@ do_image_f2fs[depends] += "f2fs-tools-native:do_populate_sysroot"
 do_image_erofs[depends] += "erofs-utils-native:do_populate_sysroot"
 do_image_erofs_lz4[depends] += "erofs-utils-native:do_populate_sysroot"
 do_image_erofs_lz4hc[depends] += "erofs-utils-native:do_populate_sysroot"
+do_image_vfat[depends] += "dosfstools-native:do_populate_sysroot mtools-native:do_populate_sysroot"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
@@ -294,6 +305,7 @@ IMAGE_TYPES = " \
     ext3 ext3.gz \
     ext4 ext4.gz \
     btrfs \
+    vfat \
     squashfs squashfs-xz squashfs-lzo squashfs-lz4 squashfs-zst \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
-- 
2.33.0


