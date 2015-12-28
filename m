Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA72773179
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBS7EraU013834
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:53 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:15 -0800
Message-ID: <66e32244aed8d33f1b49fbe78179f2442545c730.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/40] gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for v4l2 and libv4l2
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:53 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

* WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libcap, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libgudev, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on libudev, but it isn't a build dependency?
  WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2 rdepends on zlib, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-good.inc        |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 0ce4b8f..edaafe8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -11,7 +11,7 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
+    orc cairo flac gdk-pixbuf jpeg libpng soup speex taglib v4l2\
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
@@ -22,7 +22,8 @@ PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
 PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
 PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,udev"
+PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
+PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,libv4l2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
@@ -32,11 +33,10 @@ PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libraw1394 libiec61883 libavc1394"
+PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2,--disable-gst_v4l2"
 
 EXTRA_OECONF += " \
     --enable-oss \
-    --enable-gst_v4l2 \
-    --without-libv4l2 \
     --disable-directsound \
     --disable-waveform \
     --disable-oss4 \
-- 
1.7.9.5


