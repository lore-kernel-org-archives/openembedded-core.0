Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A37BE6FC43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 01:16:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6T1GufT022850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 18:16:57 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 28 Jul 2014 18:16:56 -0700
Message-ID: <53D6F609.1010008@windriver.com>
Date: Tue, 29 Jul 2014 09:16:57 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <gmp-devel@gmplib.org>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, <tege@gmplib.org>
Subject: backport patches for gmp-4.x.x
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
X-List-Received-Date: Tue, 29 Jul 2014 01:16:56 -0000
X-Groupsio-MsgNum: 55678
Content-Type: multipart/mixed; boundary="------------000705040000040802040405"

--------------000705040000040802040405
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Torbjorn Granlund:

we are using the gmp-4.2.1, but compiling gmp failed on mips64
and 64bit userspace, I see the patch 12418[(mips, powerpc):
Provide assembly-free umul_ppmm for newer gcc] can fix it. but
it is under GPLv3;

Could you release this patch under GPLv2?

Thanks

-Roy

--------------000705040000040802040405
Content-Type: text/x-diff;
	name="Provide-assembly-free-umul_ppmm-for-newer-gcc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Provide-assembly-free-umul_ppmm-for-newer-gcc.patch"

# HG changeset patch
# User Torbjorn Granlund <tege@gmplib.org>
# Date 1235947651 -3600
# Node ID 12a1d0bf21f09b05813edd5e19496ae65544cfab
# Parent  6411165312970e38a469d0236eff67ecc372223e
(mips, powerpc): Provide assembly-free umul_ppmm for newer gcc.

diff -r 641116531297 -r 12a1d0bf21f0 longlong.h
--- a/longlong.h	Wed Feb 04 11:32:34 2009 +0100
+++ b/longlong.h	Sun Mar 01 23:47:31 2009 +0100
@@ -1,7 +1,7 @@
 /* longlong.h -- definitions for mixed size 32/64 bit arithmetic.
 
 Copyright 1991, 1992, 1993, 1994, 1996, 1997, 1999, 2000, 2001, 2002, 2003,
-2004, 2005, 2007 Free Software Foundation, Inc.
+2004, 2005, 2007, 2008, 2009 Free Software Foundation, Inc.
 
 This file is free software; you can redistribute it and/or modify it under the
 terms of the GNU Lesser General Public License as published by the Free
@@ -1021,10 +1021,19 @@
 #endif /* __m88000__ */
 
 #if defined (__mips) && W_TYPE_SIZE == 32
-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
+#if __GMP_GNUC_PREREQ (4,4)
+#define umul_ppmm(w1, w0, u, v) \
+  do {									\
+    UDItype __ll = (UDItype)(u) * (v);					\
+    w1 = __ll >> 32;							\
+    w0 = __ll;								\
+  } while (0)
+#endif
+#if !defined (umul_ppmm) && __GMP_GNUC_PREREQ (2,7)
 #define umul_ppmm(w1, w0, u, v) \
   __asm__ ("multu %2,%3" : "=l" (w0), "=h" (w1) : "d" (u), "d" (v))
-#else
+#endif
+#if !defined (umul_ppmm)
 #define umul_ppmm(w1, w0, u, v) \
   __asm__ ("multu %2,%3\n\tmflo %0\n\tmfhi %1"				\
 	   : "=d" (w0), "=d" (w1) : "d" (u), "d" (v))
@@ -1034,10 +1043,20 @@
 #endif /* __mips */
 
 #if (defined (__mips) && __mips >= 3) && W_TYPE_SIZE == 64
-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
+#if __GMP_GNUC_PREREQ (4,4)
+#define umul_ppmm(w1, w0, u, v) \
+  do {									\
+    typedef unsigned int __ll_UTItype __attribute__((mode(TI)));	\
+    __ll_UTItype __ll = (__ll_UTItype)(u) * (v);			\
+    w1 = __ll >> 64;							\
+    w0 = __ll;								\
+  } while (0)
+#endif
+#if !defined (umul_ppmm) && __GMP_GNUC_PREREQ (2,7)
 #define umul_ppmm(w1, w0, u, v) \
   __asm__ ("dmultu %2,%3" : "=l" (w0), "=h" (w1) : "d" (u), "d" (v))
-#else
+#endif
+#if !defined (umul_ppmm)
 #define umul_ppmm(w1, w0, u, v) \
   __asm__ ("dmultu %2,%3\n\tmflo %0\n\tmfhi %1"				\
 	   : "=d" (w0), "=d" (w1) : "d" (u), "d" (v))
@@ -1140,12 +1159,22 @@
   __asm__ ("{cntlz|cntlzw} %0,%1" : "=r" (count) : "r" (x))
 #define COUNT_LEADING_ZEROS_0 32
 #if HAVE_HOST_CPU_FAMILY_powerpc
+#if __GMP_GNUC_PREREQ (4,4)
+#define umul_ppmm(w1, w0, u, v) \
+  do {									\
+    UDItype __ll = (UDItype)(u) * (v);					\
+    w1 = __ll >> 32;							\
+    w0 = __ll;								\
+  } while (0)
+#endif
+#if !defined (umul_ppmm)
 #define umul_ppmm(ph, pl, m0, m1) \
   do {									\
     USItype __m0 = (m0), __m1 = (m1);					\
     __asm__ ("mulhwu %0,%1,%2" : "=r" (ph) : "%r" (m0), "r" (m1));	\
     (pl) = __m0 * __m1;							\
   } while (0)
+#endif
 #define UMUL_TIME 15
 #define smul_ppmm(ph, pl, m0, m1) \
   do {									\
@@ -1229,12 +1258,23 @@
 #define count_leading_zeros(count, x) \
   __asm__ ("cntlzd %0,%1" : "=r" (count) : "r" (x))
 #define COUNT_LEADING_ZEROS_0 64
+#if __GMP_GNUC_PREREQ (4,4)
+#define umul_ppmm(w1, w0, u, v) \
+  do {									\
+    typedef unsigned int __ll_UTItype __attribute__((mode(TI)));	\
+    __ll_UTItype __ll = (__ll_UTItype)(u) * (v);			\
+    w1 = __ll >> 64;							\
+    w0 = __ll;								\
+  } while (0)
+#endif
+#if !defined (umul_ppmm)
 #define umul_ppmm(ph, pl, m0, m1) \
   do {									\
     UDItype __m0 = (m0), __m1 = (m1);					\
     __asm__ ("mulhdu %0,%1,%2" : "=r" (ph) : "%r" (m0), "r" (m1));	\
     (pl) = __m0 * __m1;							\
   } while (0)
+#endif
 #define UMUL_TIME 15
 #define smul_ppmm(ph, pl, m0, m1) \
   do {									\

--------------000705040000040802040405--
