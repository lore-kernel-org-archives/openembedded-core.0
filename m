Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD9D6B5D6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:59:42 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2013 01:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,844,1367996400"; d="scan'208";a="279808028"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 01:59:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 09:59:32 +0100
Message-Id: <16c7ff9c4e9ff11888d8d6b594f5ede88a78feeb.1376038140.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376038140.git.paul.eggleton@linux.intel.com>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] libav: add from meta-oe, update and tweak
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
X-List-Received-Date: Fri, 09 Aug 2013 08:59:42 -0000

Changes from the meta-oe recipe:
* Update stable recipe to 0.8.8
* Update git recipe to the tag for 9.8 (for now)
* Switch over to a tarball for the release version recipe
* Add LICENSE_FLAGS = "commercial"
* Set SUMMARY instead of DESCRIPTION
* Add yasm-native to DEPENDS since there is now a recipe for it
* Remove libvpx from DEPENDS and add a PACKAGECONFIG option for it,
  disabled by default since it wasn't actually being enabled
* Add a PACKAGECONFIG option for x11 to enable/disable x11grab, and
  add the proper DEPENDS if so (still defaults to enabled)
* Add a number of other PACKAGECONFIG options, replacing some old
  comments as well as offering the ability to disable x264.
* Hide text relocation warning when building for i586 (PIC can't be
  enabled for 32-bit x86).
* Drop PR

Notes for the git recipe:
* This hasn't been able to be built recently in meta-oe since there was
  a circular dependency between libav and libpostproc. libpostproc is
  part of libav 0.8.x but was split out in 9+ and is not needed at all
  anymore by libav itself, so this dependency was removed.
* Additionally the recipe was filtering out the option to enable
  libpostproc but this option wasn't being added by the inc file and
  thus the filter wasn't doing anything, so I dropped this as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-configure-enable-pic-for-AArch64.patch    |  23 ++++
 meta/recipes-multimedia/libav/libav.inc            | 129 +++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_0.8.8.bb       |  18 +++
 meta/recipes-multimedia/libav/libav_git.bb         |  16 +++
 4 files changed, 186 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch
 create mode 100644 meta/recipes-multimedia/libav/libav.inc
 create mode 100644 meta/recipes-multimedia/libav/libav_0.8.8.bb
 create mode 100644 meta/recipes-multimedia/libav/libav_git.bb

