Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7720.1626448148956093433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 08:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB89AD6E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 08:09:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84C513F774
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 08:09:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta: remove redundant ${libdir}/cmake from FILES_${PN}-dev
Date: Fri, 16 Jul 2021 16:09:05 +0100
Message-Id: <20210716150905.807592-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since oe-core 543e39ad "bitbake.conf: handle cmake -dev files packaging
with default rules" (June 2018) there's no need for recipes to add
${libdir}/cmake or ${datadir}/cmake to FILES_${PN}-dev themselves.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/dbus/dbus_1.12.20.bb                       | 2 +-
 meta/recipes-core/libxml/libxml2_2.9.12.bb                   | 2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb                 | 1 -
 meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb              | 2 --
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc            | 2 +-
 meta/recipes-support/bash-completion/bash-completion_2.11.bb | 2 --
 meta/recipes-support/gpgme/gpgme_1.16.0.bb                   | 4 +---
 7 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.12.20.bb b/meta/recipes-core/d=
bus/dbus_1.12.20.bb
index 32e7d9cfa3..2f6da67510 100644
--- a/meta/recipes-core/dbus/dbus_1.12.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.20.bb
@@ -71,7 +71,7 @@ FILES_${PN}-tools =3D "${bindir}/dbus-uuidgen \
 "
 FILES_${PN}-lib =3D "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib =3D "${PN}"
-FILES_${PN}-dev +=3D "${libdir}/dbus-1.0/include ${libdir}/cmake/DBus1 $=
{bindir}/dbus-test-tool ${datadir}/xml/dbus-1"
+FILES_${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-test-too=
l ${datadir}/xml/dbus-1"
=20
 PACKAGE_WRITE_DEPS +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd=
 sysvinit','systemd-systemctl-native','',d)}"
 pkg_postinst_dbus() {
diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-co=
re/libxml/libxml2_2.9.12.bb
index 955d934d7d..2d1e92966f 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
@@ -67,7 +67,7 @@ PACKAGE_BEFORE_PN +=3D "${PN}-utils"
 PACKAGES +=3D "${PN}-python"
=20
 FILES_${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.a"
-FILES_${PN}-dev +=3D "${libdir}/xml2Conf.sh ${libdir}/cmake/*"
+FILES_${PN}-dev +=3D "${libdir}/xml2Conf.sh"
 FILES_${PN}-utils =3D "${bindir}/*"
 FILES_${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
=20
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-=
gnome/gtk-doc/gtk-doc_1.33.2.bb
index 3b308318b2..23cd25986e 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -48,7 +48,6 @@ do_install_append () {
 }
=20
 FILES_${PN} +=3D "${datadir}/sgml"
-FILES_${PN}-dev +=3D "${libdir}/cmake"
 FILES_${PN}-doc =3D ""
=20
 SYSROOT_PREPROCESS_FUNCS_append_class-native =3D " gtkdoc_makefiles_sysr=
oot_preprocess"
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb b/meta/recip=
es-graphics/libsdl2/libsdl2_2.0.14.bb
index 54556abb27..3aac32159a 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
@@ -76,6 +76,4 @@ do_configure_prepend() {
         export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
 }
=20
-FILES_${PN}-dev +=3D "${libdir}/cmake"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
index 2c9e8167c4..4e226c616d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -182,7 +182,7 @@ FILES_libpulse =3D "${libdir}/libpulse.so.* ${sysconf=
dir}/pulse/client.conf"
 FILES_libpulse-simple =3D "${libdir}/libpulse-simple.so.*"
 FILES_libpulse-mainloop-glib =3D "${libdir}/libpulse-mainloop-glib.so.*"
=20
-FILES_${PN}-dev +=3D "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala=
 ${libdir}/cmake"  =20
+FILES_${PN}-dev +=3D "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala=
"
 FILES_${PN}-bin +=3D "${sysconfdir}/default/volatiles/04_pulse"
 FILES_${PN}-pa-info =3D "${bindir}/pa-info"
 FILES_${PN}-server =3D "${bindir}/pulseaudio ${bindir}/start-* ${sysconf=
dir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${sy=
stemd_user_unitdir}/*"
diff --git a/meta/recipes-support/bash-completion/bash-completion_2.11.bb=
 b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
index 4076535902..67738c3c83 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.11.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.11.bb
@@ -37,6 +37,4 @@ PACKAGES =3D+ "${PN}-extra"
 FILES_${PN}-extra =3D "${datadir}/${BPN}/completions/ \
     ${datadir}/${BPN}/helpers/"
=20
-FILES_${PN}-dev +=3D "${datadir}/cmake"
-
 BBCLASSEXTEND =3D "nativesdk"
diff --git a/meta/recipes-support/gpgme/gpgme_1.16.0.bb b/meta/recipes-su=
pport/gpgme/gpgme_1.16.0.bb
index da413c80a0..df3352e292 100644
--- a/meta/recipes-support/gpgme/gpgme_1.16.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.16.0.bb
@@ -71,9 +71,7 @@ PACKAGES =3D. "${@bb.utils.contains('PACKAGECONFIG', 'p=
ython3', 'python3-gpg ', ''
 FILES_${PN}-cpp =3D "${libdir}/libgpgmepp.so.*"
 FILES_python2-gpg =3D "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES_python3-gpg =3D "${PYTHON_SITEPACKAGES_DIR}/*"
-FILES_${PN}-dev +=3D "${datadir}/common-lisp/source/gpgme/* \
-                    ${libdir}/cmake/* \
-"
+FILES_${PN}-dev +=3D "${datadir}/common-lisp/source/gpgme/*"
=20
 CFLAGS_append_libc-musl =3D " -D__error_t_defined "
 do_configure_prepend () {
--=20
2.25.1

