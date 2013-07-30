Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id D292D6ADB0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 13:14:01 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id p58so5161222wes.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 06:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Luj0S6LzccLI6pRZLvXIjoQBCynLs+mpePj+fI5dWZE=;
	b=Am+lc/FIzgIxA6Jz1b3xz6dQcLQM1Fk98rDfHTzQ3SPqaD4WMA6gpaxI/xdtusqDks
	VQvMhqamLWrGI+VF2al8o5qIKUO0vemRTxCSSTsxBHTJq6EG+niuo7d5NDn6aKoAsgi7
	zpv0KoF1W5+yNFbSEQTyXnQSci8TQNoIE3CMV38drNfSI8Yqmz5U2i2Ym+2RbHwXdDcu
	ProhAOSfb9WeOv3Rq9XIoE5Qr8RstYKjgM0jkI/RkBSLSdlIFI6VY7w3wXl20bGB1JtM
	9vBsYx5QNVpXsBKj++GS4XNO2IzJiNrhEMvm3oFSEhrV7kQd+dLAY8Cq1mwcADTGt+jO
	5N8g==
X-Received: by 10.195.12.202 with SMTP id es10mr47007440wjd.17.1375190041759; 
	Tue, 30 Jul 2013 06:14:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	s19sm28448933wik.11.2013.07.30.06.14.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 06:14:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 14:13:58 +0100
Message-Id: <1375190038-21751-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlZXiGMGw5dK9b4IVanUa9Ke18t7hrM9Imt/YbcDHGvaVxjbN1Z4J7/HIU/xzDD8MfpjkJb
Subject: [PATCH] bluez5: Add obex-profiles as a PACKAGECONFIG, package obexd separately
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
X-List-Received-Date: Tue, 30 Jul 2013 13:14:02 -0000

--enable-obex controls if obexd supports extra profiles (currently IRMC and
PBAB), which brings in a dependency on libical for the dummy phonebook
implementation.

Based on work by Saul Wold <sgw@linux.intel.com>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/buildhistory.bbclass           |    1 +
 meta/recipes-connectivity/bluez5/bluez5.inc |   13 ++++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 36e7fe1..c5bba25 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -531,6 +531,7 @@ END
 python buildhistory_eventhandler() {
     if e.data.getVar('BUILDHISTORY_FEATURES', True).strip():
         if e.data.getVar("BUILDHISTORY_COMMIT", True) == "1":
+            bb.note("Writing buildhistory")
             bb.build.exec_func("buildhistory_commit", e.data)
 }
 
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


