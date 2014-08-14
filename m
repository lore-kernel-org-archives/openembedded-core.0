Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E27B161FE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EEQvHJ016430 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:26:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hvyi925Y8wq1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:26:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EEQqeZ016427
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:26:53 +0100
Message-ID: <1408026413.22187.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 15:26:53 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] qemu: Add PACKAGECONFIG for glx
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
X-List-Received-Date: Thu, 14 Aug 2014 14:26:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the configuration for sdl and glx, the virtual/libx11 in DEPENDS
no longer makes any sense at all, the dependency comes through the
various graphics backends. Therefore drop it. The glx PACKAGECONFIG
is added for completeness. We avoid a floating dependency on mesa.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e6f9e38..aaec58a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,8 +1,7 @@
 SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
-DEPENDS = "glib-2.0 zlib pixman \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+DEPENDS = "glib-2.0 zlib pixman"
 DEPENDS_class-native = "zlib-native glib-2.0-native pixman-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-glib-2.0 nativesdk-pixman"
 RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
@@ -103,6 +102,7 @@ PACKAGECONFIG[ssh2] = "--enable-libssh2,--disable-libssh2,libssh2,"
 PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
 PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = ",,alsa-lib"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,mesa"
 
 EXTRA_OECONF += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '--audio-drv-list=oss,alsa', '', d)}"
 



