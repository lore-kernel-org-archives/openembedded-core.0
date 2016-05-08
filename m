Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 22C3E6FF4E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 09:29:20 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id iv1so61999584pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 May 2016 02:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jyBhVC0rxTdpOOjnjC9WFhBmn64SHpkvHBMrj4vSJP8=;
	b=itDqGd+athaGpdZD3uPSKvcu8upJZLE1rgR4+Wu1JkQ4CL7/+6qt9/aJaKaM2YZazz
	0v08N0FJaxpOrrArPw0MneCyapiJei81LED/4sSjqnKuYZPS7H+YguEats2WscewQlPw
	oAN7iolX4Zh+vtAmM1xm3nTcblxWnLoIKiW7mh8vZUTtl1XjnVFbFBren7ozNlIgSX5l
	er2l3bxbFHjSlOkOjNierbWiDxnYA3RaPGIAbxmgHKbxr1mP0w66rsRNElHB8JmPkl/a
	hv6Tk6Xfxa0a/aVtqi3sNPitcJYtHLsnwWUCWxr7UOu0XaNchDPjary9yylhJ1WiIF4f
	hN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jyBhVC0rxTdpOOjnjC9WFhBmn64SHpkvHBMrj4vSJP8=;
	b=VQ85/OkUMCUyapIxj5S26uiNW/LpgDVTFo8rKn0ygDtOOBTdZcB6z0Zjdw+r6vqfe4
	/VdYvFd2ySngbHrheElnMuOjFHqJfgaPvw6w97iCHaGF+HplFf2lyjHqweu7gXg0vJj9
	YeuelGZH7H18IQZuDRXsVTZIjoEUsqY6GhzsfrP1p4LBtFgJNWmslLN8W/B01y3A0aW6
	xOjxvlMo9iswZ57sjIzA04nBekjaMh5pdKA8T+EijKxofh7gnIMUpdCukuuCX3DSEpmF
	vmRepgjlgdA9QDhiefct7m8ihV/79SWH0HyJFPpfGoMyPBTDkLs9wgi5lNA9plb/j+mF
	cGVw==
X-Gm-Message-State: AOPr4FWguY3L/gRZAFmy94B2rR2oVUeooJJiEH6Jr+Z8H9PQTJkyx2zZe9SGnvSuUfysmA==
X-Received: by 10.66.33.1 with SMTP id n1mr41696028pai.65.1462699761208;
	Sun, 08 May 2016 02:29:21 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	71sm32659208pfy.32.2016.05.08.02.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 May 2016 02:29:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 May 2016 02:29:08 -0700
Message-Id: <1462699748-23121-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCH] gcc: Fix hang when -mX -mmusl options are used in sequence
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
X-List-Received-Date: Sun, 08 May 2016 09:29:21 -0000

See this thread for details

https://lists.yoctoproject.org/pipermail/poky/2016-May/010513.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Reported-by: Ruslan Babayev <ruslan@babayev.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
 ...l-as-a-musl-libc-specifier-and-the-necess.patch |  72 +++++------
 .../gcc/gcc-5.3/0059-Add-musl-support-to-GCC.patch | 143 +++++++++++++++++++++
 3 files changed, 180 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0059-Add-musl-support-to-GCC.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 9808be1..912a2c5 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -88,6 +88,7 @@ SRC_URI = "\
            file://0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch \
            file://0057-unwind-fix-for-musl.patch \
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
+           file://0059-Add-musl-support-to-GCC.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch b/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
index b91c02d..8673f33 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/ginclude/stddef.h         |   3 ++
  6 files changed, 110 insertions(+), 13 deletions(-)
 
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 3825bd5..39ce047 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
+Index: gcc-5.3.0/gcc/config.gcc
+===================================================================
+--- gcc-5.3.0.orig/gcc/config.gcc
++++ gcc-5.3.0/gcc/config.gcc
 @@ -575,7 +575,7 @@ case ${target} in
  esac
  
@@ -50,11 +50,11 @@ index 3825bd5..39ce047 100644
  	if test x${enable_secureplt} = xyes; then
  		tm_file="rs6000/secureplt.h ${tm_file}"
  	fi
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 22b9be5..ca9a17f 100644
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -32,10 +32,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+Index: gcc-5.3.0/gcc/config/linux.h
+===================================================================
+--- gcc-5.3.0.orig/gcc/config/linux.h
++++ gcc-5.3.0/gcc/config/linux.h
+@@ -32,10 +32,12 @@ see the files COPYING3 and COPYING.RUNTI
  #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
  #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
  #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
