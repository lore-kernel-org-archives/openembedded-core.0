Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB86CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 15:24:30 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23141.1780500262508925482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 08:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=FQ/sWKE+;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC10F1880873;
	Wed,  3 Jun 2026 17:24:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1780500259; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ou3lIRwqSIpDqkFWXHIMwFQx5nVIDsYbl7NKbMP6oIU=;
	b=FQ/sWKE+8bOStJUjaqKoKds4zXRdnU4zA6AWc37isA7HcO1IuokGC03gGXaomMI8mOcYo1
	TbyDYEFcjHQO3BMeGbiJ/AcX2JkTwuNa5MsWh1MdWahcXsM8B9QW/PGnizUw8pnm5l6k9a
	HCuxnLVMDBUh9q1Q2K5UUiFKBa8nY/CNlBkxN0zdK8nPSOhVYzLiPsVo7KFX4UcZfyjlDb
	2ItpcJcB+uA+kPX2Jc8vfahSqwK6aWDyPC6FElF5iJLL+AEFH6jmj+BnBRQvpOKexG0geW
	GnBSw226gm6JDcvYQtIwWUbWBtFG4HTKSDRtqCVxq3OAIlCNYEuTM+nSjwAgZg==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-core@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [PATCH] kernel-fit-image: skip sstate creation for deploy
Date: Wed,  3 Jun 2026 17:23:28 +0200
Message-ID: <20260603152328.48500-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 15:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238099

When building completely from sstate (e.g. in pipeline), the
linux-yocto-fitimage recipe deploys from sstate even if the
INITRAMFS_IMAGE requires a rebuild.

Using dm-verity or verity image classes, the initramfs image must be
rebuilt after the rootfs. However, linux-yocto-fitimage:do_build was
skipped and went straight for do_deploy from sstate and deployed a
fitImage with an outdated initramfs with old roothash data while the
image and INITRAMFS_IMAGE were being built.

Skipping the do_deploy task in a sstate only build, successfully
triggers linux-yocto-fitimage:do_build after
INITRAMFS_IMAGE:do_image_complete.
This also follows fitimage.bbclass[1] from meta-oe.

[1]: https://git.openembedded.org/meta-openembedded/tree/meta-oe/classes/=
fitimage.bbclass?h=3Dwrynose#n522

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-=
recipe/kernel-fit-image.bbclass
index ae8f3c6688..03272bab51 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -241,3 +241,4 @@ do_deploy() {
     fi
 }
 addtask deploy after do_compile before do_build
+SSTATE_SKIP_CREATION:task-deploy =3D "1"

