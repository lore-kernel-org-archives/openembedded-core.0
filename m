Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40847.1601309951751722436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15F7114BF
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:09 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5F033F6CF
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] rpm: add PACKAGECONFIG for the systemd inhibit plugin
Date: Mon, 28 Sep 2020 17:18:57 +0100
Message-Id: <20200928161900.452970-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161900.452970-1-ross.burton@arm.com>
References: <20200928161900.452970-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

RPM ships a systemd inhibit plugin, that will tell systemd to inhibit a
reboot or sleep during a package upgrades.

For native RPM this is entirely useless, and for target it's only useful
if you're using systemd+logind+rpm.

This plugin uses DBus which means it depends on expat -> cmake-native ->
libarchive-native curl-native, which is quite a dependency tree to need
in early build (required to build packages via rpm-native).

It was previously forcibly disabled for native packages but the build
dependency on DBus remained.  Remove that logic and add a PACKAGECONFIG
for the plugin that is only enabled for target builds with systemd and
explicitly disabled for native/nativesdk builds.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rpm/rpm_4.15.1.bb | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.15.1.bb
index 71e2c033fd..a5b811087b 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -49,7 +49,7 @@ SRCREV =3D "ab2179452c5be276a6b96c591afded485c7e58c3"
=20
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "openssl db file popt xz bzip2 dbus elfutils python3"
+DEPENDS =3D "openssl db file popt xz bzip2 elfutils python3"
 DEPENDS_append_class-native =3D " file-replacement-native bzip2-replacem=
ent-native"
=20
 inherit autotools gettext pkgconfig python3native
@@ -62,18 +62,19 @@ EXTRA_OECONF_append =3D " --without-lua --enable-pyth=
on --with-crypto=3Dopenssl"
 EXTRA_OECONF_append_libc-musl =3D " --disable-nls --disable-openmp"
=20
 # --sysconfdir prevents rpm from attempting to access machine-specific c=
onfiguration in sysroot/etc; we need to have it in rootfs
-#
 # --localstatedir prevents rpm from writing its database to native sysro=
ot when building images
-#
-# Disable dbus for native, so that rpm doesn't attempt to inhibit shutdo=
wn via session dbus even when plugins support is enabled.
-# Also disable plugins by default for native.
-EXTRA_OECONF_append_class-native =3D " --sysconfdir=3D/etc --localstated=
ir=3D/var --disable-plugins"
-EXTRA_OECONF_append_class-nativesdk =3D " --sysconfdir=3D/etc --disable-=
plugins"
+EXTRA_OECONF_append_class-native =3D " --sysconfdir=3D/etc --localstated=
ir=3D/var"
+EXTRA_OECONF_append_class-nativesdk =3D " --sysconfdir=3D/etc"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'inhibit', '', d)}"
+# The inhibit plugin serves no purpose outside of the target
+PACKAGECONFIG_remove_class-native =3D "inhibit"
+PACKAGECONFIG_remove_class-nativesdk =3D "inhibit"
+
 PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-utils"
+PACKAGECONFIG[inhibit] =3D "--enable-inhibit-plugin,--disable-inhibit-pl=
ugin,dbus"
 PACKAGECONFIG[rpm2archive] =3D "--with-archive,--without-archive,libarch=
ive"
=20
 ASNEEDED =3D ""
--=20
2.25.1

