Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5228C55180
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21338.1785666551698748242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C08pA1w2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954afac04bso13805125e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666550; x=1786271350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=clyP23jhGEVuIxpzI20mP/bMfP5/D/zpdkPdJHUHOAE=;
        b=C08pA1w2YnbMSiyak97ghAILuTiC8lnPw4NNNKjuKwnHylxb8B3WDBxVrUeHSFzs67
         a4NqFHbZ2qo8sWWJNcpravEVvGhz4+0GnoPX8szcXzBtu3dys41BgBmDaPnEjXON9gOD
         eOTaQ4kR50USNVVrfAbJTX/EUfUWxoGeL+oNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666550; x=1786271350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=clyP23jhGEVuIxpzI20mP/bMfP5/D/zpdkPdJHUHOAE=;
        b=piPM5yDGEKUxdUxoyF1rZPJPXozSHoxFtgOgXbN5Wlx/mVGPo5kN3hZ9uCI8Gl3lqK
         tumf3rGhIgj5i9YtO09J9CcaxknpX6a6c9/e7qARP8c53YB+2XVaYdoCxlj6MFauD0Zf
         IlEbIMFa/BVF9ICRsLb9GNVwj18hITDNKNX2KJhYjP7mTtyiano/DI/AqcdcPQhLOZjt
         KFyZC4vdXF3KqNfmCPD+AbDNeZcfTOjWtiKqM1ot+WKCMg4XwBIs41zbOcBufP2oVgwa
         9YJx2b25+nEMCdE+rKxg/etLSZsdE5OPhVf+H1KxSFfj37O/wPnEqdrsIdJ/Fp19CIZf
         uKbg==
X-Gm-Message-State: AOJu0YwxsOUzJ6k7bDIUohUhG9mnuw6OQ01a0Us1AHbaKZA2819I8Ndc
	WJyM35i672qDzeyLYsiBiIyHriywdaF43ZAVu6X/MnfVZIgoVEh+KyZVTWUnkkYuX57lYjAFg04
	7s4F5QK8=
X-Gm-Gg: AR+sD13EzMTKrTQuKAreH37ILcS9c6Bi5XHQzYYsUvCXYDjST1CUCTW1sT387Hjj/iM
	6i1MyNDrjuIeFIUFWLwVsEqfloiTV7qloM3zSqjIBHWnlc20Z2I/EVVh5tQhAexAF1NRHhIJFM9
	0IKyWhMpWFzUF/S8koL4oz6dDfLXFlbIkYXaPX4Z1yrxn2Ee3dJQg+3nwo6WFy8R0HGp31qQOaY
	5zhuuUaVOuSDu8n7crOwSw8xFIw0XTQgAZovkrTqgtBnZtPWhPQ8ab1MIjQRJvfuMzMEL/lePVe
	GjbaaKnFE4LbCvz9ZELCxdsD4+I/8Y9M/UeFVF1uPAs8BxQgeCyRGmpwz5yn4a30MZ7uL20/kQy
	v0qKKPFuTn4ypd+nxz+WPzFhxWY4uYZ582Uw1STAsDRuTpEM5tKgaNWmgYiXu5ZZHZitPdX0p3V
	j4SCrpbRtlbeao1VhBS/0aK+RPyXaJxs/vOjfquQqf+ymdVZlFcVm0urDLrEWquyM5Gm2IHT4Rw
	+lzSloTP3cjYv1heg==
X-Received: by 2002:a05:600c:840f:b0:493:c42e:5be0 with SMTP id 5b1f17b1804b1-4980c60705amr111485785e9.0.1785666549950;
        Sun, 02 Aug 2026 03:29:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/25] image_types/kernel-uimage: Swap UBOOT_ARCH for oe.kernel.map_uboot_arch call
Date: Sun,  2 Aug 2026 11:28:40 +0100
Message-ID: <20260802102854.3952760-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242536

We can just call the function directly, no need to use the inherit and
variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/image_types.bbclass   | 4 ++--
 meta/classes-recipe/kernel-uimage.bbclass | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 326602d960b..ca137292257 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -270,7 +270,7 @@ IMAGE_CMD:f2fs () {
 
 EXTRA_IMAGECMD = ""
 
-inherit siteinfo kernel-arch image-artifact-names
+inherit siteinfo image-artifact-names
 
 JFFS2_ENDIANNESS ?= "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
@@ -355,7 +355,7 @@ CONVERSION_CMD:sha256sum = "sha256sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${ty
 CONVERSION_CMD:sha384sum = "sha384sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha384sum"
 CONVERSION_CMD:sha512sum = "sha512sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.sha512sum"
 CONVERSION_CMD:bmap = "bmaptool create ${IMAGE_NAME}.${type} -o ${IMAGE_NAME}.${type}.bmap"
-CONVERSION_CMD:u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.u-boot"
+CONVERSION_CMD:u-boot = "mkimage -A ${@oe.kernel.map_uboot_arch(d)} -O linux -T ramdisk -C none -n ${IMAGE_NAME} -d ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.u-boot"
 CONVERSION_CMD:vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vmdk"
 CONVERSION_CMD:vhdx = "qemu-img convert -O vhdx -o subformat=dynamic ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhdx"
 CONVERSION_CMD:vhd = "qemu-img convert -O vpc -o subformat=fixed ${IMAGE_NAME}.${type} ${IMAGE_NAME}.${type}.vhd"
diff --git a/meta/classes-recipe/kernel-uimage.bbclass b/meta/classes-recipe/kernel-uimage.bbclass
index e353232a0e9..cda1b1a1a5d 100644
--- a/meta/classes-recipe/kernel-uimage.bbclass
+++ b/meta/classes-recipe/kernel-uimage.bbclass
@@ -37,6 +37,6 @@ do_uboot_mkimage() {
 			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
-	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T ${UBOOT_MKIMAGE_KERNEL_TYPE} -C "$linux_comp" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	uboot-mkimage -A ${@oe.kernel.map_uboot_arch(d)} -O linux -T ${UBOOT_MKIMAGE_KERNEL_TYPE} -C "$linux_comp" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
 	rm -f linux.bin
 }

