Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jonas.danielsson@lundinova.se>) id 1SKmv6-0001wQ-8R
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 10:40:52 +0200
Received: from jkd-desktop (unknown [10.240.22.76])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mailhost.lundinova.se (Postfix) with ESMTP id 8CD5AE826A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 10:31:23 +0200 (CEST)
Date: Thu, 19 Apr 2012 10:31:22 +0200
From: Jonas Danielsson <jonas.danielsson@lundinova.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120419083122.GB22585@jkd-desktop>
References: <1334781049-7980-1-git-send-email-jonas.danielsson@lundinova.se>
	<4F8F43C0.6020608@linux.intel.com>
	<20120419080828.GA8581@jkd-desktop>
	<20120419081315.GA22585@jkd-desktop>
	<20120419081902.GB3671@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120419081902.GB3671@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH v3] bluez4: make alsa support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Thu, 19 Apr 2012 08:40:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline


Do not enable alsa in bluez4 unless it's included in DISTRO_FEATURES.

Signed-off-by: Jonas Danielsson <jonas.danielsson@lundinova.se>
---
 meta/recipes-connectivity/bluez/bluez4.inc     |    6 ++++--
 meta/recipes-connectivity/bluez/bluez4_4.99.bb |    3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index fbbe0bf..6dc06f4 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,9 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
+DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
+
 ASNEEDED = ""
 
 SRC_URI = "\
@@ -21,7 +24,6 @@ inherit autotools
 
 EXTRA_OECONF = "\
   --disable-gstreamer \
-  --enable-alsa \
   --enable-usb \
   --enable-tools \
   --enable-bccmd \
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
index 5033d34..32831e7 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
@@ -19,6 +19,7 @@ do_install_append() {
 
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
+ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-- 
1.7.5.4



