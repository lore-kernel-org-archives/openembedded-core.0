Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE315C27C4F
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 21:45:23 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.32292.1718055914182999704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 14:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jJhT9sFV;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6f9ca219760so639331a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 14:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718055913; x=1718660713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkIj/59bBgYozCRbe6sZSv/+g6HBe+dwgZzezogszJc=;
        b=jJhT9sFVSlighv+6rKFUFEq846Z5k8GpoarqE+GMHxgrLE+tlPWTRjupehX5MPiGNU
         Or/mc3LmzY3RZlVHfzj8Kl326Um7CM35MsZvXuu1j5gH15ka8lEu+v8KJM+2PNCMFy5c
         rZQrxfrYFeGemH+qPYpMdeKkfKmwFQGlz+DCJG1LAqsPFb4wqG+hx1eN17sK+cz03VzE
         qyfmDgzossLDNeVnWuXWSYkBD0yj/01SfPFc/qpxcS16D8zIi1gSQRrJk1vS+y1RDtt7
         58LRKfVVFVsBPmvbsZVSRpn0bZI1Y5u4S9lPeg3PYl671nqnnMKbHCRXq6+LkfTIYtJP
         2Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718055913; x=1718660713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkIj/59bBgYozCRbe6sZSv/+g6HBe+dwgZzezogszJc=;
        b=KF0KfjGd9zvo7EV7tdZuDLORWnPgWePJ49jTCjS1IL4XVoqHT1ComKrAcFn5WRo5hx
         vr81DKxoJt0gcu4H0Flqnv6WuEQGdLvexqe+NsT5aEFQYjLqicq51u4wGix8VRE0xU+M
         q6ray23cI5LSf8X8ijbgEVNp7b39OvjjCDiqKDmEfu4ZDQlA6X9fZIvKZUI/I4yMb7Ng
         dC3CLoIexCRlPjJLhM6LDLy2GmZObnwAKcW/PaOCEWO/P7JhYlq5NyAzzYog3+eFfheq
         DkYrF7pAXhigjiDbvA6iqfGDvWKNF5LUGbCzDSEeMXF5hnnVZMZJHG6/m+O3jd3SmSA9
         LtMg==
X-Gm-Message-State: AOJu0Yyh3nrkAQPlAQxumYOZXs100NTiAg08eTq8BDannWWULdrFLnY5
	O0VLvV95jWkdopgqvsbtuivaWYHyNv+7dhpZ2PDU3ccDcepTrxZQ56BTlg==
X-Google-Smtp-Source: AGHT+IEWkp9euo9SInWYSf2jeKfmXI9EtzOXbMbXl34X+ztxHVa4WIEeP3ZWg6bkq5UQhEdlJbAAhw==
X-Received: by 2002:a9d:7d8b:0:b0:6f9:631c:c45c with SMTP id 46e09a7af769-6f9631cc6f1mr8960600a34.3.1718055912644;
        Mon, 10 Jun 2024 14:45:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::2cec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f94dc70d48sm1888631a34.5.2024.06.10.14.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:45:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 6/6] classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
Date: Mon, 10 Jun 2024 15:41:52 -0600
Message-ID: <20240610214456.2757397-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610214456.2757397-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 21:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200490

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


