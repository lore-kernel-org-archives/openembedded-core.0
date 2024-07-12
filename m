Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC15AC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:22 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.11472.1720800198477815924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KhCwMLNF;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-25e076f79d5so995253fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800197; x=1721404997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtgEKVQ7DIhST8KVqQTuZZAMLu1C/Eep2QYIJd2wEjE=;
        b=KhCwMLNFNhI0m15T5gg6c/sL9niYFPog5eMEev4+wwPTWmP7XzaE0KRtbaHGU7x47y
         hEc8Y1hLlYIi6qcQN0XUdtRhuKMtQq9AR1Ea+WJtgRWA/lpipIFMh76r24WK45oTDD0r
         QOEP4B3QG6BaZB66G0cRWUWSFzzbU2Dm8xSWuU2FdM9KXFjJeyMuxacP215PVU3kVxHi
         wym5WCpwR2/q3fSIsAYE4vCp0+ALKxZd+9mOetFknhihvm4IEHHwtZY6jmWXIRhAHBVg
         TiZYQ7th2j50tfDQ9hSkPuP/c7F2H+2eN/3mYyTwZa+G+L5kxeDoATExjxwnNzImLRLD
         uuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800197; x=1721404997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtgEKVQ7DIhST8KVqQTuZZAMLu1C/Eep2QYIJd2wEjE=;
        b=tNvCTMSh1zAV9oyBmghpfWOoVAMr2DshJSzScWORRuWkxPQbQQvwn0xsYOkxIEnBq5
         8Lr56tbQTlb49IIEIMLVeQQaGBSoAQbghGl0HDbIrEFRKLvtBBNE9vWRCFtxPDa9A+5b
         SsyHaAr1dKyAO3cWnh4UJ6ZiViqUo3ppzeoQlQUS+kkFP796g9sbWPyy8zYjGAJ4rApI
         Cj+H1aXv2amAVOPxQQtJhuhcU89KPuwSypmrAPfnMd8zOC5nHZXXU1AmVvxdTRl+uP10
         8VodfqeUr2Kz84B0lfrTYL8+q2GItrGxO1IoXdEMeGpTk76pl239T4XBMXGIzIvZ0Ma5
         h1uA==
X-Gm-Message-State: AOJu0YxhkLneBdyj87aMONq3/D7Gpgl9TwE6jsEnu2GW8b9evHiI3kYt
	XwoQJclNDZKCqI8ChJufBs2jpUE2FeCmmvTNw73GPQTmmeRwoIx1/0uSmg==
X-Google-Smtp-Source: AGHT+IFsQxLQxBB1u2cdHtQ7SWWq5A9uffCsLsj1KgPOouUITCGxgpkMu4otHRpy9wiSRTtfLviBUQ==
X-Received: by 2002:a05:6871:408e:b0:25e:1976:37b6 with SMTP id 586e51a60fabf-25eaebdb53emr11336728fac.39.1720800197059;
        Fri, 12 Jul 2024 09:03:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:15 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 05/12] classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
Date: Fri, 12 Jul 2024 09:58:15 -0600
Message-ID: <20240712160304.3514496-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201839

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


