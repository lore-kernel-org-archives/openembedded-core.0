Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 62EB475D83
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 15:15:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 06 Jul 2015 08:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,415,1432623600"; d="scan'208";a="759226659"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.2.187])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2015 08:15:27 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 18:14:53 +0300
Message-Id: <08b6295e2eb85ca3fdb848e62c6ceda00a91f887.1436195315.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH 3/3] alsa-plugins, pulseaudio: depend on speexdsp, not speex
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
X-List-Received-Date: Mon, 06 Jul 2015 15:15:26 -0000

Speexdsp was split off from speex, and alsa-plugins and pulseaudio
only depend on the speexdsp library.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 4 ++--
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
index 85df8bf..3395031 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
@@ -29,7 +29,7 @@ inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "\
         samplerate \
-        speex \
+        speexdsp \
         ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
 PACKAGECONFIG[avcodec] = "--enable-avcodec,--disable-avcodec,libav"
@@ -38,7 +38,7 @@ PACKAGECONFIG[maemo-plugin] = "--enable-maemo-plugin,--disable-maemo-plugin"
 PACKAGECONFIG[maemo-resource-manager] = "--enable-maemo-resource-manager,--disable-maemo-resource-manager,dbus"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
 PACKAGECONFIG[samplerate] = "--enable-samplerate,--disable-samplerate,libsamplerate0"
-PACKAGECONFIG[speex] = "--with-speex=lib,--with-speex=no,speex"
+PACKAGECONFIG[speexdsp] = "--with-speex=lib,--with-speex=no,speexdsp"
 
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 30fe221..b309d26 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
 DEPENDS = "libatomics-ops liboil libsndfile1 libtool"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
-DEPENDS += "json-c gdbm speex libxml-parser-perl-native libcap"
+DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
 
 inherit autotools pkgconfig useradd gettext perlnative bluetooth systemd
 
-- 
1.9.3


