Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11003.1793711917136047112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 05:18:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Z+hVDTDG;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 378FA1595
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 05:18:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E4D373F632
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 05:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793711916; bh=eGacEYSx7qQUWkf/wfu1f/IWhoImZPRLEuavT3x8G68=;
	h=From:To:Subject:Date:From;
	b=Z+hVDTDGn3SdmZgLwbg9xtA5cwavrBpai2wGrDpXTB24dP450NQ634Iv2LG3BNa8R
	 NzgYh+KAwtoiz8t6IIv5ufbiF1pWHL8kXXe+iDz34EP1HD0TV6zVG+TSijA2Y81fD7
	 BOy1+ueR7dPb5UgcTINfkyiLoMKSc6DQTgB4eO+E=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] automake: remove bb/inc split
Date: Tue,  3 Nov 2026 13:18:31 +0000
Message-ID: <20261103131831.1622873-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 13:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249279
Content-Type: text/plain; charset="utf-8"

There's no poiint having this split as there's only one recipe.

As part of the merge we can do some cleanup

- Remove the AUTOMAKE assignment which is not used as we don't
  autoreconf automake
- Remove NAMEVER, never used
- Remove a redundant mkdir of ${datadir}, as automake always installs
  files into there.

Confirmed that the output is bit-for-bit identical after this change.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/automake/automake.inc   | 21 -------
 .../automake/automake_1.19.bb                 | 56 +++++++++++--------
 2 files changed, 33 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake.inc

diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-d=
evtools/automake/automake.inc
deleted file mode 100644
index 9946c73c715..00000000000
--- a/meta/recipes-devtools/automake/automake.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY =3D "A GNU tool for automatically generating Makefiles"
-DESCRIPTION =3D "Automake is a tool for automatically generating `Makefi=
le.in' files compliant with the GNU Coding \
-Standards. Automake requires the use of Autoconf."
-LICENSE =3D "GPL-2.0-only"
-HOMEPAGE =3D "http://www.gnu.org/software/automake/"
-SECTION =3D "devel"
-
-SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.gz"
-
-inherit autotools texinfo
-
-do_configure() {
-	# We can end up patching macros, which would then mean autoreconf
-	# Cheat by saying everything is up to date.
-	touch ${S}/aclocal.m4 ${S}/Makefile.in ${S}/configure
-	oe_runconf
-}
-
-export AUTOMAKE =3D "${@bb.utils.which('automake', d.getVar('PATH'))}"
-
-FILES:${PN} +=3D "${datadir}/automake* ${datadir}/aclocal*"
diff --git a/meta/recipes-devtools/automake/automake_1.19.bb b/meta/recip=
es-devtools/automake/automake_1.19.bb
index 0ee4d8facfa..aaf3ab9a6f5 100644
--- a/meta/recipes-devtools/automake/automake_1.19.bb
+++ b/meta/recipes-devtools/automake/automake_1.19.bb
@@ -1,10 +1,38 @@
-require automake.inc
-
+SUMMARY =3D "A GNU tool for automatically generating Makefiles"
+DESCRIPTION =3D "Automake is a tool for automatically generating `Makefi=
le.in' files compliant with the GNU Coding \
+Standards. Automake requires the use of Autoconf."
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
-DEPENDS:class-native =3D "autoconf-native"
+HOMEPAGE =3D "http://www.gnu.org/software/automake/"
+SECTION =3D "devel"
=20
-NAMEVER =3D "${@oe.utils.trim_version("${PV}", 2)}"
+DEPENDS =3D "autoconf-native"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.gz \
+           file://0002-automake-Update-for-python.m4-to-respect-libdir.p=
atch \
+           file://0004-Add-a-new-distro-feature-ptest.patch \
+           file://0006-automake-Remove-delays-in-configure-scripts-using=
-au.patch \
+           "
+
+SRC_URI[sha256sum] =3D "79e8b1f7a967e87ce8a9ded76bee7f793d0ce1886ab2002f=
eb1b0510f578b75a"
+
+inherit autotools texinfo
+
+PERL =3D "${USRBINPATH}/perl"
+PERL:class-native =3D "${USRBINPATH}/env perl"
+PERL:class-nativesdk =3D "${USRBINPATH}/env perl"
+
+CACHED_CONFIGUREVARS +=3D "ac_cv_path_PERL=3D'${PERL}'"
+
+do_configure() {
+	# We can end up patching macros, which would then mean autoreconf
+	# Cheat by saying everything is up to date.
+	touch ${S}/aclocal.m4 ${S}/Makefile.in ${S}/configure
+	oe_runconf
+}
+
+FILES:${PN} +=3D "${datadir}/automake* ${datadir}/aclocal*"
=20
 RDEPENDS:${PN} +=3D "\
     autoconf \
@@ -19,22 +47,4 @@ RDEPENDS:${PN} +=3D "\
=20
 RDEPENDS:${PN}:class-native =3D "autoconf-native hostperl-runtime-native=
"
=20
-SRC_URI +=3D "\
-           file://0002-automake-Update-for-python.m4-to-respect-libdir.p=
atch \
-           file://0004-Add-a-new-distro-feature-ptest.patch \
-           file://0006-automake-Remove-delays-in-configure-scripts-using=
-au.patch \
-           "
-
-SRC_URI[sha256sum] =3D "79e8b1f7a967e87ce8a9ded76bee7f793d0ce1886ab2002f=
eb1b0510f578b75a"
-
-PERL =3D "${USRBINPATH}/perl"
-PERL:class-native =3D "${USRBINPATH}/env perl"
-PERL:class-nativesdk =3D "${USRBINPATH}/env perl"
-
-CACHED_CONFIGUREVARS +=3D "ac_cv_path_PERL=3D'${PERL}'"
-
-do_install:append () {
-    install -d ${D}${datadir}
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0

