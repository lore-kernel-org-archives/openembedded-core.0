Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 31FFB71F05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 15:10:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2015 07:10:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,595,1418112000"; d="scan'208";a="528669329"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 17 Feb 2015 07:01:47 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 17:10:18 +0200
Message-Id: <1424185818-22576-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] pulseaudio: upgrade to 6.0
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
X-List-Received-Date: Tue, 17 Feb 2015 15:10:26 -0000

Changes:
- BlueZ 5 native HSP (headset) support;
- BlueZ 5 HFP (hands-free) profile support via oFono;
- systemd socket activation support;
- Better support for multichannel and 2.1 profiles;
- Remap optimisations;
- Many minor improvements, bug fixes, and i18n updates.

- Switched to ${BP} variable.
- Patch 0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
removed, no longer necessary.
- Patch CVE-2014-3970.patch included upstrem, removed.
- Slightly changed copyright notice, only a clarification.

libsamplerate based resamplers are now deprecated,
because they offer no particular advantage over speex.
Dependency to libsamplerate0 dropped.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  | 16 ++++---
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 30 -------------
 .../pulseaudio/pulseaudio/CVE-2014-3970.patch      | 52 ----------------------
 .../pulseaudio/pulseaudio_5.0.bb                   | 14 ------
 .../pulseaudio/pulseaudio_6.0.bb                   | 12 +++++
 5 files changed, 23 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index b73576e..e6ecd4a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -5,14 +5,14 @@ SECTION = "libs/multimedia"
 LICENSE = "GPLv2+ & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
+                    file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84"
 
-DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
+DEPENDS = "libatomics-ops liboil libsndfile1 libtool"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
 DEPENDS += "json-c gdbm speex libxml-parser-perl-native libcap"
 
-inherit autotools pkgconfig useradd gettext perlnative bluetooth
+inherit autotools pkgconfig useradd gettext perlnative bluetooth systemd
 
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
@@ -27,6 +27,7 @@ EXTRA_OECONF = "\
 		--disable-xen \
 		--with-database=simple \
 		--without-fftw \
+		--without-zsh-completion-dir \
 		--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d \
                 ac_cv_header_valgrind_memcheck_h=no \
 "
@@ -34,11 +35,13 @@ EXTRA_OECONF = "\
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)}"
 PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 sbc"
 PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
+PACKAGECONFIG[ofono] = "--enable-bluez5-ofono-headset,--disable-bluez5-ofono-headset,ofono"
 PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+PACKAGECONFIG[systemd] = "--enable-systemd-daemon --enable-systemd-login --enable-systemd-journal,--disable-systemd-daemon --disable-systemd-login --disable-systemd-journal,systemd"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxtst libice libsm libxcb"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
@@ -93,6 +96,9 @@ FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
 FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules"
+SYSTEMD_PACKAGES = "${PN}-server"
+SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
+
 FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
 
 # Allow the pulseaudio package to be created empty as a placeholder (-dbg and -dev depend on it)
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
deleted file mode 100644
index 467cd2c..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 002b16f0f2176b4c685e210e335bf69c02563ede Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 22 Feb 2014 18:03:10 +0100
-Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-login
-
-* they were merged into libsystemd in systemd-209
-
-Upstream-Status: Pending (it would need to be conditional on systemd version for upstream to accept this)
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 388fae2..fff7a83 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1160,7 +1160,7 @@ AC_ARG_ENABLE([systemd],
-     AS_HELP_STRING([--disable-systemd],[Disable optional systemd support]))
- 
- AS_IF([test "x$enable_systemd" != "xno"],
--    [PKG_CHECK_MODULES(SYSTEMD, [ libsystemd-login ], HAVE_SYSTEMD=1, HAVE_SYSTEMD=0)],
-+    [PKG_CHECK_MODULES(SYSTEMD, [ libsystemd ], HAVE_SYSTEMD=1, HAVE_SYSTEMD=0)],
-     HAVE_SYSTEMD=0)
- 
- AS_IF([test "x$enable_systemd" = "xyes" && test "x$HAVE_SYSTEMD" = "x0"],
--- 
-1.8.5.3
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch
deleted file mode 100644
index d5f33dc..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/CVE-2014-3970.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: Backport
-
-commit 26b9d22dd24c17eb118d0205bf7b02b75d435e3c upstream
-
-rtp-recv: fix crash on empty UDP packets (CVE-2014-3970)
-
-On FIONREAD returning 0 bytes, we cannot return success, as the caller
-(rtpoll_work_cb in module-rtp-recv.c) would then try to
-pa_memblock_unref(chunk.memblock) and, because memblock is NULL, trigger
-an assertion.
-
-Also we have to read out the possible empty packet from the socket, so
-that the kernel doesn't tell us again and again about it.
-
-Signed-off-by: Alexander E. Patrakov <patrakov@gmail.com>
-
-diff --git a/src/modules/rtp/rtp.c b/src/modules/rtp/rtp.c
-index 9195493..c45981e 100644
---- a/src/modules/rtp/rtp.c
-+++ b/src/modules/rtp/rtp.c
-@@ -182,8 +182,29 @@ int pa_rtp_recv(pa_rtp_context *c, pa_memchunk *chunk, pa_mempool *pool, struct
-         goto fail;
-     }
- 
--    if (size <= 0)
--        return 0;
-+    if (size <= 0) {
-+        /* size can be 0 due to any of the following reasons:
-+         *
-+         * 1. Somebody sent us a perfectly valid zero-length UDP packet.
-+         * 2. Somebody sent us a UDP packet with a bad CRC.
-+         *
-+         * It is unknown whether size can actually be less than zero.
-+         *
-+         * In the first case, the packet has to be read out, otherwise the
-+         * kernel will tell us again and again about it, thus preventing
-+         * reception of any further packets. So let's just read it out
-+         * now and discard it later, when comparing the number of bytes
-+         * received (0) with the number of bytes wanted (1, see below).
-+         *
-+         * In the second case, recvmsg() will fail, thus allowing us to
-+         * return the error.
-+         *
-+         * Just to avoid passing zero-sized memchunks and NULL pointers to
-+         * recvmsg(), let's force allocation of at least one byte by setting
-+         * size to 1.
-+         */
-+        size = 1;
-+    }
- 
-     if (c->memchunk.length < (unsigned) size) {
-         size_t l;
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
deleted file mode 100644
index 99f0ef3..0000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require pulseaudio.inc
-
-SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
-           file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
-           file://volatiles.04_pulse \
-           file://CVE-2014-3970.patch \
-"
-SRC_URI[md5sum] = "c43749838612f4860465e83ed62ca38e"
-SRC_URI[sha256sum] = "99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939"
-
-do_compile_prepend() {
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
new file mode 100644
index 0000000..91027bf
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
@@ -0,0 +1,12 @@
+require pulseaudio.inc
+
+SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
+           file://volatiles.04_pulse \
+"
+SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
+SRC_URI[sha256sum] = "b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6"
+
+do_compile_prepend() {
+    mkdir -p ${S}/libltdl
+    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
+}
-- 
2.1.0


