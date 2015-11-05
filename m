Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED6177138
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 3917322151
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 09:32:19 +0100 (CET)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 09:32:11 +0100
Message-Id: <1446712332-17113-6-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
References: <1446712332-17113-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 6/7] gstreamer1.0-libav: upgrade to version 1.6.1
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
X-List-Received-Date: Thu, 05 Nov 2015 08:32:24 -0000

The lgpl PACKAGECONFIG is replaced by a gpl one,
since the LGPL build is the default now. There is no
--enable-lgpl switch anymore, it got replaced by
--enable-gpl.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc             | 4 ++--
 .../workaround-to-build-gst-libav-for-i586-with-gcc.patch            | 2 +-
 .../{gstreamer1.0-libav_1.4.5.bb => gstreamer1.0-libav_1.6.1.bb}     | 5 ++---
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.4.5.bb => gstreamer1.0-libav_1.6.1.bb} (83%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 84e6e95..132b63d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -3,7 +3,7 @@ SECTION = "multimedia"
 LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
 LICENSE_FLAGS = "commercial"
 HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2 xz"
 
 inherit autotools pkgconfig
 
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 # libav copy included in the gst-libav package.
 PACKAGECONFIG ??= " orc yasm "
 PACKAGECONFIG[libav] = "--with-system-libav,,libav"
-PACKAGECONFIG[lgpl]  = "--enable-lgpl,,"
+PACKAGECONFIG[gpl]  = "--enable-gpl,,"
 PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
 PACKAGECONFIG[orc]  = "--enable-orc,--disable-orc,orc"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
index ccadea4..36abf86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
@@ -22,5 +22,5 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 +            ( (unsigned char*)(h->non_zero_count[mb_xy]) ) [i] = 16;
 +        }
          h->cur_pic.mb_type[mb_xy] = mb_type;
-         h->last_qscale_diff = 0;
+         sl->last_qscale_diff = 0;
          return 0;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb
similarity index 83%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb
index 97fc7ec..99b01c8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb
@@ -3,7 +3,6 @@ include gstreamer1.0-libav.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE;md5=ea66e97a7ac1db978cf3529068a8c948 \
                     file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
@@ -14,8 +13,8 @@ SRC_URI = " \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
-SRC_URI[md5sum] = "f4922a46adbcbe7bd01331ff5dc7979d"
-SRC_URI[sha256sum] = "605c62624604f3bb5c870844cc1f2711779cc533b004c2aa1d8c0d58557afbbc"
+SRC_URI[md5sum] = "058b22411e1690eee5b71d1ab44eab25"
+SRC_URI[sha256sum] = "24d5e8e8b8c825af1a19aa80a27aba268ec383c8133fd4ef66e0e572ff6137a9"
 
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-- 
2.5.0


