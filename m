Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DA9C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:49:53 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.11455.1740498590868487614
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 07:49:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q2TWB0dW;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso3098321f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740498589; x=1741103389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOaZLJzMUgKmSVbrpoinP5QMG+yvr44dTBxyaMRRldo=;
        b=Q2TWB0dWJb+tqb67BuL9apiFabeCnOjarIgbmxT0McRoPhAdQ+CAkErDeoDxHYXMml
         drpg0RU8o/F84JTRNyZVePhS7N/Sy570/faInFY59LniYW8KiYTtewK3Epb5agxgBsmv
         E17zHAh1u9kVIhAyLeWTD/MYYu6u7LjuyAL3PHtSWrJlJseePwgzPYqjN8baWR+2SuuE
         /kT5ElmtpkJg0Lmt3SoViq3L2RnCQmtpQs5T1St5K4Gx9FVThoi5Vn44SdOwBSry6cJ1
         yU/kswIY1dPW41IxEElTi/QO+nAJlFqT+KD0MZHhSX92YqJeYdkaKzRTfc1XdUiPan86
         k3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740498589; x=1741103389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOaZLJzMUgKmSVbrpoinP5QMG+yvr44dTBxyaMRRldo=;
        b=RN4hfD72ZzY/L3zw5PcdgXEbr4MqAHQumEr6Z/o9Rkot4WKlSPASuK/WA5ydLQthsj
         NK0SFhjTABNYU3+9nS+Bel1wI8ftX+v8cRA7IORMmnbe6fozbi5HvG/mPf5F+7lQozZ3
         nX7ZWb3NLi0LfYN+xxw8Gd8Ia9bZf7jsTRQVO9qzxL0OAd2Cz2zZmRdx6rijwavKh82W
         msb8urV23mMG3LlCiC/RKNwOufDmpX4rfjXwJZc8sifKY1o6MYoWoCHl7vK+UhVMlbrd
         AYzKLgks6LOkSn5hNUJehlEAQggBXGEwiZwYOSg8iYUzrcT8cgSlWhBCU8Q2ZqwovtUy
         3NPA==
X-Gm-Message-State: AOJu0Yz23Xe2e+J//b47iYhWP/SIJWhbQTecQhoYXYlTF9AEN08Cgn/i
	9TXakKlSL5lEXQXG7tYP8DvN5pRr3/sfMKCiIgWjGL9qlLMitl7gkCs/aiCE
X-Gm-Gg: ASbGncvo7i6WCmgutV+BfomuvuRIefUmVwCTDDE3TUIiC9RlhtWMVlwjnZzwjNCq/3D
	1KeVBNr80vh3Bb3Zdw44DicyE4G8CPbswFdd3OmQT5yIN3vLRJZVnYzQnvsRosI+CoGUvmV/DBs
	Q/BrPCoDanEPOuLOOisnUb1ow0Lt0jHCnD+RgfPNsh1v7YSniF5WrVpjevy5e2PUftSlmTp6JPF
	f2afRNBvNT2gwMYg5M29HsacCEFWRuoMSvuk9COIzrRLOCDoawgofL4dnWos27b3wipDfzc1QFs
	iYqnItJ+x5puYdFPh6T1KKVBwCxd2UBGzXs=
X-Google-Smtp-Source: AGHT+IF8N8wGoOPqXesoJbx/sWbiZadCc1e9A9FPPJxpTKyU5lvtcGW+lhVufrh2sTBdOFvG2N/u/A==
X-Received: by 2002:a5d:47c6:0:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-390cc5f6d66mr2984997f8f.11.1740498588850;
        Tue, 25 Feb 2025 07:49:48 -0800 (PST)
