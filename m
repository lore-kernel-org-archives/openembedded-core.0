Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82C8C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 15:38:45 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.11372.1676129917474903403
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 07:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BTyBlt7S;
 spf=pass (domain: linaro.org, ip: 209.85.218.54, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-ej1-f54.google.com with SMTP id lu11so22527423ejb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 07:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKh/WJUZ/a7LbcLCfqzrp1snhXBTaab70JqzWclptYU=;
        b=BTyBlt7S6AgVGZ9qMXG5vekYMbXXJ/MxqsYGWg3p+r4i45CKZT9jdUDHrTF/6BWnHV
         CYJUEvPzHUFe3lzLEWTt4FJgvf4U/xg8lEQO98flLhGakGQ5Xg01kV3FWwY9GzsMS0Bt
         Mw8BsC1cZUHFLWi+FertzGrJNrA7q+r5ST2FSep+tPpWdFPfZSmlU+E8is7FNpe5st9C
         2eIJTYeTHeir2nSmA0H61kkjSQEdl7cuLCPGsw2NsS/4gu0QOveQG8gWqOud/edMaPcM
         juS50AYZqlB1FEigeQhRLPYSPlw7Xpjdqz9QktMNfhizEf+vvqYBCuzC8Abzq3X4h9hV
         SPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKh/WJUZ/a7LbcLCfqzrp1snhXBTaab70JqzWclptYU=;
        b=BSSXpltPHwTxHYTHDYiHAw59KGUhLg1lnDL43NbjFKynxq8JNq00aax/hO8omGswR4
         67m3/MYrL9cnCMqnXgMLRXJxnb2XbaALJBdJRRL3BqQ9WD6oed+aBxfjCUo7SPE6kQHP
         PjZe4ZZb2T4LMoROt+N5ePfQAS54bcAsIeSVNO6Aw3XCIYWT2yBaIYaOgCu4MErQoy+H
         fjgxHZ6ABCvjRdMA+tQn26nyjK2qBBchSQx6zG9qAq2Sf16bh17uLkPIJAdT+ggYM4+B
         7+UZ0HgPN6mSVK6BzJFrnbzJ0fimSL+SdQFMMXngfeD/ebjBBQ4Pyoz1e6XSwwNh02jf
         tFrw==
X-Gm-Message-State: AO0yUKVxwIwo9tYCH/EfFb17l8dj6lAXnzfx+LI8MsMX7u2GLckEfBCv
	YErtc73FxVTOe8B9lHFsNEIEOmv8QFFr7Z1o
X-Google-Smtp-Source: AK7set9evLzFcrw2rxB8O8zARpS4QXEMVySA2hcbua8xjaNc0EWOTiVbkkYEJbtU3iLq24HMJPBALw==
X-Received: by 2002:a17:907:6d03:b0:8af:22b4:9952 with SMTP id sa3-20020a1709076d0300b008af22b49952mr13760898ejc.38.1676129915776;
        Sat, 11 Feb 2023 07:38:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id og15-20020a1709071dcf00b007aea1dc1840sm3985303ejc.111.2023.02.11.07.38.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:38:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] image_types.bbclass: add support for sparse images
Date: Sat, 11 Feb 2023 18:38:28 +0300
Message-Id: <20230211153828.2113018-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230211153828.2113018-1-dmitry.baryshkov@linaro.org>
References: <20230211153828.2113018-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 15:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177008

Add Support for sparse conversion to be able to generate sparse images.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/classes-recipe/image_types.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index ae00728a74da..cf8cc27e87e7 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -308,7 +308,7 @@ IMAGE_TYPES:append:x86-64 = " hddimg iso"
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?= ""
 
-CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync sparse ${COMPRESSIONTYPES}"
 CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -335,6 +335,7 @@ CONVERSION_CMD:qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE_NAME_SUFF
 CONVERSION_CMD:base64 = "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
 CONVERSION_CMD:zsync = "zsyncmake_curl ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD:gzsync = "zsyncmake_curl -z ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD:sparse = "img2simg -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse"
 CONVERSION_DEPENDS_lzma = "xz-native"
 CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
@@ -355,6 +356,7 @@ CONVERSION_DEPENDS_vhdx = "qemu-system-native"
 CONVERSION_DEPENDS_vhd = "qemu-system-native"
 CONVERSION_DEPENDS_zsync = "zsync-curl-native"
 CONVERSION_DEPENDS_gzsync = "zsync-curl-native"
+CONVERSION_DEPENDS_sparse = "rust-android-sparse-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
-- 
2.30.2


