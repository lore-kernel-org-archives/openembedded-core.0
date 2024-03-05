Return-Path: <haokexin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA77C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 06:34:42 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.16148.1709620480096114446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 22:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMDZqxa2;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: haokexin@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c1a1e1e539so244618b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 22:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709620478; x=1710225278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cwNISvKpdGaH1NDCgVuC+Q3ZDiTbE7vWWZnS0VnLw8E=;
        b=WMDZqxa25dXs2wGDgYoGBGUxlM9vqmsz9lJaiMNSYkXrHIVXlob+01YGpHoKbIpw3/
         g0rE6b/gnm9O5ND3vLmOrumvjyZRdHWS9/GhRwp54PFnDwknn1aipwj6xy+TifrGjcjz
         JfQcGbzIgtyOfK2sgb1K9hcU5ts3gXfUZp1KtbWqABTCvxr3ReaTl7AVod5Jk341sxmG
         CExlhl4DXLBiVcTNxsRvTWkYNpbuySKktPwBCmxz207lKB+AokHPhToX+lOMMsj24m7k
         PGdwrcyQgsNVBZaL4yaGOqmGGfhf601vmq5QeCD8vQ0TVeSZmecugSfvmvYrD3J/zMED
         Gb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709620478; x=1710225278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwNISvKpdGaH1NDCgVuC+Q3ZDiTbE7vWWZnS0VnLw8E=;
        b=Z2GPfhWbV1n00/g0OIn0vbO4yzxRUTb0oVxaxwc7gQtHnDWqslnX1tiB0k+oRm5JL3
         rBleE5OuG31W17CqBwk1wORSpRo0Lt4+0vDprCFrHbF6w+Xo+iu000kD5mgau3UalamA
         3POPR3k8QVOh8/BVNrPQb9SfTqjq10UW/2PSUKvC6Qne9B9amE6UK32i0BfW7CTVHLrI
         E2tVmpEha13Qyp444pGQxMyUwCTwOVgeqabHV1pURf32Qvw9FCpklxTitZ7xfqOQ19Oq
         PTWRamwHhU1dVXPuPq2pOiVweIGrbCzkEiMFty0+vVEi9htCRtj8CSGo/ZP/+CBqHI3m
         94lg==
X-Gm-Message-State: AOJu0Yx6Uu+V/sCs561ewS8qj6QUggDiBQNXTK21KH4KBpwSwcEmLLqG
	LWfI2UpT28cX9bNd1LkyLUW+5PCilar4g/E/LtQVnE+wQJ3yYf7FaoW5P+gSbKk=
X-Google-Smtp-Source: AGHT+IH2w5jsYpcScfdIi8KkTKuHZmDdzf7QlnJ976U7gJ/ysieguNg+hdXqXhSXiyuOmYbiXwt+oA==
X-Received: by 2002:a54:4484:0:b0:3c1:f1a8:1557 with SMTP id v4-20020a544484000000b003c1f1a81557mr849644oiv.43.1709620478187;
        Mon, 04 Mar 2024 22:34:38 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id c11-20020aa781cb000000b006e4362d0d8csm8297709pfn.36.2024.03.04.22.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 22:34:37 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] image-live.bbclass: Adjust the default value for INITRD_LIVE
Date: Tue,  5 Mar 2024 14:34:25 +0800
Message-ID: <20240305063425.844730-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 06:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196622

From: Kevin Hao <kexin.hao@windriver.com>

The ${INITRAMFS_FSTYPES} may contains multi filesystem types,
such as "cpio.gz cpio.xz". So it can't be used directly in setting
of the default INITRD_LIVE. We choose the first filesystem type
in ${INITRAMFS_FSTYPES} for the default INITRD_LIVE.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
v2: Drop the adding of ${IMAGE_NAME_SUFFIX}.

 meta/classes-recipe/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
index da919d52f983..d2e95ef51c3a 100644
--- a/meta/classes-recipe/image-live.bbclass
+++ b/meta/classes-recipe/image-live.bbclass
@@ -38,7 +38,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 LABELS_LIVE ?= "boot install"
 ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
-INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}${IMAGE_MACHINE_SUFFIX}.${INITRAMFS_FSTYPES}"
+INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}${IMAGE_MACHINE_SUFFIX}.${@d.getVar('INITRAMFS_FSTYPES').split()[0]}"
 
 LIVE_ROOTFS_TYPE ?= "ext4"
 ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
-- 
2.43.2


