Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43044C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:20 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.150924.1719257531728803605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CizWfNKw;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d2472450d6so2526970b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257530; x=1719862330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkIj/59bBgYozCRbe6sZSv/+g6HBe+dwgZzezogszJc=;
        b=CizWfNKwKQZkRofws85pPD/fUd3MdTbumuU25bdQAgEUBEVjGZo08INu6iCcYL6f3z
         QQlWpicWiG2uehuhDkc7NIq9164s+TtJZgHf5V0HZbplPuT6or3fDUgzMz0enVekB7GK
         GqX7fAORjQHnLO83mvFVXB/RFSof0mGOlOilcRkzEJhcS0yO8ddE11c7Yl6FEXHLREcQ
         FcW8WCwS2ULjONOC0A+lbScFfIHo/5kueobNmZ3/XlbAkj12CGp+cPF+dwymcA45Vv1F
         g4+ewSoqXERzm7ReIPgyhtLH+5DSl6Ab7OpcOKJlMEV0pPLb1uyzzDsK5IG/tUObkpxS
         njyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257530; x=1719862330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkIj/59bBgYozCRbe6sZSv/+g6HBe+dwgZzezogszJc=;
        b=okeQV6aJ1J7x260SqMbnQTkre7vt9HdJNrtjSZZGOKEHQfUjk6XfzSPFEbZuQQjrK8
         yJ8q4aE3SF8wXKpkz0/3Stp6pnI4+02DDZy/Ot6Tv2siU6Ppdvt6fy+tQuohVNGydMoz
         HecwhjcE656Cjnd5DkYUEbtDZv0vtXGcCqkZVsKkQ0u2s8pelHG/PRedKp5VNKFOnHVu
         p6752uH/xa8B1X3vKNPoUYfx8cEYv+8rab75IPaWI8Flh34ImB1Ml5qX7Ii+Zt5f7MXK
         xzY30Ab7LVIZlVSWpMs/HuKcjnfjMWb50KxD0656SHmOQ2sYLxAoT1ffb/q81wFNvdpC
         +BYg==
X-Gm-Message-State: AOJu0YziPWvU9aAfDUbD94caBNWMxNSo9lMbbqHMaYmHJXWaBYVozxQX
	M2BxsZsNx9ss8j3zKMp/FZ1P4IdUtqLgLao8N/jLJ/XH95lJpSOZecfRTQ==
X-Google-Smtp-Source: AGHT+IG9eWOMU8s/vwaEfA+J7tUg1PsxLW1EDNtU8WCyxf8qmJmkWbDRoSxtBLWNuM38Cp0r4ZzRPw==
X-Received: by 2002:a05:6808:2389:b0:3d2:1c4d:f0b9 with SMTP id 5614622812f47-3d545a7ed0cmr6043846b6e.53.1719257529636;
        Mon, 24 Jun 2024 12:32:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:32:07 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 06/10] classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
Date: Mon, 24 Jun 2024 13:10:56 -0600
Message-ID: <20240624193151.1645802-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201108

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


