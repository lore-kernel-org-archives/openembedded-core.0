Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A849EC4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 21:04:24 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.4597.1699995862270197314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 13:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JOMdOUbH;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso85371131fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 13:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699995860; x=1700600660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lm1lj/HbJ+GPGg3O2A6WfmuawmO4eRr6jBLJ1zkFmXo=;
        b=JOMdOUbH/3U2qAiXuasqSoJqr36REYVzAhBZbxu0hLOEDheh6OpnQYFx9sKEAzadQm
         9Vo1GS36gy6JHEXAG8Qcc32lddSGzHxovwmSAYoEfoWUz+4Nawd7NRBx9OLliehexWOG
         6WP7H8GhKfC4DaVNsZoVqsizY8lgdB+49GplK//sytZ1an4EdgUSxbuNiok+watS0DzO
         JexkExX/jCR7xMNoOTZ96yN28HtbOLx5oncfulvOtwAbcmMrQ2jQVkcVNDCjeMuxjEBR
         On2HBC6WYkANcPTX2RWSvvtaelEeQu7olGYtmSWCuHQmNmXJFdVEQArE/RO3Q4HA0uc/
         TnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699995860; x=1700600660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm1lj/HbJ+GPGg3O2A6WfmuawmO4eRr6jBLJ1zkFmXo=;
        b=SNdNC4/Ted88kbn+OOT4irKzjXxExa2KnbCMKj7rJDpo/dAUOXk9jrXCAfctf2xxqC
         ibeLXCLeuNR+ub60XDCYSCjDQtwgCDbzOCIbOSg/+6sJ9LIYQ6la4AtX/6H4/tf9ZsdL
         EWjwE1HPzm7l/DKXYNYgxOZoIqoOiqTyTbW3N1LsHXlUHzkyBPAOuhGTBYwdABZthZ7Q
         IdvhEIKVUznec7YWP9aEw2/5alvjtfI+72p4pC8XEzLbhI+99PQ4nl+te+ptnZ0cb9QL
         FPehm6op6PHD85ZvrQI7qc1A+WSC7/o0MeA58Dycje8PtRMihitMfh/MG11ji6gZxvkZ
         ebyA==
X-Gm-Message-State: AOJu0YyVAyws83t6o5ucpZKFu+ctQQAQx82d94IhA7Zh85h/qNMSoak7
	Zlmx9WeEc28uDC50HB6WZN7WMN8R5mD4hvzWYTE=
X-Google-Smtp-Source: AGHT+IE3u3K3mgInd7vvlEq35D5OFx9edJKJM8OE0K7c+hgxrewoGVOTWffolUC7L+j79J9PeWNuHQ==
X-Received: by 2002:a05:651c:308:b0:2c5:724:fd64 with SMTP id a8-20020a05651c030800b002c50724fd64mr2508832ljp.46.1699995860388;
        Tue, 14 Nov 2023 13:04:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a05651c210800b002c001e57e1asm1437856ljq.73.2023.11.14.13.04.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:04:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] image_types.bbclass: add support for sparse images
Date: Wed, 15 Nov 2023 00:04:18 +0300
Message-Id: <20231114210418.1323819-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114210418.1323819-1-dmitry.baryshkov@linaro.org>
References: <20231114210418.1323819-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 21:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190521

Android-targeted devices support so called sparse image format. This is
the raw filesystem image with dropped zero blocks. This way the image
takes less space and the bootloaders and/or filesystem manipulation
tools can flash it quicker (as they do not have to write useless
sequences of zeroes).

Add new image conversion type called 'sparse'to be able to generate
filesystem images in the sparse format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/classes-recipe/image_types.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index d615b41ed1ed..d0c9514b36a3 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -328,7 +328,7 @@ IMAGE_TYPES:append:x86-64 = " hddimg iso"
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?= ""
 
-CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync sparse ${COMPRESSIONTYPES}"
 CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.gz"
 CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}.${type}"
@@ -355,6 +355,7 @@ CONVERSION_CMD:qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}.${type} ${IMAGE_
 CONVERSION_CMD:base64 = "base64 ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.base64"
 CONVERSION_CMD:zsync = "zsyncmake_curl ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:gzsync = "zsyncmake_curl -z ${IMAGE_NAME}.${type}"
+CONVERSION_CMD:sparse = "img2simg -c ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.sparse"
 CONVERSION_DEPENDS_lzma = "xz-native"
 CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
@@ -375,6 +376,7 @@ CONVERSION_DEPENDS_vhdx = "qemu-system-native"
 CONVERSION_DEPENDS_vhd = "qemu-system-native"
 CONVERSION_DEPENDS_zsync = "zsync-curl-native"
 CONVERSION_DEPENDS_gzsync = "zsync-curl-native"
+CONVERSION_DEPENDS_sparse = "rust-android-sparse-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
-- 
2.39.2


