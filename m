Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF936C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 16:40:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.54881.1683218412240088914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 09:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LFMbh00c;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f19afc4fd8so5458615e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683218410; x=1685810410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FAWFjJkVs66MO7HxfX6NKXMl1DuPlJDgYj8Lhnq8dB8=;
        b=LFMbh00chzMpxHtq4hsiQwJDDDiCHalCz71IeHzUrVMbxsG2JPKNVF4HnXkh66rxMM
         eyLXlZrxc6zuAdI3EQHb52k9kDWoMnrINHQeRuLm2ilGLHyRFpmH1Zofx0NCT9sGr8gQ
         5shNflMrm4PnEQvatXw+t4r87vCLxfhzR6L9Qnu1pxIFhMRKuKFDDIqG5qsN5oDki/KS
         kpZ98OnZ5Q7fx0VuQUVOLkIC6LELAweRUjwTHUA4FzwvV7NxhDy6mZWeoA9CRmJ7z3ap
         KWc0HaHu9BrEkeTAGnD3278GwegsAi1JDyns7nKbrde1KaP9tQot+02a7NpPufThLxRf
         YDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683218410; x=1685810410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAWFjJkVs66MO7HxfX6NKXMl1DuPlJDgYj8Lhnq8dB8=;
        b=BBA0fNiR8GNLMy3DNDxTp0FktXR40G7n7ysvD9H+8KffR+9juF/YqKb4ysMLwNSVO0
         jNkzxwcmm6WxyLlJ5ZZHr7zkwwyvb7H0//I4MBkJKj6Ek/F3NTLEFHBggEnvtXEtMtWQ
         WyX+xF1rqAE4A9xUIgt2n8dmtnCY39Ro8r4sHN7Mapt5q61ZHalWC4QjDEiSn5YA582p
         heTiDtNo6bXLdL6MVUxI+G/oldZjd+/KGzvh0Tb6CfesSCtv02x2ADpQPymmXM00KVg/
         jZhfebZZdqRbaEszjWHvnKU/TlT5LO9OgyajXW2yoVrfMzS29dVoPfJSU3IMIQ5b8/ER
         KtLg==
X-Gm-Message-State: AC+VfDxZU/6NwPslPmDmV/fJiVxEJXKMUjJcEVVHjFSsey9ArcpHfMLS
	z1ALYmgebl2reikts+Gjy6hoT3tntSk=
X-Google-Smtp-Source: ACHHUZ7Ah6IDboV6Qj9h5W5prT4kPFeKT7595nAOnp4XrQ5xAUMTuNvZxcLQQ936RWmsIKslXYc7uw==
X-Received: by 2002:a05:600c:231a:b0:3f3:481a:902e with SMTP id 26-20020a05600c231a00b003f3481a902emr236529wmo.15.1683218410354;
        Thu, 04 May 2023 09:40:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c0b5600b003f40049a65bsm4191402wmr.21.2023.05.04.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 09:40:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] image_types_wic.bbclass: avoid dependency on unavailable virtual/lib32-arm-distromllib32-linux-gnueabi-binutils
Date: Thu,  4 May 2023 18:40:02 +0200
Message-Id: <20230504164002.3468716-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 16:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180884

* MLPREFIX was dropped from other cases in:
  https://git.openembedded.org/openembedded-core/commit/?id=6856fc5c848cc2564bebe03a007ef109f46d0adb

* and this one was causing:
  ERROR: Nothing PROVIDES 'virtual/lib32-arm-distromllib32-linux-gnueabi-binutils' (but virtual:multilib:lib32:oe-core/meta/recipes-core/images/core-image-minimal.bb DEPENDS on or otherwise requires it). Close matches:
    virtual/arm-distromllib32-linux-gnueabi-binutils
    virtual/lib32-arm-distromllib32-linux-gnueabi-compilerlibs
    virtual/lib32-arm-distromllib32-linux-gnueabi-go-runtime
  ERROR: Required build target 'lib32-core-image-minimal' has no buildable providers.
  Missing or unbuildable dependency chain was: ['lib32-core-image-minimal', 'virtual/lib32-arm-distromllib32-linux-gnueabi-binutils']

  in cases where multilib and WIC were enabled at the same time

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index 528a91bf5e..669606da75 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -91,7 +91,7 @@ do_image_wic[deptask] += "do_image_complete"
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
-WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
+WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
-- 
2.40.1


