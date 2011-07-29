Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QmocZ-0004Om-U8
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 17:07:48 +0200
Received: by pzk1 with SMTP id 1so6569954pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=VvSuBKLrCP5nwAPoRc7kD2uSEjVeVlxNgwqFXImrJEc=;
	b=cWzhrUQS+5bVosm7udIvhGiN4wKApwreShPCRSe/L66YCjk374mKLXnez+fCapBpbh
	N8ZLwE84yfVoarCGWM4RFdEuMnw/+gTaxocltr7iKAbnLMsII5SMS+IG5fNrCc3DkhWi
	0rv8CWgQPyyp8s/h25p024SB+lBhrTRz3wB7A=
Received: by 10.68.47.102 with SMTP id c6mr2643375pbn.441.1311951581260;
	Fri, 29 Jul 2011 07:59:41 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id l7sm676567pbh.90.2011.07.29.07.59.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 07:59:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 07:59:31 -0700
Message-Id: <1311951571-18411-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] classes, recipes: Replace use of ARM_INSTRUCTION_SET with contruct using TUNE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jul 2011 15:07:48 -0000

Currently when using thumb feature all recipes can not be compiled in
thumb mode. Therefore we had ARM_INSTRUCTION_SET to force arm intruction
set even when thumb was global choice. With this patch we remove thumb
from tune features for these recipes. This will make sure that compiler
is not using thumb options to compile these recipes at all.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/qt4e.bbclass                          |    2 +-
 meta/classes/qt4x11.bbclass                        |    2 +-
 meta/conf/machine/include/tune-thumb.inc           |   32 --------------------
 meta/recipes-core/eglibc/eglibc.inc                |    4 +-
 meta/recipes-core/glib-2.0/glib.inc                |    4 ++-
 meta/recipes-core/glibc/glibc.inc                  |    4 ++-
 meta/recipes-core/glibc/glibc_2.10.1.bb            |    3 +-
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |    3 +-
 .../xorg-xserver/xserver-kdrive.inc                |    4 ++-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb  |    3 +-
 .../gstreamer/gst-plugins-bad_0.10.21.bb           |    3 +-
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    4 ++-
 meta/recipes-multimedia/tremor/tremor_20101121.bb  |    4 ++-
 meta/recipes-qt/qt4/qt4_arch.inc                   |    3 +-
 meta/recipes-support/boost/boost-36.inc            |    4 ++-
 meta/recipes-support/gmp/gmp.inc                   |    3 +-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 +-
 meta/recipes-support/liboil/liboil_0.3.17.bb       |    3 +-
 19 files changed, 39 insertions(+), 51 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc

diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index 670605b..ab91ab3 100644
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -15,4 +15,4 @@ export OE_QMAKE_EXTRA_MODULES = "network"
 EXTRA_QMAKEVARS_PRE += " QT_LIBINFIX=${QT_LIBINFIX} "
 
 # Qt4 uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index abb1d9d..3704b48 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -6,4 +6,4 @@ QT_DIR_NAME = "qt4"
 QT_LIBINFIX = ""
 
 # Qt4 uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
