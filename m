Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7579E7712D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:14:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2016 07:14:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,354,1449561600"; d="scan'208";a="735177265"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 27 Jan 2016 07:14:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 17:11:12 +0200
Message-Id: <1453907472-28594-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
Subject: [PATCH] ffmpeg: add a recipe, and remove the libav recipe
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
X-List-Received-Date: Wed, 27 Jan 2016 15:14:45 -0000

The reasons for the switch are here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-July/107091.html
http://lists.openembedded.org/pipermail/openembedded-core/2016-January/116007.html

Changes made to libav recipe:
- drop libav-fix-CVE-2014-9676.patch, the fix is available upstream
- merge .inc into .bb, only one upstream version (latest one) is provided
- drop separate libpostproc recipe, the library is provided directly
from ffmpeg source tree
- drop ARM tweaks; they date to classic-OE, need to be retested against the
new code and probably haven't been relevant for a long time
- drop PACKAGECONFIG options that are no longer provided upstream
- drop build and packaging tweaks that don't seem to do anything useful
and also date back to classic OE; if you run into issues, please report
- explicitly enable PIC and disable stripping of binaries

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{libav/libav.inc => ffmpeg/ffmpeg_2.8.5.bb}    | 76 ++++-------------
 .../libav/libav/libav-fix-CVE-2014-9676.patch      | 99 ----------------------
 meta/recipes-multimedia/libav/libav_9.18.bb        |  6 --
 meta/recipes-multimedia/libav/libpostproc_git.bb   | 49 -----------
 4 files changed, 17 insertions(+), 213 deletions(-)
 rename meta/recipes-multimedia/{libav/libav.inc => ffmpeg/ffmpeg_2.8.5.bb} (60%)
 delete mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
 delete mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb
 delete mode 100644 meta/recipes-multimedia/libav/libpostproc_git.bb

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
similarity index 60%
rename from meta/recipes-multimedia/libav/libav.inc
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
index 371e066..7107803 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
@@ -1,10 +1,8 @@
-SUMMARY = "Open source audio and video processing tools and librairies"
-DESCRIPTION = "Libav is a friendly and community-driven effort to provide its users \
-               with a set of portable, functional and high-performance libraries for \
-               dealing with multimedia formats of all sorts. It originates from the \
-               FFmpeg codebase, but goes its own way these days, providing its users \
-               with reliable releases and a clear vision how to go forward."
-HOMEPAGE = "http://libav.org/"
+SUMMARY = "A complete, cross-platform solution to record, convert and stream audio and video."
+DESCRIPTION = "FFmpeg is the leading multimedia framework, able to decode, encode, transcode, \
+               mux, demux, stream, filter and play pretty much anything that humans and machines \
+               have created. It supports the most obscure ancient formats up to the cutting edge."
+HOMEPAGE = "https://www.ffmpeg.org/"
 SECTION = "libs"
 
 LICENSE = "GPLv2+"
@@ -15,32 +13,22 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
 
-# Provides ffmpeg compat, see http://libav.org/about.html
-PROVIDES = "ffmpeg"
+SRC_URI[md5sum] = "b34164bd181f4f81c21da3dd131d919d"
+SRC_URI[sha256sum] = "76fb83a267d2d1cb332742dadf28ad8b58af7958165f51bb1a2c226a122f0ac7"
 
-ARM_INSTRUCTION_SET = "arm"
+# Should be API compatible with libav (which was a fork of ffmpeg)
+# libpostproc was previously packaged from a separate recipe
+PROVIDES = "libav libpostproc"
 
-DEPENDS = "alsa-lib zlib libogg yasm-native"
+DEPENDS = "alsa-lib zlib libogg yasm-native libxv"
 
 inherit autotools pkgconfig
 
-B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
-
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
-FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
-BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-
-EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
-EXTRA_FFCONF_armv7ve = "--cpu=cortex-a8"
-EXTRA_FFCONF ?= ""
-
-PACKAGECONFIG ??= "avdevice avfilter avplay bzip2 gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
 PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
-PACKAGECONFIG[avplay] = "--enable-avplay,--disable-avplay"
-PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
@@ -59,17 +47,14 @@ PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 # Check codecs that require --enable-nonfree
 USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
 
