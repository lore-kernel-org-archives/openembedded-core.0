Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ED365760AA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 08:19:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 06 Apr 2016 01:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,447,1455004800"; d="scan'208";a="926496746"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2016 01:19:15 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 11:19:11 +0300
Message-Id: <027dd53408d97f085b2e3bc014c619ff952653fe.1459929046.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1459929046.git.jussi.kukkonen@intel.com>
References: <cover.1459929046.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] ffmpeg: Make configure options explicit
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
X-List-Received-Date: Wed, 06 Apr 2016 08:19:43 -0000

Currently ffmpeg builds libraries that are packaged but never appear
in PACKAGES. Add PACKAGECONFIGs for all libraries, and make sure
PACKAGES_DYNAMIC lists all dynamic packages.

Default choice (build all except libavresample) does not change.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
index 7dfcf09..0296ada 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
@@ -29,9 +29,21 @@ DEPENDS = "alsa-lib zlib libogg yasm-native"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "avdevice avfilter bzlib gpl lzma theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xv', '', d)}"
+PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc \
+                   bzlib gpl lzma theora x264 \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xv', '', d)}"
+
+# libraries to build in addition to avutil
 PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
 PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
+PACKAGECONFIG[avcodec] = "--enable-avcodec,--disable-avcodec"
+PACKAGECONFIG[avformat] = "--enable-avformat,--disable-avformat"
+PACKAGECONFIG[swresample] = "--enable-swresample,--disable-swresample"
+PACKAGECONFIG[swscale] = "--enable-swscale,--disable-swscale"
+PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc"
+PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
+
+# features to support
 PACKAGECONFIG[bzlib] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
@@ -80,7 +92,7 @@ do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
 
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util|resample)|swscale|swresample|postproc).*"
 
 python populate_packages_prepend() {
     av_libdir = d.expand('${libdir}')
-- 
2.1.4


