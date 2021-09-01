Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web12.6920.1630498236572366719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 05:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=aZ+W9tcf;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: kristian@klausen.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1630498233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rQ5yWAcT3hddiI92nj+xK7Q8pJSEkDnhWIzbY2sqvlk=;
	b=aZ+W9tcfbt5qpFXl80ocp6XrTr+PtdK7gvyFJ2w8UK9FIOsYnS4L2vQYbfbARct5eUp5xy
	6DjsTglSnookch0fwiDD0IPgBto9T2AoUPBSwwB14TATEDSZbtTj09ytjrYR2QhkOfo33e
	9krm3N1mwkQuchCD4q+7Q5OyZghwnSM=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] systemd: Add repart PACKAGECONFIG
Date: Wed,  1 Sep 2021 14:10:04 +0200
Message-Id: <20210901121004.1235402-1-kristian@klausen.dk>
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
Is there a better way to handle the openssl requirement?

 meta/recipes-core/systemd/systemd_249.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-co=
re/systemd/systemd_249.3.bb
index a6759c7a35..9914c23fa8 100644
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
--=20
2.33.0

