Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F191ACD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 14:15:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12135.1778768131298313094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 07:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=csVLfhci;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A33571A35BC;
	Thu, 14 May 2026 14:15:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65C9C60495;
	Thu, 14 May 2026 14:15:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25BC911AF8FBE;
	Thu, 14 May 2026 16:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778768128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jS6u0Te3Y5iIrTg5Ou8Op/M1zaU7J0lYN1YEJKPo6T0=;
	b=csVLfhciIkjkCEHRVMAMSCYO6vGv1oO/XHRO3b/5bju8QFUuI8yaZnc+bLIDjWCIL911hl
	Bx52uZn65S5Mz38kUChthuwr9XitAgzrUzTL6/xv3xarElKuhePrdkKDNSsbatUX7F3jJa
	El0kK/94/vmLkukhVrxne+H953gTHTFI7kHD19S4LCm9MdMNzjyZjlX/qfxDEUT6SzIDGZ
	7k08P0NQPpHujl7o7pjsFmDeAe7EYwLK2oMrYjzwEJrFkEcBpMAnCDAbJmu4K0mjxR0QbP
	H1QBGFksS2UDuhFXWnYKX9aVV8s4Cp6VfcCfRqcmciWbByqq7r1aQn6IHYaB5Q==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	raj.khem@gmail.com,
	Ross.Burton@arm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 1/3] ovmf: simplify PACKAGECONFIG's default value
Date: Thu, 14 May 2026 16:15:15 +0200
Message-ID: <20260514141517.226933-2-joaomarcos.costa@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 14:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237041

The two append operations call bb.utils.contains, while a single
contains_any() does the trick in a cleaner way.

Regarding the default value, if tpm is not enabled, PACKAGECONFIG ends
up with a couple empty spaces, and this can be avoided by redefining the
default value to the result of contains_any().

Even though this replacement comes with a change in behaviour (at least
in edge cases), we prefer a consistent PACKAGECONFIG (weak) default
assignment across recipes.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
index 958f42fc10..cc251bbc00 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -9,9 +9,7 @@ LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3D06=
357ddc23f46577c2aeaeaf7b776
 # Enabling Secure Boot adds a dependency on OpenSSL and implies
 # compiling OVMF twice, so it is disabled by default. Distros
 # may change that default.
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG +=3D "${@bb.utils.filter('MACHINE_FEATURES', 'tpm', d)}"
-PACKAGECONFIG +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'tpm2', 'tp=
m', '', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.contains_any('MACHINE_FEATURES', 'tpm t=
pm2', 'tpm', '', d)}"
 PACKAGECONFIG[debug] =3D ",,,"
 PACKAGECONFIG[secureboot] =3D ",,,"
 PACKAGECONFIG[tpm] =3D "-D TPM_ENABLE=3DTRUE,-D TPM_ENABLE=3DFALSE,,"
--=20
2.47.0


