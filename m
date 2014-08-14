Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id A63BE6FF24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:06:03 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-05.prod.phx3.secureserver.net with 
	id ej621o0091mTNtu01j64J0; Thu, 14 Aug 2014 12:06:04 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:05:51 -0500
Message-Id: <1408043159-8108-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1408043159-8108-1-git-send-email-pab@pabigot.com>
References: <1408043159-8108-1-git-send-email-pab@pabigot.com>
Subject: [PATCH v2 1/9] gcc: recipe whitespace changes
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
X-List-Received-Date: Thu, 14 Aug 2014 19:06:05 -0000

Consistent use of whitespace in multi-line assignment, with special
focus on OECONF modifications.  Quotes on separate lines, four-space
indentation, one value per line.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              | 186 +++++++++++----------
 meta/recipes-devtools/gcc/gcc-4.9.inc              | 180 ++++++++++----------
 meta/recipes-devtools/gcc/gcc-configure-common.inc |  46 ++---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |  24 +--
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |  32 ++--
 meta/recipes-devtools/gcc/gcc-cross.inc            |  28 ++--
 meta/recipes-devtools/gcc/gcc-runtime.inc          | 153 ++++++++---------
 meta/recipes-devtools/gcc/gcc-target.inc           | 106 ++++++------
 meta/recipes-devtools/gcc/libgcc.inc               |  35 ++--
 meta/recipes-devtools/gcc/libgfortran.inc          |  29 ++--
 10 files changed, 429 insertions(+), 390 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 2816f13..80a3fc4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -15,62 +15,65 @@ NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                   file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-                   file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-                   file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
-
-SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
-	   file://0002-uclibc-conf.patch \
-	   file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
-	   file://0004-uclibc-locale.patch \
-	   file://0005-uclibc-locale-no__x.patch \
-	   file://0006-uclibc-locale-wchar_fix.patch \
-	   file://0007-uclibc-locale-update.patch \
-	   file://0008-missing-execinfo_h.patch \
-	   file://0009-c99-snprintf.patch \
-	   file://0010-c99-complex-ugly-hack.patch \
-	   file://0011-index_macro.patch \
-	   file://0012-libmudflap-susv3-legacy.patch \
-	   file://0013-libstdc-namespace.patch \
-	   file://0014-sh-pr24836.patch \
-	   file://0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch \
-	   file://0016-gcc-poison-system-directories.patch \
-	   file://0017-gcc-poison-dir-extend.patch \
-	   file://0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
-	   file://0019-64-bit-multilib-hack.patch \
-	   file://0020-optional-libstdc.patch \
-	   file://0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
-	   file://0022-COLLECT_GCC_OPTIONS.patch \
-	   file://0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-	   file://0024-PR-target-32219.patch \
-	   file://0025-fortran-cross-compile-hack.patch \
-	   file://0026-libgcc-sjlj-check.patch \
-	   file://0027-cpp-honor-sysroot.patch \
-	   file://0028-MIPS64-Default-to-N64-ABI.patch \
-	   file://0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
-	   file://0030-gcc-Fix-argument-list-too-long-error.patch \
-	   file://0031-Disable-sdt.patch \
-	   file://0032-libtool.patch \
-	   file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
-	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
-	   file://0035-wcast-qual-PR-55383.patch \
-	   file://0037-gcc-4.8-PR56797.patch \
-	   file://0038-gcc-4.8-build-args.patch \
-	   file://0039-gcc-4.8-PR57717.patch \
-	   file://0040-fix-g++-sysroot.patch \
-	   file://0041-libtool-avoid-libdir.patch \
-	   file://0042-pr57748.patch \
-	   file://0043-cpp.patch \
-	   file://0044-gengtypes.patch \
-	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
-	   file://0046-libatomic-deptracking.patch \
-	   file://0047-repomembug.patch \
-	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
-	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
-	   file://0050-PR-target-58595.patch \
-	  "
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+    file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
+"
+
+SRC_URI = "\
+    ${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+    file://0002-uclibc-conf.patch \
+    file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
+    file://0004-uclibc-locale.patch \
+    file://0005-uclibc-locale-no__x.patch \
+    file://0006-uclibc-locale-wchar_fix.patch \
+    file://0007-uclibc-locale-update.patch \
+    file://0008-missing-execinfo_h.patch \
+    file://0009-c99-snprintf.patch \
+    file://0010-c99-complex-ugly-hack.patch \
+    file://0011-index_macro.patch \
+    file://0012-libmudflap-susv3-legacy.patch \
+    file://0013-libstdc-namespace.patch \
+    file://0014-sh-pr24836.patch \
+    file://0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch \
+    file://0016-gcc-poison-system-directories.patch \
+    file://0017-gcc-poison-dir-extend.patch \
+    file://0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
+    file://0019-64-bit-multilib-hack.patch \
+    file://0020-optional-libstdc.patch \
+    file://0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
+    file://0022-COLLECT_GCC_OPTIONS.patch \
+    file://0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+    file://0024-PR-target-32219.patch \
+    file://0025-fortran-cross-compile-hack.patch \
+    file://0026-libgcc-sjlj-check.patch \
+    file://0027-cpp-honor-sysroot.patch \
+    file://0028-MIPS64-Default-to-N64-ABI.patch \
+    file://0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
+    file://0030-gcc-Fix-argument-list-too-long-error.patch \
+    file://0031-Disable-sdt.patch \
+    file://0032-libtool.patch \
+    file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
+    file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
+    file://0035-wcast-qual-PR-55383.patch \
+    file://0037-gcc-4.8-PR56797.patch \
+    file://0038-gcc-4.8-build-args.patch \
+    file://0039-gcc-4.8-PR57717.patch \
+    file://0040-fix-g++-sysroot.patch \
+    file://0041-libtool-avoid-libdir.patch \
+    file://0042-pr57748.patch \
+    file://0043-cpp.patch \
+    file://0044-gengtypes.patch \
+    file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
+    file://0046-libatomic-deptracking.patch \
+    file://0047-repomembug.patch \
+    file://0048-PR58854_fix_arm_apcs_epilogue.patch \
+    file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
+    file://0050-PR-target-58595.patch \
+"
 SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
 SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
 