diff --git a/meta/conf/machine/include/tune-thumb.inc b/meta/conf/machine/include/tune-thumb.inc
deleted file mode 100644
index 9f6ce95..0000000
--- a/meta/conf/machine/include/tune-thumb.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-#tune file for thumb instructions
-
-ARM_INSTRUCTION_SET ?= "arm"
-# "arm" "thumb"
-#    The instruction set the compiler should use when generating application
-#    code.  The kernel is always compiled with arm code at present.  arm code
-#    is the original 32 bit ARM instruction set, thumb code is the 16 bit
-#    encoded RISC sub-set.  Thumb code is smaller (maybe 70% of the ARM size)
-#    but requires more instructions (140% for 70% smaller code) so may be
-#    slower.
-
-THUMB_INTERWORK ?= "yes"
-# "yes" "no"
-#    Whether to compile with code to allow interworking between the two
-#    instruction sets.  This allows thumb code to be executed on a primarily
-#    arm system and vice versa.  It is strongly recommended that DISTROs not
-#    turn this off - the actual cost is very small.
-
-OVERRIDE_THUMB = "${@['', ':thumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
-OVERRIDE_INTERWORK = "${@['', ':thumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
-OVERRIDES .= "${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}"
-
-#    Compiler and linker options for application code and kernel code.  These
-#    options ensure that the compiler has the correct settings for the selected
-#    instruction set and interworking.
-ARM_INTERWORK_M_OPT = "${@['-mno-thumb-interwork', '-mthumb-interwork'][bb.data.getVar('THUMB_INTERWORK', d, 1) == 'yes']}"
-ARM_THUMB_M_OPT = "${@['-mno-thumb', '-mthumb'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1) == 'thumb']}"
-
-#
-TUNE_CCARGS +=  "${ARM_INTERWORK_M_OPT} ${ARM_THUMB_M_OPT}"
-TARGET_CC_KERNEL_ARCH  += "-mno-thumb-interwork -mno-thumb"
-
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 1b2e630..2adcd05 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -33,8 +33,6 @@ LEAD_SONAME = "libc.so"
 GLIBC_EXTRA_OECONF ?= ""
 INHIBIT_DEFAULT_DEPS = "1"
 
-ARM_INSTRUCTION_SET = "arm"
-
 # eglibc uses PARALLELMFLAGS variable to pass parallel build info so transfer
 # PARALLEL_MAKE into PARALLELMFLAGS and empty out PARALLEL_MAKE
 EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
@@ -48,3 +46,5 @@ do_configure_prepend() {
 	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
 	echo '${OE_FEATURES}' > ${B}/option-groups.config
 }
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e25db3d..f7e88e3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -33,5 +33,7 @@ FILES_${PN} = "${libdir}/lib*${SOLIBS} ${sysconfdir}/bash_completion.d ${datadir
 FILES_${PN}-dev += "${libdir}/glib-2.0/include"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
+
 USE_NLS = "yes"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 57d693c..a447a82 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -57,4 +57,6 @@ do_rig_locales() {
 
 addtask rig_locales before do_compile after do_configure
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
+
diff --git a/meta/recipes-core/glibc/glibc_2.10.1.bb b/meta/recipes-core/glibc/glibc_2.10.1.bb
index e76f3c0..dfb09e0 100644
--- a/meta/recipes-core/glibc/glibc_2.10.1.bb
+++ b/meta/recipes-core/glibc/glibc_2.10.1.bb
@@ -1,6 +1,7 @@
 require glibc.inc
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
 
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 222c34f..e6e13af 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -125,7 +125,7 @@ configmangle = '/^KERNEL_HEADERS/d; \
                 /^SHARED_LIB_LOADER_PREFIX/d; \
                 /^UCLIBC_EXTRA_CFLAGS/d; \
                 s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
-                ${@["","s,.*COMPILE_IN_THUMB_MODE.*,COMPILE_IN_THUMB_MODE=y,;"][bb.data.getVar("ARM_INSTRUCTION_SET", d, 1) != "arm"]} \
+		${@bb.utils.contains("TUNE_FEATURES", "thumb", "COMPILE_IN_THUMB_MODE=y", "", d)} \
                 ${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
                 ${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'mips64', 'mips64el', 'avr32']]} \
                 /^CROSS/d; \
diff --git a/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc b/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
index cb5b087..ce7c3d1 100644
--- a/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
+++ b/meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
@@ -47,6 +47,7 @@ EXTRA_OECONF_BASE = "--enable-libssp --disable-bootstrap --disable-libgomp --dis
 EXTRA_OECONF_INITIAL = "--disable-libmudflap --disable-libgomp --disable-libssp --disable-bootstrap"
 EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap --disable-libgomp --disable-libssp --disable-bootstrap"
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
 
 addtask unpack2 after do_unpack before do_patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