@@ -67,7 +67,7 @@ index 22b9be5..ca9a17f 100644
  #endif
  
  #define GNU_USER_TARGET_OS_CPP_BUILTINS()			\
-@@ -53,18 +55,21 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -53,18 +55,21 @@ see the files COPYING3 and COPYING.RUNTI
     uClibc or Bionic is the default C library and whether
     -muclibc or -mglibc or -mbionic has been passed to change the default.  */
  
@@ -97,7 +97,7 @@ index 22b9be5..ca9a17f 100644
  #else
  #error "Unsupported DEFAULT_LIBC"
  #endif /* DEFAULT_LIBC */
-@@ -84,16 +89,16 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -84,16 +89,16 @@ see the files COPYING3 and COPYING.RUNTI
  
  #define GNU_USER_DYNAMIC_LINKER						\
    CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,	\
@@ -118,7 +118,7 @@ index 22b9be5..ca9a17f 100644
  
  /* Whether we have Bionic libc runtime */
  #undef TARGET_HAS_BIONIC
-@@ -123,3 +128,74 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+@@ -123,3 +128,74 @@ see the files COPYING3 and COPYING.RUNTI
  # define TARGET_LIBC_HAS_FUNCTION linux_libc_has_function
  
  #endif
@@ -193,32 +193,35 @@ index 22b9be5..ca9a17f 100644
 +    { 0, 0, 0, 0, 0, 0 }				\
 +  }
 +#endif
-diff --git a/gcc/config/linux.opt b/gcc/config/linux.opt
-index c054338..9334f74 100644
---- a/gcc/config/linux.opt
-+++ b/gcc/config/linux.opt
-@@ -30,3 +30,7 @@ Use GNU C library
+Index: gcc-5.3.0/gcc/config/linux.opt
+===================================================================
+--- gcc-5.3.0.orig/gcc/config/linux.opt
++++ gcc-5.3.0/gcc/config/linux.opt
+@@ -28,5 +28,9 @@ Target Report RejectNegative Var(linux_l
+ Use GNU C library
+ 
  muclibc
- Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
+-Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
++Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mmusl)
  Use uClibc C library
 +
 +mmusl
-+Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mglibc)
++Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mbionic)
 +Use musl C library
-diff --git a/gcc/config/rs6000/secureplt.h b/gcc/config/rs6000/secureplt.h
-index b463463..77edf2a 100644
---- a/gcc/config/rs6000/secureplt.h
-+++ b/gcc/config/rs6000/secureplt.h
-@@ -18,3 +18,4 @@ along with GCC; see the file COPYING3.  If not see
+Index: gcc-5.3.0/gcc/config/rs6000/secureplt.h
+===================================================================
+--- gcc-5.3.0.orig/gcc/config/rs6000/secureplt.h
++++ gcc-5.3.0/gcc/config/rs6000/secureplt.h
+@@ -18,3 +18,4 @@ along with GCC; see the file COPYING3.
  <http://www.gnu.org/licenses/>.  */
  
  #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
 +#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
-diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index c6c31dc..7cd07e0 100644
---- a/gcc/config/rs6000/sysv4.h
-+++ b/gcc/config/rs6000/sysv4.h
-@@ -538,6 +538,10 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEFAULT_ASM_ENDIAN)
+Index: gcc-5.3.0/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-5.3.0.orig/gcc/config/rs6000/sysv4.h
++++ gcc-5.3.0/gcc/config/rs6000/sysv4.h
+@@ -538,6 +538,10 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEF
  #define CC1_SECURE_PLT_DEFAULT_SPEC ""
  #endif
  
@@ -237,10 +240,10 @@ index c6c31dc..7cd07e0 100644
    { "cpp_os_ads",		CPP_OS_ADS_SPEC },			\
    { "cpp_os_yellowknife",	CPP_OS_YELLOWKNIFE_SPEC },		\
    { "cpp_os_mvme",		CPP_OS_MVME_SPEC },			\
-diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
-index f20a41b..eb879ef 100644
---- a/gcc/ginclude/stddef.h
-+++ b/gcc/ginclude/stddef.h
+Index: gcc-5.3.0/gcc/ginclude/stddef.h
+===================================================================
+--- gcc-5.3.0.orig/gcc/ginclude/stddef.h
++++ gcc-5.3.0/gcc/ginclude/stddef.h
 @@ -184,6 +184,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
  #ifndef _GCC_SIZE_T
  #ifndef _SIZET_
