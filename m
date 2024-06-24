Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C95C41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:23:02 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.143621.1719242580015361194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5jKJKC0;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5bb041514c1so2362339eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242579; x=1719847379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkIj/59bBgYozCRbe6sZSv/+g6HBe+dwgZzezogszJc=;
        b=d5jKJKC0jBSo9vKZvtSvAzTkzvNYkHghoewZoht+NZ7rj4PtMqTJ4m6MmRaXCg+hBc
         46hRP/F/pzE3J13623iMB/YfadVJeCO5dSP9a70lBJUyhfCeWbwUKiaHZnpPD8beVwop
         HuWwJDyRmoiZI0OhZoySrwQcia7RRlRXOxFAHdhKALtAY2pe9eIjRE597syA1ZMejna0
         YdScJk+xCUZMvaIdk6Og0ymlEMOju78A/ZqjG8htj1q2ZtyANSjJyFVylN1NQ88VO4/A
         hUNwNayccfkc4dURgzbreebzamLJTamvPOrD7EPgsyF7B4WOloWFfyi777cm3qYZRjuL
         EWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242579; x=1719847379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkIj/59bBgYozCRbe6sZSv/+g6HBe+dwgZzezogszJc=;
        b=dqnqik3QwU1RwP/JdIhByc262s0murDqpZILRU2nCCooEdzdMQA6452NTDPkbRsCX8
         RjI2zCICc4YhErlFE+HNQI9pUDZDqcw8U1XhBcut8pwaeGvg+5PxVaKetbiZGgiT3Qr1
         TRtN4s0BFJT8bgYOgRB33Vvmgu+kDYtIH0uh5GCkD4Cqlh+WG2PkAqgOatYJhqi4oSK7
         ja+g/k1kYYiW2vwxn+ZhLhm6zLZTQUwe6bfOkCp3ePdn1afIFs19EU50FFY2G4mNxfo+
         /oK0CfXjO4ogDuyCu4oMU//rkY3CTeyMzKeAmqwOCjQVSI9h2fnGRxqW5R6pdadouGuj
         XA4A==
X-Gm-Message-State: AOJu0Yz7I3wNghKEYkpPB96mpxcjzjMoBpoNF/iXf6u7/I37MQQ59VZt
	pfmuSyO79j5zVH38P7AXd1nvcwTwmwG3zDdyRzi2CkO/sSLROrn1zcJ8fw==
X-Google-Smtp-Source: AGHT+IEK3THJeh/EQQkTiyb0ZYQjDUF8T2LvVui2bB30LpgX+IWa8z9bvr3aYXZKKrK9f7Nxkl7xaQ==
X-Received: by 2002:a05:6871:b0a:b0:250:7510:894f with SMTP id 586e51a60fabf-25d06c511a5mr5297142fac.30.1719242578643;
        Mon, 24 Jun 2024 08:22:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:22:57 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 06/10] classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
Date: Mon, 24 Jun 2024 09:20:35 -0600
Message-ID: <20240624152236.1019980-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624152236.1019980-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624152236.1019980-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201096

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


