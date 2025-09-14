Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290E3CA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 15:40:30 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.11772.1757864427163554228
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 08:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AcOKtrHT;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b52196e8464so2091321a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757864426; x=1758469226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMwkzpHu4Mvyf1YoqsZdmdEf8KId/MsnWzGNj7lmpu4=;
        b=AcOKtrHTM4uai/xwWQ6X5JyHmGM390ogdZ6l01wONfJ7vuktE5bArZfuL+vh4wQj1Z
         occVVvOOCIrV0e1wb3VmM1B/yFsMxjTBVK52Hoa8Nl+ic32duYSNSoAwkBy2d9b/ceEJ
         3E5Y0YzlcU8SOTkEaZAjPsYHadLeWeiXf3byZXu+B6wbIGdkw/LKSFvVTthLBaW2ooZi
         rryypMCq+wFJz96mGHS70aGuwFzPAgX7/kmUPR7NqeCywPr2LsE4tSeCYK65Q1HCdUhx
         7SGlXf54e5mOLs/dyScUSf4fejnnxaPxhHlCDoUl1Sb1iph3rnM5PQgvkrnpZBCeWOOh
         y5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757864426; x=1758469226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMwkzpHu4Mvyf1YoqsZdmdEf8KId/MsnWzGNj7lmpu4=;
        b=sN8jDF64z00OOhraqm3SpkI5u3BJNRNhLy9eNMoz6xp02RlVnrJ5ekjXFW+n8DzYT0
         uH6Lko7tfQkNkl4rB/nvdpnCMqlvvj32pfBEP5JUVYh+q58esqYbr/mv0jXIshD9fT+k
         ZP8b8xe4MzF8/QW3zGzfc8Y6iNp2Czt5JuTOqGUNK+mE+YQJaPIAYrs6LwdsEcNVNAMK
         bc50dcfuugWd2r5D160RePaxzO2TNV9otdhtvzt3OVL0X6UmuLOUaV/XAZt1BsxIgz9m
         BwkW3WZszmgdFzFuJhYfZfOMlubldXTR2mhdrkjTsao/gUKk5XiPhX/hHOfeVtBNLxmy
         wNMw==
X-Gm-Message-State: AOJu0YytjG+JTVx4W7B325P6zVqK/mE1ikrq9Dmi/+7O4m1Ay8nc8vTv
	Rs3FGF5t4rv/QhD8Ok1jmQU/99aY3bO4ZIuZHMzRWTJdfd0qFYd/5b521MRp+g==
X-Gm-Gg: ASbGncuW2Nkwy7x06KJilvx2f/cx8tQzw4xJOG26W1rBIURnjbNwnU1lsqUwXaJBC3P
	j/R4Tg4e8zagN82uGIykV1e5bzL/WJGbIwuiCO8WvTC8a+fD3xM7EvyIK2HEuNorX+/gkAYHr0O
	x2JeW5biQrn4czBViYhiEPXFcB4awMMPfbh1v/AA6RMtIarTx518/TPzWA2NOQ0OfWEYT7VXz9N
	QTXKKrg//CFMpss5LNcOTfgV5KnimGNIGlPAk24LLSRC9maj2Epard2CIFW/nn86lDdWdScC2vK
	RZUhNDFT9m6CahQlxtig7dDznbODyGcfe3wF6ayxAS8nnn493YcgvFE3MnY8Utojk3xMfbPg9r5
	z
X-Google-Smtp-Source: AGHT+IHmR5ugUvQs7Ahhk1KpqIVVwO8O/pMu95hPDEydJpHFSAuUEXMfB9BnWsqxcQ4QTeAzMfQQpA==
X-Received: by 2002:a17:902:ebc1:b0:240:9dd8:219b with SMTP id d9443c01a7336-25d2703a588mr129485995ad.49.1757864426399;
        Sun, 14 Sep 2025 08:40:26 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:6012:935:7d1b:6dcb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ae2dd2csm103015765ad.121.2025.09.14.08.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 08:40:26 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [PATCH] meta-oe: image: optionally remove RAW image after sparse image creation
Date: Sun, 14 Sep 2025 21:10:09 +0530
Message-ID: <20250914154009.22042-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 15:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223360

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

When creating sparse images, the RAW image is no longer needed in
some workflows such as Android and CI pipelines. These RAW images
can be multi-GB artifacts and consume significant disk space.

This change introduces a configuration option
`DELETE_RAWIMAGE_AFTER_SPARSE_CMD` which, when set to "1",
removes the RAW image after sparse image generation.

This reduces disk usage in builds where sparse images are the
final deliverables and RAW images are not required.

Default behavior is unchanged: RAW images are kept unless the
variable is explicitly enabled:

    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "1"   # Delete RAW image
    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "0"   # Default behavior

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index d6ea68968e..5416c2a019 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -9,9 +9,15 @@ SPARSE_BLOCK_SIZE ??= "4096"
 
 CONVERSIONTYPES += "sparse"
 
+DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
+
 CONVERSION_CMD:sparse = " \
     truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${type}"; \
     img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${SPARSE_BLOCK_SIZE}; \
+    if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
+        rm -f ${IMAGE_NAME}.${type};\
+        bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
+    fi;\
  "
 
 CONVERSION_DEPENDS_sparse = "android-tools-native"
-- 
2.43.0