@@ -83,40 +86,47 @@ JAVA = ""
 
 LTO = "--enable-lto"
 
-EXTRA_OECONF_BASE = "   ${LTO} \
-			--enable-libssp \
-			--disable-bootstrap \
-			--disable-libmudflap \
-			--with-system-zlib \
-			--with-linker-hash-style=${LINKER_HASH_STYLE} \
-			--enable-linker-build-id \
-			--with-ppl=no \
-			--with-cloog=no \
-			--enable-checking=release \
-			--enable-cheaders=c_global "
-
-EXTRA_OECONF_INITIAL = "--disable-libmudflap \
-			--disable-libgomp \
-			--disable-libssp \
-			--disable-libquadmath \
-			--with-system-zlib \
-			--disable-lto \
-			--disable-plugin \
-			--enable-decimal-float=no"
-
-EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
-				--disable-libgomp \
-				--disable-libquadmath \
-				--with-system-zlib \
-				--disable-lto \
-				--disable-plugin \
-				--disable-libssp"
+EXTRA_OECONF_BASE = "\
+    ${LTO} \
+    --enable-libssp \
+    --disable-bootstrap \
+    --disable-libmudflap \
+    --with-system-zlib \
+    --with-linker-hash-style=${LINKER_HASH_STYLE} \
+    --enable-linker-build-id \
+    --with-ppl=no \
+    --with-cloog=no \
+    --enable-checking=release \
+    --enable-cheaders=c_global \
+"
+
+EXTRA_OECONF_INITIAL = "\
+    --disable-libmudflap \
+    --disable-libgomp \
+    --disable-libssp \
+    --disable-libquadmath \
+    --with-system-zlib \
+    --disable-lto \
+    --disable-plugin \
+    --enable-decimal-float=no \
+"
+
+EXTRA_OECONF_INTERMEDIATE = "\
+    --disable-libmudflap \
+    --disable-libgomp \
+    --disable-libquadmath \
+    --with-system-zlib \
+    --disable-lto \
+    --disable-plugin \
+    --disable-libssp \
+"
 
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
-EXTRA_OECONF_PATHS = " \ 
-                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \ 
-                      --with-sysroot=${STAGING_DIR_TARGET} \ 
-                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+EXTRA_OECONF_PATHS = "\ 
+    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \ 
+    --with-sysroot=${STAGING_DIR_TARGET} \ 
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
 
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index d1be67d..5a1c028 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -15,59 +15,62 @@ NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
 
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                   file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-                   file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-                   file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
-
-SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
-	   file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-	   file://0002-uclibc-conf.patch \
-	   file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
-	   file://0004-uclibc-locale.patch \
-	   file://0005-uclibc-locale-no__x.patch \
-	   file://0006-uclibc-locale-wchar_fix.patch \
-	   file://0007-uclibc-locale-update.patch \
-	   file://0008-missing-execinfo_h.patch \
-	   file://0009-c99-snprintf.patch \
-	   file://0010-c99-complex-ugly-hack.patch \
-	   file://0011-index_macro.patch \
-	   file://0013-libstdc-namespace.patch \
-	   file://0014-sh-pr24836.patch \
-	   file://0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch \
-	   file://0016-gcc-poison-system-directories.patch \
-	   file://0017-gcc-poison-dir-extend.patch \
-	   file://0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
-	   file://0019-64-bit-multilib-hack.patch \
-	   file://0020-optional-libstdc.patch \
-	   file://0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
-	   file://0022-COLLECT_GCC_OPTIONS.patch \
-	   file://0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-	   file://0024-PR-target-32219.patch \
-	   file://0025-fortran-cross-compile-hack.patch \
-	   file://0026-libgcc-sjlj-check.patch \
-	   file://0027-cpp-honor-sysroot.patch \
-	   file://0028-MIPS64-Default-to-N64-ABI.patch \
-	   file://0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
-	   file://0030-gcc-Fix-argument-list-too-long-error.patch \
-	   file://0031-Disable-sdt.patch \
-	   file://0032-libtool.patch \
-	   file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
-	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
-	   file://0037-gcc-4.8-PR56797.patch \
-	   file://0040-fix-g++-sysroot.patch \
-	   file://0041-libtool-avoid-libdir.patch \
-	   file://0043-cpp.patch \
-	   file://0044-gengtypes.patch \
-	   file://0046-libatomic-deptracking.patch \
-	   file://0047-repomembug.patch \
-	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
-	   file://0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch \
-           file://0051-eabispe.patch \
-           file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
-           file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
-	  "
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+    file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
+"
+
+SRC_URI = "\
+    ${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
+    file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
+    file://0002-uclibc-conf.patch \
+    file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
+    file://0004-uclibc-locale.patch \
+    file://0005-uclibc-locale-no__x.patch \
+    file://0006-uclibc-locale-wchar_fix.patch \
+    file://0007-uclibc-locale-update.patch \
+    file://0008-missing-execinfo_h.patch \
+    file://0009-c99-snprintf.patch \
+    file://0010-c99-complex-ugly-hack.patch \
+    file://0011-index_macro.patch \
+    file://0013-libstdc-namespace.patch \
+    file://0014-sh-pr24836.patch \
+    file://0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch \
+    file://0016-gcc-poison-system-directories.patch \
+    file://0017-gcc-poison-dir-extend.patch \
+    file://0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
+    file://0019-64-bit-multilib-hack.patch \
+    file://0020-optional-libstdc.patch \
+    file://0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
+    file://0022-COLLECT_GCC_OPTIONS.patch \
+    file://0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+    file://0024-PR-target-32219.patch \
+    file://0025-fortran-cross-compile-hack.patch \
+    file://0026-libgcc-sjlj-check.patch \
+    file://0027-cpp-honor-sysroot.patch \
+    file://0028-MIPS64-Default-to-N64-ABI.patch \
+    file://0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
+    file://0030-gcc-Fix-argument-list-too-long-error.patch \
+    file://0031-Disable-sdt.patch \
+    file://0032-libtool.patch \
+    file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
+    file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
+    file://0037-gcc-4.8-PR56797.patch \
+    file://0040-fix-g++-sysroot.patch \
+    file://0041-libtool-avoid-libdir.patch \
+    file://0043-cpp.patch \
+    file://0044-gengtypes.patch \
+    file://0046-libatomic-deptracking.patch \
+    file://0047-repomembug.patch \
+    file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
+    file://0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch \
+    file://0051-eabispe.patch \
+    file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
+    file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
+"
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
 
