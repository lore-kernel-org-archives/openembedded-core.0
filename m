Received: from mailout09.rmx.de (mailout09.rmx.de [94.199.88.74])
 by mx.groups.io with SMTP id smtpd.web10.16509.1592830468864629954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 05:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.74, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout09.rmx.de (Postfix) with ESMTPS id 49r8W46Plzzbg6f
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:54:24 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 49r8Vy0rfzz2TSDs
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:54:18 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Mon, 22 Jun 2020 14:54:16 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.60) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 22 Jun
 2020 14:54:16 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [PATCH v2 2/2] eudev: Extend for native/nativesdk
Date: Mon, 22 Jun 2020 14:53:59 +0200
Message-ID: <20200622125359.11587-3-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622125359.11587-1-ceggers@arri.de>
References: <20200622125359.11587-1-ceggers@arri.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.60]
X-OriginalArrivalTime: 22 Jun 2020 12:54:16.0707 (UTC) FILETIME=[3CD6AD30:01D64894]
X-RMX-ID: 20200622-145420-49r8Vy0rfzz2TSDs-0@kdin02
X-RMX-SOURCE: 217.111.95.7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

libudev is required by networkmanager.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta/recipes-core/udev/eudev_3.2.9.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/udev/eudev_3.2.9.bb b/meta/recipes-core/ud=
ev/eudev_3.2.9.bb
index f96f8cbe78..0009896ab9 100644
--- a/meta/recipes-core/udev/eudev_3.2.9.bb
+++ b/meta/recipes-core/udev/eudev_3.2.9.bb
@@ -61,12 +61,22 @@ do_install_prepend_class-target () {
 	sed -i -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
 		${B}/src/udev/keyboard-keys-from-name.h
 }
+do_install_append_class-native() {
+	# for -native, we only want to install libudev
+	rm -r ${D}${sysconfdir} ${D}${nonarch_base_libdir}/udev ${D}${base_sbin=
dir} ${D}${bindir} ${D}${libexecdir}
+}
+do_install_append_class-nativesdk() {
+	# for -nativesdk, we only want to install libudev
+	rm -r ${D}${sysconfdir} ${D}${nonarch_base_libdir}/udev ${D}${base_sbin=
dir} ${D}${bindir} ${D}${libexecdir}
+}
=20
 INITSCRIPT_NAME =3D "udev"
 INITSCRIPT_PARAMS =3D "start 04 S ."
=20
 PACKAGES =3D+ "libudev"
 PACKAGES =3D+ "eudev-hwdb"
+# For nativesdk, we only want to package libudev
+PACKAGES_remove_class-nativesdk =3D "${PN} eudev-hwdb"
=20
=20
 FILES_${PN} +=3D "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/ud=
evadm"
@@ -81,6 +91,7 @@ RDEPENDS_eudev-hwdb +=3D "eudev"
=20
 RPROVIDES_${PN} =3D "hotplug udev"
 RPROVIDES_eudev-hwdb +=3D "udev-hwdb"
+RPROVIDES_libudev_class-nativesdk =3D "${PN}"
=20
 PACKAGE_WRITE_DEPS +=3D "qemu-native"
 pkg_postinst_eudev-hwdb () {
@@ -94,3 +105,5 @@ pkg_postinst_eudev-hwdb () {
 pkg_prerm_eudev-hwdb () {
         rm -f $D${sysconfdir}/udev/hwdb.bin
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Traunin=
ger; Markus Zeiler

