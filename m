Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DC7E9D401
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:34:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23201.1770219236816186762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=NyPz9OZJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kory.maincent@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27EB9C24398
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Feb 2026 15:34:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3257C60705
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Feb 2026 15:33:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 537E4119A8891;
	Wed,  4 Feb 2026 16:33:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770219233; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=uHWbNmijC8WSLV+polTETDXVsvmw4Ir33h4M8mJy1ks=;
	b=NyPz9OZJB8IbxccAzNWlghBsK6pFX9B32yvxPtsiSecW5RJzvxgSWv3OMUT/fMqqcPDVZu
	coSAhl6PpVXW3XnKta2+7va3Jrh9CU32CC5V0xQ1XWt05LOvfqGfi3Rp/5gpvzkZJ8ICxw
	9EakYWAg+9MrK6IyWJLD5qifRuuBOzK1mBV4AAcDBTF1EAF8z3CdF4XnKEqypGwnZ8Ou0B
	Z7tRVsPN9o3p6pH/4996eEhI2a5ehq52bD5miAdXE+p6a50emRFjttyuNDNIueamjH6DY0
	45h6OFtKQlT9r7Igl+I/c+K+GGlz4175WyzFqWUL+N9QbkowKC8Ke+QluGFimQ==
From: Kory Maincent <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [OE-core][PATCH] uboot-sign: Rebuild binman image with configuration signing keys
Date: Wed,  4 Feb 2026 16:33:44 +0100
Message-ID: <20260204153344.445281-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230547

When using binman to generate U-Boot images, the configuration signing
keys are not included in the final image. This occurs because the binman
image is not regenerated after the configuration signing keys are added
to the device tree.

In case binman is used, regenerate the image with the updated device tree
containing the configuration signing keys. This ensures the signed
configuration is properly included in the final U-Boot image.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
index 9cb5c6ccf3..9268bfc451 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -192,6 +192,15 @@ concat_dtb() {
 				-k "${UBOOT_DTB_BINARY}" \
 				-f ${B}/unused.itb
 		fi
+
+		# Regenerate binman image with the newly signed key
+		if [ "${UBOOT_BINMAN_IMAGE}" =3D "1" ] && [ -f "..binman_stamp.cmd" ];=
 then
+			binman_cmd=3D$(sed -n 's/^cmd_[^:]*:=3D *//p' ..binman_stamp.cmd)
+			dtb_binary=3D$(basename ${UBOOT_DTB_BINARY} .dtb)
+			binman_cmd=3D"${binman_cmd} -a of-list=3D\"${dtb_binary}\" -a default=
-dt=3D\"${dtb_binary}\""
+			eval ${binman_cmd}
+		fi
+
 		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
 	fi
=20
--=20
2.43.0


