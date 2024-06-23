Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFA1C27C4F
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 21:33:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.126928.1719178379008675770
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 14:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bqf8Egrr;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42172ed3487so27264355e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 14:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1719178377; x=1719783177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A75lSVHMpqk7dj4Jhh3/QM4C2ZPRjtF++YUGh7onceQ=;
        b=bqf8EgrrIQoc7o7aWBDNZmA4MSnuUBW7BXSyzlcWh+bbrusRXL7395OECOe4FpPy8i
         WS+Ha4meZx1T/HFfMWI1RcN9H1NkkIJnV2E0r0E5HgymVSopTMdkcs9cEL8m/xNzsZTT
         eIEgdInpk57HSLECK5gVmDRyvFRmagKu+BH8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719178377; x=1719783177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A75lSVHMpqk7dj4Jhh3/QM4C2ZPRjtF++YUGh7onceQ=;
        b=iyKZbWBdb9JwjLgMZhSHeUzlhTqe1g6jwSqYlLLZ8MiysIayvIsjx2vlIDGqeCfbnz
         H2SBCbJzDbkMiCSwPraTArjV4u9aWfFj7cZfuv9K+0xpGAbol9rkQGko79BTJl/5pepF
         Ye5m2xcfu0FDMw18sgXLEFfHf9stYIPxXcxmCe6woJ8p/CQW54jkQ8XpkPAaETSQ0ky4
         dbETDVnUDaOHt4MYiaI9X+j+4OP2JpwMLvqs0/90oM0DirGPbDoxI1dU3fgYJdI2OxbE
         hQO0TY75fU433Lvbelh2Dy9aFe8DPUJetr+I+DS0O48VRsLdynV0v8HxpOi5FBLVtecA
         jtbA==
X-Gm-Message-State: AOJu0YyhIosdq6Osb1tDJ9dbMh5tJ+/a7sU6+dnBvG8EwGUwb+f7ADDS
	CiDsCTWCF3uLhGkJTvSf8lACJkhPCiTtFGo5MCNNejByUKJdc5Y+kwn49cCjo+XIowhAGOpzwGF
	U
X-Google-Smtp-Source: AGHT+IGTp8FyFXIgBma00RKy4NZy45fPcpnNBWfZiB3KHBzo+X03QEiuwu+hJUNBApczjnhhWNIyhg==
X-Received: by 2002:a05:600c:434a:b0:421:7f4d:5280 with SMTP id 5b1f17b1804b1-42489e46d51mr25441455e9.21.1719178377112;
        Sun, 23 Jun 2024 14:32:57 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b863fsm8167021f8f.47.2024.06.23.14.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 14:32:56 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] u-boot.inc: WORKDIR -> UNPACKDIR transition
Date: Mon, 24 Jun 2024 00:32:54 +0300
Message-Id: <20240623213254.3215897-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 21:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201061

Replace references of WORKDIR with UNPACKDIR for U-Boot script
and variable UBOOT_ENV_BINARY, for example for boot.scr.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 45d700fbdd..9a91a0e3d8 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -92,7 +92,7 @@ do_compile () {
 
     if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" = "scr" ]
     then
-        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${WORKDIR}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_ENV_BINARY}
+        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${UNPACKDIR}/${UBOOT_ENV_BINARY}
     fi
 }
 
@@ -188,7 +188,7 @@ do_install () {
 
     if [ -n "${UBOOT_ENV}" ]
     then
-        install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
+        install -m 644 ${UNPACKDIR}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
         ln -sf ${UBOOT_ENV_IMAGE} ${D}/boot/${UBOOT_ENV_BINARY}
     fi
 
@@ -324,7 +324,7 @@ do_deploy () {
 
     if [ -n "${UBOOT_ENV}" ]
     then
-        install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
+        install -m 644 ${UNPACKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
         ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
     fi
-- 
2.39.2


