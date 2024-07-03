Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2CCC3814E
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:26 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.51060.1720015276986960750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IJK52GTH;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7eb895539e3so216773139f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015275; x=1720620075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtgEKVQ7DIhST8KVqQTuZZAMLu1C/Eep2QYIJd2wEjE=;
        b=IJK52GTHRK8vgqtbAdn9Ln3bnqya+l+RHeEHZDq2tRUv/2y2pqslQqWDTmgp4YuPDN
         Ebcz3ZIsgFKdZoZBH7/IZlWoqyehNo2knUSlNPTEm4yLHxTAXpwdTtlDz3klDYF2gq47
         wev489az8AiQjJp8fkFCoFMVnFoScdFz+EmFXXoLkFkrPlJYFu1d1RN21K/+TfsnxhoP
         gYQ5CJyzUSPQlEoqnDErILEcl0ZPzmI6xc3TKK3TQt87OkhL+n7hOzvCV5RGQa5fKI6V
         Ae9zVyOoO5VIhwsVjboAtuBrD18ahOHhl3Oe1d/4mcecg1pSLPHFJUMz1sTBQWTRLUzL
         bAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015275; x=1720620075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtgEKVQ7DIhST8KVqQTuZZAMLu1C/Eep2QYIJd2wEjE=;
        b=l+1dg4LULyWp3CGF3kN8h+FtFgiE7Qwf90VgtmRbLLQYacHAKSe0o2sXhlWpecZgl2
         PHqj4Dr5vAEI9ETwtc3XoAoV9NbPwE64o4eZAa4F450qMYk8htM8BPMuN6n6rX105p0q
         mRYYAPjD5Pi3RpsDPRGi6XPx8bDT2LFJ2BONZ6gsjCkxA9mLOem5ee5MVBc5xddsznfa
         Ipiri+tiz3qNMMjTAC1sh/VhlRWuCU8e1zWuhMI0ODPdh8FH4jfLDReQ1D6JI1w7nDxG
         LUDTP41gWXgfJKmTWhPq12y+KWzxcjo5IoMnFmxo+Vwb3aORb3ez6CTeXEy5AS9ZIPBm
         u1ug==
X-Gm-Message-State: AOJu0Yx+uOLU5F/wjc9O+wqAyEpRsBBLF0Y9KMxki6LMp69Z3muGKl16
	zRfqwtwzjjAYqudAS2+X9eC1UQWIDLE1LBw9JoAG/HlA33UHDOUbxryrug==
X-Google-Smtp-Source: AGHT+IEX+xS7rl7d1w3xMpzG+VUXnTzu/vBNS6ZnE55lodE0xy3m+XoRl8TF++oN3aB3TleOx0TP6Q==
X-Received: by 2002:a5e:8a41:0:b0:7f6:1590:447c with SMTP id ca18e2360f4ac-7f62ee1183cmr1361412139f.1.1720015274844;
        Wed, 03 Jul 2024 07:01:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f949])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb742f1e77sm3407500173.179.2024.07.03.07.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:01:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 5/8] classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
Date: Wed,  3 Jul 2024 07:59:20 -0600
Message-ID: <20240703140059.4096394-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703140059.4096394-1-JPEWhacker@gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
 <20240703140059.4096394-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201486

Adds the variable overrides to set the SPDX image purpose for various
image types

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/image_types.bbclass     | 2 ++
 meta/classes-recipe/image_types_wic.bbclass | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 2f948ecbf88..506b9934cb7 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -146,6 +146,7 @@ IMAGE_CMD:vfat = "oe_mkvfatfs ${EXTRA_IMAGECMD}"
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
 IMAGE_CMD:tar = "${IMAGE_CMD_TAR} --sort=name --format=posix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+SPDX_IMAGE_PURPOSE:tar = "archive"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD:cpio () {
@@ -167,6 +168,7 @@ IMAGE_CMD:cpio () {
 		fi
 	fi
 }
+SPDX_IMAGE_PURPOSE:cpio = "archive"
 
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 UBI_VOLTYPE ?= "dynamic"
diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index cf3be909b30..86f40633ebc 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -91,6 +91,7 @@ IMAGE_CMD:wic () {
 	mv "$build_wic/$(basename "${wks%.wks}")"*.${IMAGER} "$out.wic"
 }
 IMAGE_CMD:wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
+SPDX_IMAGE_PURPOSE:wic = "diskImage"
 do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 
 PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/build-wic"
-- 
2.45.2


