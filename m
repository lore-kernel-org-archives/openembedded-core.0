Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1ReNU6-0004f9-IA
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Dec 2011 10:01:42 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Dec 2011 00:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99913596"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2011 00:54:33 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Dec 2011 17:06:27 +0800
Message-Id: <ec4db47b951ab9f6065bfb3a08645c4e93098bc8.1324717264.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
References: <b24a112a399a16e8cde104f43faa567a0963bb30.1324717264.git.shane.wang@intel.com>
In-Reply-To: <cover.1324717264.git.shane.wang@intel.com>
References: <cover.1324717264.git.shane.wang@intel.com>
Subject: [PATCH 06/13] gst-ffmpeg: upgrade to 0.10.13
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
X-List-Received-Date: Sat, 24 Dec 2011 09:01:43 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../gst-ffmpeg-0.10.13/configure-fix.patch         |   20 ++++++++++++++++++++
 .../lower-rank.diff                                |    0
 ...gst-ffmpeg_0.10.11.bb => gst-ffmpeg_0.10.13.bb} |   19 ++++++++++++-------
 3 files changed, 32 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
 rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg-0.10.11 => gst-ffmpeg-0.10.13}/lower-rank.diff (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg_0.10.11.bb => gst-ffmpeg_0.10.13.bb} (58%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
new file mode 100644
index 0000000..81029ca
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
@@ -0,0 +1,20 @@
+Disable yasm for libav when --disable-yasm
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+
+diff -r f2f8f74c6e30 configure.ac
+--- a/configure.ac	Thu Dec 22 23:56:09 2011 +0800
++++ b/configure.ac	Thu Dec 22 23:57:37 2011 +0800
+@@ -325,6 +325,10 @@
+         --enable-gpl"
+   fi
+ 
++  if test "x$disable_yasm" != "xyes"; then
++    embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"
++  fi
++
+   # if we are cross-compiling, tell ffmpeg so
+   target_os=`echo $host_os | sed 's/-gnu//'`
+   if test "x$cross_compiling" = xyes; then
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff
rename to meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/lower-rank.diff
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
similarity index 58%
rename from meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb
rename to meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index c3512e1..a1b7cbb 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ext/libpostproc/gstpostproc.c;beginline=1;endline=18;md5=5896e445e41681324381f5869ee33d38 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://ext/ffmpeg/gstffmpeg.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9 \
-                    file://gst-libs/ext/ffmpeg/LICENSE;md5=524b5ee4bdbbf755ebbb76727ba80b0d \
-                    file://gst-libs/ext/ffmpeg/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://gst-libs/ext/ffmpeg/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gst-libs/ext/ffmpeg/COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://gst-libs/ext/ffmpeg/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+                    file://gst-libs/ext/libav/LICENSE;md5=abc3b8cb02856aa7823bbbd162d16232 \
+                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 HOMEPAGE = "http://www.gstreamer.net/"
 DEPENDS = "gstreamer gst-plugins-base zlib"
 
@@ -17,15 +17,20 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://lower-rank.diff \
+           file://configure-fix.patch \
 "
 
-SRC_URI[md5sum] = "0d23197ba7ac06ea34fa66d38469ebe5"
-SRC_URI[sha256sum] = "ff36a138e5af4ed8dcc459d6d6521fe66ed31ec29ba9a924dc3675c6749a692e"
+SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
+SRC_URI[sha256sum] = "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
 
 PR = "r0"
 
 EXTRA_OECONF = "--with-ffmpeg-extra-configure=\"--target-os=linux\" "
 
+# yasm not found, use --disable-yasm for a crippled build for libav
+EXTRA_OECONF_append_x86-64 = " --disable-yasm "
+EXTRA_OECONF_append_x86 = " --disable-yasm "
+
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-- 
1.7.6