@@ -80,40 +83,47 @@ JAVA = ""
 
 LTO = "--enable-lto"
 
-EXTRA_OECONF_BASE = "   ${LTO} \
-			--enable-libssp \
-			--disable-bootstrap \
-			--disable-libmudflap \
-			--with-system-zlib \
-			--with-linker-hash-style=${LINKER_HASH_STYLE} \
-			--enable-linker-build-id \
-			--with-ppl=no \
-			--with-cloog=no \
-			--enable-checking=release \
-			--enable-cheaders=c_global "
-
-EXTRA_OECONF_INITIAL = "--disable-libmudflap \
-			--disable-libgomp \
-			--disable-libssp \
-			--disable-libquadmath \
-			--with-system-zlib \
-			--disable-lto \
-			--disable-plugin \
-			--enable-decimal-float=no"
-
-EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
-				--disable-libgomp \
-				--disable-libquadmath \
-				--with-system-zlib \
-				--disable-lto \
-				--disable-plugin \
-				--disable-libssp"
+EXTRA_OECONF_BASE = "\
+    ${LTO} \
+    --enable-libssp \
+    --disable-bootstrap \
+    --disable-libmudflap \
+    --with-system-zlib \
+    --with-linker-hash-style=${LINKER_HASH_STYLE} \
+    --enable-linker-build-id \
+    --with-ppl=no \
+    --with-cloog=no \
+    --enable-checking=release \
+    --enable-cheaders=c_global \
+"
+
+EXTRA_OECONF_INITIAL = "\
+    --disable-libmudflap \
+    --disable-libgomp \
+    --disable-libssp \
+    --disable-libquadmath \
+    --with-system-zlib \
+    --disable-lto \
+    --disable-plugin \
+    --enable-decimal-float=no \
+"
+
+EXTRA_OECONF_INTERMEDIATE = "\
+    --disable-libmudflap \
+    --disable-libgomp \
+    --disable-libquadmath \
+    --with-system-zlib \
+    --disable-lto \
+    --disable-plugin \
+    --disable-libssp \
+"
 
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
-EXTRA_OECONF_PATHS = " \ 
-                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \ 
-                      --with-sysroot=${STAGING_DIR_TARGET} \ 
-                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+EXTRA_OECONF_PATHS = "\ 
+    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \ 
+    --with-sysroot=${STAGING_DIR_TARGET} \ 
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
 
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 75fb379..9c4e986 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -29,24 +29,26 @@ EXTRA_OECONF_INTERMEDIATE ?= ""
 GCCMULTILIB ?= "--disable-multilib"
 GCCTHREADS ?= "posix"
 
-EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
-                --with-gnu-ld \
-                --enable-shared \
-                --enable-languages=${LANGUAGES} \
-                --enable-threads=${GCCTHREADS} \
-                ${GCCMULTILIB} \
-                --enable-c99 \
-                --enable-long-long \
-                --enable-symvers=gnu \
-                --enable-libstdcxx-pch \
-                --program-prefix=${TARGET_PREFIX} \
-		--without-local-prefix \
-                ${OPTSPACE} \
-                ${EXTRA_OECONF_BASE} \
-                ${EXTRA_OECONF_FPU} \
-                ${EXTRA_OECONF_PATHS} \
-                ${@get_gcc_mips_plt_setting(bb, d)} \
-                ${@get_gcc_multiarch_setting(bb, d)}"
+EXTRA_OECONF = "\
+    ${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
+    --with-gnu-ld \
+    --enable-shared \
+    --enable-languages=${LANGUAGES} \
+    --enable-threads=${GCCTHREADS} \
+    ${GCCMULTILIB} \
+    --enable-c99 \
+    --enable-long-long \
+    --enable-symvers=gnu \
+    --enable-libstdcxx-pch \
+    --program-prefix=${TARGET_PREFIX} \
+    --without-local-prefix \
+    ${OPTSPACE} \
+    ${EXTRA_OECONF_BASE} \
+    ${EXTRA_OECONF_FPU} \
+    ${EXTRA_OECONF_PATHS} \
+    ${@get_gcc_mips_plt_setting(bb, d)} \
+    ${@get_gcc_multiarch_setting(bb, d)} \
+"
 
 export ac_cv_path_SED = 'sed'
 export gcc_cv_collect2_libs = 'none required'
@@ -55,11 +57,11 @@ export gcc_cv_collect2_libs = 'none required'
 # hence being missed by the insane do_configure check).
 
 # Build uclibc compilers without cxa_atexit support
-EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
-EXTRA_OECONF_append_libc-uclibc        = " --enable-__cxa_atexit"
+EXTRA_OECONF_append_linux = " --enable-__cxa_atexit"
+EXTRA_OECONF_append_libc-uclibc = " --enable-__cxa_atexit"
 
-EXTRA_OECONF_append_mips64    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
-EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mips64 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 
 EXTRA_OECONF_FPU ??= ""
 CPPFLAGS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index f0a03a6..7da5058 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -9,10 +9,12 @@ GCCMULTILIB = "--enable-multilib"
 
 require gcc-configure-common.inc
 
