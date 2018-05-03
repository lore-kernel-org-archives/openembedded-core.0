Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ED183603FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:18:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 01:18:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="55612729"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.22.40])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2018 01:18:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 16:17:49 +0800
Message-Id: <20180503081758.4661-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
Subject: [PATCH 03/12] gst-plugins-good: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 08:18:07 -0000

* For changes, please see: https://gstreamer.freedesktop.org/releases/1.14/
* With the expiration of mp3 patents [1], mp3 decoders and encoders have been
  moved to -plugins-good from -plugins-ugly (also see the release notes).
* Move bz2 and zlib to PACKAGECONFIG.
* gtk+ plugin has moved to -good from -bad. Enable it by default.
* qt plugin has also moved to -good from -bad but it's disabled by default.

[1] https://www.iis.fraunhofer.de/en/ff/amm/prod/audiocodec/audiocodecs/mp3.html

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.12.4.bb  | 20 ------------
 ...ood.inc => gstreamer1.0-plugins-good_1.14.0.bb} | 36 +++++++++++++++++++---
 2 files changed, 31 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good.inc => gstreamer1.0-plugins-good_1.14.0.bb} (52%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
deleted file mode 100644
index a0609641d6..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require gstreamer1.0-plugins-good.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
-                    file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
-
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
-    file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
-    file://avoid-including-sys-poll.h-directly.patch \
-    file://ensure-valid-sentinel-for-gst_structure_get.patch \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-"
-SRC_URI[md5sum] = "bdf4791a2b788ec6a149b81ff4032038"
-SRC_URI[sha256sum] = "649f49bec60892d47ee6731b92266974c723554da1c6649f21296097715eb957"
-
-S = "${WORKDIR}/gst-plugins-good-${PV}"
-
-RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
-RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
similarity index 52%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
index 14c3d61848..481ac51908 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
@@ -1,15 +1,33 @@
 require gstreamer1.0-plugins.inc
 
+SRC_URI = " \
+            http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
+            file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
+            file://avoid-including-sys-poll.h-directly.patch \
+            file://ensure-valid-sentinel-for-gst_structure_get.patch \
+            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+            "
+
+SRC_URI[md5sum] = "48584b02e469a314b0e71f1553a2d2a7"
+SRC_URI[sha256sum] = "6afa35747d528d3ab4ed8f5eac13f7235d7d28100d6a24dd78f81ec7c0d04688"
+
+S = "${WORKDIR}/gst-plugins-good-${PV}"
+
 LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
+                    file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
+DEPENDS += "gstreamer1.0-plugins-base libcap"
+RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
+RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
 
 inherit gettext
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
-    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 \
+    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 bz2 zlib gtk \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
@@ -31,11 +49,19 @@ PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
+PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
+PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
+PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
+PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
+PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
+
+# qt5 support is disabled, because it is not present in OE core, and requires more work than
+# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
+# This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
+# in a gstreamer1.0-plugins-good bbappend).
 
 EXTRA_OECONF += " \
-    --enable-bz2 \
     --enable-oss \
-    --enable-zlib \
     --disable-aalib \
     --disable-aalibtest \
     --disable-directsound \
@@ -45,8 +71,8 @@ EXTRA_OECONF += " \
     --disable-osx_audio \
     --disable-osx_video \
     --disable-shout2 \
-    --disable-sunaudio \
     --disable-waveform \
+    --disable-qt \
 "
 
 FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
-- 
2.14.1


