Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 428D4609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 14:05:57 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so1074691wib.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9ibX5WLTKzLA23+eZkuqK2M3uLBGmy5lJp2nEYQqRiU=;
	b=NkBYp0R9asPJfn6ywQrO0xjyTOcQreIMWt5TMoUQvDmGIaKm71GCqsAm5uQ+fTtoci
	WKoyuePoufbJqZIjSNuSI4poT4zo1s2Jz7JsBzZl+6mrnYJsHNrP1oJeXpfBxdXN9EQO
	lIpFZmePJslvVJgoNVLSY9C4L+a+QiwB2AODrW6umm/unyn6l5VMdC54iVm04AwrHafu
	A3cXs9WoTEQYOfslVInnZAguRn44ecwL3gBmNemwF67P0QWTObG1BZwUFfW+52vg8uLi
	EhXB4Gfzp7c/IkRNLeCgTZgHh2/i+/lWj9nwq69f50gSB08OgwfN9qUQOj9nCzoUpkv0
	HTpQ==
X-Received: by 10.194.84.105 with SMTP id x9mr22412467wjy.67.1407506758386;
	Fri, 08 Aug 2014 07:05:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w6sm17597859wjq.39.2014.08.08.07.05.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 07:05:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 16:06:27 +0200
Message-Id: <1407506787-3692-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <20140808102805.GD14848@jama>
References: <20140808102805.GD14848@jama>
Subject: [RFC][PATCH] libav: drop older 0.8.11 and use libav-9 by default
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
X-List-Received-Date: Fri, 08 Aug 2014 14:06:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 +--
 meta/recipes-multimedia/libav/libav.inc            |  8 ++++++++
 .../0001-configure-enable-pic-for-AArch64.patch    | 23 ----------------------
 meta/recipes-multimedia/libav/libav_0.8.11.bb      | 20 -------------------
 meta/recipes-multimedia/libav/libav_9.13.bb        | 12 -----------
 5 files changed, 9 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
 delete mode 100644 meta/recipes-multimedia/libav/libav_0.8.11.bb

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index bd7b8ce..04c08cc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -53,7 +53,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
            file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
            file://0001-ffserver-set-oformat.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'libav9', 'file://libav-9.patch', '', d)} \ 
+           file://libav-9.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
@@ -80,7 +80,6 @@ EXTRA_OECONF = "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
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
diff --git a/meta/recipes-multimedia/libav/libav_0.8.11.bb b/meta/recipes-multimedia/libav/libav_0.8.11.bb
deleted file mode 100644
index 1344a2a..0000000
--- a/meta/recipes-multimedia/libav/libav_0.8.11.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require libav.inc
-
-SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
-           file://0001-configure-enable-pic-for-AArch64.patch"
-
-SRC_URI[md5sum] = "cdc9b53c56a375baf73ea38cf7ade4f9"
-SRC_URI[sha256sum] = "5934e4f0dbf6e0fc4987de86cdd079f1d11a1410ae275e9f46472af17f05155a"
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
diff --git a/meta/recipes-multimedia/libav/libav_9.13.bb b/meta/recipes-multimedia/libav/libav_9.13.bb
index f9c413f..e922403 100644
--- a/meta/recipes-multimedia/libav/libav_9.13.bb
+++ b/meta/recipes-multimedia/libav/libav_9.13.bb
@@ -1,16 +1,4 @@
 require libav.inc
 
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
-
 SRC_URI[md5sum] = "23b9e34bffdaee366710fdf20157a570"
 SRC_URI[sha256sum] = "2ff05df6cd2259b3bb277eb16c234214f8e0530700d0c774d033eba23edde6ca"
-
-DEFAULT_PREFERENCE = "-1"
-
-# unlike 0.8.11 we don't provide libpostproc
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
-- 
2.0.4


