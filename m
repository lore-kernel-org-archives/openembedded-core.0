Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6CB7319C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 12:57:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 20 Jun 2016 05:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,498,1459839600"; d="scan'208";a="125284288"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2016 05:57:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 15:56:46 +0300
Message-Id: <1466427408-31744-4-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466427408-31744-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466427408-31744-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/6] mpg123: add a recipe from meta-oe
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
X-List-Received-Date: Mon, 20 Jun 2016 12:57:07 -0000

The recipe is updated to latest upstream release.
Also audiofile dependency is dropped as it's not actually used anywhere.

[YOCTO #6020]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/mpg123/mpg123_1.23.4.bb | 63 +++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta/recipes-multimedia/mpg123/mpg123_1.23.4.bb

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.23.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.23.4.bb
new file mode 100644
index 0000000..3101023
--- /dev/null
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.23.4.bb
@@ -0,0 +1,63 @@
+SUMMARY = "Audio decoder for MPEG-1 Layer 1/2/3"
+DESCRIPTION = "The core of mpg123 is an MPEG-1 Layer 1/2/3 decoding library, which can be used by other programs. \
+mpg123 also comes with a command-line tool which can playback using ALSA, PulseAudio, OSS, and several other APIs, \
+and also can write the decoded audio to WAV."
+HOMEPAGE = "http://mpg123.de/"
+BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
+SECTION = "multimedia"
+
+LICENSE = "LGPLv2.1"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
+
+SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
+
+SRC_URI[md5sum] = "dea9e3a815d127d04ebe9f6b80f229ce"
+SRC_URI[sha256sum] = "3495e678dec9a60f29cbcd4fc698abc4c811ec60d1276e744f7a10ac35023b48"
+
+inherit autotools pkgconfig
+
+# The options should be mutually exclusive for configuration script.
+# If both alsa and pulseaudio are specified (as in the default distro features)
+# pulseaudio takes precedence.
+PACKAGECONFIG_ALSA = "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '${PACKAGECONFIG_ALSA}', d)}"
+
+PACKAGECONFIG[alsa] = "--with-default-audio=alsa,,alsa-lib"
+PACKAGECONFIG[esd] = ",,esound"
+PACKAGECONFIG[jack] = ",,jack"
+PACKAGECONFIG[openal] = ",,openal-soft"
+PACKAGECONFIG[portaudio] = ",,portaudio-v19"
+PACKAGECONFIG[pulseaudio] = "--with-default-audio=pulse,,pulseaudio"
+PACKAGECONFIG[sdl] = ",,libsdl"
+
+# Following are possible sound output modules:
+# alsa arts coreaudio dummy esd jack nas openal os2 oss portaudio pulse sdl sndio sun tinyalsa win32 win32_wasapi
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', 'alsa', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'esd', 'esd', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'jack', 'jack', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'openal', 'openal', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'portaudio', 'portaudio', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d)}"
+AUDIOMODS += "${@bb.utils.contains('PACKAGECONFIG', 'sdl', 'sdl', '', d)}"
+
+EXTRA_OECONF = " \
+    --enable-shared \
+    --with-audio='${AUDIOMODS}' \
+    --with-module-suffix=.so \
+    ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
+"
+
+# The x86 assembler optimisations contains text relocations and there are no
+# upstream plans to fix them: http://sourceforge.net/p/mpg123/bugs/168/
+INSANE_SKIP_${PN}_append_x86 = " textrel"
+
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:47: Error: selected processor does not support Thumb mode `smull r5,r6,r7,r4'
+#| {standard input}:48: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r5,r5,lsr#24'
+#...
+#| make[3]: *** [equalizer.lo] Error 1
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.8.1


