Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6A3T-0006Th-VA
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 01:48:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 16:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50889701"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2011 16:43:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2011 16:43:24 -0700
Message-Id: <6fc87cc77b841c45824c14dbabed335a9f919500.1316562083.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316562083.git.sgw@linux.intel.com>
References: <cover.1316562083.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316562083.git.sgw@linux.intel.com>
References: <cover.1316562083.git.sgw@linux.intel.com>
Subject: [RC Fixes 8/8] avahi: Refactor recipe to move UI to avahi-ui
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Sep 2011 23:48:48 -0000

[YOCTO #1492]

This patch refactors avahi into a core non ui and avahi-ui, OE-Classic
has a similar factoring, and it was used as a refernce to make this
occur correctly here.

This allows the package to be built without gtk and GPLv3 issues.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb |   37 +++++++++
 meta/recipes-connectivity/avahi/avahi.inc          |   86 ++++++++++---------
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb    |    6 +-
 3 files changed, 87 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
new file mode 100644
index 0000000..e0733a9
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
@@ -0,0 +1,37 @@
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://avahi-common/address.h;endline=25;md5=b1d1d2cda1c07eb848ea7d6215712d9d \
+                    file://avahi-core/dns.h;endline=23;md5=6fe82590b81aa0ddea5095b548e2fdcb \
+                    file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
+                    file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
+
+require avahi.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS += "avahi gtk+ libglade"
+
+AVAHI_GTK = "--enable-gtk --disable-gtk3"
+
+S = "${WORKDIR}/avahi-${PV}"
+
+PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev python-avahi avahi-discover avahi-discover-standalone"
+
+FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
+FILES_${PN}-dbg += "${libdir}/.debug/libavah-ui*"
+FILES_${PN}-dev += "${libdir}/libavahi-ui*"
+
+FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
+
+FILES_python-avahi = "${PYTHON_SITEPACKAGES_DIR}/avahi/*"
+FILES_avahi-discover = "${bindir}/avahi-discover \
+                        ${datadir}/applications/avahi-discover.desktop \
+                        ${datadir}/avahi/interfaces/avahi-discover.glade"
+FILES_avahi-discover-standalone = "${bindir}/avahi-discover-standalone \
+                                   ${datadir}/avahi/interfaces/avahi-discover.glade"
+
+RDEPENDS_avahi-discover = "python-avahi python-pygtk"
+RDEPENDS_python-avahi = "python-dbus"
+
+
+SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
+SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 24ea458..a847394 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,8 +14,9 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-X11DEPENDS = "gtk+ libglade"
-DEPENDS = "expat libcap libdaemon dbus glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
+INC_PR = "r6"
+
+DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
 SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://00avahi-autoipd \
@@ -25,58 +26,38 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
 inherit autotools pkgconfig update-rc.d gettext
 
 EXTRA_OECONF = "--with-distro=debian \
+             --disable-introspection \
              --with-avahi-priv-access-group=adm \
              --disable-stack-protector \
              --disable-gdbm \
              --disable-mono \
              --disable-monodoc \
-             --disable-gtk3 \
-	     ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-gtk', '--disable-gtk', d)} \
              --disable-qt3 \
              --disable-qt4 \
              --disable-python \
              --disable-doxygen-doc \
              --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
-"
-
-PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-gobject avahi-autoipd avahi-ui-utils avahi-utils libavahi-ui libavahi-ui-dev"
+             ${AVAHI_GTK} \
+           "
 
-FILES_avahi-systemd = "${base_libdir}/systemd"
-RDEPENDS_avahi-systemd = "avahi-daemon"
+AVAHI_GTK ?= "--disable-gtk --disable-gtk3"
 
-pkg_postinst_avahi-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	
-	systemctl enable avahi-daemon.service
-}
-
-pkg_postrm_avahi-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
+LDFLAGS_append_libc-uclibc = " -lintl"
+LDFLAGS_append_uclinux-uclibc = " -lintl"
 
-	systemctl disable avahi-daemon.service
+do_configure_prepend() {
+    sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i configure.ac
 }
 
-# uclibc has no nss
-RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
-RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
 
-RDEPENDS_avahi-daemon = "sysvinit-pidof"
+PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
 
+FILES_avahi-systemd = "${base_libdir}/systemd"
 FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
                        ${sysconfdir}/avahi/avahi-autoipd.action \
                        ${sysconfdir}/dhcp3/*/avahi-autoipd"
 FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
 FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
-FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
-FILES_libavahi-ui-dev = "${libdir}/libavahi-ui.* \
-                         ${includedir}/avahi-ui/* \
-                         ${libdir}/pkgconfig/avahi-ui.pc"
 FILES_avahi-daemon = "${sbindir}/avahi-daemon \
                       ${sysconfdir}/avahi/avahi-daemon.conf \
                       ${sysconfdir}/avahi/hosts \
@@ -88,16 +69,19 @@ FILES_avahi-daemon = "${sbindir}/avahi-daemon \
                       ${datadir}/avahi/service-types \
                       ${datadir}/dbus-1/system-services"
 FILES_libavahi-client = "${libdir}/libavahi-client.so.*"
+FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
 FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
                         ${sysconfdir}/avahi/avahi-dnsconfd.action \
                         ${sysconfdir}/init.d/avahi-dnsconfd"
 FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
 FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
 FILES_avahi-utils = "${bindir}/avahi-*"
-FILES_avahi-ui-utils = "${bindir}/bssh ${bindir}/bvnc ${bindir}/bshell \
-                        ${bindir}/avahi-discover-standalone \
-                        ${datadir}/applications \
-                        ${datadir}/avahi/interfaces"
+
+RDEPENDS_avahi-daemon = "sysvinit-pidof"
+
+# uclibc has no nss
+RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
+RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
 
 RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev glib-2.0-dev update-rc.d-dev"
 RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
@@ -119,6 +103,14 @@ do_install() {
 	# /var/run of current version is empty, so just remove it.
 	# if /var/run become non-empty in the future, need to install it via volatile
 	rm -rf ${D}/var/run
+	rm -rf ${D}${datadir}/dbus-1/interfaces
+}
+
+do_install_avahi-autoipd() {
+	autotools_do_install
+	install -d ${D}${sysconfdir}/udhcpc.d
+	install ${WORKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
+	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
 }
 
 # At the time the postinst runs, dbus might not be setup so only restart if running
@@ -157,9 +149,21 @@ pkg_postrm_avahi-autoipd () {
 	delgroup avahi-autoipd || true
 }
 
-do_install_avahi-autoipd() {
-	autotools_do_install
-	install -d ${D}${sysconfdir}/udhcpc.d
-	install ${WORKDIR}/00avahi-autoipd ${D}${sysconfdir}/udhcpc.d
-	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
+pkg_postinst_avahi-systemd() {
+	# can't do this offline
+	if [ "x$D" != "x" ]; then
+		exit 1
+	fi
+	
+	systemctl enable avahi-daemon.service
 }
+
+pkg_postrm_avahi-systemd() {
+	# can't do this offline
+	if [ "x$D" != "x" ]; then
+		exit 1
+	fi
+
+	systemctl disable avahi-daemon.service
+}
+
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
index 05716d0..692a5df 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
@@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-PR = "r4"
+PR = "${INC_PR}.0"
+
+DEPENDS += "intltool-native"
+
+PACKAGES =+ "libavahi-gobject"
 
 SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
 SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
-- 
1.7.6