Received: from toster.lan ([185.228.162.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd882644sm2664188f8f.42.2025.02.25.07.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 07:49:48 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][scarthgap][PATCH] u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1" behavior
Date: Tue, 25 Feb 2025 15:49:03 +0000
Message-ID: <20250225154902.98249-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 15:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211913

From: Marek Vasut <marex@denx.de>

OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
where the resulting signed fitImage contains both signed
images and signed configurations, possibly using different
keys. This kind of signing of images is redundant, but so is
the behavior of FIT_SIGN_INDIVIDUAL="1" and that is here to
stay.

Adjust the process of public key insertion into u-boot.dtb
such that if FIT_SIGN_INDIVIDUAL==1, the image signing key
is inserted into u-boot.dtb first, and in any case the
configuration signing key is inserted into u-boot.dtb last.

The verification of the keys inserted into u-boot.dtb against
unused.itb is performed only for FIT_SIGN_INDIVIDUAL!=1 due to
mkimage limitation, which does not allow mkimage -f auto-conf
to update the generated unused.itb, and instead rewrites it.

Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0106e5efab99c8016836a2ab71e2327ce58a9a9d)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/uboot-sign.bbclass | 60 ++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 96c47ab016..5c579a9fb0 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -101,27 +101,69 @@ concat_dtb() {
 	binary="$2"
 
 	if [ -e "${UBOOT_DTB_BINARY}" ]; then
-		# Re-sign the kernel in order to add the keys to our dtb
-		UBOOT_MKIMAGE_MODE="auto-conf"
 		# Signing individual images is not recommended as that
 		# makes fitImage susceptible to mix-and-match attack.
+		#
+		# OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
+		# where the resulting signed fitImage contains both signed
+		# images and signed configurations. This is redundant. In
+		# order to prevent mix-and-match attack, it is sufficient
+		# to sign configurations. The FIT_SIGN_INDIVIDUAL = "1"
+		# support is kept to avoid breakage of existing layers, but
+		# it is highly recommended to avoid FIT_SIGN_INDIVIDUAL = "1",
+		# i.e. set FIT_SIGN_INDIVIDUAL = "0" .
 		if [ "${FIT_SIGN_INDIVIDUAL}" = "1" ] ; then
-			UBOOT_MKIMAGE_MODE="auto"
+			# Sign dummy image images in order to
+			# add the image signing keys to our dtb
+			${UBOOT_MKIMAGE_SIGN} \
+				${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+				-f auto \
+				-k "${UBOOT_SIGN_KEYDIR}" \
+				-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
+				-g "${UBOOT_SIGN_IMG_KEYNAME}" \
+				-K "${UBOOT_DTB_BINARY}" \
+				-d /dev/null \
+				-r ${B}/unused.itb \
+				${UBOOT_MKIMAGE_SIGN_ARGS}
 		fi
+
+		# Sign dummy image configurations in order to
+		# add the configuration signing keys to our dtb
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
-			-f $UBOOT_MKIMAGE_MODE \
+			-f auto-conf \
 			-k "${UBOOT_SIGN_KEYDIR}" \
 			-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
-			-g "${UBOOT_SIGN_IMG_KEYNAME}" \
+			-g "${UBOOT_SIGN_KEYNAME}" \
 			-K "${UBOOT_DTB_BINARY}" \
 			-d /dev/null \
 			-r ${B}/unused.itb \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
-		# Verify the kernel image and u-boot dtb
-		${UBOOT_FIT_CHECK_SIGN} \
-			-k "${UBOOT_DTB_BINARY}" \
-			-f ${B}/unused.itb
+
+		# Verify the dummy fitImage signature against u-boot.dtb
+		# augmented using public key material.
+		#
+		# This only works for FIT_SIGN_INDIVIDUAL = "0", because
+		# mkimage -f auto-conf does not support -F to extend the
+		# existing unused.itb , and instead rewrites unused.itb
+		# from scratch.
+		#
+		# Using two separate unused.itb for mkimage -f auto and
+		# mkimage -f auto-conf invocation above would not help, as
+		# the signature verification process below checks whether
+		# all keys inserted into u-boot.dtb /signature node pass
+		# the verification. Separate unused.itb would each miss one
+		# of the signatures.
+		#
+		# The FIT_SIGN_INDIVIDUAL = "1" support is kept to avoid
+		# breakage of existing layers, but it is highly recommended
+		# to not use FIT_SIGN_INDIVIDUAL = "1", i.e. set
+		# FIT_SIGN_INDIVIDUAL = "0" .
+		if [ "${FIT_SIGN_INDIVIDUAL}" != "1" ] ; then
+			${UBOOT_FIT_CHECK_SIGN} \
+				-k "${UBOOT_DTB_BINARY}" \
+				-f ${B}/unused.itb
+		fi
 		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
 	fi
 
-- 
2.48.1


