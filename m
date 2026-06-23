Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE223CDB47F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 12:08:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19191.1782216518096056096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 05:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=JkcNckrR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C963CC6B38C;
	Tue, 23 Jun 2026 12:08:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48847601C2;
	Tue, 23 Jun 2026 12:08:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61683106C843D;
	Tue, 23 Jun 2026 14:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782216515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xb2VD8YyWK7FfjEUxoQmBNrfjaMNb/nq8kLtalv/OPc=;
	b=JkcNckrRCH372DYcPa+qjthURyo59k54cNEzLfBlybVJLrRq4gFFNn1EgKvsd3xokiNbMD
	lg9O4jg4hpAlLbBCYU34QZx9GNV0JiUoBYHTF1w9cB8IRWQB4Jj9k7fI091cPsZEQKwJkU
	RsTyqfbPXOMnQtgMGZOeswM0DqDpH9UAaawQn35pNvdqpW7sSpOem5VrYQ+vx9GdntQsRQ
	i2jfV99YNLai3YEsLqE46ObZ6PzvYRzb44iW5ii2OV+XvzEH5LniX+89cEuQEbucubhal3
	V6t1D8HGB3sH9JEQihcpPhx3Qu0GFzI3swz4We5F/TVX6dxDZTGcemR332owUw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 1/5] llvm-project-source.inc: fix string replacements in do_preconfigure
Date: Tue, 23 Jun 2026 14:08:14 +0200
Message-ID: <20260623120818.110754-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
References: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239360

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
2.43.0


