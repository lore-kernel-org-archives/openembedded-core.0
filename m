Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9EDC98302
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:24:33 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5969.1790069065279392513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=q64+FjKP;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id F3D3EDEE7
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 11:24:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.249]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8wjc-3frliL0; Tue, 22 Sep 2026 11:24:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/5] cpan: survive the Makefile that MakeMaker rebuilds under us
Date: Tue, 22 Sep 2026 11:23:33 +0200
Message-ID: <20260922092411.262885-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922092411.262885-1-f_l_k@t-online.de>
References: <20260922092411.262885-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790069060-AB7FD986-B4CF83EA/0/0 CLEAN NORMAL
X-TOI-MSGID: 35b5e735-3703-4b42-8003-449bae020004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790069061; i=f_l_k@t-online.de;
	bh=C8doxuExPyQal2YIFzMaqwq3wFbqWxOZ2H+eG9we/7o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=q64+FjKP9mw4vNA42Ussts/NILjxlVb5jak1FuK3HTmvAkJKMxWScs0Fvs+8HoInY
	 DCtQDMV/BLxg7aoTlx+BfUTPRBnqQVfBfihAB3eQ+WWKJCtO5XOrPiQgdtF/GTjm0d
	 f6jofT9fTetJTqiWueZfPvGMAcSZjK1hGSK8NpHmea07S+Doa4O21SivzWHOSXJg5g
	 0ABgKLsNctTUZ1avkIdovYRGVFrVtdb/kq6COWoXqpZf430iqnljHbnDuBW6MCJut+
	 sIiXrfKgkFyuc217CWhwnZLzDAgqVoyVgrGWsHZ0xIUbMg+a0UCVsox3QOOrcQ0Roq
	 4VieJv+rs/Vjw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246397

ExtUtils::MakeMaker makes the generated Makefile depend on Config.pm and
config.h from the perl it was configured against. do_prepare_recipe_sysro=
ot
stages those files fresh on every run, so their mtime can end up newer th=
an
a Makefile written by a do_configure that is still valid. make then
regenerates the Makefile, prints "Please rerun the make command" and exit=
s
non-zero, which fails do_compile or do_install. Run make a second time in
that case, which is what MakeMaker asks for; a run that fails for any oth=
er
reason fails again. Also drop a stale Makefile before Makefile.PL runs, s=
o
a configure in a used work directory does not start from old settings.

Reproduced with liburi-perl by touching Config.pm and config.h in the
recipe sysroot and forcing do_install: it failed before the change and
succeeds after it.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/cpan.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.=
bbclass
index dbf44da9d2..0f7384786f 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -23,6 +23,10 @@ export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl5=
/${@get_perl_version(d)}/"
 export PERLHOSTARCHLIB =3D "${STAGING_LIBDIR_NATIVE}/perl5/${@get_perl_v=
ersion(d)}/${@get_perl_hostarch(d)}/"
=20
 cpan_do_configure () {
+	# A Makefile left behind by an earlier configure run would be used with=
 the
+	# settings it was generated with, so start from the Makefile.PL every t=
ime.
+	rm -f Makefile
+
 	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor NO_PE=
RLLOCAL=3D1 NO_PACKLIST=3D1 PERL=3D$(which perl) ${EXTRA_CPANFLAGS}
=20
 	# Makefile.PLs can exit with success without generating a
@@ -57,12 +61,17 @@ do_configure:append:class-nativesdk() {
            -e 's:LD_RUN_PATH ?=3D ?"?[^"]*"?::g'
 }
=20
+# ExtUtils::MakeMaker regenerates the Makefile when the staged perl has =
become
+# newer than it, and then exits asking for make to be rerun. Do that ins=
tead of
+# failing the task; a run that fails for any other reason fails again.
 cpan_do_compile () {
-	oe_runmake PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}"
+	oe_runmake_call PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}" || \
+		oe_runmake PASTHRU_INC=3D"${CFLAGS}" LD=3D"${CCLD}"
 }
=20
 cpan_do_install () {
-	oe_runmake DESTDIR=3D"${D}" install_vendor
+	oe_runmake_call DESTDIR=3D"${D}" install_vendor || \
+		oe_runmake DESTDIR=3D"${D}" install_vendor
 	for PERLSCRIPT in `grep -rIEl '#! *${bindir}/perl-native.*/perl' ${D}`;=
 do
 		sed -i -e 's|${bindir}/perl-native.*/perl|/usr/bin/env nativeperl|' $P=
ERLSCRIPT
 	done
--=20
2.55.0


