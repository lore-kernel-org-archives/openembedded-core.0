Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BBEC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 12:39:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.16016.1691671173297401104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 05:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WpHkegSI;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31757edd9edso750783f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691671171; x=1692275971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd7XMRmGs6dZom3IR8eF5oBKBsCXbskDChNtsunYD8U=;
        b=WpHkegSIDSkRBKE+5fiinJt4sxTAQE67Li1Qh1DKjioKkWLnUX77HMh7oi/HB4KRgJ
         IkmgLmpnOZ+jc9FU8zRxeGNjzjXwIpFg1K5TW/Ptvfqy/1pzR3xiZgkAejrZH9YXP7wa
         DrFxbfSKGCystmErprU22YWAO04OyqFY2C1yLp2FD4adX0Sx4ax/R4UOBI/Gg05Cu95m
         HwpgU6cG/CwBPNoO0gk2ZA19XT5LwZy2jtX/FXw8A2X2GicplX4eIE3LXdxzXyhJi1vp
         dHUAb/sFiy6WcP80AXZpYCBXJF0iUnC7aOMe6TqXbwsvWtmzCUhRX67FJZoAvmydwux1
         d8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691671171; x=1692275971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jd7XMRmGs6dZom3IR8eF5oBKBsCXbskDChNtsunYD8U=;
        b=IE9dJJrya+sIvzI09vi2rTxEqqPZ3m+yKvUpOlUW/quXie/d4ElmlFHIP7cwBMBBeF
         XueCcO0VUhT8SKRGIKLrrHGpoemr0/A+A4EuySSdwwRuXv2BFMcoL+7QZLJO8+JG7/z+
         a7Uw/6mf2EuSHCjpRS6f2+vYc0ChTIRvHr1vLhw4rZrsfEJEmm0UYQCk1Pg1ONeUHp8k
         hmSbZ66Y4HJmfhT5aGacdUpm/eiGHvwSFStQAkd6RSMJBbqakz7/iMVH/cXYOo2WzFNw
         X3QdiSmls+iqZnUB32RUfEgLEByNtFpKuyn9upILpP4ihD3A42CCJ9TO4jfPL9LeOGxE
         Hpcw==
X-Gm-Message-State: AOJu0YzSNGM/BZTdViNKmpuJCDWuDFu85Ij011/5EKAAtEfoV5bbmwdc
	DuXpI5s78pdYzEr3MUfCD5Vhx/4aS/I=
X-Google-Smtp-Source: AGHT+IHn1yrN8vgOrehTf5JtBqlTERB76AU9bbmutjHMBXm8aOkuvatlpRecOxyx/jOxNMvEfVwk2A==
X-Received: by 2002:a5d:5384:0:b0:317:5b32:b2c3 with SMTP id d4-20020a5d5384000000b003175b32b2c3mr2058237wrv.6.1691671171083;
        Thu, 10 Aug 2023 05:39:31 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:5b50:7d5d:7b5c:afc6])
        by smtp.gmail.com with ESMTPSA id c8-20020a5d63c8000000b0031773e3cf46sm2111518wrw.61.2023.08.10.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 05:39:30 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [dunfell]] kernel: skip installing fitImage when using Initramfs bundles
Date: Thu, 10 Aug 2023 14:39:21 +0200
Message-Id: <20230810123921.309708-1-frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 12:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185741

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

When including an initramfs bundle inside a FIT image, the fitImage is created
after the install task by do_assemble_fitimage_initramfs.

This happens after the generation of the initramfs bundle
(done by do_bundle_initramfs).

So, at the level of the install task we should not try to install the fitImage.
The fitImage is still not generated yet.

After the generation of the fitImage, the deploy task copies the fitImage from
the build directory to the deploy folder.

Change-Id: I3eaa6bba1412f388f710fa0f389f66631c1c4826
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b67fd9ac74935fa41e960478c54e45422339138)
Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes/kernel.bbclass | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c6310d8de7..5d8b3b062a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -417,12 +417,26 @@ kernel_do_install() {
 	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
+
+	#
+	# When including an initramfs bundle inside a FIT image, the fitImage is created after the install task
+	# by do_assemble_fitimage_initramfs.
+	# This happens after the generation of the initramfs bundle (done by do_bundle_initramfs).
+	# So, at the level of the install task we should not try to install the fitImage. fitImage is still not
+	# generated yet.
+	# After the generation of the fitImage, the deploy task copies the fitImage from the build directory to
+	# the deploy folder.
+	#
+
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
-		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
-			ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
+		if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
+			if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
+				ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
+			fi
 		fi
 	done
+
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-- 
2.34.1


