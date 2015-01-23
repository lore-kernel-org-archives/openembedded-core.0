Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D825A72CD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 21:20:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0NLK3N9020992
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 13:20:03 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 23 Jan 2015 13:20:02 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Jan 2015 15:20:01 -0600
Message-ID: <1422048001-34023-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] arch-mips.inc: Change definition of TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Fri, 23 Jan 2015 21:20:08 -0000
Content-Type: text/plain

[YOCTO #7230]

In certain system configurations TRANSLATED_TARGET_ARCH will not
expand in the right order for gcc-cross-candian-mips64n32 to be
generated properly.

This will cause SDKs to fail to generate properly.

Changing the global definition of TRANSLATED_TARGET_ARCH always
expands the ABIEXTENSION, which causes the OVERRIDES to pick it up
as well.  This effectively defines a new class of overrides for the 'n32'.

The side effect is that we need to duplicate some mips64 overrides, and
redefine others that were previously 'n32' or 'mips64' exclusive to have
the correct semantics.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/bitbake.conf                             |   2 +
 meta/conf/machine/include/mips/arch-mips.inc       |   4 +-
 .../packagegroups/packagegroup-core-sdk.bb         |   1 +
 .../packagegroup-core-tools-profile.bb             |   2 +
 .../packagegroups/packagegroup-self-hosted.bb      |   1 +
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +
 meta/recipes-devtools/gdb/gdb-common.inc           |   2 +
 .../python/python-numpy/mips64n32/_numpyconfig.h   |  30 +++++
 .../python/python-numpy/mips64n32/config.h         | 139 +++++++++++++++++++++
 meta/recipes-devtools/python/python-numpy_1.7.0.bb |   4 +
 .../ghostscript/ghostscript/mips64eln32/objarch.h  |  40 ++++++
 .../ghostscript/ghostscript/mips64n32/objarch.h    |  40 ++++++
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb         |   1 +
 .../packagegroups/packagegroup-core-lsb.bb         |   1 +
 meta/recipes-kernel/sysprof/sysprof_git.bb         |   1 +
 .../packagegroups/packagegroup-core-qt.bb          |   2 +-
 .../packagegroups/packagegroup-core-qt4e.bb        |   2 +-
 .../packagegroup-qt-toolchain-target.inc           |   2 +-
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |   2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |   1 +
 meta/recipes-sato/midori/midori_0.5.8.bb           |   2 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   2 +-
 22 files changed, 276 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/mips64n32/config.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips64eln32/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips64n32/objarch.h

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d22e9e8..ba6113d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -520,6 +520,8 @@ LINKER_HASH_STYLE_mips = "sysv"
 LINKER_HASH_STYLE_mipsel = "sysv"
 LINKER_HASH_STYLE_mips64 = "sysv"
 LINKER_HASH_STYLE_mips64el = "sysv"
+LINKER_HASH_STYLE_mips64n32 = "sysv"
+LINKER_HASH_STYLE_mips64eln32 = "sysv"
 TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE', True) != 'gnu']}"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 08d8fdc..c41fa5e 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -101,4 +101,6 @@ BASE_LIB_tune-mips64el-nf = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
 
-TRANSLATED_TARGET_ARCH_append = "${ABIEXTENSION}"
+# On mips we need to redefine this to include the ABIEXTENSION
+# we can avoid the python bit as there are no _ or - to translate
+TRANSLATED_TARGET_ARCH = "${TARGET_ARCH}${ABIEXTENSION}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 83da7e0..a41eada 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -32,6 +32,7 @@ SANITIZERS = "libasan-dev libubsan-dev"
 SANITIZERS_aarch64 = ""
 SANITIZERS_mips = ""
 SANITIZERS_mips64 = ""
+SANITIZERS_mips64n32 = ""
 SANITIZERS_powerpc64 = ""
 SANITIZERS_sparc = ""
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index f0ba8b9..6f4842f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -38,6 +38,7 @@ SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-uclibc = ""
 SYSTEMTAP_mips = ""
 SYSTEMTAP_mips64 = ""
+SYSTEMTAP_mips64n32 = ""
 SYSTEMTAP_aarch64 = ""
 
 # lttng-ust uses sched_getcpu() which is not there on uclibc
@@ -65,6 +66,7 @@ VALGRIND = "valgrind"
 VALGRIND_libc-uclibc = ""
 VALGRIND_mips = ""
 VALGRIND_mips64 = ""
+VALGRIND_mips64n32 = ""
 VALGRIND_arm = ""
 VALGRIND_aarch64 = ""
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index af57fac..c471020 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -29,6 +29,7 @@ RDEPENDS_packagegroup-self-hosted = "\
 # midori depends on webkit-gtk which could not build for mips64
 MIDORI = "midori"
 MIDORI_mips64 = ""
+MIDORI_mips64n32 = ""
 
 RDEPENDS_packagegroup-self-hosted-host-tools = "\
     connman \
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 0693118..c30242d 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -64,6 +64,8 @@ EXTRA_OECONF_append_libc-uclibc = " --enable-__cxa_atexit"
 
 EXTRA_OECONF_append_mips64 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 EXTRA_OECONF_append_mips64el = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mips64n32 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mips64eln32 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 
 # ARMv6+ adds atomic instructions that affect the ABI in libraries built
 # with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index a902f9a..81af42f 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -11,6 +11,8 @@ LTTNGUST_mips = ""
 LTTNGUST_mipsel = ""
 LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
+LTTNGUST_mips64n32 = ""
+LTTNGUST_mips64eln32 = ""
 LTTNGUST_sh4 = ""
 
 INC_PR = "r0"
diff --git a/meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h
new file mode 100644
index 0000000..be57ac2
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/mips64n32/_numpyconfig.h
@@ -0,0 +1,30 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x00000007
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy/mips64n32/config.h b/meta/recipes-devtools/python/python-numpy/mips64n32/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/mips64n32/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
index 6cb14c9..d4fd279 100644
--- a/meta/recipes-devtools/python/python-numpy_1.7.0.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -50,6 +50,10 @@ CONFIGFILESURI_mips64 = " \
     file://config.h \
     file://_numpyconfig.h \
 "
+CONFIGFILESURI_mips64n32 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
 
 S = "${WORKDIR}/numpy-${PV}"
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mips64eln32/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mips64eln32/objarch.h
new file mode 100644
index 0000000..a05de29
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/mips64eln32/objarch.h
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 8
+#define ARCH_ALIGN_PTR_MOD 8
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 3
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 8
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 0
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mips64n32/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mips64n32/objarch.h
new file mode 100644
index 0000000..0d0a16b
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/mips64n32/objarch.h
@@ -0,0 +1,40 @@
+/* Parameters derived from machine and compiler architecture. */
+/* This file is generated mechanically by genarch.c. */
+
+	 /* ---------------- Scalar alignments ---------------- */
+
+#define ARCH_ALIGN_SHORT_MOD 2
+#define ARCH_ALIGN_INT_MOD 4
+#define ARCH_ALIGN_LONG_MOD 8
+#define ARCH_ALIGN_PTR_MOD 8
+#define ARCH_ALIGN_FLOAT_MOD 4
+#define ARCH_ALIGN_DOUBLE_MOD 8
+
+	 /* ---------------- Scalar sizes ---------------- */
+
+#define ARCH_LOG2_SIZEOF_CHAR 0
+#define ARCH_LOG2_SIZEOF_SHORT 1
+#define ARCH_LOG2_SIZEOF_INT 2
+#define ARCH_LOG2_SIZEOF_LONG 3
+#define ARCH_LOG2_SIZEOF_LONG_LONG 3
+#define ARCH_SIZEOF_GX_COLOR_INDEX 8
+#define ARCH_SIZEOF_PTR 8
+#define ARCH_SIZEOF_FLOAT 4
+#define ARCH_SIZEOF_DOUBLE 8
+#define ARCH_FLOAT_MANTISSA_BITS 24
+#define ARCH_DOUBLE_MANTISSA_BITS 53
+
+	 /* ---------------- Unsigned max values ---------------- */
+
+#define ARCH_MAX_UCHAR ((unsigned char)0xff + (unsigned char)0)
+#define ARCH_MAX_USHORT ((unsigned short)0xffff + (unsigned short)0)
+#define ARCH_MAX_UINT ((unsigned int)~0 + (unsigned int)0)
+#define ARCH_MAX_ULONG ((unsigned long)~0L + (unsigned long)0)
+
+	 /* ---------------- Miscellaneous ---------------- */
+
+#define ARCH_IS_BIG_ENDIAN 1
+#define ARCH_PTRS_ARE_SIGNED 0
+#define ARCH_FLOATS_ARE_IEEE 1
+#define ARCH_ARITH_RSHIFT 2
+#define ARCH_DIV_NEG_POS_TRUNCATES 1
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
index c9392b4..7140990 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
@@ -32,6 +32,7 @@ EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
 # int-ll64.h included
 EXTRA_OEMAKE_append_powerpc64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
 EXTRA_OEMAKE_append_mips64 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
+EXTRA_OEMAKE_append_mips64n32 = ' CFLAGS=-D__SANE_USERSPACE_TYPES__'
 
 do_compile() {
 	oe_runmake
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index dd96fbe..e0f32e0 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -211,6 +211,7 @@ QT4PKGS = " \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
     "
 QT4PKGS_mips64 = ""
+QT4PKGS_mips64n32 = ""
 
 SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
 DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to support libraries \
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index cfc814f..e18aebf 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.gnome.org/sysprof \
 SRC_URI_append_arm  = " file://rmb-arm.patch"
 SRC_URI_append_mips = " file://rmb-mips.patch"
 SRC_URI_append_mips64 = " file://rmb-mips.patch"
+SRC_URI_append_mips64n32 = " file://rmb-mips.patch"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index d28e032..5f6916a 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 PR = "r4"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
-COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+COMPATIBLE_HOST_mips64 = "null"
 
 inherit packagegroup
 
diff --git a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
index d7a457c..d4f0fd1 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt4e.bb
@@ -3,7 +3,7 @@ PR = "r2"
 LICENSE = "MIT"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
-COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+COMPATIBLE_HOST_mips64 = "null"
 
 inherit packagegroup
 
diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
index fc1ccba..02a0326 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
@@ -1,7 +1,7 @@
 LICENSE = "MIT"
 
 # Qt4 could NOT be built on MIPS64 with 64 bits userspace
-COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
+COMPATIBLE_HOST_mips64 = "null"
 
 inherit packagegroup
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.8.6.inc
index a2c0688..bd20dac 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.6.inc
@@ -39,7 +39,7 @@ S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 # disable webkit for mips64 n32 temporarily that fails to compile,
 # qt upstream defect:
 # https://bugreports.qt-project.org/browse/QTBUG-39224
-QT_CONFIG_FLAGS_append_mips64 = "${@bb.utils.contains("TUNE_FEATURES", "n32", " -no-webkit", "" ,d)}"
+QT_CONFIG_FLAGS_append_mips64n32 = " -no-webkit"
 
 # disable webkit for aarch64 temporarily that fails to compile
 QT_CONFIG_FLAGS_append_aarch64 = " -no-webkit"
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 1c4f328..62836f9 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -6,6 +6,7 @@ form a standalone SDK."
 
 QT4PKG = "qt4-pkgs"
 QT4PKG_mips64 = ""
+QT4PKG_mips64n32 = ""
 
 IMAGE_FEATURES += "dev-pkgs tools-sdk ${QT4PKG} \
 	tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
diff --git a/meta/recipes-sato/midori/midori_0.5.8.bb b/meta/recipes-sato/midori/midori_0.5.8.bb
index 299ecb3..3aabdd4 100644
--- a/meta/recipes-sato/midori/midori_0.5.8.bb
+++ b/meta/recipes-sato/midori/midori_0.5.8.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "af19135fd4c4b04345df4d3592e7939c20f9b40eaca24550e6cb619751
 
 # midori depends on webkit-gtk, and webkit-gtk can NOT be built on
 # MIPS64 with n32 ABI. So remove it from mips64 n32 temporarily.
-COMPATIBLE_HOST_mips64 = "mips64.*-linux$"
+COMPATIBLE_HOST_mips64n32 = "null"
 
 inherit gtk-icon-cache pkgconfig vala pythonnative cmake
 
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 29f8a79..920e1a0 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -32,7 +32,7 @@ SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
 SRC_URI[sha256sum] = "ada02d636af61aed38f142d3cded662d141ce71264f624c4eb873621a74cc9e7"
 
 # webkit-gtk can NOT be built on MIPS64 with n32 ABI
-COMPATIBLE_HOST_mips64 = "mips64.*-linux$"
+COMPATIBLE_HOST_mips64n32 = "null"
 
 inherit autotools lib_package gtk-doc pkgconfig
 
-- 
1.9.3


