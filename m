Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5911372D08
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:35 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y19so2804319wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0ivLQ5sj7DmpIWsgcRYLSgUe8vWo+l348jCs19/VzG4=;
	b=Xa0Bjz1dd9HLZPTq6fXkqmiN6MFFr2p1NV5ZFuzkU00W1ex07RvNgLbDpP7O/tAE3P
	qYnOFC56vfGuEHtWYFlkSrdOXSYm8Wv83+iCpvEHyNbgjNkEreoHh7Cz/QzMM1uRW28c
	so7Ewm5e/z2y8bkKFM99t8nw6e3A4MAy47AyK4Mw9VC6xoN5lATDp/nKNnkJGaL3qsCI
	BmcrgNFFeL64ZYfMXpyqvMWsOBtY+pWX7a4PyEnrKqtshVrAiPIbtoIHQh6rwetaEkdh
	TZ39SCCQMPf4fIYA4SeYxSSJAlbG2nUzlJwYxEbD7pJ6tYMDdINiRgoKtImYS9z8e5wN
	DSzQ==
X-Received: by 10.180.89.41 with SMTP id bl9mr2443920wib.75.1421944775734;
	Thu, 22 Jan 2015 08:39:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	be2sm4610204wjb.38.2015.01.22.08.39.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:33 +0100
Message-Id: <cf1c187e7ab765c5fdb33e7739d088b2e3d5ec4d.1421943849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1421943849.git.Martin.Jansa@gmail.com>
References: <cover.1421943849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1421943849.git.Martin.Jansa@gmail.com>
References: <cover.1421943849.git.Martin.Jansa@gmail.com>
Subject: [PATCHv4 3/4] libav: drop older 0.8.* and use libav-9 by default
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
X-List-Received-Date: Thu, 22 Jan 2015 16:39:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 +--
 meta/recipes-multimedia/libav/libav.inc            |  8 ++++++++
 .../0001-configure-enable-pic-for-AArch64.patch    | 23 ----------------------
 meta/recipes-multimedia/libav/libav_0.8.15.bb      | 20 -------------------
 meta/recipes-multimedia/libav/libav_9.16.bb        | 12 -----------
 5 files changed, 9 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
 delete mode 100644 meta/recipes-multimedia/libav/libav_0.8.15.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 7304fff..219feaa 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -57,7 +57,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch \
            file://0001-avcodec-smc-fix-off-by-1-error.patch \
            file://0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'libav9', 'file://libav-9.patch', '', d)} \ 
+           file://libav-9.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
@@ -84,7 +84,6 @@ EXTRA_OECONF = "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
 PACKAGECONFIG ??= "external-libav"
 PACKAGECONFIG[external-libav] = "--with-system-ffmpeg,,libav"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
-PACKAGECONFIG[libav9] = ",,,"
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 8b470c1..21c29fc 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -10,6 +10,13 @@ SECTION = "libs"
 LICENSE = "GPLv2+"
 LICENSE_FLAGS = "commercial"
 
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
+
 # Provides ffmpeg compat, see http://libav.org/about.html
 PROVIDES = "ffmpeg"
 
@@ -86,6 +93,7 @@ do_install_append() {
 }
 
 PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
 
 RSUGGESTS_${PN} = "mplayer"
 FILES_${PN} = "${bindir}"
diff --git a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch b/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
deleted file mode 100644
index d9b22b9..0000000
--- a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
-From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-Date: Thu, 10 Jan 2013 12:42:19 +0100
-Subject: [PATCH] configure: enable pic for AArch64
-
-Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-Upstream-Status: Backport
----
- configure |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- git.orig/configure
-+++ git/configure
-@@ -2393,7 +2393,7 @@ check_host_cflags -std=c99
- check_host_cflags -Wall
- 
- case "$arch" in
--    alpha|ia64|mips|parisc|ppc|sparc)
-+    alpha|ia64|mips|parisc|ppc|sparc|aarch64)
-         spic=$shared
-     ;;
-     x86)
diff --git a/meta/recipes-multimedia/libav/libav_0.8.15.bb b/meta/recipes-multimedia/libav/libav_0.8.15.bb
deleted file mode 100644
index 127a088..0000000
--- a/meta/recipes-multimedia/libav/libav_0.8.15.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require libav.inc
-
-SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
-           file://0001-configure-enable-pic-for-AArch64.patch"
-
-SRC_URI[md5sum] = "e483ea8f482b5ecd65ee1d09251b0a5b"
-SRC_URI[sha256sum] = "495789ec547e93632937f0f36b06f4dd3180bc61518181f124af6746c6218710"
-
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-PROVIDES += "libpostproc"
-
-EXTRA_OECONF += " \
-    --enable-postproc \
-"
-
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc|swscale).*"
diff --git a/meta/recipes-multimedia/libav/libav_9.16.bb b/meta/recipes-multimedia/libav/libav_9.16.bb
index 8ced2dc..79ff3f8 100644
--- a/meta/recipes-multimedia/libav/libav_9.16.bb
+++ b/meta/recipes-multimedia/libav/libav_9.16.bb
@@ -1,16 +1,4 @@
 require libav.inc
 
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
-
 SRC_URI[md5sum] = "7b44b75cec24b8e7545e5029e76917e0"
 SRC_URI[sha256sum] = "ca846473b0b8ed8e3404c52e5e92df6d35cb5fa487eec498525de3ffda4367a0"
-
-DEFAULT_PREFERENCE = "-1"
-
-# unlike 0.8.11 we don't provide libpostproc
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
-- 
2.2.1


