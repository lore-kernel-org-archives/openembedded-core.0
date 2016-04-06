Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 403F8760AA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 08:19:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 06 Apr 2016 01:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,447,1455004800"; d="scan'208";a="926496752"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2016 01:19:16 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 11:19:12 +0300
Message-Id: <354604dae62477a036dc170cd9f9034272ce2fdd.1459929046.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <027dd53408d97f085b2e3bc014c619ff952653fe.1459929046.git.jussi.kukkonen@intel.com>
References: <027dd53408d97f085b2e3bc014c619ff952653fe.1459929046.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1459929046.git.jussi.kukkonen@intel.com>
References: <cover.1459929046.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] ffmpeg, gstreamer1.0-libav: add textrel INSANE_SKIPs
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

ffmpeg disables PIC on some platforms even when --enable-pic is
set, apparently for performance reasons. Add INSANE_SKIPS for the
relevant packages.

Fixes [YOCTO #9375].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb             | 11 +++++++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
index 0296ada..1dfbb9b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
@@ -94,6 +94,17 @@ do_configure() {
 
 PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util|resample)|swscale|swresample|postproc).*"
 
+# ffmpeg disables PIC on some platforms (e.g. x86-32)
+INSANE_SKIP_${MLPREFIX}libavcodec = "textrel"
+INSANE_SKIP_${MLPREFIX}libavdevice = "textrel"
+INSANE_SKIP_${MLPREFIX}libavfilter = "textrel"
+INSANE_SKIP_${MLPREFIX}libavformat = "textrel"
+INSANE_SKIP_${MLPREFIX}libavutil = "textrel"
+INSANE_SKIP_${MLPREFIX}libavresample = "textrel"
+INSANE_SKIP_${MLPREFIX}libswscale = "textrel"
+INSANE_SKIP_${MLPREFIX}libswresample = "textrel"
+INSANE_SKIP_${MLPREFIX}libpostproc = "textrel"
+
 python populate_packages_prepend() {
     av_libdir = d.expand('${libdir}')
     av_pkgconfig = d.expand('${libdir}/pkgconfig')
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 598a349..363101e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -41,3 +41,6 @@ FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 # http://errors.yoctoproject.org/Errors/Details/20493/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
+
+# ffmpeg/libav disables PIC on some platforms (e.g. x86-32)
+INSANE_SKIP_${PN} = "textrel"
-- 
2.1.4


