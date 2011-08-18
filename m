Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtwM2-0003It-NF
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 08:45:26 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so1241102fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 23:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9oxVkQseIUPi80ri1qKos1DALaAQ5N5YPyIjjXJqoio=;
	b=I+4Qaf49KGYrPBJnk2uX2fJThenZYBMCvfqyUKFMTE6FYk5URmsJ/tKXNlYYfFuljB
	Roiq7GJa2sBCjq016mHzPXEYLCp2ySXjPpkGIYlKM5gOBFl0m+u3swxdJyuc/YWfcQUy
	Fm9dmmnIgqfcnkKsLxf94NhpjBREo91mgoQ5Q=
Received: by 10.223.2.139 with SMTP id 11mr592817faj.102.1313649649884;
	Wed, 17 Aug 2011 23:40:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e5sm559607fah.11.2011.08.17.23.40.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 23:40:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 08:40:37 +0200
Message-Id: <9fb41f4a7503988c32398c8224fdd9a98dc7c953.1313649419.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <d41b52b9e9df02e8ab44b70c66a8c6ac320412b6.1313649419.git.Martin.Jansa@gmail.com>
References: <d41b52b9e9df02e8ab44b70c66a8c6ac320412b6.1313649419.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1313649419.git.Martin.Jansa@gmail.com>
References: <cover.1313649419.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] bluez4: update recipe from meta-oe
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
X-List-Received-Date: Thu, 18 Aug 2011 06:45:26 -0000

* fix DEPENDS
* fix typo in --enable-pandd option
* remove unsupported options
* update packaging
* remove distro override which doesn't belong to oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.96.bb |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
index ebd2849..edba167 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -7,12 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "gst-plugins-base alsa-lib libusb dbus-glib libnl"
+DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib usbpath"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
-# For angstrom we want this to replace at least bluez-libs
-PROVIDES_append_angstrom = " bluez-utils bluez-libs"
-
 ASNEEDED = ""
 
 PR = "r0"
@@ -24,6 +21,7 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "296111afac49e3f9035085ac14daf518"
 SRC_URI[sha256sum] = "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd87871c13d0d70f87fa99"
+
 S = "${WORKDIR}/bluez-${PV}"
 
 inherit autotools
@@ -32,20 +30,16 @@ EXTRA_OECONF = "\
   --enable-gstreamer \
   --enable-alsa \
   --enable-usb \
-  --enable-netlink \
   --enable-tools \
   --enable-bccmd \
   --enable-hid2hci \
   --enable-dfutool \
   --enable-hidd \
-  --enable-pandd \
+  --enable-pand \
   --enable-dund \
   --disable-cups \
   --enable-test \
-  --enable-manpages \
   --enable-configfiles \
-  --enable-initscripts \
-  --disable-pcmciarules \
 "
 
 do_install_append() {
@@ -59,8 +53,8 @@ do_install_append() {
 PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
 
 FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so"
-FILES_${PN} += "${libdir}/bluetooth/plugins/*.so"
+FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
+FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${base_libdir}/systemd/"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
@@ -70,4 +64,5 @@ FILES_${PN}-dev += "\
 FILES_${PN}-dbg += "\
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
+  ${base_libdir}/udev/.debug \
 "
-- 
1.7.6



