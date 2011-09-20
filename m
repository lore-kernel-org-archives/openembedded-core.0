Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R67Ov-0001Mx-Sw
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 22:58:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 13:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="50443809"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga001.jf.intel.com with ESMTP; 20 Sep 2011 13:53:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2011 13:53:24 -0700
Message-Id: <d88ccdfb100573e0c56b666511cf1305de957471.1316551810.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316551810.git.sgw@linux.intel.com>
References: <cover.1316551810.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316551810.git.sgw@linux.intel.com>
References: <cover.1316551810.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] avahi: remove avahi-ui related packages
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
X-List-Received-Date: Tue, 20 Sep 2011 20:58:46 -0000

[YOCTO #1492]

This patch removes the UI related packages from avahi. This
allows the package to be built without gtk and GPLv3 issues.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc       |   19 +++++++------------
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    2 +-
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 24ea458..025805a 100644
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
@@ -30,8 +31,8 @@ EXTRA_OECONF = "--with-distro=debian \
              --disable-gdbm \
              --disable-mono \
              --disable-monodoc \
+             --disable-gtk \
              --disable-gtk3 \
-	     ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-gtk', '--disable-gtk', d)} \
              --disable-qt3 \
              --disable-qt4 \
              --disable-python \
@@ -39,7 +40,7 @@ EXTRA_OECONF = "--with-distro=debian \
              --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
 "
 
-PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-gobject avahi-autoipd avahi-ui-utils avahi-utils libavahi-ui libavahi-ui-dev"
+PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-gobject libavahi-ui avahi-autoipd avahi-utils"
 
 FILES_avahi-systemd = "${base_libdir}/systemd"
 RDEPENDS_avahi-systemd = "avahi-daemon"
@@ -73,10 +74,6 @@ FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
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
@@ -88,16 +85,13 @@ FILES_avahi-daemon = "${sbindir}/avahi-daemon \
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
 
 RRECOMMENDS_avahi-dev = "expat-dev libcap-dev libdaemon-dev dbus-dev glib-2.0-dev update-rc.d-dev"
 RRECOMMENDS_avahi-dev_append_libc-glibc = " gettext-dev"
@@ -119,6 +113,7 @@ do_install() {
 	# /var/run of current version is empty, so just remove it.
 	# if /var/run become non-empty in the future, need to install it via volatile
 	rm -rf ${D}/var/run
+	rm -rf ${D}${datadir}/dbus-1/interfaces
 }
 
 # At the time the postinst runs, dbus might not be setup so only restart if running
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
index 05716d0..5094961 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-PR = "r4"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
 SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
-- 
1.7.6



