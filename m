Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22640CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:30:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46604.1778491793656806465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 02:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=TBrRMmgF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2AC59C5E169;
	Mon, 11 May 2026 09:30:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1DD360646;
	Mon, 11 May 2026 09:29:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61B0C11AE8423;
	Mon, 11 May 2026 11:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778491791; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kl9SG2JnQ4kBDBFFED0yoL8TWxawG4kH38lRobfOOKQ=;
	b=TBrRMmgFYnVPEO1kUThepXSdMk/bxqvYHdVl5otXa0qls73j9BTsaXW52NJC26/pBFkrge
	yYLmSxGB7fti5vky2XJIQpwVEmBZhrqiXmjnjs9mIUkJDLV4tETbbtcbXlMcduh/NIjiGT
	jya2QL1CAxGQPYPN3MjENgxxhDKtFzNudfHg+cbUXbFqVwvmrycc3vvEkoHcNuzddOZWhD
	dbd9Co/aZvbgyJPXFFnRAUAfQCDEaivmJrAIA2LfMQhi9CObSNFmnEGpvPx3DQ8L/pvvHk
	z8xCwqUG7jXzaxQOKKDW/7aVQQa6a33fFdvkz2Xuws4//5s8PG7oqEkX9U/VPg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	khem.raj@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS setting
Date: Mon, 11 May 2026 11:29:34 +0200
Message-ID: <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236792

This was handled upstream a while ago:

https://github.com/tianocore/edk2/blob/master/BaseTools/Source/C/DevicePa=
th/GNUmakefile#L27

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index 779e9f8196..8e2d172f66 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -14,10 +14,6 @@ PACKAGECONFIG[debug] =3D ",,,"
 PACKAGECONFIG[secureboot] =3D ",,,"
 PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,"
=20
-# GCC12 trips on it
-#see https://src.fedoraproject.org/rpms/edk2/blob/rawhide/f/0032-Basetoo=
ls-turn-off-gcc12-warning.patch
-BUILD_CFLAGS +=3D "-Wno-error=3Dstringop-overflow"
-
 SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;proto=
col=3Dhttps;tag=3D${PV} \
            file://0001-ovmf-update-path-to-native-BaseTools.patch \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitba=
ke.patch \
--=20
2.47.0


