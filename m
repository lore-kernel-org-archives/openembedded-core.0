Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0572ACD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 14:15:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12140.1778768135496994184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 07:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0Aa9fx/0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 50376C5DC78;
	Thu, 14 May 2026 14:16:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6000160495;
	Thu, 14 May 2026 14:15:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FBE911AF8FBE;
	Thu, 14 May 2026 16:15:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778768132; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HnZRtVIyLylv7LcCxgQWEU0B05piv+ApWsnaokXhtm8=;
	b=0Aa9fx/06y965LfeQp3AGbijKU0DqsvQgQx1vHNZwZ+r/VKM7l85H0IfRq+AK9gi9q4Lnu
	OJhF93iYnsE4+qu3evDWYHsaZke5CuLE/rdEa8gvc+fRXYDiqUwD7SsCJdHeoOc6csB+K2
	tVTV8EDjd7bn4xFyOrbZkOZPNUqjkBnbONti3mhAFpfY1jdZ+mEwIG0OU/HFQ1UtqKaHHc
	clXSYJjUjkRvnFWoupbE08QUyzZD9PipIMHSwlHb4TgB8f2UuPMpBxPFm0phMPiNoxKUQC
	RtBihTKFXBA+a2/lFYo5VFSDvqA55nxDD3FYCtjDI8/x5vN2YbNTm6Kv/ZDFkQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	raj.khem@gmail.com,
	Ross.Burton@arm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 2/3] ovmf: drop upstreamed BUILD_CFLAGS setting
Date: Thu, 14 May 2026 16:15:16 +0200
Message-ID: <20260514141517.226933-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260514141517.226933-1-joaomarcos.costa@bootlin.com>
References: <20260514141517.226933-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 14:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237042

This same gcc (v12) warning was handled upstream a while ago:

22130dcd98b4 ("Basetools: turn off gcc12 warning")

This change is available in the tag we currently use: edk2-stable202511.

In fact, it is available since edk2-stable202205, and the
-Wno-error=3Dstringop-overflow flag [1] was added for the same reason we =
have
it in ovmf's recipe.

[1] https://github.com/tianocore/edk2/blob/master/BaseTools/Source/C/Devi=
cePath/GNUmakefile#L27

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index cc251bbc00..f91f458006 100644
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


