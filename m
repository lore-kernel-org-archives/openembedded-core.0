Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UE6FN-00043e-NH
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 23:58:49 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 23:42:01 +0100
Message-Id: <1362782523-17438-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] wpa-supplicant: change S to point to the top-level directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Mar 2013 22:59:18 -0000

This makes it possible to apply patches to ../src.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |   26 ++++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 75e85ae..9e4514a 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -3,9 +3,9 @@ HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
-                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
-                    file://wpa_supplicant.c;beginline=1;endline=12;md5=cba4fa09fa364da845ca546f21008909"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
+                    file://README;md5=5cb758942d25f6f61fd4ac388fd446fa \
+                    file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=cba4fa09fa364da845ca546f21008909"
 DEPENDS = "gnutls dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
@@ -21,7 +21,7 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant"
 
-S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
+S = "${WORKDIR}/wpa_supplicant-${PV}"
 
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
@@ -31,7 +31,7 @@ CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
 	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> ${WORKDIR}/defconfig-gnutls
-	install -m 0755 ${WORKDIR}/defconfig-gnutls .config
+	install -m 0755 ${WORKDIR}/defconfig-gnutls wpa_supplicant/.config
 }
 
 export EXTRA_CFLAGS = "${CFLAGS}"
@@ -39,19 +39,19 @@ export BINDIR = "${sbindir}"
 
 do_compile () {
 	unset CFLAGS CPPFLAGS CXXFLAGS
-	oe_runmake
+	oe_runmake -C wpa_supplicant
 }
 
 do_install () {
 	install -d ${D}${sbindir}
-	install -m 755 wpa_supplicant ${D}${sbindir}
-	install -m 755 wpa_cli        ${D}${sbindir}
+	install -m 755 wpa_supplicant/wpa_supplicant ${D}${sbindir}
+	install -m 755 wpa_supplicant/wpa_cli        ${D}${sbindir}
 
 	install -d ${D}${bindir}
-	install -m 755 wpa_passphrase ${D}${bindir}
+	install -m 755 wpa_supplicant/wpa_passphrase ${D}${bindir}
 
 	install -d ${D}${docdir}/wpa_supplicant
-	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
+	install -m 644 wpa_supplicant/README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
 
 	install -d ${D}${sysconfdir}
 	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
@@ -64,13 +64,13 @@ do_install () {
 	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
 
 	install -d ${D}/${sysconfdir}/dbus-1/system.d
-	install -m 644 ${S}/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
+	install -m 644 ${S}/wpa_supplicant/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
 	install -d ${D}/${datadir}/dbus-1/system-services
-	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
+	install -m 644 ${S}/wpa_supplicant/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
 	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}/${systemd_unitdir}/system
-		install -m 644 ${S}/systemd/*.service ${D}/${systemd_unitdir}/system
+		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_unitdir}/system
 	fi
 
 	install -d ${D}/etc/default/volatiles
-- 
1.7.10.4



