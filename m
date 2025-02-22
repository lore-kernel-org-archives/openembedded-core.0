Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4CBC021B3
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 00:21:09 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.37744.1740183664482351822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 16:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=mx-20241105 header.b=SHbyYY7L;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 655A410382D37;
	Sat, 22 Feb 2025 01:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740183662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VKMGjdMclv5c61ejTSPb16TtecZ/jOc/RhpieRrXvSg=;
	b=SHbyYY7LT6N1iHd1leznbTwMtb3DwjkAbgkgISdF819x/xQ7Ol890gand7dQ58PMWCy8Bc
	Iw0wmahbtLR71iZh2Lu28KukB4MkmDZdlWOf4h3IgBpuA9fbNX1jFC5E/DaNguxAOeSIeV
	F23unE3v9XNXr5icJm2Sx5I9eHhDXHIhZEMiDCyAIJ1Ch94ZP+Kqh+WWwfJnhc/FQIuye3
	61j+NFV7H71M/j865h3Ph1arH6pB7EQLchCK5mNOdYa8jkPVhsBlieWEJsnaTR3WgoOcuD
	JVJ0l6l/ihxJhNrEdEHz920XUS7A9hcgJjqsgxcTTkm5HQyh9wgAX7uBdETbFg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Leonard Anderweit <L.Anderweit@phytec.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rogerio Guerra Borin <rogerio.borin@toradex.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: [PATCH] u-boot: kernel-fitimage: Restore FIT_SIGN_INDIVIDUAL="1" behavior
Date: Sat, 22 Feb 2025 01:20:37 +0100
Message-ID: <20250222002047.319479-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Feb 2025 00:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211814

OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
where the resulting signed fitImage contains both signed
images and signed configurations, possibly using different
keys. This kind of signing of images is redundant, but so is
the behavior of FIT_SIGN_INDIVIDUAL=3D"1" and that is here to
stay.

Adjust the process of public key insertion into u-boot.dtb
such that if FIT_SIGN_INDIVIDUAL=3D=3D1, the image signing key
is inserted into u-boot.dtb first, and in any case the
configuration signing key is inserted into u-boot.dtb last.

The verification of the keys inserted into u-boot.dtb against
unused.itb is performed only for FIT_SIGN_INDIVIDUAL!=3D1 due to
mkimage limitation, which does not allow mkimage -f auto-conf
to update the generated unused.itb, and instead rewrites it.

Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if UBO=
OT_SIGN_ENABLE and UBOOT_ENV enabled")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Leonard Anderweit <L.Anderweit@phytec.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>
Cc: Sean Anderson <seanga2@gmail.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 60 ++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
index 96c47ab0165..5c579a9fb0e 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -101,27 +101,69 @@ concat_dtb() {
 	binary=3D"$2"
=20
 	if [ -e "${UBOOT_DTB_BINARY}" ]; then
-		# Re-sign the kernel in order to add the keys to our dtb
-		UBOOT_MKIMAGE_MODE=3D"auto-conf"
 		# Signing individual images is not recommended as that
 		# makes fitImage susceptible to mix-and-match attack.
+		#
+		# OE FIT_SIGN_INDIVIDUAL is implemented in an unusual manner,
+		# where the resulting signed fitImage contains both signed
+		# images and signed configurations. This is redundant. In
+		# order to prevent mix-and-match attack, it is sufficient
+		# to sign configurations. The FIT_SIGN_INDIVIDUAL =3D "1"
+		# support is kept to avoid breakage of existing layers, but
+		# it is highly recommended to avoid FIT_SIGN_INDIVIDUAL =3D "1",
+		# i.e. set FIT_SIGN_INDIVIDUAL =3D "0" .
 		if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
-			UBOOT_MKIMAGE_MODE=3D"auto"
+			# Sign dummy image images in order to
+			# add the image signing keys to our dtb
+			${UBOOT_MKIMAGE_SIGN} \
+				${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}'=
) else ''} \
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
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}')=
 else ''} \
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
+		# This only works for FIT_SIGN_INDIVIDUAL =3D "0", because
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
+		# The FIT_SIGN_INDIVIDUAL =3D "1" support is kept to avoid
+		# breakage of existing layers, but it is highly recommended
+		# to not use FIT_SIGN_INDIVIDUAL =3D "1", i.e. set
+		# FIT_SIGN_INDIVIDUAL =3D "0" .
+		if [ "${FIT_SIGN_INDIVIDUAL}" !=3D "1" ] ; then
+			${UBOOT_FIT_CHECK_SIGN} \
+				-k "${UBOOT_DTB_BINARY}" \
+				-f ${B}/unused.itb
+		fi
 		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
 	fi
=20
--=20
2.47.2


