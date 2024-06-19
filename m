Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC26C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 22:18:26 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.34252.1718835502468103537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 15:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6ntwJ4b;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c9b94951cfso122398b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835500; x=1719440300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkIj/59bBgYozCRbe6sZSv/+g6HBe+dwgZzezogszJc=;
        b=Z6ntwJ4baABnPsu+npBvmwY8J/PtAxHVDUY4PFOxj6xOoE/W702omSofd7cD2H8Tsx
         ysKJFkh/W9AZmlytdjjGXeI8FunNoPgFzLc4z4ALX8daQ/CbHwLRdkXUXJ7OB8x2S/PD
         esrdh2SnvKlxytTRoKb7SDekIpprS5Sbo1iJuW6Evh0D+LolabT3gxauoWMRetDVz5Zi
         NZZZynUaFsb1szap/DLYlk5qHAror8yRHGIfn7Aw0hGyfVHiccTABMK+WqojjRi9loRZ
         ewztziYq3ceXy/TiKSorWLfohTiJEKqSnTIRPSu/eVkWKhEF2Mx1+w4gwocr6ukAoOV/
         SbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835500; x=1719440300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkIj/59bBgYozCRbe6sZSv/+g6HBe+dwgZzezogszJc=;
        b=HTmoJfITqLvdKvswtrEvX2hk0nW7Xa3IZlvOwrF2k8hUNFQ0MiUmQT90nyn2SN+NXV
         idOknYYrFBBB/0iRWUz/2xm6F1V4pu39usaCigCWbYC8ofRJ3EBmVDABNjQeM4fVc+0M
         35zVRC8xZOVfWbjACZFGZVk2amljXp8iAzi83Z3BeA7ZeWmwK2dBwASKhC1Yu7ZHoHvq
         rwKfF6LgdrXSUUBvzGyI+JBdebgfF3j42fDmlFEANMIBrIPi2NyfGsju1ZumWOAsGibE
         /9mY/oFt0GIKg9NbC2n9G1zio/aQqQKm1Q/TjCJ/hVokYRZmFclGIFy4OMni2UBmaxek
         +nWA==
X-Gm-Message-State: AOJu0Yzw6XlrY0Owmo6F/itTQcgGVY+moQeWBoBlL6DEVVFx19naFJxA
	MESUOgHw+VGPRepuslCWTALf3/TVQR6xzgBKce7ofXrJincVGDPHnOvGsA==
X-Google-Smtp-Source: AGHT+IGHxclLtZSCKEgVj0tCMSN2tnIlTXpz2OX4DXNgbO7NbFRB+fCeqPEtYbQVaUWDy2fKpwt5xg==
X-Received: by 2002:a05:6808:219a:b0:3d2:2bb6:af4c with SMTP id 5614622812f47-3d51b9e31b4mr4319221b6e.34.1718835500037;
        Wed, 19 Jun 2024 15:18:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4189])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2475e5359sm2321190b6e.3.2024.06.19.15.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 15:18:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 3/7] classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
Date: Wed, 19 Jun 2024 16:13:25 -0600
Message-ID: <20240619221805.3038528-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 22:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200932

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
2.43.2


