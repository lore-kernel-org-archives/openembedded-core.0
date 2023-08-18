Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFCFC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 16:33:08 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.1602.1692376380876412577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 09:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oixVO4Kv;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6bd0afbd616so935274a34.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692376379; x=1692981179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTCuCCiXUj8SEgpgI/1ciI4xAfyZaDrPoZN6T5zkf0g=;
        b=oixVO4KvJJuAyRWLDpSwcmNbDSy5CVgbpWq5paKqmdsXRz/7axhXotU6qqBUS0JjmW
         5O6zHpHoToskhSE/e9/VQPhJyTBmWVSjdbrGjp32d8SgV38FnMKStCpcXSTOgaC7HEbs
         CYt6tB3bvZxc6kHW+zOCcOCWCEwvud0iCTAVD8xB9MS/Zt05zqFUuuJEcUbUoS8RFN1N
         beSvq6LEnNkd0faJJCRJM7j5cCrY51iH+q9fQfq5+rhYV67x62hjjIww0sCs6+rerPjW
         R5pF8s351K3hvPiz2X3ovy0vW9r388ResuDRVpa73oEqqFulaSzx9mUqBFXB/YcbezSW
         MorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692376379; x=1692981179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTCuCCiXUj8SEgpgI/1ciI4xAfyZaDrPoZN6T5zkf0g=;
        b=PWQM8KOce5fBRzCzGNfVD501RV/jMhrEvvTcSMlbv3+mlEJl18r9C/HXpE4A96kmUA
         hff8WWiZtoxZ85pvzXdBimc5Itq6o3kxErbo2jZenNus8Ke4Y/XOU83YmjZ4mHQfy7zj
         UoJjpcqqEKaPZ+pJQvYAnpmQSrXVKWc+Jorwo4z5/SSxdJ5dx9oT/GVGv12NgL1floHT
         jvouZs/ZwZVTawts/CGyuo5NT0/EC+5xDEHEr5cMbr4cvGWH/dBBxmkBWqKjF846dahc
         R46+aoNqG/O/wGuLCK9Q7xxU1Zjn2wU9E0XxmdY5EV6znqoCzuC7wphsjp32kphvHvwi
         xuqA==
X-Gm-Message-State: AOJu0YwBXKt+Ks0JGoDqqZL1Rz3vP2j7D/3vb9PXeV9aYfe6vYRgZUz3
	KzK5hGPKaiGydn94HpRcOu2VWIlW3jo=
X-Google-Smtp-Source: AGHT+IExIYr4MNrY5rLDi8uOdm5ZdwK7g7I8c+v7MRHhY3MINNREAWjVqCU92vSoOwaE0mlk9ra32A==
X-Received: by 2002:a9d:4d94:0:b0:6b9:cba0:93a9 with SMTP id u20-20020a9d4d94000000b006b9cba093a9mr3185231otk.31.1692376379319;
        Fri, 18 Aug 2023 09:32:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::c239])
        by smtp.gmail.com with ESMTPSA id s1-20020a05683004c100b006b98fe3b5c9sm985547otd.1.2023.08.18.09.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 09:32:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <Joshua.Watt@garmin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2] classes/image_types: Add vfat image type
Date: Fri, 18 Aug 2023 10:32:44 -0600
Message-Id: <20230818163244.1733763-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230815161126.1513219-1-JPEWhacker@gmail.com>
References: <20230815161126.1513219-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 16:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186380

From: Joshua Watt <Joshua.Watt@garmin.com>

Adds support for creating FAT formatted file system images (useful for
boot partitions on some SoCs).

Note that FAT partitions are limited in what they can represent (no
symlinks or device files), so they can't really be used for general
purpose root file systems. As such, they are skipped when testing for
that purpose.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/image_types.bbclass       | 15 +++++++++++++++
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index fdee835e7c8..4aed64e27f3 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -131,6 +131,15 @@ IMAGE_CMD:erofs = "mkfs.erofs ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.er
 IMAGE_CMD:erofs-lz4 = "mkfs.erofs -zlz4 ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4 ${IMAGE_ROOTFS}"
 IMAGE_CMD:erofs-lz4hc = "mkfs.erofs -zlz4hc ${EXTRA_IMAGECMD} ${IMGDEPLOYDIR}/${IMAGE_NAME}.erofs-lz4hc ${IMAGE_ROOTFS}"
 
+# Note that vfat can't handle all types of files that a real linux file system
+# can (e.g. device files, symlinks, etc.) and therefore it not suitable for all
+# use cases
+oe_mkvfatfs () {
+    mkfs.vfat $@ -C ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.vfat ${ROOTFS_SIZE}
+    mcopy -i "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.vfat" -vsmpQ ${IMAGE_ROOTFS}/* ::/
+}
+
+IMAGE_CMD:vfat = "oe_mkvfatfs ${EXTRA_IMAGECMD}"
 
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
@@ -266,6 +275,10 @@ EXTRA_IMAGECMD:ext4 ?= "-i 4096"
 EXTRA_IMAGECMD:btrfs ?= "-n 4096 --shrink"
 EXTRA_IMAGECMD:f2fs ?= ""
 
+# If a specific FAT size is needed, set it here (e.g. "-F 32"/"-F 16"/"-F 12")
+# otherwise mkfs.vfat will automatically pick one.
+EXTRA_IMAGECMD:vfat ?= ""
+
 do_image_cpio[depends] += "cpio-native:do_populate_sysroot"
 do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
@@ -285,6 +298,7 @@ do_image_f2fs[depends] += "f2fs-tools-native:do_populate_sysroot"
 do_image_erofs[depends] += "erofs-utils-native:do_populate_sysroot"
 do_image_erofs_lz4[depends] += "erofs-utils-native:do_populate_sysroot"
 do_image_erofs_lz4hc[depends] += "erofs-utils-native:do_populate_sysroot"
+do_image_vfat[depends] += "dosfstools-native:do_populate_sysroot mtools-native:do_populate_sysroot"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
@@ -294,6 +308,7 @@ IMAGE_TYPES = " \
     ext3 ext3.gz \
     ext4 ext4.gz \
     btrfs \
+    vfat \
     squashfs squashfs-xz squashfs-lzo squashfs-lz4 squashfs-zst \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index a5e069d0be9..dc88c222bdc 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -199,7 +199,7 @@ class ImageFeatures(OESelftestTestCase):
         image = 'core-image-minimal'
 
         all_image_types = set(get_bb_var("IMAGE_TYPES", image).split())
-        skip_image_types = set(('container', 'elf', 'f2fs', 'tar.zst', 'wic.zst', 'squashfs-lzo'))
+        skip_image_types = set(('container', 'elf', 'f2fs', 'tar.zst', 'wic.zst', 'squashfs-lzo', 'vfat'))
         img_types = all_image_types - skip_image_types
 
         config = """
-- 
2.33.0


