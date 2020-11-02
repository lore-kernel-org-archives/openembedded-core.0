Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.29305.1604314280938175876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 02:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 045DD101E
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2020 02:51:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A38413F66E
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2020 02:51:17 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rpm: use libgcrypt instead of OpenSSL for cryptography
Date: Mon,  2 Nov 2020 10:51:15 +0000
Message-Id: <20201102105115.2203462-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

RPM 4.16 uses libgcrypt by default[1], so change our build to follow.

[1] https://github.com/rpm-software-management/rpm/commit/5c0801a1a3cba56=
d5c7e379323242e26f33f0729

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rpm/rpm_4.16.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.16.0.bb b/meta/recipes-devto=
ols/rpm/rpm_4.16.0.bb
index f01874fe38..1d34b41acc 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.0.bb
@@ -47,7 +47,7 @@ SRCREV =3D "cd7f9303ef1070f027493cad7d00bc66935af2a0"
=20
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "openssl db file popt xz bzip2 elfutils python3"
+DEPENDS =3D "libgcrypt db file popt xz bzip2 elfutils python3"
 DEPENDS_append_class-native =3D " file-replacement-native bzip2-replacem=
ent-native"
=20
 inherit autotools gettext pkgconfig python3native
@@ -58,7 +58,7 @@ AUTOTOOLS_AUXDIR =3D "${S}/build-aux"
 # OE-core patches autoreconf to additionally run gnu-configize, which fa=
ils with this recipe
 EXTRA_AUTORECONF_append =3D " --exclude=3Dgnu-configize"
=20
-EXTRA_OECONF_append =3D " --without-lua --enable-python --with-crypto=3D=
openssl"
+EXTRA_OECONF_append =3D " --without-lua --enable-python --with-crypto=3D=
libgcrypt"
 EXTRA_OECONF_append_libc-musl =3D " --disable-nls --disable-openmp"
=20
 # --sysconfdir prevents rpm from attempting to access machine-specific c=
onfiguration in sysroot/etc; we need to have it in rootfs
--=20
2.25.1

