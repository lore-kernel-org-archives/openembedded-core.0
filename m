Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E798171DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:52:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3P7qHu0022962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 00:52:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 25 Apr 2018 00:52:16 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 15:23:21 +0800
Message-ID: <47c479f97f5141b022f0e8f55015116a3af39b29.1524640773.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524640773.git.kai.kang@windriver.com>
References: <cover.1524640773.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 5/8] gstreamer1.0-plugins-good: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 07:52:16 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade gstreamer1.0-plugins-good from 1.12.4 to 1.14.0.

* add packageconfig 'gtk' and configure option '--disable-qt' from -bad
* add packageconfig 'lame', 'mpg123' and configure option
  '--disable-twolame' from -ugly
* remove configure option '--disable-sunaudio' since plugin sunaudio has
  been removed

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-good.inc               | 15 +++++++++++++--
 ...good_1.12.4.bb => gstreamer1.0-plugins-good_1.14.0.bb} |  4 ++--
 2 files changed, 15 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.4.bb => gstreamer1.0-plugins-good_1.14.0.bb} (85%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 14c3d61848..ed14ed56c2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -6,10 +6,12 @@ DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
 
 inherit gettext
 
+# gtk is not in the PACKAGECONFIG variable by default until
+# the transition to gtk+3 is finished
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
-    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 \
+    cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
@@ -18,11 +20,14 @@ PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
 PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
+PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
+PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
 PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
 PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
+PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
 PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
@@ -32,6 +37,11 @@ PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
 
+# qt5 support is disabled, because it is not present in OE core, and requires more work than
+# just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
+# This is better done in a separate qt5 layer (which then should add a "qt5" packageconfig
+# in a gstreamer1.0-plugins-bad bbappend).
+
 EXTRA_OECONF += " \
     --enable-bz2 \
     --enable-oss \
@@ -44,8 +54,9 @@ EXTRA_OECONF += " \
     --disable-oss4 \
     --disable-osx_audio \
     --disable-osx_video \
+    --disable-qt \
     --disable-shout2 \
-    --disable-sunaudio \
+    --disable-twolame \
     --disable-waveform \
 "
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
index a0609641d6..275e2b7f47 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
@@ -11,8 +11,8 @@ SRC_URI = " \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "bdf4791a2b788ec6a149b81ff4032038"
-SRC_URI[sha256sum] = "649f49bec60892d47ee6731b92266974c723554da1c6649f21296097715eb957"
+SRC_URI[md5sum] = "48584b02e469a314b0e71f1553a2d2a7"
+SRC_URI[sha256sum] = "6afa35747d528d3ab4ed8f5eac13f7235d7d28100d6a24dd78f81ec7c0d04688"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.14.1