@@ -265,6 +268,3 @@ index f20a41b..eb879ef 100644
  #endif /* __size_t */
  #endif /* _SIZET_ */
  #endif /* _GCC_SIZE_T */
--- 
-2.6.3
-
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0059-Add-musl-support-to-GCC.patch b/meta/recipes-devtools/gcc/gcc-5.3/0059-Add-musl-support-to-GCC.patch
new file mode 100644
index 0000000..b9de01c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0059-Add-musl-support-to-GCC.patch
@@ -0,0 +1,143 @@
+From f2d678afa5b8385d763b93772d73d6bf80a9739e Mon Sep 17 00:00:00 2001
+From: ktkachov <ktkachov@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 8 May 2015 08:30:40 +0000
+Subject: [PATCH] [PATCH 0/13] Add musl support to GCC
+
+2015-05-08  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/glibc-stdint.h (OPTION_MUSL): Define.
+	(INT_FAST16_TYPE, INT_FAST32_TYPE, UINT_FAST16_TYPE, UINT_FAST32_TYPE):
+	Change the definition based on OPTION_MUSL for 64 bit targets.
+	* config/linux.h (OPTION_MUSL): Redefine.
+	* config/alpha/linux.h (OPTION_MUSL): Redefine.
+	* config/rs6000/linux.h (OPTION_MUSL): Redefine.
+	* config/rs6000/linux64.h (OPTION_MUSL): Redefine.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@222905 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+ gcc/ChangeLog               | 10 ++++++++++
+ gcc/config/alpha/linux.h    |  4 ++++
+ gcc/config/glibc-stdint.h   | 14 ++++++++++----
+ gcc/config/linux.h          |  2 ++
+ gcc/config/rs6000/linux.h   |  4 ++++
+ gcc/config/rs6000/linux64.h |  4 ++++
+ 6 files changed, 34 insertions(+), 4 deletions(-)
+
+diff --git a/gcc/config/alpha/linux.h b/gcc/config/alpha/linux.h
+index c567f43..475ea06 100644
+--- a/gcc/config/alpha/linux.h
++++ b/gcc/config/alpha/linux.h
+@@ -61,10 +61,14 @@ along with GCC; see the file COPYING3.  If not see
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ /* Determine what functions are present at the runtime;
+diff --git a/gcc/config/glibc-stdint.h b/gcc/config/glibc-stdint.h
+index 3fc67dc..98f4f04 100644
+--- a/gcc/config/glibc-stdint.h
++++ b/gcc/config/glibc-stdint.h
+@@ -22,6 +22,12 @@ a copy of the GCC Runtime Library Exception along with this program;
+ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ <http://www.gnu.org/licenses/>.  */
+ 
++/* Systems using musl libc should use this header and make sure
++   OPTION_MUSL is defined correctly before using the TYPE macros. */
++#ifndef OPTION_MUSL
++#define OPTION_MUSL 0
++#endif
++
+ #define SIG_ATOMIC_TYPE "int"
+ 
+ #define INT8_TYPE "signed char"
+@@ -43,12 +49,12 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #define UINT_LEAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
+ 
+ #define INT_FAST8_TYPE "signed char"
+-#define INT_FAST16_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
+-#define INT_FAST32_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
++#define INT_FAST16_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long int" : "int")
++#define INT_FAST32_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long int" : "int")
+ #define INT_FAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
+ #define UINT_FAST8_TYPE "unsigned char"
+-#define UINT_FAST16_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "unsigned int")
+-#define UINT_FAST32_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "unsigned int")
++#define UINT_FAST16_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long unsigned int" : "unsigned int")
++#define UINT_FAST32_TYPE (LONG_TYPE_SIZE == 64 && !OPTION_MUSL ? "long unsigned int" : "unsigned int")
+ #define UINT_FAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
+ 
+ #define INTPTR_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "int")
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index b551c56..7bc87ab 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -32,11 +32,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#undef OPTION_MUSL
+ #define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#undef OPTION_MUSL
+ #define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
+index fe0ebd6..a68ff69 100644
+--- a/gcc/config/rs6000/linux.h
++++ b/gcc/config/rs6000/linux.h
+@@ -30,10 +30,14 @@
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ /* Determine what functions are present at the runtime;
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 0879e7e..1b7f695 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -299,10 +299,14 @@ extern int dot_symbols;
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#undef OPTION_MUSL
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ /* Determine what functions are present at the runtime;
+-- 
+2.8.2
+
-- 
2.8.2


