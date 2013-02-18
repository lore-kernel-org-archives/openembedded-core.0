Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U7QQG-0007jp-TB
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:06:24 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Feb 2013 04:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,687,1355126400"; d="scan'208";a="292587503"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2013 04:50:11 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 14:50:30 +0200
Message-Id: <1361191830-19106-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1361191830-19106-1-git-send-email-cristian.iorga@intel.com>
References: <1361191830-19106-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/2] pulseaudio: upgrade to 3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 13:06:27 -0000

ARM Neon instruction set compilation error fixed.
Build system disables Neon optimisations if
ARM target does not support it.
BT support dependent on bluez and sbc support.
sbc package added as a dependency.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc             |    4 +++-
 .../pulseaudio/{pulseaudio_2.1.bb => pulseaudio_3.0.bb}       |    9 ++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_2.1.bb => pulseaudio_3.0.bb} (62%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 81573e3..9929f1b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -11,7 +11,7 @@ DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxtst libice libsm libxcb gtk+', '', d)}"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 dbus gconf \
-           ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
+           ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4 sbc', '', d)}"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
            file://gcc4-compile-fix.patch \
@@ -43,6 +43,8 @@ EXTRA_OECONF = "\
 		--without-fftw \
 "
 
+EXTRA_OECONF_append_arm += "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "--enable-neon-opt=no", d)}"
+
 PARALLEL_MAKE = ""
 
 export TARGET_PFPU = "${TARGET_FPU}"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
similarity index 62%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
index a576368..71c3c05 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
@@ -1,17 +1,16 @@
 require pulseaudio.inc
 
-PR = "r15"
+PR = "r0"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
 inherit gettext perlnative
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
-  file://volatiles.04_pulse \
-"
+           file://volatiles.04_pulse"
 
-SRC_URI[md5sum] = "33e85023259d530f0a763d5204e8bad9"
-SRC_URI[sha256sum] = "ef6b347bf47abfb98080795f1583018ac959b4aeb4df916b879f9e1eaba0ca7f"
+SRC_URI[md5sum] = "47fd7eca8479c757822bee68a1feef25"
+SRC_URI[sha256sum] = "c90bfda29605942d08e3e218ef10e3c660506a06651a616bfbb6a6df8392836d"
 
 do_compile_prepend() {
     cd ${S}
-- 
1.7.10.4



