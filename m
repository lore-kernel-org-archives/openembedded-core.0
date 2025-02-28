Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47325C19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 14:43:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.17295.1740753821708598138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 06:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HkCpdRRU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2235908a30aso4395035ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 06:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740753821; x=1741358621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgy2uuYC6gMF4V5dqjjMAl+iTc5ehZ673U+z+wetUSE=;
        b=HkCpdRRU+Ye77WTkaAUr9OPkcvYN31whLw2F8fysF7m4WpYTv37u6G6VFzxyrJg8iE
         X9T3RUc07Y4gkLRlFea+jKWIRFsIWKib6XpOErNMkaKcOSIhTo01XkjWu6RYjvW5IxM8
         oB9E5A2msxRMRjfmngIoEKO7FobPlldbXOHWeMoRYnt7MjoJY9e/lQ/EgaTHSFDFFXSP
         /UfTjRFofwTbBt9vtEtejxJPKEGwM64RDOrzJN1B74WvDVMSIzDUVEbluAtciG36wgQg
         lGsDPP8OXeJgtqUzCzUuYTBjPuHa5zSdUBeGl2RHKRO4GidN75N9lTP+5lumIODaPsVv
         SQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740753821; x=1741358621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgy2uuYC6gMF4V5dqjjMAl+iTc5ehZ673U+z+wetUSE=;
        b=kKUQCZP2PdHPjVMVRyNifRzG2QSdwXZhIlpazEbjcZyGDlr1kQmi9VJyk/sSR3vF5a
         bY/041g11TFRNZwQN7KNz187Uuh3gD2OYUSJ+nZ9YVSAJc6KiM4fR/MoRAShhEte537F
         2+N26wD0h1wKRUGYbPwYK+a467cISjJOCzooWkMHGiHpuiW28kN2GbLpCCY7Hhc05HN7
         qYHbnsK1mmqvxstwKMJ8CAqmo+xjNCx9QvYIhN4ZK5c9D4Zqr96mwo6EEO7iuXY+vOp0
         6xM6R5vmP2MZmGE99aEGRdvVRtiHTvj/ix7ZU6VE+vQdo17ptwC2YS7E0xc2ITN0s8nb
         uq7Q==
X-Gm-Message-State: AOJu0YyotGqpKk8eCI8/dqVJl4dEHwy99khIJjk6ZTSbuBFNXGQDSjTn
	3AJh5hkEAvOt2NcrsxnoUcOYfxJn6xkokAbnfBV4Wk1NAdAt1Xm2e1q+1Hv10I/M6lG3RfhxTOS
	Z
X-Gm-Gg: ASbGnctamN1RnqMLtzHLuk60Fju5Vy5Fk3MTZvulHh0awwfJ3+U+13wCBuQHPodHwhy
	m4jbfpeS8OmFAI8pSaXBG6EuPEh73y6i7e6JRJPOUiP7VL9nqEj06kQGav2V9zuxBTddqA8OrPH
	x9LWuRBV6pob6pgf5TbmPURSS6BWqHQniu6HQyAtV+2VunX+EImQJ1tRXuXZpzsUWV7L684qT0D
	fPriCdyIhZ6PoEnPreBR38tv4FzkqVNkyI9nF2mqlm2uJZ10N6Vg4bF1stcm3ab+hyFA1gLvdhP
	kl7fKZcbGuUIgiI=
X-Google-Smtp-Source: AGHT+IHGexcCLL3DQi0X/8G+czpeXGyBYK3XOzg+ApDnGqCN3woCBiyx4ly6lw6Lhny71aSSqfpLRg==
X-Received: by 2002:a17:902:e54e:b0:220:f449:7419 with SMTP id d9443c01a7336-22368f60a5emr60826235ad.7.1740753820825;
        Fri, 28 Feb 2025 06:43:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cd66sm3806559b3a.74.2025.02.28.06.43.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:43:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/4] u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1" behavior
Date: Fri, 28 Feb 2025 06:42:58 -0800
Message-ID: <699822a163a4efa32735f75d21fde4ffa195c0e0.1740753632.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740753632.git.steve@sakoman.com>
References: <cover.1740753632.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 14:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212062

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


