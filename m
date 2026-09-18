Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205B9C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 09:27:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7247.1789723650698540391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 02:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Rqo+ohE4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B80C1A0983;
	Fri, 18 Sep 2026 09:27:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50BE460649;
	Fri, 18 Sep 2026 09:27:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB8F910328F43;
	Fri, 18 Sep 2026 11:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789723643; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8Q2B3mulw2GlP2BTvkg+Dms+q0eSxqYif5XZei23WDU=;
	b=Rqo+ohE4mIi9eTHbulgiZ5W/KVBEcK8nN9dO2FT7FWYHaxoSwXWqHb7n3PUB6S5N3tEOgr
	HeN5jwX5E4VWkP9c1Caci1E7ULLsxTE4sDUy+bgGArPIUTDVK1SCUuQScE2Gzrk6fc+5NB
	FepuHihH48u5nP3g7rDQUfhKvHTDi1+A29i2xICSPX0hphvzB2vvlecuPT7LEuOlD62zeH
	m1UB7hyIE8TOwxZ3wFA8iTCkfLpnYrKTVtoHOi5IL9OnHEjL8qfhpB3EvnS3W7cixSLYFu
	/xVl/n5jKH78lX6HTDUdOjJ0gTWpRBvPuB5OsBCzhlrv7I0cS5R02yA9NMl0dg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	paul@pbarker.dev,
	yoann.congal@smile.fr,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 RESEND] classes/archiver: fix tarball content in "original" mode
Date: Fri, 18 Sep 2026 11:27:11 +0200
Message-ID: <20260918092711.471982-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246204

When ARCHIVER_MODE[src] is set to "original", a tarball is generated with
the unpacked sources of a given recipe. Prior to it, a tmpdir
(i.e. from tempfile.mkdtemp()) is created and the sources are unpacked in=
side:

(...)/vim/9.2.0340/archiver-work/tmp8pu2nsck
`-- vim-9.2.0340
    |-- READMEdir
    |-- ci
    |-- lang

This tmpdir, however, ends up being shipped in the deployed tarball:

$ tar -tf vim-9.2.0340-r0.tar.xz
(...)
tmp8pu2nsck/vim-9.2.0340/ci/config.mk.clang-12.sed
tmp8pu2nsck/vim-9.2.0340/LICENSE
tmp8pu2nsck/vim-9.2.0340/.git-blame-ignore-revs
(...)

This can be avoided by pointing to the subdir where the sources are
unpacked, rather than to tmpdir, when calling create_tarball().

The subdir's name can be inferred from 'BP', so we will use
'tmp8pu2nsck/vim-9.2.0340/.' instead of 'tmp8pu2nsck/.' as input.

e.g. and in the result:

./
./vim-9.2.0304/
./vim-9.2.0304/SECURITY.md
./vim-9.2.0304/.codecov.yml
(...)

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
index b274c53e79..c824718a1d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -230,7 +230,7 @@ python do_ar_original() {
                     else:
                         bb.fatal("Cannot determine archive names for ori=
ginal source because 'name=3D' URL parameter '%s' is used twice. Make it =
unique in: %s %s" % (tarball_suffix[name], url))
             tarball_suffix[name] =3D url
-            create_tarball(d, tmpdir + '/.', name, ar_outdir)
+            create_tarball(d, os.path.join(tmpdir, d.getVar('BP'), '.'),=
 name, ar_outdir)
=20
     # Emit patch series files for 'original'
     bb.note('Writing patch series files...')
--=20
2.55.0