index 52b63ed..21758ba 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
@@ -93,7 +93,9 @@ RDEPENDS_xserver-kdrive-via = "${PN}"
 
 inherit autotools pkgconfig
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
+
 
 EXTRA_OECONF = "--enable-composite --enable-kdrive \
                 --disable-dga --disable-dri --disable-xinerama \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
index 53f4d29..e36cde4 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
@@ -12,7 +12,8 @@ BBCLASSEXTEND = "native"
 # (not just those with the ARM instruction set), this should be removed,
 # (or replaced by a permitted #define).
 #FIXME: remove the following
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
 
 PR = "r0"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
index 2b8a89c..0219cbc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
@@ -16,7 +16,8 @@ inherit gettext
 EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disable-cdaudio \
                  --with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse --disable-vdpau --disable-apexsink"
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index aec929c..919dc8c 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -31,4 +31,6 @@ do_configure_prepend () {
 	touch NEWS AUTHORS ChangeLog
 }
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
+
diff --git a/meta/recipes-multimedia/tremor/tremor_20101121.bb b/meta/recipes-multimedia/tremor/tremor_20101121.bb
index 4a4cb28..49fed41 100644
--- a/meta/recipes-multimedia/tremor/tremor_20101121.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20101121.bb
@@ -16,4 +16,6 @@ inherit autotools
 
 EXTRA_OECONF=" --enable-shared --disable-rpath  "
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
+
diff --git a/meta/recipes-qt/qt4/qt4_arch.inc b/meta/recipes-qt/qt4/qt4_arch.inc
index e8c8fab..3d9a0e3 100644
--- a/meta/recipes-qt/qt4/qt4_arch.inc
+++ b/meta/recipes-qt/qt4/qt4_arch.inc
@@ -1,6 +1,7 @@
 inherit siteinfo
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
 
 def qt_arch(d):
     import bb, re
diff --git a/meta/recipes-support/boost/boost-36.inc b/meta/recipes-support/boost/boost-36.inc
index bb267d7..02a009f 100644
--- a/meta/recipes-support/boost/boost-36.inc
+++ b/meta/recipes-support/boost/boost-36.inc
@@ -10,7 +10,9 @@ DEPENDS = "boost-jam-native zlib"
 LICENSE = "Boost"
 PR = "r4"
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
+
 BOOST_VER = "${@"_".join(bb.data.getVar("PV",d,1).split("."))}"
 BOOST_MAJ = "${@"_".join(bb.data.getVar("PV",d,1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 66349e6..868e36d 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -9,7 +9,8 @@ SRC_URI = "${GNU_MIRROR}/gmp/gmp-${PV}.tar.bz2 \
 
 inherit autotools
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
 
 acpaths = ""
 
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 128aed3..c3a8793 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -23,7 +23,8 @@ do_install_append() {
 	install -m 0644 ${S}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
 }
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
 
 # move libgcrypt-config into -dev package
 FILES_${PN} = "${libdir}/lib*.so.*"
diff --git a/meta/recipes-support/liboil/liboil_0.3.17.bb b/meta/recipes-support/liboil/liboil_0.3.17.bb
index f342a82..5f03701 100644
--- a/meta/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta/recipes-support/liboil/liboil_0.3.17.bb
@@ -22,4 +22,5 @@ SRC_URI[sha256sum] = "105f02079b0b50034c759db34b473ecb5704ffa20a5486b60a8b769812
 
 inherit autotools pkgconfig
 
-ARM_INSTRUCTION_SET = "arm"
+# Remove thumb from tune features since we can not compile this in using thumb mode
+TUNE_FEATURES := "${@oe_filter_out('thumb', '${TUNE_FEATURES}', d)}"
-- 
1.7.4.1



