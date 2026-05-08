Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C51CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 21:40:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.695.1778276440800992181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 14:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=OWmQy0e6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A0E584E42C4D;
	Fri,  8 May 2026 21:40:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7753F605D0;
	Fri,  8 May 2026 21:40:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4F3E10819DBA;
	Fri,  8 May 2026 23:40:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778276437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1v5iBL+ggd80JTQXMSMcBOwMwwKUrVBj6u+6AT9ZYZA=;
	b=OWmQy0e6V1k1ejErtKKLxNhFk/UKZLw5EkpUvIs0OYHXBIhdymZN0d2O8A/kv0FKkERbTC
	5i3HDkheTDnIHQWB4IB21dwRx+TYq9p35JHmWN1IktNW1KHcZgkF5S0zxqgC51nKo62b29
	WelyuVSohMVoAx8bjoOzPgWFSPCub7TxNsE8O/Mc4kSbsMGCbYS8i2MlwMqaySVS4SnBz2
	seZ1P9xGh7bgYQZtDGPBHMko/Ym4+4IwZZIiRXSb6znXnT3KZ3Gbo6cB9rTtxoonakWY2i
	ARdbBArZ28VDbRjhPkoZ47e8MG30BwrRk0xs1FUD7+DfqrSnPUIMnpbCGm8BwA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 3/4] vim: drop references to xxd in base recipe
Date: Fri,  8 May 2026 23:40:19 +0200
Message-ID: <20260508214020.2488025-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 21:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236745

The new vim-xxd recipe provides a binary package shipping xxd, along with
the update-alternative specific settings, and it also provides xxd for
build-time.

Remove these settings in Vim's base recipe to avoid duplication and
potential conflicts.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-support/vim/vim_9.2.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-support/vim/vim_9.2.bb b/meta/recipes-support/v=
im/vim_9.2.bb
index fee9f055e9..8341dd5af8 100644
--- a/meta/recipes-support/vim/vim_9.2.bb
+++ b/meta/recipes-support/vim/vim_9.2.bb
@@ -1,7 +1,5 @@
 require vim.inc
=20
-PROVIDES =3D "xxd"
-
 RDEPENDS:${PN} =3D "ncurses-terminfo-base ${PN}-xxd"
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS:${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc $=
{PN}-common"
@@ -9,14 +7,6 @@ RRECOMMENDS:${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tut=
or ${PN}-vimrc ${PN}-commo
 PACKAGECONFIG:class-native =3D ""
 BBCLASSEXTEND =3D "native nativesdk"
=20
-PACKAGES =3D+ "${PN}-xxd"
-FILES:${PN}-xxd =3D "${bindir}/xxd"
-RPROVIDES:${PN}-xxd =3D "xxd"
-
-ALTERNATIVE:${PN}-xxd =3D "xxd"
-ALTERNATIVE_TARGET[xxd] =3D "${bindir}/xxd"
-ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
-
 # We override the default in security_flags.inc because vim (not vim-tin=
y!) will abort
 # in many places for _FORTIFY_SOURCE=3D2.  Security flags become part of=
 CC.
 #
--=20
2.43.0


