Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUHZp-0004tK-AN
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 14:09:37 +0200
Received: by wwb17 with SMTP id 17so389124wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2011 05:06:18 -0700 (PDT)
Received: by 10.216.230.138 with SMTP id j10mr690508weq.46.1307534778099;
	Wed, 08 Jun 2011 05:06:18 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f73sm242354wef.19.2011.06.08.05.06.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 05:06:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2011 14:06:13 +0200
Message-Id: <1307534773-30707-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] avahi: fix dbus system-service packaging and move more things to .inc
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
X-List-Received-Date: Wed, 08 Jun 2011 12:09:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/avahi/avahi.inc       |   23 +++++++++++++++--------
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    9 +--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 9e26a20..2ab037e 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -17,14 +17,10 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0 gtk+ libglade"
 
-# uclibc has no nss
-RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
-RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
-
 SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
-        file://00avahi-autoipd \
-        file://99avahi-autoipd \
-        file://initscript.patch"
+          file://00avahi-autoipd \
+          file://99avahi-autoipd \
+          file://initscript.patch"
 
 inherit autotools pkgconfig update-rc.d gettext
 
@@ -34,6 +30,7 @@ EXTRA_OECONF = "--with-distro=debian \
              --disable-gdbm \
              --disable-mono \
              --disable-monodoc \
+             --disable-gtk3 \
              --disable-qt3 \
              --disable-qt4 \
              --disable-python \
@@ -64,6 +61,15 @@ pkg_postrm_avahi-systemd() {
 	systemctl disable avahi-daemon.service
 }
 
+# uclibc has no nss
+RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
+RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
+
+RDEPENDS_avahi-daemon = "sysvinit-pidof"
+
+FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
+                       ${sysconfdir}/avahi/avahi-autoipd.action \
+                       ${sysconfdir}/dhcp3/*/avahi-autoipd"
 FILES_libavahi-common = "${libdir}/libavahi-common.so.*"
 FILES_libavahi-core = "${libdir}/libavahi-core.so.*"
 FILES_libavahi-ui = "${libdir}/libavahi-ui.so.*"
@@ -78,7 +84,8 @@ FILES_avahi-daemon = "${sbindir}/avahi-daemon \
                       ${sysconfdir}/init.d/avahi-daemon \
                       ${datadir}/avahi/introspection/*.introspect \
                       ${datadir}/avahi/avahi-service.dtd \
-                      ${datadir}/avahi/service-types"
+                      ${datadir}/avahi/service-types \
+                      ${datadir}/dbus-1/system-services"
 FILES_libavahi-client = "${libdir}/libavahi-client.so.*"
 FILES_avahi-dnsconfd = "${sbindir}/avahi-dnsconfd \
                         ${sysconfdir}/avahi/avahi-dnsconfd.action \
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
index 23c0fa0..05716d0 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
@@ -6,14 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-RDEPENDS_avahi-daemon = "sysvinit-pidof"
-PR = "r3"
-
-EXTRA_OECONF += "--disable-gtk3"
-
-FILES_avahi-autoipd = "${sbindir}/avahi-autoipd \
-                       ${sysconfdir}/avahi/avahi-autoipd.action \
-		       ${sysconfdir}/dhcp3/*/avahi-autoipd"
+PR = "r4"
 
 SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
 SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
-- 
1.6.6.1



