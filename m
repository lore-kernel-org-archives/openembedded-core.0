Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEA7CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:21:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43026.1782134466880279030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=dXY9FF8E;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2680DC6220C
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:21:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F37F5601BB;
	Mon, 22 Jun 2026 13:21:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF526106C89B2;
	Mon, 22 Jun 2026 15:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782134464; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E408VbVxV3jClzeIlZiZfztC5WEMuKGX5X5jdgqg/TE=;
	b=dXY9FF8ESaKKpPG7jL+qQ0FJ7KxM0NFjLh3Yxf29PVg5/YtVWTy/b1H4kn6kVqYQ3EkMMJ
	5rC5I85ZxNEid4rigmFxr5LZ/jodlfT6NeVuFUSVHH4hYRdi2X4cBRXTyLaHymcRxRRNoG
	7ZLQEEzXhQLf13RAt6YIe8VqQ4+FIFJrQXhMclV8EA5ISr+d95gjLhFcHN8rv5SFjF2DMC
	NKbKsl4sC5BgoPVGyaAMHWXB383AEUsptE6oDWa13s50JahVjU2f1LFoNws9CLGKKHiPqu
	7NptbQ73ml+1WI3LA1UBtwv9pgozuoEyXHzyUUb6tm5c3XIQPPgHdvcXxuoRrA==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 1/4] llvm-project-source.inc: fix string replacements in do_preconfigure
Date: Mon, 22 Jun 2026 15:20:18 +0200
Message-ID: <20260622132021.37598-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
References: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239291

Both CLANG_EXTRA_OE_DISTRO_CASE and CLANG_EXTRA_OE_DISTRO_TRIPLE are
added by the same patch:

0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch

and they are supposed to be replaced by a couple of sed commands in
do_preconfigure. However, sed looks for CLANG_EXTRA_OE_DISTRO_CASES (and
CLANG_EXTRA_OE_DISTRO_TRIPLES) and since none is found, the code is left
with the dangling comment like so:

@ clang/lib/Driver/ToolChains/Linux.cpp
82     if (TargetEnvironment =3D=3D llvm::Triple::GNUX32)
83       return "x86_64-linux-gnux32";
84     //CLANG_EXTRA_OE_DISTRO_TRIPLE
85     return "x86_64-linux-gnu";

Fix that by removing the 'S' in the end of ..._CASES and ..._TRIPLES.

Another way to fix this would be to directly change the patch, but
simply changing do_preconfigure feels cleaner.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/r=
ecipes-devtools/clang/llvm-project-source.inc
index ba6cbf9a8d..6540d1cc7c 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -82,9 +82,9 @@ python do_preconfigure() {
     subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
     cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CHECK#%s#g' % check=
, source + '/clang/include/clang/Driver/Distro.h']
     subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
-    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_TRIPLES#%s#g' % tri=
ple, source + '/clang/lib/Driver/ToolChains/Linux.cpp']
+    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_TRIPLE#%s#g' % trip=
le, source + '/clang/lib/Driver/ToolChains/Linux.cpp']
     subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
-    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CASES#%s#g' % case,=
 source + '/clang/lib/Driver/Distro.cpp']
+    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CASE#%s#g' % case, =
source + '/clang/lib/Driver/Distro.cpp']
     subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
 }
=20
--=20
2.47.0


