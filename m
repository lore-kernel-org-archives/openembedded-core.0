Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web08.295.1630513529581421631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 09:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=jQE5tWcp;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: "Kristian Klausen" <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1630513526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NpXV4sdsUD7aYwerPN7k4wT2fTmvLTCuOBlbUCdXJCA=;
	b=jQE5tWcpv0uey3+A0mutvpM0E/AD8mMuAOqmZYeoMYM+e2AyhK9NSdLGVKKMlTPQIlPnNS
	YW5wtErcaNjurIRizp4mTIeolG8f0xJRlX44UGI6m6+UbIDiJL8i814jG4Z4S/lo+Bqjfc
	V0JCaJcyBHROrSmVF3sUA+CJN1DjGR4=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH v2] systemd: Add repart PACKAGECONFIG
Date: Wed,  1 Sep 2021 18:21:39 +0200
Message-Id: <20210901162139.1239145-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

systemd-repart[1] is useful for partitioning the disk:
"systemd-repart grows and adds partitions to a partition table, based on
the configuration files described in repart.d(5)."[1]

openssl is required by repart, so it can be enabled like so:
PACKAGECONFIG +=3D "openssl repart"

[1] https://www.freedesktop.org/software/systemd/man/systemd-repart.html

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
V2:
Error if repart is specified without openssl.

 meta/recipes-core/systemd/systemd_249.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-co=
re/systemd/systemd_249.3.bb
index a6759c7a35..c2d4343f10 100644
--- a/meta/recipes-core/systemd/systemd_249.3.bb
+++ b/meta/recipes-core/systemd/systemd_249.3.bb
@@ -132,6 +132,7 @@ PACKAGECONFIG[efi] =3D "-Defi=3Dtrue,-Defi=3Dfalse"
 PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-libdir=3D${STAGING_LI=
BDIR} -Defi-includedir=3D${STAGING_INCDIR}/efi,-Dgnu-efi=3Dfalse,gnu-efi"
 PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfuti=
ls"
 PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
+PACKAGECONFIG[repart] =3D "-Drepart=3Dtrue,-Drepart=3Dfalse"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Dtrue,-Dgcrypt=3Dfalse,libgcrypt"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
@@ -713,6 +714,9 @@ INITSCRIPT_PARAMS:udev =3D "start 03 S ."
 python __anonymous() {
     if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,=
 d):
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+
+    if bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d) and =
not bb.utils.contains('PACKAGECONFIG', 'openssl', True, False, d):
+        bb.error("PACKAGECONFIG[repart] requires PACKAGECONFIG[openssl]"=
)
 }
=20
 python do_warn_musl() {

base-commit: 234a3e84640c1bb6df5fa4d3d7089a854b19d108
--=20
2.33.0

