Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3082D600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 21:09:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 66so8256766pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 14:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wk2s5PF/9LUqZn1O1uue72wL+Kh8pemm46FhzhG73KE=;
	b=tN1pG10CE4I2J1MEpaPsCSieRdhOgr3gFUVx3Kt6CScnpV6aIMYWI+upEGReTIwjNR
	0WJ3ZEqyLo7TlPfLQ9em0UYcqNdhiZTwgmPHwMrGoOE6ZS4U23Y39/bn6RGV3XKzXKfN
	Ge3RAUv69STLQImALZIWXB8e9sq4jGvGkuZ/JI0doy0ON1E+vPNA9v3IBXDKDXyDGNs3
	0LBL0+6qQoZb7nZdJ0TQnJnFfYj5WBhHfl/Y9EfGOWblYDDVg5Mior/UYAZ2HiTmX0Ol
	UDVjLOWpMwa9DWOVHi8BkGS0ctfu1MLfG6+2CmI6n4avVc0ME/JM2H8t7exNm0sOLtGE
	uk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wk2s5PF/9LUqZn1O1uue72wL+Kh8pemm46FhzhG73KE=;
	b=fqyxXWng+xSfDeH95yw7bBtz6EjNkdOhvUnmoV3EXkOxFSaCechszbkIb0hfvvwt1y
	EP+JwkvVSHwIpoKW0f+WPDJBajdlrK20afLHw60QoP9e1ttrui9Jb/3s/Xe9Qen9zKq4
	FrkWgHTM/tHOfmb8ipWkG+qhBySFL7gAIP9R/eRa9Ht2ceNyzkheNvZnd00EmFbTFOov
	4OleBUNt1N4Sxv7tBZXpjgZqXKcR9WwTnpd0n3a75elIPNBPxAsqtoJ8k9HRY8jFOBpX
	WboB9SYiWggzAc8Tp8WZeh8bi2R6gY98Jxm6Ymm2EyhDyVatmH/gU8svNcDBSPX1+rc5
	Mweg==
X-Gm-Message-State: ALyK8tKPuW3TkbkrYf8i66EZiggZ6F/Q88GG5e2coMUbNyLfyYfvfd+4BmkLO7nWIpiK+Q==
X-Received: by 10.98.97.193 with SMTP id v184mr25207018pfb.138.1467320974786; 
	Thu, 30 Jun 2016 14:09:34 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 6sm35069pfx.68.2016.06.30.14.09.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jun 2016 14:09:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2016 14:09:27 -0700
Message-Id: <20160630210927.4718-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [krogoth][PATCH] gcc-5: Fix hang with mmusl option on cmdline
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
X-List-Received-Date: Thu, 30 Jun 2016 21:09:34 -0000

When using -m32 -mmusl options in this order, gcc hangs
in parsing the options decode_cmdline_options_to_array()
the reason is that we have broken the link when adding
mmusl options, the order of specifying libc was not kept
in order as a result it was unable to contruct the array
correctly and ended in parse hang.

We fix the options to specify the order properly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...l-as-a-musl-libc-specifier-and-the-necess.patch | 72 +++++++++++-----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch b/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
index b91c02d..26aa96c 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/ginclude/stddef.h         |   3 ++
  6 files changed, 110 insertions(+), 13 deletions(-)
 
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 3825bd5..39ce047 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
+Index: gcc-5.4.0/gcc/config.gcc
+===================================================================
+--- gcc-5.4.0.orig/gcc/config.gcc
++++ gcc-5.4.0/gcc/config.gcc
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
+Index: gcc-5.4.0/gcc/config/linux.h
+===================================================================
+--- gcc-5.4.0.orig/gcc/config/linux.h
++++ gcc-5.4.0/gcc/config/linux.h
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
+Index: gcc-5.4.0/gcc/config/linux.opt
+===================================================================
+--- gcc-5.4.0.orig/gcc/config/linux.opt
++++ gcc-5.4.0/gcc/config/linux.opt
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
+Index: gcc-5.4.0/gcc/config/rs6000/secureplt.h
+===================================================================
+--- gcc-5.4.0.orig/gcc/config/rs6000/secureplt.h
++++ gcc-5.4.0/gcc/config/rs6000/secureplt.h
+@@ -18,3 +18,4 @@ along with GCC; see the file COPYING3.
  <http://www.gnu.org/licenses/>.  */
  
  #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
 +#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
-diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index c6c31dc..7cd07e0 100644
---- a/gcc/config/rs6000/sysv4.h
-+++ b/gcc/config/rs6000/sysv4.h
-@@ -538,6 +538,10 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEFAULT_ASM_ENDIAN)
+Index: gcc-5.4.0/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-5.4.0.orig/gcc/config/rs6000/sysv4.h
++++ gcc-5.4.0/gcc/config/rs6000/sysv4.h
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
+Index: gcc-5.4.0/gcc/ginclude/stddef.h
+===================================================================
+--- gcc-5.4.0.orig/gcc/ginclude/stddef.h
++++ gcc-5.4.0/gcc/ginclude/stddef.h
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
-- 
2.9.0


