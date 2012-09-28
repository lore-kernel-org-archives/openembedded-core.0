Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THPek-0004sN-3m
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 03:46:20 +0200
Received: from mail7-co1-R.bigfish.com (10.243.78.237) by
	CO1EHSOBE013.bigfish.com (10.243.66.76) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 01:33:24 +0000
Received: from mail7-co1 (localhost [127.0.0.1])	by mail7-co1-R.bigfish.com
	(Postfix) with ESMTP id DD2BF800AF	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(zz936eIzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail7-co1 (localhost.localdomain [127.0.0.1]) by mail7-co1
	(MessageSwitch) id 1348796002379041_16738;
	Fri, 28 Sep 2012 01:33:22 +0000 (UTC)
Received: from CO1EHSMHS019.bigfish.com (unknown [10.243.78.244])	by
	mail7-co1.bigfish.com (Postfix) with ESMTP id 50A7C180044	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS019.bigfish.com
	(10.243.66.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 01:33:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 27 Sep 2012 20:33:20 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8S1XJaK007331 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 18:33:20 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 20:33:07 -0500
Message-ID: <1348795994-21695-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348795994-21695-1-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 03/10] eglibc_2.16.bb: refresh ppc_slow_ieee754_sqrt.patch for Freescale targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 01:46:20 -0000
Content-Type: text/plain

Make same changes for e6500 fpu as done with others

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: refresh patch for other new arches that were added by the previous commit
    which was causing new build errors

 .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  278 ++++++++++++++++++--
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    2 +-
 2 files changed, 261 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
index 9a932ff..60532cb 100644
--- a/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
@@ -5,9 +5,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 ===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-07-03 22:36:01.172386436 -0700
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-07-03 23:04:37.396469515 -0700
-@@ -40,7 +40,7 @@
+--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+@@ -40,7 +40,7 @@ static const float half = 0.5;
     simultaneously.  */
  
  double
@@ -16,7 +16,7 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -77,7 +77,7 @@
+@@ -77,7 +77,7 @@ __ieee754_sqrt (double b)
    
            /* Handle small numbers by scaling.  */
            if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
@@ -25,7 +25,7 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
  
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
-@@ -126,4 +126,12 @@
+@@ -126,4 +126,12 @@ __ieee754_sqrt (double b)
      }
    return f_wash (b);
  }
@@ -40,9 +40,9 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
  strong_alias (__ieee754_sqrt, __sqrt_finite)
 Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 ===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-07-03 22:36:01.172386436 -0700
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-07-03 23:07:06.260476775 -0700
-@@ -38,7 +38,7 @@
+--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+@@ -38,7 +38,7 @@ static const float threehalf = 1.5;
     square root.  */
  
  float
@@ -51,7 +51,7 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -93,4 +93,10 @@
+@@ -93,4 +93,10 @@ __ieee754_sqrtf (float b)
      }
    return f_washf (b);
  }
@@ -64,9 +64,9 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 ===================================================================
---- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-07-03 22:36:01.176386435 -0700
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-07-03 23:14:16.328497458 -0700
-@@ -40,7 +40,7 @@
+--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+@@ -40,7 +40,7 @@ static const float half = 0.5;
     simultaneously.  */
  
  double
@@ -75,7 +75,7 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -77,7 +77,7 @@
+@@ -77,7 +77,7 @@ __ieee754_sqrt (double b)
    
            /* Handle small numbers by scaling.  */
            if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
@@ -84,7 +84,7 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
  
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
-@@ -126,4 +126,12 @@
+@@ -126,4 +126,12 @@ __ieee754_sqrt (double b)
      }
    return f_wash (b);
  }
@@ -99,9 +99,9 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
  strong_alias (__ieee754_sqrt, __sqrt_finite)
 Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 ===================================================================
---- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-07-03 22:36:01.176386435 -0700
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-07-03 23:13:52.732496373 -0700
-@@ -38,7 +38,7 @@
+--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+@@ -38,7 +38,7 @@ static const float threehalf = 1.5;
     square root.  */
  
  float
@@ -110,7 +110,7 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -93,4 +93,10 @@
+@@ -93,4 +93,11 @@ __ieee754_sqrtf (float b)
      }
    return f_washf (b);
  }
@@ -120,4 +120,246 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 +{
 +  return __slow_ieee754_sqrtf (x);
 +}
