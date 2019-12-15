Return-Path: <crg7475@mailbox.org>
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	by mail.openembedded.org (Postfix) with ESMTP id A9C4C7F7C9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 12:54:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 47bPP73q8ZzKmfg
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:references:in-reply-to:message-id:date:date:subject:subject
	:from:from:received; s=mail20150812; t=1576414165; bh=pgiBFNDkhD
	Xj2d0KkbeeBQEfIJg6+NxscJ4siQIHpag=; b=Nuvsb6zmymk3zDwk28BxEDkwVD
	uw/m/oz/bG2s4hDnYphivdudvth/0xiVnwMY1+LpTqB6k7EwR6P8ZU02RhNghNwe
	HqkpprA8QcnEY4s7nDNs2esEKpuPTtbwJL4uANfMsnBV3hyKnEQapTchWh6YJ39u
	IgqH9K/6ZLk38nvOUpZUMlM81Y46wq5lm1tmR8lxdG6TsgEFRNod0wakcSL53NqF
	JAeio8ZkG4HgQp+4Z8r8aD1hxBlzsxjxbHEjFgoaQWcj0oaKK8AmxC3uVpH+SPFr
	IhjdIt3GEDzEtdbCUp4rr/nWd+Smsp7a3Ih14xmZyvbZxg7oE5lFH5WtZheg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1576414171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=CEw+iy1CN08BCd9MVNNOaEhZbTH0pfYVEzgJcd/gy7s=;
	b=qFVcxEcWawUUCDKc3JracL+RWhlr/WaqIBMh4nspZ+CWV5Fyl37ZUEHMJDASvqZXWw4jUq
	LGwqVSuKpcCcTYae1kxQ/sNp4AnV9VOB31xKY7I+lffYTlsDgKsd8trHofdmtuJbhO8uQ4
	cCc5mSnbIIl/4o2vWMaiPbkCYVBkAsoTkRReiBPx5LL/MjUOiP6iVLXrPSkYzeiKP3ZykT
	p4UEdrZvBAEzOo3yyLHqvc72xv0Vu+t98J5wwnZ89TvGy37hEcKyOSOy+yKk7tjjIz6+qs
	HJpSXax0fQnTuazfozjzJtcIiPWRIKvKSC+FVSrwx5NP+1/6ibVN6TvJogZYFg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id P3eD1Jhoh1XC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:25 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 13:49:05 +0100
Message-Id: <20191215124910.24946-7-crg7475@mailbox.org>
In-Reply-To: <20191215124910.24946-1-crg7475@mailbox.org>
References: <20191215124910.24946-1-crg7475@mailbox.org>
MIME-Version: 1.0
Subject: [WIP][PATCH 07/12] gstreamer1.0-libav: Transition to meson based builds
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
X-List-Received-Date: Sun, 15 Dec 2019 12:54:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

meson based builds exclusively rely on external FFmpeg builds. The internal
copy was added at a time when stable FFmpeg releases did not exist. They
do nowadays, so the internal copy is not needed anymore. As a result, large
portions of the recipe are unnecessary, since they set up the internal
copy. Same goes for the patches and the zlib/bzip2/xz dependendencies.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...ble-yasm-for-libav-when-disable-yasm.patch | 33 ----------
 ...-configure-check-for-armv7ve-variant.patch | 35 -----------
 .../0001-fix-host-contamination.patch         | 36 -----------
 .../mips64_cpu_detection.patch                | 32 ----------
 ...to-build-gst-libav-for-i586-with-gcc.patch | 26 --------
 .../gstreamer/gstreamer1.0-libav_1.16.1.bb    | 63 +++++--------------
 6 files changed, 14 insertions(+), 211 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-fix-host-contamination.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
