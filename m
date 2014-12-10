Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6BB725DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 14:17:16 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so5323404wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G20KtVb1Vb8LyKi4BgEKCcCVJJcZxnCscf+EoL8JSQg=;
	b=v0/o8U7GxqL0Q/N4I2my6cUgRZR35l/2yTOC3gC1DQJS81iRnRE4umsdJKp6nrBKva
	Vuzaajt833fmypJs71TzbdC1WlvrVv7iqVM35d30oSxwJksJbKyOkW0PbIJVbPHG4hZ7
	xFBdzPoLsldPoPOLR2qmqEfG9UepZC+vi9wbEYB+zpsfOC6rHEC6O6ik8Tohi5QRBkk8
	vDWT0TH87RFy6xwcqBwslplrCgP7iof5T9JoLa6X/+t4BAf2Wc9o6qTccBpJuDwq5Z3w
	ZPX5SvH7rz/B4Cti1xjKgayOR9bHXqy5zTbOBPvPpZCBIpfggq73JAwpR2AIlnocwaLv
	RAFg==
X-Received: by 10.194.109.201 with SMTP id hu9mr7014172wjb.45.1418221036586;
	Wed, 10 Dec 2014 06:17:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h14sm6516453wic.8.2014.12.10.06.17.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 06:17:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 15:17:06 +0100
Message-Id: <1418221027-12371-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
References: <20141030082101.GE15148@jama>
	<1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2 3/4] libav: drop older 0.8.11 and use libav-9 by default
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
X-List-Received-Date: Wed, 10 Dec 2014 14:17:16 -0000

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
2.1.3


