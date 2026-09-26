Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D99AC9832A
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 19:11:51 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25221.1790449909776426092
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 12:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=vBfAOWoh;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout01.t-online.de (Postfix) with SMTP id 680391BCC8
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 21:11:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.105]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xAXoH-0vfJtQ0; Sat, 26 Sep 2026 21:11:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] cpan: do not rebuild the Makefile when perls config is re-staged
Date: Sat, 26 Sep 2026 21:11:32 +0200
Message-ID: <20260926191132.45145-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790449905-597F9936-0CCCE782/0/0 CLEAN NORMAL
X-TOI-MSGID: efd8bf22-56df-4a4e-acf3-aa17a12cd286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790449907; i=f_l_k@t-online.de;
	bh=E1M6V6QE0zHm/D2ZD1P+euSjAkTWce7qrc+NEF82OFM=;
	h=From:To:Subject:Date;
	b=vBfAOWohp7H3bUBzdnm7DtpeychL4y6wVALvUaJEu99v77EhvWuiupF+0CY/HJKT3
	 kpxYtZwwho+oZsg1Rm1T2jGiVo+EG9hlPqccJTA6icRQ2/w08S/l5UOEmrLImDYiVv
	 u5UaEFf5i0JMlCAlLrxuzFHGLB1u/zYTss/vizSyHEAhHuXZ3JHaKjK/ANc/Qf1b4T
	 HqdkwyUdP/SftvDzvXUD2/H5ZJJjwwcyU/W58D2gIWtQBaqoNJgcGozuum0fLwqbO9
	 4UDvy6luaTePeEeAVDeg1LkhirDx22clWS3gKqaUeNGZhEO4d3N0NNynGEEmCk2dZI
	 C//Clsbp2yl4A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 19:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246641

The Makefile depends on Config.pm and config.h of the staged
perl. After pulling an oe-core update that installs perl fresh into the
sysroot, these become newer than the Makefile because of a sed in:
staging.bbclass:185
 cmd =3D "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDI=
RTARGET:%s:g; ..."
Thus make regenerates the Makefile, its asking to be rerun and fails. Cle=
ar CONFIGDEP so
make ignores those timestamps; a real change of perl reruns do_configure =
through the task
hash anyway.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/cpan.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.=
bbclass
index dbf44da9d2..5b5698fbf8 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -58,11 +58,11 @@ do_configure:append:class-nativesdk() {
 }
=20
 cpan_do_compile () {
-	oe_runmake PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}"
+	oe_runmake PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}" CONFIGDEP=3D
 }
=20
 cpan_do_install () {
-	oe_runmake DESTDIR=3D"${D}" install_vendor
+	oe_runmake DESTDIR=3D"${D}" install_vendor CONFIGDEP=3D
 	for PERLSCRIPT in `grep -rIEl '#! *${bindir}/perl-native.*/perl' ${D}`;=
 do
 		sed -i -e 's|${bindir}/perl-native.*/perl|/usr/bin/env nativeperl|' $P=
ERLSCRIPT
 	done
--=20
2.55.0


