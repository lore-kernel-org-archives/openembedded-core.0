Return-Path: <crg7475@mailbox.org>
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by mail.openembedded.org (Postfix) with ESMTP id B2F917FA15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:18 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 47wddv1xs5zKmTQ
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1578837617; bh=9yKw03qweR4c2J9
	kxcyveK/0SysTop3hHIfRx1njPNA=; b=K2LJMYxN73nr7AoMdohiAp4Wc4tnSjR
	4Un7RMXyyHYwA8fz1svXRFtWCYAHrclsBPYOczcRY+EIKqW3RVInb90dQmCd5uZb
	wEmYZWAZS3yxnbq27ehWCGhLlAtXPiIqlRZh/zHwU0AL+zPKMqVyGNC1K+k0hhPt
	FA1KGnIP/ASE9S7yamQWkzj8CV8LCoJ2aIpmbeAz3oqGytEG79gjLDbJRYpmp3Uw
	Ug0XBhikO0RO8AkZAQIu0k1pqDhhdKNVTeweAGIgCyY55hVGh/VDb9jIfXY2o2K6
	5RbTHYftVLMxNe2+3jQTA5LfdhL/+Q50GY8qQVyxsxC4rbGPFdSfkug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=SOUu1GvB3/kgszykjzlUgsPev2dXyO6HlJdlWIBXQY8=;
	b=WbdjUT+0Kd2ZPo/XCumr35iWeTdC36/uycZ7OsYrix87vAiVUIeZleZhk0SFRs4JTK+UBe
	6MIUfsW+snSTB9vJsVyuaeiJmmCBesQphgIzFle7HvAc0o4+uO6rSVyx4AN1ZLBmUf+jPu
	gQ2WpdJG+ACXFsui2Oc0uJbWxDq5xp/6GQ77s8wMIx3G2TRv0jOvXkuoHr+ZKyeyh8ZIHS
	6Mns0FS1Y173wgKgZY/zTBBmTR4BpaVrvW5Y1Wg2lcyCNl1zCMiT73sE85xjaQ6JZmKl1a
	gxIVbyfYIG/DGzg1cW2ZLEBw3E4PYgHmeefUqjNFnAMCbRo4fduxQtJUKEX8bw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
	[80.241.56.115]) (amavisd-new, port 10030) with ESMTP id ayw43Zlqt6rF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:17 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:46 +0100
Message-Id: <20200112135954.23868-4-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 04/12] gstreamer1.0-plugins-good: Transition to meson based builds
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
X-List-Received-Date: Sun, 12 Jan 2020 14:00:19 -0000

* Removed autotools/M4 related patch
  0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch.

* gtk-doc support is handled here, not in gstreamer1.0-plugins-common.inc,
    since unlike with autotools, only some plugin set packages use gtk-doc.

* zlib is no longer optional, and glib anyway depends on zlib, therefore
    it gets added to the DEPENDS list.

* gettext handling now part of gstreamer1.0-plugins-common.inc.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer1.0-plugins-good_1.16.1.bb       | 79 +++++++++----------
 1 file changed, 38 insertions(+), 41 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
index 0fa7b86ffe..a6eb9986dd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
@@ -1,8 +1,7 @@
-require gstreamer1.0-plugins.inc
+require gstreamer1.0-plugins-common.inc
 
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
-            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 
 SRC_URI[md5sum] = "515987ee763256840a11bd8ea098f2bf"
@@ -15,42 +14,41 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-DEPENDS += "gstreamer1.0-plugins-base libcap"
+DEPENDS += "gstreamer1.0-plugins-base libcap zlib"
 RPROVIDES_${PN}-pulseaudio += "${PN}-pulse"
 RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
 
-inherit gettext
-
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
-    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 zlib \
+    bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
+X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled"
+X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"
 