++
+ strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+@@ -41,10 +41,10 @@ static const float half = 0.5;
+ 
+ #ifdef __STDC__
+ double
+-__ieee754_sqrt (double b)
++__slow_ieee754_sqrt (double b)
+ #else
+ double
+-__ieee754_sqrt (b)
++__slow_ieee754_sqrt (b)
+      double b;
+ #endif
+ {
+@@ -83,7 +83,7 @@ __ieee754_sqrt (b)
+   
+           /* Handle small numbers by scaling.  */
+           if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
+-            return __ieee754_sqrt (b * two108) * twom54;
++            return __slow_ieee754_sqrt (b * two108) * twom54;
+ 
+ #define FMADD(a_, c_, b_)                                               \
+           ({ double __r;                                                \
+@@ -132,4 +132,12 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++   return __slow_ieee754_sqrt (x);
++}
++
+ strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+@@ -39,10 +39,10 @@ static const float threehalf = 1.5;
+ 
+ #ifdef __STDC__
+ float
+-__ieee754_sqrtf (float b)
++__slow_ieee754_sqrtf (float b)
+ #else
+ float
+-__ieee754_sqrtf (b)
++__slow_ieee754_sqrtf (b)
+      float b;
+ #endif
+ {
+@@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
++
+ strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+@@ -41,10 +41,10 @@ static const float half = 0.5;
+ 
+ #ifdef __STDC__
+ double
+-__ieee754_sqrt (double b)
++__slow_ieee754_sqrt (double b)
+ #else
+ double
+-__ieee754_sqrt (b)
++__slow_ieee754_sqrt (b)
+      double b;
+ #endif
+ {
+@@ -83,7 +83,7 @@ __ieee754_sqrt (b)
+   
+           /* Handle small numbers by scaling.  */
+           if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
+-            return __ieee754_sqrt (b * two108) * twom54;
++            return __slow_ieee754_sqrt (b * two108) * twom54;
+ 
+ #define FMADD(a_, c_, b_)                                               \
+           ({ double __r;                                                \
+@@ -132,4 +132,12 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++   return __slow_ieee754_sqrt (x);
++}
++
+ strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+@@ -39,10 +39,10 @@ static const float threehalf = 1.5;
+ 
+ #ifdef __STDC__
+ float
+-__ieee754_sqrtf (float b)
++__slow_ieee754_sqrtf (float b)
+ #else
+ float
+-__ieee754_sqrtf (b)
++__slow_ieee754_sqrtf (b)
+      float b;
+ #endif
+ {
+@@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
++
+ strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+@@ -41,10 +41,10 @@ static const float half = 0.5;
+ 
+ #ifdef __STDC__
+ double
+-__ieee754_sqrt (double b)
++__slow_ieee754_sqrt (double b)
+ #else
+ double
+-__ieee754_sqrt (b)
++__slow_ieee754_sqrt (b)
+      double b;
+ #endif
+ {
+@@ -83,7 +83,7 @@ __ieee754_sqrt (b)
+   
+           /* Handle small numbers by scaling.  */
+           if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
+-            return __ieee754_sqrt (b * two108) * twom54;
++            return __slow_ieee754_sqrt (b * two108) * twom54;
+ 
+ #define FMADD(a_, c_, b_)                                               \
+           ({ double __r;                                                \
+@@ -132,4 +132,12 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++   return __slow_ieee754_sqrt (x);
++}
++
+ strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+@@ -39,10 +39,10 @@ static const float threehalf = 1.5;
+ 
+ #ifdef __STDC__
+ float
+-__ieee754_sqrtf (float b)
++__slow_ieee754_sqrtf (float b)
+ #else
+ float
+-__ieee754_sqrtf (b)
++__slow_ieee754_sqrtf (b)
+      float b;
+ #endif
+ {
+@@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
++
+ strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+@@ -132,4 +132,12 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++
++#undef __ieee754_sqrt
++double
++__ieee754_sqrt (double x)
++{
++   return __slow_ieee754_sqrt (x);
++}
++
+ strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+@@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++
++#undef __ieee754_sqrtf
++float
++__ieee754_sqrtf (float x)
++{
++  return __slow_ieee754_sqrtf (x);
++}
++
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index b7f297f..5d88831 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r12"
+PR = "r13"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-- 
1.7.9.7