-# libav will install in /usr/local if prefix is empty. Luckily,
-# passing just "/" instead does the right thing.
-nonempty_prefix = "${@bb.data.getVar('prefix', d, True) or '/'}"
-
 EXTRA_OECONF = " \
+    --disable-stripping \
+    --enable-pic \
     --enable-shared \
     --enable-pthreads \
     ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
     \
     --cross-prefix=${TARGET_PREFIX} \
-    --prefix=${nonempty_prefix} \
     \
     --ld="${CCLD}" \
     --arch=${TARGET_ARCH} \
@@ -82,37 +67,15 @@ EXTRA_OECONF = " \
     ${EXTRA_FFCONF} \
     --libdir=${libdir} \
     --shlibdir=${libdir} \
+    --datadir=${datadir}/ffmpeg \
 "
 
 do_configure() {
-    # We don't have TARGET_PREFIX-pkgconfig
-    sed -i '/pkg_config_default="${cross_prefix}${pkg_config_default}"/d' ${S}/configure
-    mkdir -p ${B}
-    cd ${B}
     ${S}/configure ${EXTRA_OECONF}
-    sed -i -e s:Os:O4:g ${B}/config.h
 }
 
-do_install_append() {
-    if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'avfilter', 'yes', '', d)}" ]; then
-        install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
-    fi
-}
-
-PACKAGES += "${PN}-vhook ffmpeg-x264-presets"
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
-
 RSUGGESTS_${PN} = "mplayer"
-FILES_${PN} = "${bindir}"
-FILES_${PN}-dev = "${includedir}/${PN}"
-
-FILES_${PN}-vhook = "${libdir}/vhook"
-
-FILES_ffmpeg-x264-presets = "${datadir}/*.avpreset"
-
-LEAD_SONAME = "libavcodec.so"
-
-FILES_${PN}-dev = "${includedir}"
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
 
 python populate_packages_prepend() {
     av_libdir = d.expand('${libdir}')
@@ -145,9 +108,4 @@ python populate_packages_prepend() {
                       prepend=True,
                       allow_links=True)
 
-    if d.getVar('TARGET_ARCH', True) in [ 'i586', 'i686' ]:
-        # libav can't be build with -fPIC for 32-bit x86
-        pkgs = d.getVar('PACKAGES', True).split()
-        for pkg in pkgs:
-            d.appendVar('INSANE_SKIP_%s' % pkg, ' textrel')
 }
diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
deleted file mode 100644
index 94213a7..0000000
--- a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Upstream-Status: Backport
-CVE: CVE-2014-9676
-
-Backport patch to fix CVE-2014-9676.
-
-https://security-tracker.debian.org/tracker/CVE-2014-9676
-https://git.libav.org/?p=libav.git;a=commit;h=b3f04657368a32a9903406395f865e230b1de348
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From b3f04657368a32a9903406395f865e230b1de348 Mon Sep 17 00:00:00 2001
-From: Luca Barbato <lu_zero@gentoo.org>
-Date: Mon, 5 Jan 2015 10:40:41 +0100
-Subject: [PATCH] segment: Fix the failure paths
-
-A failure in segment_end() or segment_start() would lead to freeing
-a dangling pointer and in general further calls to seg_write_packet()
-or to seg_write_trailer() would have the same faulty behaviour.
-
-CC: libav-stable@libav.org
-Reported-By: luodalongde@gmail.com
----
- libavformat/segment.c | 32 ++++++++++++++++++++------------
- 1 file changed, 20 insertions(+), 12 deletions(-)
-
-diff --git a/libavformat/segment.c b/libavformat/segment.c
-index 52da6b9..bcfd1f9 100644
---- a/libavformat/segment.c
-+++ b/libavformat/segment.c
-@@ -184,6 +184,13 @@ static void close_null_ctx(AVIOContext *pb)
-     av_free(pb);
- }
- 
-+static void seg_free_context(SegmentContext *seg)
-+{
-+    avio_closep(&seg->pb);
-+    avformat_free_context(seg->avf);
-+    seg->avf = NULL;
-+}
-+
- static int seg_write_header(AVFormatContext *s)
- {
-     SegmentContext *seg = s->priv_data;
-@@ -265,12 +272,9 @@ static int seg_write_header(AVFormatContext *s)
-     }
- 
- fail:
--    if (ret) {
--        if (seg->list)
--            avio_close(seg->pb);
--        if (seg->avf)
--            avformat_free_context(seg->avf);
--    }
-+    if (ret < 0)
-+        seg_free_context(seg);
-+
-     return ret;
- }
- 
-@@ -282,6 +286,9 @@ static int seg_write_packet(AVFormatContext *s, AVPacket *pkt)
-     int64_t end_pts = seg->recording_time * seg->number;
-     int ret, can_split = 1;
- 
-+    if (!oc)
-+        return AVERROR(EINVAL);
-+
-     if (seg->has_video) {
-         can_split = st->codec->codec_type == AVMEDIA_TYPE_VIDEO &&
-                     pkt->flags & AV_PKT_FLAG_KEY;
-@@ -322,11 +329,8 @@ static int seg_write_packet(AVFormatContext *s, AVPacket *pkt)
-     ret = ff_write_chained(oc, pkt->stream_index, pkt, s);
- 
- fail:
--    if (ret < 0) {
--        if (seg->list)
--            avio_close(seg->pb);
--        avformat_free_context(oc);
--    }
-+    if (ret < 0)
-+        seg_free_context(seg);
- 
-     return ret;
- }
-@@ -335,7 +339,11 @@ static int seg_write_trailer(struct AVFormatContext *s)
- {
-     SegmentContext *seg = s->priv_data;
-     AVFormatContext *oc = seg->avf;
--    int ret;
-+    int ret = 0;
-+
-+    if (!oc)
-+        goto fail;
-+
-     if (!seg->write_header_trailer) {
-         if ((ret = segment_end(oc, 0)) < 0)
-             goto fail;
--- 
-2.4.1.314.g9532ead
-
diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipes-multimedia/libav/libav_9.18.bb
deleted file mode 100644
index 210a649..0000000
--- a/meta/recipes-multimedia/libav/libav_9.18.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libav.inc
-
-SRC_URI[md5sum] = "75e838068a75fb88e1b4ea0546bc16f0"
-SRC_URI[sha256sum] = "0875e835da683eef1a7bac75e1884634194149d7479d1538ba9fbe1614d066d7"
-
-SRC_URI += "file://libav-fix-CVE-2014-9676.patch"
diff --git a/meta/recipes-multimedia/libav/libpostproc_git.bb b/meta/recipes-multimedia/libav/libpostproc_git.bb
deleted file mode 100644
index 911ae86..0000000
--- a/meta/recipes-multimedia/libav/libpostproc_git.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "FFmpeg derived postprocessing library"
-HOMEPAGE = "http://git.videolan.org/?p=libpostproc.git;a=summary"
-SECTION = "libs"
-DEPENDS = "libav"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-# because it depends on libav which has commercial flag
-LICENSE_FLAGS = "commercial"
-
-PV = "52.3.0+git${SRCPV}"
-
-SRCREV = "811db3b957dfde24aef2d0f82e297e5bf552d873"
-SRC_URI = "git://github.com/lu-zero/postproc;protocol=https"
-
-S = "${WORKDIR}/git"
-
-inherit autotools lib_package pkgconfig
-
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
-FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
-BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-
-EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
-EXTRA_FFCONF_armv7ve = "--cpu=cortex-a8"
-EXTRA_FFCONF ?= ""
-
-EXTRA_OECONF = " \
-    --enable-shared \
-    --enable-pthreads \
-    --enable-gpl \
-    --enable-postproc \
-    \
-    --cross-prefix=${TARGET_PREFIX} \
-    --prefix=${prefix} \
-    \
-    --arch=${TARGET_ARCH} \
-    --target-os="linux" \
-    --enable-cross-compile \
-    --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
-    --extra-ldflags="${TARGET_LDFLAGS}" \
-    --sysroot="${STAGING_DIR_TARGET}" \
-    --shlibdir="${libdir}" \
-    ${EXTRA_FFCONF} \
-"
-
-do_configure() {
-    ${S}/configure ${EXTRA_OECONF}
-}
-- 
2.7.0.rc3


