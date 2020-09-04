Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.553.1599234165986939993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2020 08:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E24E0113E
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2020 08:42:44 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 853A63F66F
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Sep 2020 08:42:44 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] help2man: rewrite recipe
Date: Fri,  4 Sep 2020 16:42:36 +0100
Message-Id: <20200904154236.2112029-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This recipe was originally explicitly minimal because it was needed to
bootstrap autotools, but that isn't the case anymore.

Instead of being explicitly native, use BBCLASSEXTEND.

No need to explicitly depend on autoconf-native automake-native, because
the autotools class does that.

As this recipe isn't needed in early build anymore there's no need to
avoid reconfiguring.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc          |  2 +-
 ...2man-native_1.47.15.bb =3D> help2man_1.47.15.bb} | 15 +++++++--------
 2 files changed, 8 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.15.bb =3D> h=
elp2man_1.47.15.bb} (71%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 9f80970309..a094b39b2a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -255,7 +255,7 @@ RECIPE_MAINTAINER_pn-gtk-doc =3D "Alexander Kanavin <=
alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gzip =3D "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-harfbuzz =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-hdparm =3D "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-help2man-native =3D "Hongxu Jia <hongxu.jia@windriv=
er.com>"
+RECIPE_MAINTAINER_pn-help2man =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
 RECIPE_MAINTAINER_pn-hicolor-icon-theme =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
 RECIPE_MAINTAINER_pn-hwlatdetect =3D "Alexander Kanavin <alex.kanavin@gm=
ail.com>"
 RECIPE_MAINTAINER_pn-i2c-tools =3D "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.15.bb b/=
meta/recipes-devtools/help2man/help2man_1.47.15.bb
similarity index 71%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
rename to meta/recipes-devtools/help2man/help2man_1.47.15.bb
index 4f80a2bdb1..6ab9f6cbe7 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.15.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.47.15.bb
@@ -2,22 +2,21 @@ SUMMARY =3D "Program for creating simple man pages"
 SECTION =3D "devel"
 LICENSE =3D "GPLv3"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
-DEPENDS =3D "autoconf-native automake-native"
=20
 SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "c25a35b30eceb315361484b0ff1f81c924e8ee5c8881576f=
1ee762f001dbcd1c"
=20
-inherit autotools native
+inherit autotools
=20
-EXTRA_OECONF =3D "--disable-nls"
+# This is a hand-maintained aclocal.m4 but our autotools class currently=
 deletes
+# aclocal.m4.
+EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
=20
-# We don't want to reconfigure things as it would require 'perlnative' t=
o be
-# used.
-do_configure() {
-	oe_runconf
-}
+EXTRA_OECONF =3D "--disable-nls"
=20
 do_install_append () {
 	# Make sure we use /usr/bin/env perl
 	sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${D}${bindir}/help2man
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.28.0

