Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 1487065E37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 11:37:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,879,1392159600"; d="scan'208";a="51552490"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 21 May 2014 13:37:51 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Wed, 21 May 2014 13:37:51 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 21 May 2014 13:37:51 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 May 2014 13:37:54 +0200
Message-ID: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH 1/4] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Wed, 21 May 2014 11:37:52 -0000
Content-Type: text/plain

Dropped libvorvis dependency because there is already a (better) builtin vorbis codec.
Don't confuse codec names: "vorbis" (builtin) and "libvorbis" (using external library).

Changes:
- add --enable-nonfree when faac or openssl are used
- add DESCRIPTION
- sort PACKAGECONFIG entries

Tested with libav-0.8.11 & libav-9.13.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-multimedia/libav/libav.inc | 39 ++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index a05a2a6..0bcdedc 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -1,6 +1,12 @@
-SUMMARY = "A complete, cross-platform solution to record, convert and stream audio and video"
+SUMMARY = "Open source audio and video processing tools and librairies"
+DESCRIPTION = "Libav is a friendly and community-driven effort to provide its users \
+               with a set of portable, functional and high-performance libraries for \
+               dealing with multimedia formats of all sorts. It originates from the \
+               FFmpeg codebase, but goes its own way these days, providing its users \
+               with reliable releases and a clear vision how to go forward."
 HOMEPAGE = "http://libav.org/"
 SECTION = "libs"
+
 LICENSE = "GPLv2+"
 LICENSE_FLAGS = "commercial"
 
@@ -9,7 +15,7 @@ PROVIDES = "ffmpeg"
 
 ARM_INSTRUCTION_SET = "arm"
 
-DEPENDS = "zlib libogg libvorbis libtheora yasm-native"
+DEPENDS = "zlib libogg yasm-native"
 
 INC_PR = "r8"
 
@@ -23,21 +29,29 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
 EXTRA_FFCONF ?= ""
 
-PACKAGECONFIG ??= "bzip2 x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
+PACKAGECONFIG ??= "bzip2 x264 theora ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
-PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
+PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
-PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
-PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
+PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
+PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
 PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
-PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
+PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
+PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
+PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
+PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
+PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
+
+# Check codecs that require --enable-nonfree
+USE_NONFREE = "${@contains_one('PACKAGECONFIG', [ 'faac', 'openssl' ], d)}"
 
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-pthreads \
     --enable-gpl \
+    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
     --enable-avfilter \
     \
     --cross-prefix=${TARGET_PREFIX} \
@@ -91,6 +105,15 @@ LEAD_SONAME = "libavcodec.so"
 
 FILES_${PN}-dev = "${includedir}"
 
+def contains_one(variable, checkvalues, d):
+    val = d.getVar(variable, True)
+    if not val:
+        return ''
+    val = set(val.split())
+    if val.intersection(checkvalues):
+        return 'yes'
+    return ''
+
 python populate_packages_prepend() {
     av_libdir = d.expand('${libdir}')
     av_pkgconfig = d.expand('${libdir}/pkgconfig')
-- 
1.8.1.2


