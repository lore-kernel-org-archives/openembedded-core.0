Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 94C9B71AB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:43 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 3A018A75E32B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:40 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 23 Nov 2016 13:47:43 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 13:47:30 +0000
Message-ID: <20161123134733.38276-5-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
References: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 4/7] python-numpy: Use MIPS MACHINE_OVERRIDES to reduce duplication
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
X-List-Received-Date: Wed, 23 Nov 2016 13:47:44 -0000
Content-Type: text/plain

The mipsarch* MACHINE_OVERRIDES can be used to pass the same
parameters to MIPS pre-R2 and R6 ISA variants.

Use them to reduce duplication in supporting MIPS R6 ISA.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 .../{mips64n32 => mipsarchn32eb}/_numpyconfig.h    |   0
 .../files/{mips64 => mipsarchn32eb}/config.h       |   0
 .../files/mipsarchn32el/_numpyconfig.h             |  31 +++++
 .../python-numpy/files/mipsarchn32el/config.h      | 138 +++++++++++++++++++++
 .../files/{mips64 => mipsarchn64eb}/_numpyconfig.h |   0
 .../files/{mips64n32 => mipsarchn64eb}/config.h    |   0
 .../files/mipsarchn64el/_numpyconfig.h             |  32 +++++
 .../python-numpy/files/mipsarchn64el/config.h      | 138 +++++++++++++++++++++
 .../files/{mips => mipsarcho32eb}/_numpyconfig.h   |   0
 .../files/{mips => mipsarcho32eb}/config.h         |   0
 .../files/{mipsel => mipsarcho32el}/config.h       |   0
 .../files/{mipsel => mipsarcho32el}/numpyconfig.h  |   0
 .../python-numpy/python-numpy_1.11.2.bb            |  16 ++-
 .../python-numpy/python3-numpy_1.11.2.bb           |  16 ++-
 14 files changed, 363 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/python-numpy/files/{mips64n32 => mipsarchn32eb}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mips64 => mipsarchn32eb}/config.h (100%)
 create mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
 rename meta/recipes-devtools/python-numpy/files/{mips64 => mipsarchn64eb}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mips64n32 => mipsarchn64eb}/config.h (100%)
 create mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
 rename meta/recipes-devtools/python-numpy/files/{mips => mipsarcho32eb}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mips => mipsarcho32eb}/config.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mipsel => mipsarcho32el}/config.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mipsel => mipsarcho32el}/numpyconfig.h (100%)

diff --git a/meta/recipes-devtools/python-numpy/files/mips64n32/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/mips64n32/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
diff --git a/meta/recipes-devtools/python-numpy/files/mips64/config.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/mips64/config.h
rename to meta/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
new file mode 100644
index 0000000..8e2b5d0
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
@@ -0,0 +1,31 @@
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
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
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
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
new file mode 100644
index 0000000..4872703
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
@@ -0,0 +1,138 @@
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
diff --git a/meta/recipes-devtools/python-numpy/files/mips64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/mips64/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
diff --git a/meta/recipes-devtools/python-numpy/files/mips64n32/config.h b/meta/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/mips64n32/config.h
rename to meta/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
new file mode 100644
index 0000000..debb390
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
@@ -0,0 +1,32 @@
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
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
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
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h b/meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
new file mode 100644
index 0000000..4872703
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
@@ -0,0 +1,138 @@
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
diff --git a/meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/mips/_numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
diff --git a/meta/recipes-devtools/python-numpy/files/mips/config.h b/meta/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/mips/config.h
rename to meta/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
diff --git a/meta/recipes-devtools/python-numpy/files/mipsel/config.h b/meta/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/mipsel/config.h
rename to meta/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
diff --git a/meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/mipsel/numpyconfig.h
rename to meta/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb
index dafd7e2..c4bc354 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb
@@ -26,7 +26,7 @@ CONFIGFILESURI_armeb = " \
     file://config.h \
     file://numpyconfig.h \
 "
-CONFIGFILESURI_mipsel = " \
+CONFIGFILESURI_mipsarcho32el = " \
     file://config.h \
     file://numpyconfig.h \
 "
@@ -38,7 +38,7 @@ CONFIGFILESURI_x86-64 = " \
     file://config.h \
     file://_numpyconfig.h \
 "
-CONFIGFILESURI_mips = " \
+CONFIGFILESURI_mipsarcho32eb = " \
     file://config.h \
     file://_numpyconfig.h \
 "
@@ -50,11 +50,19 @@ CONFIGFILESURI_powerpc64 = " \
     file://config.h \
     file://_numpyconfig.h \
 "
-CONFIGFILESURI_mips64 = " \
+CONFIGFILESURI_mipsarchn64eb = " \
     file://config.h \
     file://_numpyconfig.h \
 "
-CONFIGFILESURI_mips64n32 = " \
+CONFIGFILESURI_mipsarchn64el = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn32eb = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn32el = " \
     file://config.h \
     file://_numpyconfig.h \
 "
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
index c34df6f..d5fe50c 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
@@ -26,7 +26,7 @@ CONFIGFILESURI_armeb = " \
     file://config.h \
     file://numpyconfig.h \
 "
-CONFIGFILESURI_mipsel = " \
+CONFIGFILESURI_mipsarcho32el = " \
     file://config.h \
     file://numpyconfig.h \
 "
@@ -38,7 +38,7 @@ CONFIGFILESURI_x86-64 = " \
     file://config.h \
     file://_numpyconfig.h \
 "
-CONFIGFILESURI_mips = " \
+CONFIGFILESURI_mipsarcho32eb = " \
     file://config.h \
     file://_numpyconfig.h \
 "
@@ -50,11 +50,19 @@ CONFIGFILESURI_powerpc64 = " \
     file://config.h \
     file://_numpyconfig.h \
 "
-CONFIGFILESURI_mips64 = " \
+CONFIGFILESURI_mipsarchn64eb = " \
     file://config.h \
     file://_numpyconfig.h \
 "
-CONFIGFILESURI_mips64n32 = " \
+CONFIGFILESURI_mipsarchn64el = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn32eb = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn32el = " \
     file://config.h \
     file://_numpyconfig.h \
 "
-- 
2.10.2


