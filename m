Received: from mail-we0-f173.google.com ([74.125.82.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UWn1t-0007VR-Pj
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 14:18:02 +0200
Received: by mail-we0-f173.google.com with SMTP id o7so5248495wea.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 05:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=iu2SAYhBw0WuGedWc3aQTQZ/7v3EBE2BCjpSOiZ5J10=;
	b=j6B0dLmAMEuvWI6l+m/KRbhANpezVd9ukFTeWt/Hi7X87oGB1i4aNfwpz00DKu15ub
	M7g+6Z6rsotdxuDBXPgDFavF1+wrE0IiWXR1/3C5VkNPpkuScM0UPK0SPoNC/iCl5XPd
	9vIwImAWTGGkruqsdUF+I/3utqBPVNjY2FwCiW1N7rxCAhdq9pwJ0Fug8yFUCKD0juEL
	rzvWa8PqVEKK1ERyZpnemhfXlwulMq2oXbarVMsPlH+nxDGJl0am1FiYzmPyq4XpLL0h
	Q+YzlyNSxamqfWGhkO6r2UTkKDIhH5TD5oNGHk6FU2PNxJxpvEgyW7KZCmsREPzJgRv7
	vCMw==
X-Received: by 10.194.173.167 with SMTP id bl7mr96239588wjc.50.1367236812806; 
	Mon, 29 Apr 2013 05:00:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dj7sm19751410wib.6.2013.04.29.05.00.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 05:00:12 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 12:57:14 +0100
Message-Id: <1367236635-27036-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkCKSdbu/R7VSAl08RldFmxB9xmE5CmG4On3Q5YUQHbnD1ST7cmJfHV9oCpDlMpac4KiUcM
Subject: [PATCH 1/2] neard: re-order recipe so the statement order is logical
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
X-List-Received-Date: Mon, 29 Apr 2013 12:18:10 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/neard/neard_0.9.bb |   54 ++++++++++++--------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.9.bb b/meta/recipes-connectivity/neard/neard_0.9.bb
index d598666..2c4acb3 100644
--- a/meta/recipes-connectivity/neard/neard_0.9.bb
+++ b/meta/recipes-connectivity/neard/neard_0.9.bb
@@ -1,15 +1,26 @@
-SUMMARY  = "Linux NFC daemon"
+SUMMARY = "Linux NFC daemon"
 DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
 HOMEPAGE = "http://01.org/linux-nfc"
+LICENSE = "GPLv2"
 
-LICENSE  = "GPLv2"
+DEPENDS = "dbus glib-2.0 libnl"
 
-DEPENDS  = "dbus glib-2.0 libnl"
+SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
+           file://neard.in \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+ file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
+ "
+
+S = "${WORKDIR}/git"
+SRCREV = "eb486bf35e24d7d1db61350f5ab393a0c880523d"
+PV = "0.10+git${SRCPV}"
+PR = "r0"
 
 inherit autotools pkgconfig update-rc.d
 
-INITSCRIPT_NAME = "neard"
-INITSCRIPT_PARAMS = "defaults 64"
+EXTRA_OECONF += "--enable-tools"
 
 do_install() {
 	oe_runmake DESTDIR=${D} libexecdir=${libexecdir} install
@@ -31,35 +42,20 @@ do_install_append() {
 	install -m 0755 ${S}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
 }
 
-RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
-
-# Bluez & Wifi are not mandatory except for handover	"
-RRECOMMENDS_${PN} = "\
-	${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
-	${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-	"
-
-#Additional
 PACKAGES =+ "${PN}-tests"
 
 FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
 FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
 
-RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
-
-# This is valid for 0.10+
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
- file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
- "
-S	= "${WORKDIR}/git"
-SRCREV	= "eb486bf35e24d7d1db61350f5ab393a0c880523d"
-PV	= "0.10+git${SRCPV}"
-PR	= "r0"
+RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
 
-SRC_URI  = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
-	file://neard.in \
-	"
+# Bluez & Wifi are not mandatory except for handover
+RRECOMMENDS_${PN} = "\
+                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+                     ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+                    "
 
-EXTRA_OECONF += "--enable-tools \
-	"
+RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
 
+INITSCRIPT_NAME = "neard"
+INITSCRIPT_PARAMS = "defaults 64"
-- 
1.7.10.4