deleted file mode 100644
index 11571aefa1..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 54bba228ea52d01fd84941d97be23c03f9862b64 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <dv@pseudoterminal.org>
-Date: Sat, 6 Apr 2013 01:22:22 +0200
-Subject: [PATCH] Disable yasm for libav when --disable-yasm
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
----
- configure.ac | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 22ede88..ef3c050 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -355,6 +355,12 @@ else
-     emblibav_configure_args="$emblibav_configure_args --enable-gpl"
-   fi
-
-+  AC_ARG_ENABLE(yasm,
-+              [AC_HELP_STRING([--disable-yasm], [disable use of yasm assembler])])
-+  if test "x$enable_yasm" = "xno"; then
-+    emblibav_configure_args="$emblibav_configure_args --disable-yasm"
-+  fi
-+
-   # if we are cross-compiling, tell libav so
-   case $host in
-       *android*)
--- 
-1.8.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch
deleted file mode 100644
index f182715bda..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From aac5902d3c9cb35c771e760d0e487622aa2e116a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 20 Apr 2017 10:38:18 -0700
-Subject: [PATCH] configure: check for armv7ve variant
-
-OE passes -mcpu and -march via cmdline and if
-package tries to detect one of it own then it
-should be compatible otherwise, newer gcc7+ will
-error out
-
-Check for relevant preprocessor macro to determine
-armv7ve architecture
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gst-libs/ext/libav/configure | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gst-libs/ext/libav/configure b/gst-libs/ext/libav/configure
-index 4a5e477..727818e 100755
---- a/gst-libs/ext/libav/configure
-+++ b/gst-libs/ext/libav/configure
-@@ -4745,6 +4745,7 @@ elif enabled arm; then
-         elif check_arm_arch 6KZ;      then echo armv6zk
-         elif check_arm_arch 6ZK;      then echo armv6zk
-         elif check_arm_arch 6T2;      then echo armv6t2
-+        elif check_arm_arch EXT_IDIV; then echo armv7ve
-         elif check_arm_arch 7;        then echo armv7
-         elif check_arm_arch 7A  7_A;  then echo armv7-a
-         elif check_arm_arch 7S;       then echo armv7-a
--- 
-2.12.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-fix-host-contamination.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-fix-host-contamination.patch
deleted file mode 100644
index 120c0798ea..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-fix-host-contamination.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c1700f867f876ee33c130a8e28b688e2b1d89663 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Wed, 11 Apr 2018 17:14:55 +0800
-Subject: [PATCH] Prevent host contamination
-
-Remove reference to host $(libdir) from .la files.
-
-Upstream-Status: Inappropriate [cross-compile specific]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- gst-libs/ext/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gst-libs/ext/Makefile.am b/gst-libs/ext/Makefile.am
-index 6cdc048..a19d255 100644
---- a/gst-libs/ext/Makefile.am
-+++ b/gst-libs/ext/Makefile.am
-@@ -49,7 +49,7 @@ echo "  GEN      $1.la" && \
-  echo "library_names=''" && \
-  echo "old_library='$1.a'" && \
-  echo "inherited_linker_flags=''" && \
-- echo "dependency_libs=' -L$(libdir) $(if $2,$(foreach dep,$2,$(abs_builddir)/$(dep).la)) $(call find_library_la,$3 $(LIBM),$(LDFLAGS)) '" && \
-+ echo "dependency_libs=' -L $(if $2,$(foreach dep,$2,$(abs_builddir)/$(dep).la)) $(call find_library_la,$3 $(LIBM),$(LDFLAGS)) '" && \
-  echo "weak_library_names=''" &&  \
-  echo "current=" && \
-  echo "age=" && \
-@@ -58,7 +58,7 @@ echo "  GEN      $1.la" && \
-  echo "shouldnotlink=no" && \
-  echo "dlopen=''" && \
-  echo "dlpreopen=''" && \
-- echo "libdir='$(libdir)'") > $1.la
-+ echo "libdir=''") > $1.la
- endef
- 
- libavutil.la:
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
deleted file mode 100644
index 90d042b313..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/mips64_cpu_detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-It will add -mips64r6 and -mips64r2 to cmdline which will
-cause conflicts
-
-in OE we user mips32r2 and mips64r2 for mips arch versions
-so there is no benefit of detecting it automatically by
-poking at tools especially in cross env
-
-Fixes errors like
-
-linking -mnan=2008 module with previous -mnan=legacy modules
-failed to merge target specific data of file
-
--Khem
-Upstream-Status: Inappropriate [OE-Specific]
-
-Index: gst-libav-1.10.1/gst-libs/ext/libav/configure
-===================================================================
---- gst-libav-1.10.1.orig/gst-libs/ext/libav/configure
-+++ gst-libav-1.10.1/gst-libs/ext/libav/configure
-@@ -5650,12 +5650,9 @@ elif enabled mips; then
- 
-     # Enable minimum ISA based on selected options
-     if enabled mips64; then
--        enabled mips64r6 && check_inline_asm_flags mips64r6 '"dlsa $0, $0, $0, 1"' '-mips64r6'
-         enabled mips64r2 && check_inline_asm_flags mips64r2 '"dext $0, $0, 0, 1"' '-mips64r2'
-         disabled mips64r6 && disabled mips64r2 && check_inline_asm_flags mips64r1 '"daddi $0, $0, 0"' '-mips64'
-     else
--        enabled mips32r6 && check_inline_asm_flags mips32r6 '"aui $0, $0, 0"' '-mips32r6'
--        enabled mips32r5 && check_inline_asm_flags mips32r5 '"eretnc"' '-mips32r5'
-         enabled mips32r2 && check_inline_asm_flags mips32r2 '"ext $0, $0, 0, 1"' '-mips32r2'
-         disabled mips32r6 && disabled mips32r5 && disabled mips32r2 && check_inline_asm_flags mips32r1 '"addi $0, $0, 0"' '-mips32'
-     fi
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
deleted file mode 100644
index 4b85356547..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/workaround-to-build-gst-libav-for-i586-with-gcc.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Description: Workaround to build libav for i586 with gcc 4.9.2 by avoiding memset
-Author: Bernhard Übelacker <bernhardu@vr-web.de>
-
----
-Bug-Debian: https://bugs.debian.org/783082
-Last-Update: 2015-04-28
-
-Upstream-Status: Backport [debian]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
---- gst-libav-1.4.5.orig/gst-libs/ext/libav/libavcodec/h264_cabac.c
-+++ gst-libav-1.4.5/gst-libs/ext/libav/libavcodec/h264_cabac.c
-@@ -2057,7 +2057,11 @@ decode_intra_mb:
-         // In deblocking, the quantizer is 0
-         h->cur_pic.qscale_table[mb_xy] = 0;
-         // All coeffs are present
--        memset(h->non_zero_count[mb_xy], 16, 48);
-+        /*memset(h->non_zero_count[mb_xy], 16, 48);*/
-+            /* avoiding this memset because it leads at least with gcc4.9.2 to error: 'asm' operand has impossible constraints */
-+        for (size_t i = 0; i < 48; i++) {
-+            ( (unsigned char*)(h->non_zero_count[mb_xy]) ) [i] = 16;
-+        }
-         h->cur_pic.mb_type[mb_xy] = mb_type;
-         sl->last_qscale_diff = 0;
-         return 0;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
index 10955ff161..c1bd6b1eb1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.1.bb
@@ -6,65 +6,30 @@ LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-           file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
-           file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
-           file://mips64_cpu_detection.patch \
-           file://0001-configure-check-for-armv7ve-variant.patch \
-           file://0001-fix-host-contamination.patch \
            "
 SRC_URI[md5sum] = "58023f4c71bbd711061e350fcd76c09d"
 SRC_URI[sha256sum] = "e8a5748ae9a4a7be9696512182ea9ffa6efe0be9b7976916548e9d4381ca61c4"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2 xz"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base ffmpeg"
 
