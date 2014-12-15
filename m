Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E21CC7249B
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 18:45:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2014 10:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,581,1413270000"; d="scan'208";a="637892703"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2014 10:43:51 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, meta-intel@yoctoproject.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	ross.burton@intel.com, paul.eggleton@linux.intel.com,
	tom.zanussi@intel.com, dvhart@linux.intel.com
Date: Mon, 15 Dec 2014 10:47:17 -0800
Message-Id: <7cced157a79e0c7ca2a86eec64bc84a62ccbdf11.1418667266.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1418667266.git.nitin.a.kamble@intel.com>
References: <cover.1418667266.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] alsa-plugins: a new recipe
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
X-List-Received-Date: Mon, 15 Dec 2014 18:45:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Provides the pulseaudio to ALSA connector, which is needed for ALSA apps when
using the pulseaudio sound server on the target,

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../recipes-multimedia/alsa/alsa-plugins_1.0.28.bb | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins_1.0.28.bb

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.28.bb
new file mode 100644
index 0000000..a21eacb
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.28.bb
@@ -0,0 +1,49 @@
+SUMMARY = "ALSA sound plugins"
+HOMEPAGE = "http://www.alsa-project.org"
+BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1 & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://rate/rate_samplerate.c;beginline=1;endline=20;md5=1d72a209fca5472c7bdc3d4f5c01ce03"
+DEPENDS = "alsa-lib pulseaudio"
+
+SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${PN}-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] = "6fcbbb31e96f8ebc5fb926184a717aa4"
+SRC_URI[sha256sum] = "426f8af1a07ee9d8c06449524d1f0bd59a06e0331a51aa3d59d343a7c6d03120"
+
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--disable-jack --disable-samplerate --disable-avcodec --with-speex=no"
+
+PACKAGES += "${PN}-pulseaudio \
+             ${PN}-speex \
+             ${PN}-oss \
+             ${PN}-vdownmix \
+             ${PN}-upmix \
+             ${PN}-usbstream \
+             ${PN}-arcamav \
+            "
+FILES_${PN}-doc          = "${datadir}/alsa/*"
+FILES_${PN}-dbg          = "${libdir}/alsa-lib/.debug ${prefix}/src/debug"
+FILES_${PN}-dev          = "${libdir}/alsa-lib/*.la"
+FILES_${PN}-pulseaudio   = "${libdir}/alsa-lib/libasound_module*_pulse.so"
+FILES_${PN}-speex        = "${libdir}/alsa-lib/libasound_module_*_speex*.so"
+FILES_${PN}-oss          = "${libdir}/alsa-lib/libasound_module_*_oss.so"
+FILES_${PN}-vdownmix     = "${libdir}/alsa-lib/libasound_module_*_vdownmix.so"
+FILES_${PN}-upmix        = "${libdir}/alsa-lib/libasound_module_*_upmix.so"
+FILES_${PN}-usbstream    = "${libdir}/alsa-lib/libasound_module_*_usb_stream.so"
+FILES_${PN}-arcamav      = "${libdir}/alsa-lib/libasound_module_*_arcam_av.so"
+
+RDEPENDS_${PN}-pulseaudio  = "libpulse"
+
+SUMMARY_${PN}-pulseaudio   = "Alsa to PulseAudio backend"
+SUMMARY_${PN}-oss          = "Oss PCM output plugin for ALSA"
+SUMMARY_${PN}-speex        = "Rate Converter Plugin Using Speex Resampler"
+SUMMARY_${PN}-vdownmix     = "Downmixer to stereo plugin for ALSA"
+SUMMARY_${PN}-upmix        = "Upmixer channel expander plugin for ALSA"
+SUMMARY_${PN}-usbstream    = "USB stream plugin for ALSA"
+SUMMARY_${PN}-arcamav      = "Arcam AV amplifier plugin for ALSA"
+
-- 
1.8.1.4


