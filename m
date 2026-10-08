Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A1FCA600A
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 07:17:57 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10044.1791443870495279235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 00:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fris.de header.s=mail header.b=keCfxApA;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791443867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LtbwmLl3ia8i4P3XD0o6TOaKeEz/KD/2oQwjmmIkml0=;
	b=keCfxApAmgpUR63pkk5i+YwwckCtWPWrhsfVXLwKPgG7h45ZATjrdc3j1RS0I/TIaAFKfD
	MZbzZEryP48UAbHCdENyDFENVfj9GRcmOslxG33y3LqAJh8fZFtUtlSd1SxAoSb8TmzkCC
	7Df6BMOZUDC+O2O+dmXFxAUOH08v0z4rfq2uT49bIETgkk4iTYYtGxT2KFG/fo6q7jUHWT
	P5d/L/5fxP9VB35FyYdhkv159qPET407iyj+ZIarRndrQlld1hOfOSz+lFwt3lNzEa3oGq
	G1jZeF0sb8vejEpzNcr8yRCDg1ntw1bBogLKyas24kwm4jgKTNYDAqbMz01wYA==
To: openembedded-core@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH] sqlite3: Fix host include path leaking in with readline/editline
Date: Thu,  8 Oct 2026 09:17:33 +0200
Message-ID: <20261008071733.1242183-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 07:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247418

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The autosetup based configure derives the readline CFLAGS from
--with-readline-header, so the ${includedir} based path turns into
"-I/usr/include" and the build host headers are used. With the cross
compiler this fails with -Werror=3Dpoison-system-directories. Use
${STAGING_INCDIR} so the include path points to the recipe sysroot.

Tested by building sqlite3 with PACKAGECONFIG readline enabled for
qemuarm on master.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb b/meta/recipes=
-support/sqlite/sqlite3_3.53.4.bb
index 137ec26207..007a823dc5 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.53.4.bb
@@ -34,8 +34,8 @@ inherit pkgconfig siteinfo upstream-stable-release-poin=
t
 PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext unlock-notify"
 PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext"
=20
-PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-header=3D=
${includedir}/editline/readline.h,--disable-editline,libedit ncurses"
-PACKAGECONFIG[readline] =3D "--enable-readline --with-readline-header=3D=
${includedir}/readline/readline.h,--disable-readline,readline ncurses"
+PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-header=3D=
${STAGING_INCDIR}/editline/readline.h,--disable-editline,libedit ncurses"
+PACKAGECONFIG[readline] =3D "--enable-readline --with-readline-header=3D=
${STAGING_INCDIR}/readline/readline.h,--disable-readline,readline ncurses=
"
 PACKAGECONFIG[fts3] =3D "--enable-fts3,--disable-fts3"
 PACKAGECONFIG[fts4] =3D "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] =3D "--enable-fts5,--disable-fts5"
--=20
2.55.0