-EXTRA_OECONF_PATHS = "--with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++/${BINV} \
-                      --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
-                      --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
-                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+EXTRA_OECONF_PATHS = "\
+    --with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++/${BINV} \
+    --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
+    --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
 # We have to point gcc at a sysroot but we don't need to rebuild if this changes
 # e.g. we switch between different machines with different tunes.
 EXTRA_OECONF_PATHS[vardepsexclude] = "TUNE_PKGARCH"
@@ -82,14 +84,14 @@ FILES_${PN} = "\
     ${prefix}/${TARGET_SYS}/bin/* \
     ${prefix}/${TARGET_SYS}/lib/* \
     ${prefix}/${TARGET_SYS}/usr/include/* \
-    "
+"
 INSANE_SKIP_${PN} += "dev-so"
 
 FILES_${PN}-doc = "\
     ${infodir} \
     ${mandir} \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
-    "
+"
 
 EXEEXT = ""
 
@@ -156,11 +158,13 @@ SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
-EXTRA_OECONF += " --enable-poison-system-directories"
+EXTRA_OECONF += "--enable-poison-system-directories"
 
-EXTRA_OECONF += "--disable-libunwind-exceptions \
-		--with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
-		--with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
+EXTRA_OECONF += "\
+    --disable-libunwind-exceptions \
+    --with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
+    --with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix} \
+"
 
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 5a6da8b..b8e3a86 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -11,22 +11,24 @@ CROSS_TARGET_SYS_DIR_append = ".${PN}"
 
 # This is intended to be a -very- basic config
 # sysroot is needed in case we use libc-initial
