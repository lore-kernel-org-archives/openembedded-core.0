Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1226A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 13:48:38 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id hq12so3676493wib.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 06:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=crGiJJSGQtDQ3NryV15Wf1xAl62dngEKgblgFkiaH9c=;
	b=XVh6EtevkZ5fgOFK8Qn45jiNwndR1clGQgvdQoOqAKbdciHNUGysQDNP8ld5dZXaMb
	n2Kyy9awPv8Z+PBP23qwY6YDWWNxQXyDylq/5QvmEsk9IqW3IVj2CTzfOTK8QWAQ+90m
	W+o0WJYtghyFeVHDdQTUkJSEYhZqpYSDD/oXsDUy7eldmoyM6HHHFgn5mKdhYPulUADL
	2qv41X2euC19uVkrD83lOt5FYYS3w9sePGaWmlpKqXBUYNrFXRnzXQ/r1S7kZxAwNrxV
	3Y4bZCOOgP9Zu46kAuorAqrKuyRhGICCJLH/q6jEFEOxdhICAAFc/ztYyxiGZewd6SeF
	uTtA==
X-Received: by 10.180.79.161 with SMTP id k1mr1041819wix.36.1375192118397;
	Tue, 30 Jul 2013 06:48:38 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	s19sm28651851wik.11.2013.07.30.06.48.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 06:48:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 14:48:34 +0100
Message-Id: <1375192114-11396-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnvVgYIqjoN4CSz/E3hlU6yJ/8kNqZ6D3MdDO84Svi0y8coYbRuw/iBz8bMr668//Zn4789
Subject: [PATCH][V2] bluez5: Add obex-profiles as a PACKAGECONFIG, package obexd separately
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
X-List-Received-Date: Tue, 30 Jul 2013 13:48:38 -0000

--enable-obex controls if obexd supports extra profiles (currently IRMC and
PBAB), which brings in a dependency on libical for the dummy phonebook
implementation.

Based on work by Saul Wold <sgw@linux.intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index fc78900..6ab05cf 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -6,12 +6,13 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
-DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck libical readline"
+DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
 
 RCONFLICTS_${PN} = "bluez4"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} obex-profiles"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
@@ -47,7 +48,7 @@ do_install_append() {
 }
 
 ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-test"
+PACKAGES =+ "libasound-module-bluez ${PN}-test ${PN}-obex"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
@@ -56,6 +57,12 @@ FILES_${PN}-dev += "\
   ${libdir}/alsa-lib/*.la \
 "
 
+FILES_${PN}-obex = "${libdir}/bluez5/bluetooth/obexd \
+                    ${libdir}/systemd/user/obex.service \
+                    ${datadir}/dbus-1/services/org.bluez.obex.service \
+                   "
+SYSTEMD_SERVICE_${PN}-obex = "obex.service"
+
 FILES_${PN}-test = "${libdir}/bluez/test/*"
 
 FILES_${PN}-dbg += "\
-- 
1.7.10.4


