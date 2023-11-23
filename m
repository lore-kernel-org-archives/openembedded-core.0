Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4630C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 15:44:18 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web11.93981.1700754256507511655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 07:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fris.de header.s=dkim header.b=eqpUuzW+;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDB83BFC04;
	Thu, 23 Nov 2023 16:44:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1700754253; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Sauk/5mGNqdkSXT+YSVvupyhtvqMo2cRnUH2oXX/HHY=;
	b=eqpUuzW+89sXvuKSU537q2sHDwp18RWxgoqz3J/31PR7HY/n76PbeMuNhjcdJ74gvnfM46
	/EFV7FUvaRnjVFdiiDIG1hnkrX+EU5xbR399dYLnIY3bKzj3ya+N+13ZZ1PN1uLeQd8F6R
	ElWvUDxJhgYVXL21Z73xzjPSTefvUopJNy2CZaoCF78CV7Km51UZQdQJ1jLy8EE0y3OP1I
	skHHzgHfBfBSdby+zPiZptKn7ik3RVt10SIAsofHPHqQT7x7mbaWV0zRIt/tOxQF2wKoCR
	wwFFcs3gLQdS+hyq+KttluTd/fh77z1CrQkevVIFTgVwNJoqbkvf9N6zJshhdA==
From: Frieder Schrempf <frieder@fris.de>
To: openembedded-core@lists.openembedded.org
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [kirkstone][PATCH] kernel-fitImage: Strip path component from dtb
Date: Thu, 23 Nov 2023 16:43:51 +0100
Message-ID: <20231123154351.806765-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 15:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191169

From: Ninad Palsule <ninad@linux.ibm.com>

Machines that have added subdirectires to the KERNEL_DEVICETREE
recently, such as arm32 boards that were moved under subdirectories in
Linux 6.5, will have that subdirectory in the node name of the FIT. This
breaks existing systems that select a configuration in u-boot by it's
name.

Strip off the directory component from the device tree to preserve
compatibility.

(From OE-Core rev: 941ba1a132bafa9c9be855fb91fec96d8b06299f)

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de> # backport =
to kirkstone
---
 meta/classes/kernel-fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
index 27e17db951..194d825b0e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -542,6 +542,11 @@ fitimage_assemble() {
 				DTB_PATH=3D"arch/${ARCH}/boot/$DTB"
 			fi
=20
+			# Strip off the path component from the filename
+			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) el=
se 'true'}"; then
+				DTB=3D`basename $DTB`
+			fi
+
 			DTB=3D$(echo "$DTB" | tr '/' '_')
=20
 			# Skip DTB if we've picked it up previously
--=20
2.42.1


