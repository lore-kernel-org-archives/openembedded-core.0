Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.40657.1601309950141826533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8319C1477
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F9D93F6CF
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] rpm: disable libarchive use
Date: Mon, 28 Sep 2020 17:18:56 +0100
Message-Id: <20200928161900.452970-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161900.452970-1-ross.burton@arm.com>
References: <20200928161900.452970-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

libarchive is only needed for the rpm2archive tool, as this is of
limited use and libarchive is a non-trivial build dependency make this
optional and disabled by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rpm/rpm_4.15.1.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.15.1.bb
index c9258632d2..71e2c033fd 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -49,7 +49,7 @@ SRCREV =3D "ab2179452c5be276a6b96c591afded485c7e58c3"
=20
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "openssl libarchive db file popt xz bzip2 dbus elfutils pyth=
on3"
+DEPENDS =3D "openssl db file popt xz bzip2 dbus elfutils python3"
 DEPENDS_append_class-native =3D " file-replacement-native bzip2-replacem=
ent-native"
=20
 inherit autotools gettext pkgconfig python3native
@@ -74,6 +74,7 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-utils"
+PACKAGECONFIG[rpm2archive] =3D "--with-archive,--without-archive,libarch=
ive"
=20
 ASNEEDED =3D ""
=20
@@ -95,7 +96,7 @@ WRAPPER_TOOLS =3D " \
=20
 do_install_append_class-native() {
         for tool in ${WRAPPER_TOOLS}; do
-                create_wrapper ${D}$tool \
+                test -x ${D}$tool && create_wrapper ${D}$tool \
                         RPM_CONFIGDIR=3D${STAGING_LIBDIR_NATIVE}/rpm \
                         RPM_ETCCONFIGDIR=3D${STAGING_DIR_NATIVE} \
                         MAGIC=3D${STAGING_DIR_NATIVE}${datadir_native}/m=
isc/magic.mgc \
@@ -105,7 +106,7 @@ do_install_append_class-native() {
=20
 do_install_append_class-nativesdk() {
         for tool in ${WRAPPER_TOOLS}; do
-                create_wrapper ${D}$tool \
+                test -x ${D}$tool && create_wrapper ${D}$tool \
                         RPM_CONFIGDIR=3D'`dirname $''realpath`'/${@os.pa=
th.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
                         RPM_ETCCONFIGDIR=3D'$'{RPM_ETCCONFIGDIR-'`dirnam=
e $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bind=
ir'))}/..} \
                         MAGIC=3D'`dirname $''realpath`'/${@os.path.relpa=
th(d.getVar('datadir'), d.getVar('bindir'))}/misc/magic.mgc \
--=20
2.25.1

