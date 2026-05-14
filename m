Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD28CD4F3C
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 13:35:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11151.1778765727869714650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 06:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=X5yCyT6s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 525E01A35BF;
	Thu, 14 May 2026 13:35:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1799660495;
	Thu, 14 May 2026 13:35:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0262811AF8C61;
	Thu, 14 May 2026 15:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778765725; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HnZRtVIyLylv7LcCxgQWEU0B05piv+ApWsnaokXhtm8=;
	b=X5yCyT6szsfpZjA547GaPL4xd5ZusWEm+IDsvlt/WnRUxM9/aRF8vz9OU0m9XQxnVeueOu
	9LA2FjTATf31RewrUhl9xrGPiOZ6G+XzrR7BlRct4hwvbRhWAl0JVBnGf9rl0OXOLcBBb/
	Sk+uWfciz85L4MztO/bZju0uIJ6jt8jvnthy868Qa2Dg65LJNUjX9jcrao5uqbxqkWCnNH
	EWb6/fhPT8bFBOAK5zvOV3zD04CihInBrNO2/hF4kkf0fN31zyizo1ZGJlYYpzva6HeBjJ
	7U3SwjXnGUQoVDjeaF0+mjxKl/MsCTlNEXU2Q7VbgO7+PlibxWyYFo/6ZezXnQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	raj.khem@gmail.com,
	Ross.Burton@arm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 2/3] ovmf: drop upstreamed BUILD_CFLAGS setting
Date: Thu, 14 May 2026 15:34:45 +0200
Message-ID: <20260514133446.219612-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260514133446.219612-1-joaomarcos.costa@bootlin.com>
References: <20260514133446.219612-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 13:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237033

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


