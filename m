Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8D5873F9E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:43:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 09 Jul 2015 03:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,439,1432623600"; d="scan'208";a="758988084"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.21.252])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2015 03:43:23 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 13:43:15 +0300
Message-Id: <1f21286ea09ea0535e0d9dde4f9f1a9e75f6d464.1436438063.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <95ffeac6a06e92a7e530ae6c903626535185ac60.1436438063.git.tanu.kaskinen@linux.intel.com>
References: <95ffeac6a06e92a7e530ae6c903626535185ac60.1436438063.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1436438063.git.tanu.kaskinen@linux.intel.com>
References: <cover.1436438063.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v2 3/3] alsa-plugins, pulseaudio: depend on speexdsp, not speex
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
X-List-Received-Date: Thu, 09 Jul 2015 10:43:24 -0000

Speexdsp was split off from speex, and alsa-plugins and pulseaudio
only depend on the speexdsp library.

alsa-plugins needs also a patch, because it has so far relied on
speex_types.h, which was renamed to speexdsp_types.h when speexdsp was
split off, to not collide with the file that is included in speex.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 ...nclude-speexdsp_types.h-not-speex_types.h.patch | 71 ++++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb |  5 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  2 +-
 3 files changed, 75 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch b/meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch
new file mode 100644
index 0000000..e5199fb
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch
@@ -0,0 +1,71 @@
+From ca41e96a49a568128354f65f90a769debf5435f1 Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+Date: Thu, 9 Jul 2015 11:58:12 +0300
+Subject: [PATCH] include speexdsp_types.h, not speex_types.h
+
+Speexdsp was separated from speex in 1.2rc2. speex_types.h is not
+shipped by speexdsp, so alsa-plugins shouldn't use that file. speexdsp
+has speexdsp_types.h, which has the same contents as speex_types.h.
+
+speexdsp_types.h is a new file introduced in 1.2rc2, so this change
+bumps the minimum supported speexdsp version. The version check in
+configure.ac will actually break if speexdsp 1.2 ever gets released,
+because pkg-config thinks that "1.2" < "1.2rc2", but I think it's
+useful to fail if the installed speexdsp version is 1.2rc1 (which I
+believe is very common on current distributions). If a non-rc version
+of speexdsp will ever get released, I hope version number 1.2 will be
+skipped for this reason. (A non-rc version seems unlikely, since
+1.2rc1 was released years ago, so it's pretty likely that the project
+is stuck on so called "release candidates" forever...)
+
+Upstream-Status: Submitted (http://thread.gmane.org/gmane.linux.alsa.devel/141149)
+
+Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
+---
+ configure.ac          | 2 +-
+ pph/arch.h            | 2 +-
+ pph/speex_resampler.h | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 902a6d7..c554d22 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -108,7 +108,7 @@ AC_SUBST(AVCODEC_CFLAGS)
+ AC_SUBST(AVCODEC_LIBS)
+ AC_SUBST(AVCODEC_HEADER)
+ 
+-PKG_CHECK_MODULES(speexdsp, [speexdsp >= 1.2], [HAVE_SPEEXDSP="yes"], [HAVE_SPEEXDSP=""])
++PKG_CHECK_MODULES(speexdsp, [speexdsp >= 1.2rc2], [HAVE_SPEEXDSP="yes"], [HAVE_SPEEXDSP=""])
+ AM_CONDITIONAL(HAVE_SPEEXDSP, test "$HAVE_SPEEXDSP" = "yes")
+ 
+ AC_ARG_WITH([speex],
+diff --git a/pph/arch.h b/pph/arch.h
+index e2d731a..a07d0d9 100644
+--- a/pph/arch.h
++++ b/pph/arch.h
+@@ -36,7 +36,7 @@
+ #define ARCH_H
+ 
+ #ifndef OUTSIDE_SPEEX
+-#include "speex/speex_types.h"
++#include "speex/speexdsp_types.h"
+ #endif
+ 
+ #define ABS(x) ((x) < 0 ? (-(x)) : (x))      /**< Absolute integer value. */
+diff --git a/pph/speex_resampler.h b/pph/speex_resampler.h
+index c44fbcd..aa85abb 100644
+--- a/pph/speex_resampler.h
++++ b/pph/speex_resampler.h
+@@ -82,7 +82,7 @@
+       
+ #else /* OUTSIDE_SPEEX */
+ 
+-#include "speex/speex_types.h"
++#include "speex/speexdsp_types.h"
+ 
+ #endif /* OUTSIDE_SPEEX */
+ 
+-- 
+1.9.3
+
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
index 85df8bf..c928618 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2 \
            file://0001-arcam-av-Include-sys-select.h-for-fd_set-definition.patch \
+           file://0001-include-speexdsp_types.h-not-speex_types.h.patch \
 "
 SRC_URI[md5sum] = "a66797b4471e3cbe96575207bfbe252c"
 SRC_URI[sha256sum] = "325d85cac285f632b83e0191ae3f348bad03c1f007b937042f164abb81ea6532"
@@ -29,7 +30,7 @@ inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "\
         samplerate \
-        speex \
+        speexdsp \
         ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
 PACKAGECONFIG[avcodec] = "--enable-avcodec,--disable-avcodec,libav"
@@ -38,7 +39,7 @@ PACKAGECONFIG[maemo-plugin] = "--enable-maemo-plugin,--disable-maemo-plugin"
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