-inherit autotools pkgconfig upstream-version-is-even gtk-doc
-
-# CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
-# compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
-# libav copy included in the gst-libav package.
-PACKAGECONFIG ??= "orc yasm"
-
-PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl,"
-PACKAGECONFIG[libav] = "--with-system-libav,,libav"
-PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
-PACKAGECONFIG[yasm] = "--enable-yasm,--disable-yasm,nasm-native"
-PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
-
-GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-
-LIBAV_EXTRA_CONFIGURE = "--with-libav-extra-configure"
-
-LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
-  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-  --ranlib='${RANLIB}' \
-  ${GSTREAMER_1_0_DEBUG} \
-  --cross-prefix='${HOST_PREFIX}'"
-
-# Disable assembly optimizations for X32, as this libav lacks the support
-PACKAGECONFIG_remove_linux-gnux32 = "yasm"
-LIBAV_EXTRA_CONFIGURE_COMMON_ARG_append_linux-gnux32 = " --disable-asm"
-
-LIBAV_EXTRA_CONFIGURE_COMMON = \
-'${LIBAV_EXTRA_CONFIGURE}="${LIBAV_EXTRA_CONFIGURE_COMMON_ARG}"'
-
-EXTRA_OECONF = "${LIBAV_EXTRA_CONFIGURE_COMMON}"
+inherit meson pkgconfig upstream-version-is-even
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 
-# http://errors.yoctoproject.org/Errors/Details/20493/
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-
-# ffmpeg/libav disables PIC on some platforms (e.g. x86-32)
-INSANE_SKIP_${PN} = "textrel"
+delete_unused_libav_copy() {
+        # When building with meson, the internal libav copy is not used.
+        # It is only present for legacy autotools based builds. In future
+        # GStreamer versions, the autotools scripts will be gone, and so
+        # will this internal copy. Until then, it will be present. In order
+        # to make sure this copy is not included in the -src package, just
+        # manually delete the copy.
+        rm -rf "${S}/gst-libs/ext/libav/"
+}
+
+do_unpack[postfuncs] += " delete_unused_libav_copy"
-- 
2.17.1