-EXTRA_OECONF = "--with-newlib \
-		--without-headers \
-		--disable-shared \
-		--disable-threads \
-		--disable-multilib \
-		--disable-__cxa_atexit \
-		--enable-languages=c \
-                ${OPTSPACE} \
-		--program-prefix=${TARGET_PREFIX} \
-		--with-sysroot=${STAGING_DIR_TARGET} \
-		--with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
-		${EXTRA_OECONF_INITIAL} \
-		${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
-		${EXTRA_OECONF_FPU}"
+EXTRA_OECONF = "\
+    --with-newlib \
+    --without-headers \
+    --disable-shared \
+    --disable-threads \
+    --disable-multilib \
+    --disable-__cxa_atexit \
+    --enable-languages=c \
+    ${OPTSPACE} \
+    --program-prefix=${TARGET_PREFIX} \
+    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-build-sysroot=${GCCCROSS_BUILDSYSROOT} \
+    ${EXTRA_OECONF_INITIAL} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
+    ${EXTRA_OECONF_FPU} \
+"
 
-EXTRA_OECONF += " --with-native-system-header-dir=${SYSTEMHEADERS} "
+EXTRA_OECONF += "--with-native-system-header-dir=${SYSTEMHEADERS}"
 
 GCCCROSS_BUILDSYSROOT = "${B}/tmpsysroot"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index cf3e5e8..64d0652 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -13,17 +13,23 @@ PN = "gcc-cross-${TARGET_ARCH}"
 
 require gcc-configure-common.inc
 
-EXTRA_OECONF += " --enable-poison-system-directories"
-EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
-
-EXTRA_OECONF += "--disable-libunwind-exceptions \
-                 --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
-                 --with-system-zlib "
-
-EXTRA_OECONF_PATHS = " \
-                      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \
-                      --with-sysroot=${STAGING_DIR_TARGET} \
-                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+EXTRA_OECONF += "--enable-poison-system-directories"
+EXTRA_OECONF_append_sh4 = " \
+    --with-multilib-list= \
+    --enable-incomplete-targets \
+"
+
+EXTRA_OECONF += "\
+    --disable-libunwind-exceptions \
+    --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
+    --with-system-zlib \
+"
+
+EXTRA_OECONF_PATHS = "\
+    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \
+    --with-sysroot=${STAGING_DIR_TARGET} \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 974c80c..e7d938d 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -2,10 +2,11 @@ require gcc-configure-common.inc
 
 CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
 
-EXTRA_OECONF_PATHS = " \
+EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-sysroot=${STAGING_DIR_TARGET} \
-    --with-build-sysroot=${STAGING_DIR_TARGET}"
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions"
 EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
@@ -63,111 +64,113 @@ PROVIDES = "virtual/${TARGET_PREFIX}compilerlibs"
 BBCLASSEXTEND = "nativesdk"
 
 PACKAGES = "\
-  ${PN}-dbg \
-  libstdc++ \
-  libstdc++-precompile-dev \
-  libstdc++-dev \
-  libstdc++-staticdev \
-  libg2c \
-  libg2c-dev \
-  libssp \
-  libssp-dev \
-  libssp-staticdev \
-  libgfortran \
-  libgfortran-dev \
-  libgfortran-staticdev \
-  libmudflap \
-  libmudflap-dev \
-  libmudflap-staticdev \
-  libquadmath \
-  libquadmath-dev \
-  libquadmath-staticdev \
-  libgomp \
-  libgomp-dev \
-  libgomp-staticdev \
-  libatomic \
-  libatomic-dev \
-  libatomic-staticdev \
+    ${PN}-dbg \
+    libstdc++ \
+    libstdc++-precompile-dev \
+    libstdc++-dev \
+    libstdc++-staticdev \
+    libg2c \
+    libg2c-dev \
+    libssp \
+    libssp-dev \
+    libssp-staticdev \
+    libgfortran \
+    libgfortran-dev \
+    libgfortran-staticdev \
+    libmudflap \
+    libmudflap-dev \
+    libmudflap-staticdev \
+    libquadmath \
+    libquadmath-dev \
+    libquadmath-staticdev \
+    libgomp \
+    libgomp-dev \
+    libgomp-staticdev \
+    libatomic \
+    libatomic-dev \
+    libatomic-staticdev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
 
 # include python debugging scripts
 FILES_${PN}-dbg += "\
-  ${libdir}/libstdc++.so.*-gdb.py \
-  ${datadir}/gcc-${BINV}/python/libstdcxx"
+    ${libdir}/libstdc++.so.*-gdb.py \
+    ${datadir}/gcc-${BINV}/python/libstdcxx \
+"
 
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
 FILES_libg2c-dev = "\
-  ${libdir}/libg2c.so \
-  ${libdir}/libg2c.a \
-  ${libdir}/libfrtbegin.a"
+    ${libdir}/libg2c.so \
+    ${libdir}/libg2c.a \
+    ${libdir}/libfrtbegin.a \
+"
 
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "\
-  ${includedir}/c++/ \
-  ${libdir}/libstdc++.so \
-  ${libdir}/libstdc++.la \
-  ${libdir}/libsupc++.la"
+    ${includedir}/c++/ \
+    ${libdir}/libstdc++.so \
+    ${libdir}/libstdc++.la \
+    ${libdir}/libsupc++.la \
+"
 FILES_libstdc++-staticdev = "\
-  ${libdir}/libstdc++.a \
-  ${libdir}/libsupc++.a"
+    ${libdir}/libstdc++.a \
+    ${libdir}/libsupc++.a \
+"
 
 FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
 
 FILES_libssp = "${libdir}/libssp.so.*"
-FILES_libssp-dev = " \
-  ${libdir}/libssp*.so \
-  ${libdir}/libssp*_nonshared.a \
-  ${libdir}/libssp*.la \
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
-FILES_libssp-staticdev = " \
-  ${libdir}/libssp*.a"
+FILES_libssp-dev = "\
+    ${libdir}/libssp*.so \
+    ${libdir}/libssp*_nonshared.a \
+    ${libdir}/libssp*.la \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
+"
+FILES_libssp-staticdev = "${libdir}/libssp*.a"
 
 FILES_libgfortran = "${libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = " \
-  ${libdir}/libgfortran*.so \
-  ${libdir}/libgfortran.spec \
-  ${libdir}/libgfortran.la \
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single*"
-FILES_libgfortran-staticdev = " \
-  ${libdir}/libgfortran.a"
+FILES_libgfortran-dev = "\
+    ${libdir}/libgfortran*.so \
+    ${libdir}/libgfortran.spec \
+    ${libdir}/libgfortran.la \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
+"
+FILES_libgfortran-staticdev = "${libdir}/libgfortran.a"
 
 INSANE_SKIP_${MLPREFIX}libgfortran-dev = "staticdev"
 
 FILES_libquadmath = "${libdir}/libquadmath*.so.*"
 FILES_libquadmath-dev = "\
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
-  ${libdir}/libquadmath*.so \
-  ${libdir}/libquadmath.la"
-FILES_libquadmath-staticdev = "\
-  ${libdir}/libquadmath.a"
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
+    ${libdir}/libquadmath*.so \
+    ${libdir}/libquadmath.la \
+"
+FILES_libquadmath-staticdev = "${libdir}/libquadmath.a"
 
 FILES_libmudflap = "${libdir}/libmudflap*.so.*"
 FILES_libmudflap-dev = "\
-  ${libdir}/libmudflap*.so \
-  ${libdir}/libmudflap.la"
-FILES_libmudflap-staticdev = "\
-  ${libdir}/libmudflap.a"
+    ${libdir}/libmudflap*.so \
+    ${libdir}/libmudflap.la \
+"
+FILES_libmudflap-staticdev = "${libdir}/libmudflap.a"
 
 FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
 FILES_libgomp-dev = "\
-  ${libdir}/libgomp*${SOLIBSDEV} \
-  ${libdir}/libgomp*.la \
-  ${libdir}/libgomp.spec \
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
-  "
-FILES_libgomp-staticdev = "\
-  ${libdir}/libgomp*.a \
-  "
+    ${libdir}/libgomp*${SOLIBSDEV} \
+    ${libdir}/libgomp*.la \
+    ${libdir}/libgomp.spec \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
+"
+FILES_libgomp-staticdev = "${libdir}/libgomp*.a"
 
 FILES_libatomic = "${libdir}/libatomic.so.*"
-FILES_libatomic-dev = " \
-  ${libdir}/libatomic.so \
-  ${libdir}/libatomic.la"
-FILES_libatomic-staticdev = " \
-  ${libdir}/libatomic.a"
+FILES_libatomic-dev = "\
+    ${libdir}/libatomic.so \
+    ${libdir}/libatomic.la \
+"
+FILES_libatomic-staticdev = "${libdir}/libatomic.a"
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 59c554d..8941f5f 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -1,105 +1,105 @@
 GCCMULTILIB = "--enable-multilib"
 require gcc-configure-common.inc
 
-EXTRA_OECONF_PATHS = " \
+EXTRA_OECONF_PATHS = "\
     --with-sysroot=/ \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
     --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
-    --with-gxx-include-dir=${includedir}/c++/${BINV}"
+    --with-gxx-include-dir=${includedir}/c++/${BINV} \
+"
 
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 
 PACKAGES = "\
-  ${PN} ${PN}-plugins ${PN}-symlinks \
-  g++ g++-symlinks \
-  cpp cpp-symlinks \
-  g77 g77-symlinks \
-  gfortran gfortran-symlinks \
-  gcov gcov-symlinks \
-  ${PN}-plugin-dev \
-  ${PN}-doc \
-  ${PN}-dev \
-  ${PN}-dbg \
+    ${PN} ${PN}-plugins ${PN}-symlinks \
+    g++ g++-symlinks \
+    cpp cpp-symlinks \
+    g77 g77-symlinks \
+    gfortran gfortran-symlinks \
+    gcov gcov-symlinks \
+    ${PN}-plugin-dev \
+    ${PN}-doc \
+    ${PN}-dev \
+    ${PN}-dbg \
 "
 
 FILES_${PN} = "\
-  ${bindir}/${TARGET_PREFIX}gcc* \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
+    ${bindir}/${TARGET_PREFIX}gcc* \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/include \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed \
 "
 INSANE_SKIP_${PN} += "dev-so"
 
 FILES_${PN}-dbg += "\
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/.debug/ \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/.debug/ \
 "
 FILES_${PN}-dev = "\
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
 "
 FILES_${PN}-plugin-dev = "\
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/include/ \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/gengtype \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin/gtype.state \
 "
 FILES_${PN}-symlinks = "\
-  ${bindir}/cc \
-  ${bindir}/gcc \
-  ${bindir}/gccbug \
+    ${bindir}/cc \
+    ${bindir}/gcc \
+    ${bindir}/gccbug \
 "
 
 FILES_${PN}-plugins = "\
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/plugin \
 "
 ALLOW_EMPTY_${PN}-plugins = "1"
 
 FILES_g77 = "\
-  ${bindir}/${TARGET_PREFIX}g77 \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
+    ${bindir}/${TARGET_PREFIX}g77 \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
 "
 FILES_g77-symlinks = "\
-  ${bindir}/g77 \
-  ${bindir}/f77 \
+    ${bindir}/g77 \
+    ${bindir}/f77 \
 "
 FILES_gfortran = "\
-  ${bindir}/${TARGET_PREFIX}gfortran \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
+    ${bindir}/${TARGET_PREFIX}gfortran \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
 "
 FILES_gfortran-symlinks = "\
-  ${bindir}/gfortran \
-  ${bindir}/f95"
+    ${bindir}/gfortran \
+    ${bindir}/f95"
 
 FILES_cpp = "\
-  ${bindir}/${TARGET_PREFIX}cpp \
-  ${base_libdir}/cpp \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
+    ${bindir}/${TARGET_PREFIX}cpp \
+    ${base_libdir}/cpp \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
 FILES_cpp-symlinks = "${bindir}/cpp"
 
 FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov"
 FILES_gcov-symlinks = "${bindir}/gcov"
 
 FILES_g++ = "\
-  ${bindir}/${TARGET_PREFIX}g++ \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
+    ${bindir}/${TARGET_PREFIX}g++ \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
 "
 FILES_g++-symlinks = "\
-  ${bindir}/c++ \
-  ${bindir}/g++ \
+    ${bindir}/c++ \
+    ${bindir}/g++ \
 "
 
-
 FILES_${PN}-doc = "\
-  ${infodir} \
-  ${mandir} \
-  ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
+    ${infodir} \
+    ${mandir} \
+    ${gcclibdir}/${TARGET_SYS}/${BINV}/include/README \
 "
 
 do_compile () {
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 45dd151..22c42d5 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -3,25 +3,26 @@ require libgcc-common.inc
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 
 PACKAGES = "\
-  ${PN} \
-  ${PN}-dev \
-  ${PN}-dbg \
-  libgcov-dev \
-  "
+    ${PN} \
+    ${PN}-dev \
+    ${PN}-dbg \
+    libgcov-dev \
+"
 
 FILES_${PN} = "${base_libdir}/libgcc*.so.*"
-FILES_${PN}-dev = " \
-  ${base_libdir}/libgcc*.so \
-  ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
-  ${libdir}/${TARGET_SYS}/${BINV}/64 \
-  ${libdir}/${TARGET_SYS}/${BINV}/32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcc* \
-  ${@base_conditional('TARGET_SYS_NO_EXTENSION', '${TARGET_SYS}', '', '${libdir}/${TARGET_SYS_NO_EXTENSION}', d)}"
-FILES_libgcov-dev = " \
-  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
-  "
+FILES_${PN}-dev = "\
+    ${base_libdir}/libgcc*.so \
+    ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
+    ${libdir}/${TARGET_SYS}/${BINV}/64 \
+    ${libdir}/${TARGET_SYS}/${BINV}/32 \
+    ${libdir}/${TARGET_SYS}/${BINV}/x32 \
+    ${libdir}/${TARGET_SYS}/${BINV}/n32 \
+    ${libdir}/${TARGET_SYS}/${BINV}/libgcc* \
+    ${@base_conditional('TARGET_SYS_NO_EXTENSION', '${TARGET_SYS}', '', '${libdir}/${TARGET_SYS_NO_EXTENSION}', d)} \
+"
+FILES_libgcov-dev = "\
+    ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
+"
 FILES_${PN}-dbg += "${base_libdir}/.debug/"
 
 LIBGCCBUILDTREENAME = "gcc-build-internal-"
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 7bf4121..cf7942f 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -1,8 +1,9 @@
 require gcc-configure-common.inc
 
-EXTRA_OECONF_PATHS = " \
+EXTRA_OECONF_PATHS = "\
     --with-sysroot=${STAGING_DIR_TARGET} \
-    --with-build-sysroot=${STAGING_DIR_TARGET}"
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
 
 do_configure () {
 	mtarget=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
@@ -45,20 +46,20 @@ DEPENDS = "gcc-runtime"
 BBCLASSEXTEND = "nativesdk"
 
 PACKAGES = "\
-  ${PN}-dbg \
-  libgfortran \
-  libgfortran-dev \
-  libgfortran-staticdev \
+    ${PN}-dbg \
+    libgfortran \
+    libgfortran-dev \
+    libgfortran-staticdev \
 "
 FILES_${PN} = "${libdir}/libgfortran.so.*"
-FILES_${PN}-dev = " \
-  ${libdir}/libgfortran*.so \
-  ${libdir}/libgfortran.spec \
-  ${libdir}/libgfortran.la \
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
-  ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single*"
-FILES_${PN}-staticdev = " \
-  ${libdir}/libgfortran.a"
+FILES_${PN}-dev = "\
+    ${libdir}/libgfortran*.so \
+    ${libdir}/libgfortran.spec \
+    ${libdir}/libgfortran.la \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
+"
+FILES_${PN}-staticdev = "${libdir}/libgfortran.a"
 
 INSANE_SKIP_${MLPREFIX}libgfortran-dev = "staticdev"
 
-- 
1.8.5.5


