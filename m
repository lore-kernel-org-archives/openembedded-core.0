Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A50B3786EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 05:58:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5L5vZp2010436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 22:58:00 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 20 Jun 2018 22:57:51 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2018 14:00:22 +0800
Message-ID: <ebe6e619b682f90b87ae2a3f1e639f42afa08f39.1529478911.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1529478911.git.Qi.Chen@windriver.com>
References: <cover.1529478911.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] avahi: reorganize codes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2018 05:58:09 -0000
Content-Type: text/plain

This patch does nothing but reorganizing codes.

avahi.inc is shared by avahi and avahi-ui recipes. Move common things
into it, and move uncommon things out of it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.7.bb | 16 +----
 meta/recipes-connectivity/avahi/avahi.inc       | 84 ++++---------------------
 meta/recipes-connectivity/avahi/avahi_0.7.bb    | 83 ++++++++++++++++++++----
 3 files changed, 83 insertions(+), 100 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
index 5648e38..a77653b 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
@@ -1,31 +1,18 @@
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
-                    file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
-                    file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
-                    file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
-
 require avahi.inc
 
 inherit distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
-SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
-
 DEPENDS += "avahi"
 
 AVAHI_GTK = "gtk3"
 
 S = "${WORKDIR}/avahi-${PV}"
 
-PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc avahi-discover"
+PACKAGES += "${PN}-utils avahi-discover"
 
 FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
-FILES_${PN}-dev += "${libdir}/libavahi-ui${SOLIBSDEV}"
-FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
-
 FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
-
 FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
                         ${datadir}/avahi/interfaces/avahi-discover.ui \
                         ${bindir}/avahi-discover-standalone \
@@ -59,4 +46,3 @@ do_install_append () {
         rm ${D}${libdir}/girepository-1.0/ -rf
         rm ${D}${datadir}/gir-1.0/ -rf
 }
-
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index ec368de..1184684 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -13,15 +13,19 @@ SECTION = "network"
 # major part is under LGPLv2.1+, but several .dtd, .xsl, initscripts and
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
+                    file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
+                    file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
+                    file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
+SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz"
 
-SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
-          file://00avahi-autoipd \
-          file://99avahi-autoipd \
-          file://initscript.patch \
-          "
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
+SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
+SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
+
+DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
 
 # For gtk related PACKAGECONFIGs: gtk, gtk3
 AVAHI_GTK ?= ""
@@ -31,18 +35,7 @@ PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
 
-USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
-USERADD_PARAM_avahi-daemon = "--system --home /run/avahi-daemon \
-                              --no-create-home --shell /bin/false \
-                              --user-group avahi"
-
-USERADD_PARAM_avahi-autoipd = "--system --home /run/avahi-autoipd \
-                              --no-create-home --shell /bin/false \
-                              --user-group \
-                              -c \"Avahi autoip daemon\" \
-                              avahi-autoipd"
-
-inherit autotools pkgconfig update-rc.d gettext useradd gobject-introspection
+inherit autotools pkgconfig gettext gobject-introspection
 
 EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
              --disable-stack-protector \
@@ -73,67 +66,12 @@ do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/avahi-gobject/.libs:${B}/avahi-common/.libs:${B}/avahi-client/.libs:${B}/avahi-glib/.libs"
 }
 
-PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
-
-# As avahi doesn't put any files into PN, clear the files list to avoid problems
-# if extra libraries appear.
-FILES_${PN} = ""
-FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
-                       ${sysconfdir}/avahi/avahi-autoipd.action \
-                       ${sysconfdir}/dhcp/*/avahi-autoipd \
-                       ${sysconfdir}/udhcpc.d/00avahi-autoipd \
-                       ${sysconfdir}/udhcpc.d/99avahi-autoipd"
-FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
-FILES_libavahi-core = "${libdir}/libavahi-core.so.* ${libdir}/girepository-1.0/AvahiCore*.typelib"
-FILES_avahi-daemon = "${sbindir}/avahi-daemon \
-                      ${sysconfdir}/avahi/avahi-daemon.conf \
-                      ${sysconfdir}/avahi/hosts \
-                      ${sysconfdir}/avahi/services \
-                      ${sysconfdir}/dbus-1 \
-                      ${sysconfdir}/init.d/avahi-daemon \
-                      ${datadir}/avahi/introspection/*.introspect \
-                      ${datadir}/avahi/avahi-service.dtd \
-                      ${datadir}/avahi/service-types \
-                      ${datadir}/dbus-1/system-services"
-FILES_libavahi-client = "${libdir}/libavahi-client.so.*"
-FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
-FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
-                        ${sysconfdir}/avahi/avahi-dnsconfd.action \
-                        ${sysconfdir}/init.d/avahi-dnsconfd"
-FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
-FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*  ${libdir}/girepository-1.0/Avahi*.typelib"
-FILES_avahi-utils = "${bindir}/avahi-*"
-
-RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
-
-RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
 RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
 
-CONFFILES_avahi-daemon = "${sysconfdir}/avahi/avahi-daemon.conf"
-
-INITSCRIPT_PACKAGES = "avahi-daemon avahi-dnsconfd"
-INITSCRIPT_NAME_avahi-daemon = "avahi-daemon"
-INITSCRIPT_PARAMS_avahi-daemon = "defaults 21 19"
-INITSCRIPT_NAME_avahi-dnsconfd = "avahi-dnsconfd"
-INITSCRIPT_PARAMS_avahi-dnsconfd = "defaults 22 19"
-
 do_install() {
 	autotools_do_install
 	rm -rf ${D}/run
 	rm -rf ${D}${datadir}/dbus-1/interfaces
 	test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi
-
-	install -d ${D}${sysconfdir}/udhcpc.d
-	install ${WORKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
-	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
-}
-
-# At the time the postinst runs, dbus might not be setup so only restart if running 
-# Don't exit early, because update-rc.d needs to run subsequently.
-
-pkg_postinst_avahi-daemon () {
-if [ -z "$D" ]; then
-	killall -q -HUP dbus-daemon || true
-fi
 }
diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
index 7c91f10..b695be9 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
@@ -1,20 +1,79 @@
 require avahi.inc
 
-inherit systemd
+SRC_URI += "file://00avahi-autoipd \
+           file://99avahi-autoipd \
+           file://initscript.patch \
+           "
+
+inherit update-rc.d systemd useradd
+
+PACKAGES =+ "libavahi-gobject avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib avahi-autoipd avahi-utils"
+
+# As avahi doesn't put any files into PN, clear the files list to avoid problems
+# if extra libraries appear.
+FILES_${PN} = ""
+FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
+                       ${sysconfdir}/avahi/avahi-autoipd.action \
+                       ${sysconfdir}/dhcp/*/avahi-autoipd \
+                       ${sysconfdir}/udhcpc.d/00avahi-autoipd \
+                       ${sysconfdir}/udhcpc.d/99avahi-autoipd"
+FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
+FILES_libavahi-core = "${libdir}/libavahi-core.so.* ${libdir}/girepository-1.0/AvahiCore*.typelib"
+FILES_avahi-daemon = "${sbindir}/avahi-daemon \
+                      ${sysconfdir}/avahi/avahi-daemon.conf \
+                      ${sysconfdir}/avahi/hosts \
+                      ${sysconfdir}/avahi/services \
+                      ${sysconfdir}/dbus-1 \
+                      ${sysconfdir}/init.d/avahi-daemon \
+                      ${datadir}/avahi/introspection/*.introspect \
+                      ${datadir}/avahi/avahi-service.dtd \
+                      ${datadir}/avahi/service-types \
+                      ${datadir}/dbus-1/system-services"
+FILES_libavahi-client = "${libdir}/libavahi-client.so.*"
+FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
+                        ${sysconfdir}/avahi/avahi-dnsconfd.action \
+                        ${sysconfdir}/init.d/avahi-dnsconfd"
+FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
+FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*  ${libdir}/girepository-1.0/Avahi*.typelib"
+FILES_avahi-utils = "${bindir}/avahi-*"
+
+RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
+
+RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
+
+CONFFILES_avahi-daemon = "${sysconfdir}/avahi/avahi-daemon.conf"
+
+USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
+USERADD_PARAM_avahi-daemon = "--system --home /run/avahi-daemon \
+                              --no-create-home --shell /bin/false \
+                              --user-group avahi"
+
+USERADD_PARAM_avahi-autoipd = "--system --home /run/avahi-autoipd \
+                              --no-create-home --shell /bin/false \
+                              --user-group \
+                              -c \"Avahi autoip daemon\" \
+                              avahi-autoipd"
+
+INITSCRIPT_PACKAGES = "avahi-daemon avahi-dnsconfd"
+INITSCRIPT_NAME_avahi-daemon = "avahi-daemon"
+INITSCRIPT_PARAMS_avahi-daemon = "defaults 21 19"
+INITSCRIPT_NAME_avahi-dnsconfd = "avahi-dnsconfd"
+INITSCRIPT_PARAMS_avahi-dnsconfd = "defaults 22 19"
 
 SYSTEMD_PACKAGES = "${PN}-daemon ${PN}-dnsconfd"
 SYSTEMD_SERVICE_${PN}-daemon = "avahi-daemon.service"
 SYSTEMD_SERVICE_${PN}-dnsconfd = "avahi-dnsconfd.service"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
-                    file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
-                    file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
-                    file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
-
-SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
-SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
-
-DEPENDS += "intltool-native"
+do_install_append() {
+	install -d ${D}${sysconfdir}/udhcpc.d
+	install ${WORKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
+	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
+}
 
-PACKAGES =+ "libavahi-gobject"
+# At the time the postinst runs, dbus might not be setup so only restart if running 
+# Don't exit early, because update-rc.d needs to run subsequently.
+pkg_postinst_avahi-daemon () {
+if [ -z "$D" ]; then
+	killall -q -HUP dbus-daemon || true
+fi
+}
-- 
1.9.1