diff --git a/meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch b/meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch
new file mode 100644
index 0000000..d9b22b9
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch
@@ -0,0 +1,23 @@
+From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+Date: Thu, 10 Jan 2013 12:42:19 +0100
+Subject: [PATCH] configure: enable pic for AArch64
+
+Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+Upstream-Status: Backport
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- git.orig/configure
++++ git/configure
+@@ -2393,7 +2393,7 @@ check_host_cflags -std=c99
+ check_host_cflags -Wall
+ 
+ case "$arch" in
+-    alpha|ia64|mips|parisc|ppc|sparc)
++    alpha|ia64|mips|parisc|ppc|sparc|aarch64)
+         spic=$shared
+     ;;
+     x86)
diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
new file mode 100644
index 0000000..eae190d
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -0,0 +1,129 @@
+SUMMARY = "A complete, cross-platform solution to record, convert and stream audio and video."
+HOMEPAGE = "http://libav.org/"
+SECTION = "libs"
+LICENSE = "GPLv2+"
+LICENSE_FLAGS = "commercial"
+
+# Provides ffmpeg compat, see http://libav.org/about.html
+PROVIDES = "ffmpeg"
+
+ARM_INSTRUCTION_SET = "arm"
+
+DEPENDS = "virtual/libsdl zlib libogg libvorbis libtheora yasm-native"
+
+INC_PR = "r8"
+
+inherit autotools pkgconfig
+
+B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
+
+FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
+BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
+
+EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
+EXTRA_FFCONF ?= ""
+
+PACKAGECONFIG ??= "bzip2 x264 x11"
+PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
+PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
+PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
+PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
+PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
+PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
+PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
+PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
+PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto"
+
+EXTRA_OECONF = " \
+    --enable-shared \
+    --enable-pthreads \
+    --enable-gpl \
+    --enable-avfilter \
+    \
+    --cross-prefix=${TARGET_PREFIX} \
+    --prefix=${prefix} \
+    \
+    --enable-avserver \
+    --enable-avplay \
+    --enable-libtheora  \
+    --enable-libvorbis \
+    --arch=${TARGET_ARCH} \
+    --target-os="linux" \
+    --enable-cross-compile \
+    --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
+    --extra-ldflags="${TARGET_LDFLAGS}" \
+    --sysroot="${STAGING_DIR_TARGET}" \
+    --enable-hardcoded-tables \
+    ${EXTRA_FFCONF} \
+"
+
+do_configure() {
+    # We don't have TARGET_PREFIX-pkgconfig
+    sed -i '/pkg_config_default="${cross_prefix}${pkg_config_default}"/d' ${S}/configure
+    mkdir -p ${B}
+    cd ${B}
+    ${S}/configure ${EXTRA_OECONF}
+    sed -i -e s:Os:O4:g ${B}/config.h
+}
+
+do_install_append() {
+    install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
+}
+
+FFMPEG_LIBS = "libavcodec libavdevice libavformat \
+               libavutil libpostproc libswscale libavfilter"
+
+PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
+
+RSUGGESTS_${PN} = "mplayer"
+FILES_${PN} = "${bindir}"
+FILES_${PN}-dev = "${includedir}/${PN}"
+
+FILES_${PN}-vhook = "${libdir}/vhook"
+FILES_${PN}-vhook-dbg += "${libdir}/vhook/.debug"
+
+FILES_ffmpeg-x264-presets = "${datadir}/*.avpreset"
+
+LEAD_SONAME = "libavcodec.so"
+
+FILES_${PN}-dev = "${includedir}"
+
+python populate_packages_prepend() {
+    av_libdir = d.expand('${libdir}')
+    av_pkgconfig = d.expand('${libdir}/pkgconfig')
+
+    # Runtime package
+    do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
+                      output_pattern='lib%s',
+                      description='libav %s library',
+                      extra_depends='',
+                      prepend=True,
+                      allow_links=True)
+
+    # Development packages (-dev, -staticdev)
+    do_split_packages(d, av_libdir, '^lib(.*)\.so$',
+                      output_pattern='lib%s-dev',
+                      description='libav %s development package',
+                      extra_depends='${PN}-dev',
+                      prepend=True,
+                      allow_links=True)
+    do_split_packages(d, av_pkgconfig, '^lib(.*)\.pc$',
+                      output_pattern='lib%s-dev',
+                      description='libav %s development package',
+                      extra_depends='${PN}-dev',
+                      prepend=True)
+    do_split_packages(d, av_libdir, '^lib(.*)\.a$',
+                      output_pattern='lib%s-staticdev',
+                      description='libav %s development package - static library',
+                      extra_depends='${PN}-dev',
+                      prepend=True,
+                      allow_links=True)
+
+    if d.getVar('TARGET_ARCH', True) == 'i586':
+        # libav can't be build with -fPIC for 32-bit x86
+        pkgs = d.getVar('PACKAGES', True).split()
+        for pkg in pkgs:
+            d.appendVar('INSANE_SKIP_%s' % pkg, ' textrel')
+}
+
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc).*"
diff --git a/meta/recipes-multimedia/libav/libav_0.8.8.bb b/meta/recipes-multimedia/libav/libav_0.8.8.bb
new file mode 100644
index 0000000..9cb4cf2
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav_0.8.8.bb
@@ -0,0 +1,18 @@
+require libav.inc
+
+SRC_URI = "http://libav.org/releases/libav-0.8.8.tar.xz \
+           file://0001-configure-enable-pic-for-AArch64.patch"
+
+SRC_URI[md5sum] = "34b8f1279a04466386ed67731197efe3"
+SRC_URI[sha256sum] = "e95cf618eb6239177a62c46f15e840c37e02e8308baf94912fc5910ff4aacbf2"
+
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+EXTRA_OECONF += " \
+    --enable-postproc \
+"
+
+
diff --git a/meta/recipes-multimedia/libav/libav_git.bb b/meta/recipes-multimedia/libav/libav_git.bb
new file mode 100644
index 0000000..951baa9
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav_git.bb
@@ -0,0 +1,16 @@
+require libav.inc
+
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+PV = "9.8+git${SRCPV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRCREV = "9aaca159bd220582c698f13d081a455f398c9975"
+SRC_URI = "git://git.libav.org/libav.git"
+
+S = "${WORKDIR}/git"
+
-- 
1.8.1.2


