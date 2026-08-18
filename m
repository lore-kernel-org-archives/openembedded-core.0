Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE303C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 13:37:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8906.1787060229701339522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 06:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fjb5B8lC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4DDC4E41286
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:37:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3B7B60355
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C601E11C705C1;
	Tue, 18 Aug 2026 15:37:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787060227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=c2hIqQUugg6LWyx6hhT4oiV+AtMPvQnvc7oDjUx1j9o=;
	b=fjb5B8lCVKx2UcKAPxYATOxUzFysEXdT4vnSkCxW3n4Le/9nw6VQ3I3epUDpzXGE3+KtEK
	4fVoRq4pd5GZD1MhfR1qVI8/g3UdWu0rNwGOlNdC8+I7gesv9ExWKpfVWW2UAXSTsHWGDi
	q5fYthCLAPQgps0LghF6grLIwYjoYC5QhkUhnFI3ozbpNOeLYNS+7wIuIUH4GiES9VxOlM
	FfSvxj/2/eQAYxBAC0e35gEwdN/p20BIlIm6WwIIEEO72m11FXJeMWf7syxsVBkuHxOsIP
	1bMdfdrwnqBcGifaK9uVdXM7zEx0D/LdRvUZta5/AaL6uLZewkBtkDxpBxBW+w==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] classes/archiver: fix tarball content in "original" mode
Date: Tue, 18 Aug 2026 15:36:41 +0200
Message-ID: <20260818133641.1269741-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243684

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

This can be avoided by using "-C" option from tar's command, with which w=
e
can point to the tmpdir and to the content inside separately:

tar --exclude=3Dtemp --exclude=3Dpatches --exclude=3D'.pc' \
-C (...)/vim/9.1.1683/archiver-work/tmpv0m93p52 -cf - . | \
xz --memlimit=3D50% --threads=3D64 > \
(...)/vim/9.1.1683/archiver-sources/(...)/vim-9.1.1683-r0/vim-9.1.1683-r0=
.tar.xz

and in the result:

./
./vim-9.1.1683/
./vim-9.1.1683/SECURITY.md
./vim-9.1.1683/.codecov.yml
(...)

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/classes/archiver.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
index 3124b7040d..85b591c084 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -424,7 +424,12 @@ def create_tarball(d, srcdir, suffix, ar_outdir):
     bb.note('Creating %s' % tarname)
     dirname =3D os.path.dirname(srcdir)
     basename =3D os.path.basename(srcdir)
-    tar_cmd =3D ["tar", "--exclude=3Dtemp", "--exclude=3Dpatches", "--ex=
clude=3D.pc", '-cf', tarname, basename, '-I', compression_cmd]
+    if d.getVarFlag('ARCHIVER_MODE', 'src') =3D=3D "original":
+        tar_dir, content =3D srcdir, "."
+    else:
+        tar_dir, content =3D dirname, basename
+
+    tar_cmd =3D ["tar", "--exclude=3Dtemp", "--exclude=3Dpatches", "--ex=
clude=3D.pc", '-C', tar_dir, '-cf', tarname, content, '-I', compression_c=
md]
     subprocess.check_call(tar_cmd, cwd=3Ddirname)
=20
 # creating .diff.gz between source.orig and source
--=20
2.55.0


