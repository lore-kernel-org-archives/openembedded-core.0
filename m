Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3D2CD5BB1
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 12:58:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35640.1779368325843647562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 05:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=tCC5CwRc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5997A1A3655;
	Thu, 21 May 2026 12:58:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F32160495;
	Thu, 21 May 2026 12:58:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20E93107E8B86;
	Thu, 21 May 2026 14:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779368323; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9lgScfCVwurV7xzYxUp8Kjf9jPheI5HeM6WSVjDIBJE=;
	b=tCC5CwRcG86ehD6waaWUMhbEU0H8M+t2WqrJ2D/lEHhAo4WLOXjk5BIFemu0wzj9PjbsSv
	wVmbouKK3Q+9jYx5gIxDtfZOMKRdOhvQAi5BBpKlV1zAGekOxoP2X/iYPAbLKBCd18jPng
	bQqBa23/0IUyIvyJVbbvJe6LVVc8qdD69vDRY/BKTwlZXFmLpi7JaH3NM1IEKLOx/GtKhy
	i2VbDnXnRkEVZA6B8YQQJv2eUpOlo9fnpVpmLIHEVldyjpzTmg15Xt5Z6HtHEbmzoEKUUU
	wFX832DEcSSJ6SleefVE94HoNzfg78M0f5yNmYLN1xPdRJoU8Bs3t3mJFOG6sw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Ross.Burton@arm.com,
	alex.kanavin@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 3/5] vim: drop references to xxd in base recipe
Date: Thu, 21 May 2026 14:58:26 +0200
Message-ID: <20260521125828.718050-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 12:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237510

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
index 59de224aac..b5eef2245a 100644
--- a/meta/recipes-support/vim/vim_9.2.bb
+++ b/meta/recipes-support/vim/vim_9.2.bb
@@ -5,8 +5,6 @@ SRC_URI +=3D "file://disable_acl_header_check.patch \
     file://no-path-adjust.patch \
 "
=20
-PROVIDES =3D "xxd"
-
 RDEPENDS:${PN} =3D "ncurses-terminfo-base ${PN}-xxd"
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS:${PN} =3D "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc $=
{PN}-common"
@@ -14,14 +12,6 @@ RRECOMMENDS:${PN} =3D "${PN}-syntax ${PN}-help ${PN}-t=
utor ${PN}-vimrc ${PN}-commo
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