-PACKAGECONFIG[bz2]        = "--enable-bz2,--disable-bz2,bzip2"
-PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
-PACKAGECONFIG[dv1394]     = "--enable-dv1394,--disable-dv1394,libiec61883 libavc1394 libraw1394"
-PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
-PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[gtk]        = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[gudev]      = "--with-gudev,--without-gudev,libgudev"
-PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
-PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[lame]       = "--enable-lame,--disable-lame,lame"
-PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
-PACKAGECONFIG[libv4l2]    = "--with-libv4l2,--without-libv4l2,v4l-utils"
-PACKAGECONFIG[mpg123]     = "--enable-mpg123,--disable-mpg123,mpg123"
-PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
-PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
-PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
-PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
-PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst_v4l2"
-PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
-PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
-PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
-PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
+PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
+PACKAGECONFIG[cairo]      = "-Dcairo=enabled,-Dcairo=disabled,cairo"
+PACKAGECONFIG[dv1394]     = "-Ddv1394=enabled,-Ddv1394=disabled,libiec61883 libavc1394 libraw1394"
+PACKAGECONFIG[flac]       = "-Dflac=enabled,-Dflac=disabled,flac"
+PACKAGECONFIG[gdk-pixbuf] = "-Dgdk-pixbuf=enabled,-Dgdk-pixbuf=disabled,gdk-pixbuf"
+PACKAGECONFIG[gtk]        = "-Dgtk3=enabled,-Dgtk3=disabled,gtk+3"
+PACKAGECONFIG[gudev]      = "-Dv4l2-gudev=enabled,-Dv4l2-gudev=disabled,libgudev"
+PACKAGECONFIG[jack]       = "-Djack=enabled,-Djack=disabled,jack"
+PACKAGECONFIG[jpeg]       = "-Djpeg=enabled,-Djpeg=disabled,jpeg"
+PACKAGECONFIG[lame]       = "-Dlame=enabled,-Dlame=disabled,lame"
+PACKAGECONFIG[libpng]     = "-Dpng=enabled,-Dpng=disabled,libpng"
+PACKAGECONFIG[libv4l2]    = "-Dv4l2-libv4l2=enabled,-Dv4l2-libv4l2=disabled,v4l-utils"
+PACKAGECONFIG[mpg123]     = "-Dmpg123=enabled,-Dmpg123=disabled,mpg123"
+PACKAGECONFIG[pulseaudio] = "-Dpulse=enabled,-Dpulse=disabled,pulseaudio"
+PACKAGECONFIG[soup]       = "-Dsoup=enabled,-Dsoup=disabled,libsoup-2.4"
+PACKAGECONFIG[speex]      = "-Dspeex=enabled,-Dspeex=disabled,speex"
+PACKAGECONFIG[taglib]     = "-Dtaglib=enabled,-Dtaglib=disabled,taglib"
+PACKAGECONFIG[v4l2]       = "-Dv4l2=enabled -Dv4l2-probe=true,-Dv4l2=disabled -Dv4l2-probe=false"
+PACKAGECONFIG[vpx]        = "-Dvpx=enabled,-Dvpx=disabled,libvpx"
+PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
+PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 
 # qt5 support is disabled, because it is not present in OE core, and requires more work than
 # just adding a packageconfig (it requires access to moc, uic, rcc, and qmake paths).
@@ -58,19 +56,18 @@ PACKAGECONFIG[zlib]       = "--enable-zlib,--disable-zlib,zlib"
 # in a gstreamer1.0-plugins-good bbappend).
 
 EXTRA_OECONF += " \
-    --enable-oss \
-    --disable-aalib \
-    --disable-aalibtest \
-    --disable-directsound \
-    --disable-libcaca \
-    --disable-libdv \
-    --disable-oss4 \
-    --disable-osx_audio \
-    --disable-osx_video \
-    --disable-qt \
-    --disable-shout2 \
-    --disable-twolame \
-    --disable-waveform \
+    -Daalib=disabled \
+    -Ddirectsound=disabled \
+    -Ddv=disabled \
+    -Dlibcaca=disabled \
+    -Doss=enabled \
+    -Doss4=disabled \
+    -Dosxaudio=disabled \
+    -Dosxvideo=disabled \
+    -Dqt=disabled \
+    -Dshout2=disabled \
+    -Dtwolame=disabled \
+    -Dwaveform=disabled \
 "
 
 FILES_${PN}-equalizer += "${datadir}/gstreamer-1.0/presets/*.prs"
-- 
2.17.1


