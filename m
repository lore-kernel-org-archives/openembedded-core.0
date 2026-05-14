Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85827CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 13:35:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11150.1778765726237917963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 06:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=rRpQeaAC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6E6C54E42C9B
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 13:35:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4589C60495;
	Thu, 14 May 2026 13:35:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48E9B11AF8FBA;
	Thu, 14 May 2026 15:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778765723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jS6u0Te3Y5iIrTg5Ou8Op/M1zaU7J0lYN1YEJKPo6T0=;
	b=rRpQeaACDct95wbnvp62KnLdgcFRwdczPUQHXFMUEa2KR8SdFXTqEC85hseWuzNrGKOg9B
	R+6Ppt3e4hbCJJh9UEzynNefgS1C7+Ep80V+jhkcp6wWHWTYqSwLqQ2AvJdgoz17WIGRda
	eHR8vTjTg0beGs3AKATTcHWkBAVZdZQPWtEivMYT/KvJEyl0cflWUvehgXXKXABM7UBufW
	evsDtcRMi8iWrQW7qGQt0I1haqlyrAltdY29318+Fbd5OOKuLavR+JJjrzBkXGNB7N6F9q
	sKborrUQ1lZR46aN8ejdVu+ASshNLiPl+iUkjIgJER6at63i7YdjPcY8oDMQXA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	raj.khem@gmail.com,
	Ross.Burton@arm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 1/3] ovmf: simplify PACKAGECONFIG's default value
Date: Thu, 14 May 2026 15:34:44 +0200
Message-ID: <20260514133446.219612-2-joaomarcos.costa@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237032

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


