Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id B19AC6F719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 15:51:49 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id p10so7187224pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8iqm2jYxtyvZV6mFOW8h2bPzYHupt/6Z2LN0ZkT71dA=;
	b=p+gZXtHSJyMs4SRAPjkEtccGBLnZz0r9qY6iB38xodHzpcWsvPXbisn3avAOyS8Zbu
	6ULy9k+0iAS6SG+t9zoSjXoAZXFG0hUlOzxP7MV3TjqW/l97ZX9pohflMtqBEDSp+Iqz
	6USwb4NTWX3zbHVlHU1z9adUNNPgZc2VztH+6YYwPkyQeYBnB0GNUf+vyCVpuCnO07UY
	bDhLVibIUEMVHx+L+TXGiVZba8CwYdCF5Ce78rSiSYk7r2beJucfbmfd1MrdO4P/xymG
	IV6YOaTQsjyqq9ajyCiAE/9zn53IZ8QsZgl3EoZp66u4jC60P/vwhJlMyUMgf8LP3zey
	PxdA==
X-Received: by 10.69.31.43 with SMTP id kj11mr40650235pbd.67.1394466709979;
	Mon, 10 Mar 2014 08:51:49 -0700 (PDT)
Received: from leo.jnpr.net (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	oz7sm66857986pbc.41.2014.03.10.08.51.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Mar 2014 08:51:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Mar 2014 08:51:37 -0700
Message-Id: <1394466697-6539-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] eglibc: Fix build for FSL ppc/fpu
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
X-List-Received-Date: Mon, 10 Mar 2014 15:51:49 -0000

The patch needs to adapt to upstream changes
should fix errors on e500mc+ based SOCs

This should fix [YOCTO #5871]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc/eglibc-2.19/glibc.fix_sqrt2.patch       | 162 ++++++++++++---------
 1 file changed, 90 insertions(+), 72 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch b/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch
index a669729..037feeb 100644
--- a/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch
@@ -1,9 +1,10 @@
 Signed-of-by: Edmar Wienskoski <edmar@freescale.com>
 Upstream-Status: Pending
 
-diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
---- libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-06-14 14:51:50.452001745 -0500
+Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -87,7 +88,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c libc/sysdeps/pow
 +
 +          g = b * y;
 +          h = 0.5 * y;
-+  
++
 +          /* Handle small numbers by scaling.  */
 +          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
 +            return __ieee754_sqrt (b * two108) * twom54;
@@ -132,16 +133,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c libc/sysdeps/pow
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_wash (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
---- libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-06-14 14:51:50.452001745 -0500
+Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -237,16 +239,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_washf (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
---- libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c	2012-06-14 14:55:14.749001061 -0500
+Index: libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -330,7 +333,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c libc/sysdeps/p
 +
 +          g = b * y;
 +          h = 0.5 * y;
-+  
++
 +          /* Handle small numbers by scaling.  */
 +          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
 +            return __ieee754_sqrt (b * two108) * twom54;
@@ -375,16 +378,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_wash (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
---- libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c	2012-06-14 14:55:14.749001061 -0500
+Index: libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -480,16 +484,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c libc/sysdeps/
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_washf (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
---- libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c	2012-06-14 14:55:21.812002270 -0500
+Index: libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -573,7 +578,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c libc/sysdeps/po
 +
 +          g = b * y;
 +          h = 0.5 * y;
-+  
++
 +          /* Handle small numbers by scaling.  */
 +          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
 +            return __ieee754_sqrt (b * two108) * twom54;
@@ -618,16 +623,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_wash (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
---- libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c	2012-06-14 14:55:21.812002270 -0500
+Index: libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -723,16 +729,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_washf (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
---- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2012-06-14 14:55:24.620001266 -0500
+Index: libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -816,7 +823,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/po
 +
 +          g = b * y;
 +          h = 0.5 * y;
-+  
++
 +          /* Handle small numbers by scaling.  */
 +          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
 +            return __ieee754_sqrt (b * two108) * twom54;
@@ -861,16 +868,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_wash (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
---- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2012-06-14 14:55:24.620001266 -0500
+Index: libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -966,16 +974,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_washf (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
---- libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-06-14 14:51:50.452001745 -0500
+Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -1059,7 +1068,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c libc/sysdeps/po
 +
 +          g = b * y;
 +          h = 0.5 * y;
-+  
++
 +          /* Handle small numbers by scaling.  */
 +          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
 +            return __ieee754_sqrt (b * two108) * twom54;
@@ -1104,16 +1113,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_wash (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
---- libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-06-14 14:51:50.452001745 -0500
+Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -1209,16 +1219,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_washf (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
---- libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c	2012-06-14 14:56:02.080000985 -0500
+Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
 +/* Double-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -1302,7 +1313,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c libc/sysdeps/po
 +
 +          g = b * y;
 +          h = 0.5 * y;
-+  
++
 +          /* Handle small numbers by scaling.  */
 +          if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
 +            return __ieee754_sqrt (b * two108) * twom54;
@@ -1347,16 +1358,17 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_wash (b);
 +}
-diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
---- libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c	2012-06-14 14:56:02.080000985 -0500
+Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+===================================================================
+--- /dev/null
++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
 +/* Single-precision floating point square root.
 +   Copyright (C) 2010 Free Software Foundation, Inc.
@@ -1452,40 +1464,46 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
 +    }
 +  return f_washf (b);
 +}
-diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
---- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies	2012-06-14 14:51:50.452001745 -0500
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/603e/fpu
-diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
---- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies	2012-06-14 14:54:00.481000876 -0500
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e500mc/fpu
-diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
---- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies	2012-06-14 14:54:17.000001007 -0500
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e5500/fpu
-diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
---- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies	2012-06-14 14:54:31.054001299 -0500
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e6500/fpu
-diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
---- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies	2012-06-14 14:51:50.453001709 -0500
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e5500/fpu
-diff -ruN libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
---- libc-orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies	1969-12-31 18:00:00.000000000 -0600
-+++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies	2012-06-14 14:58:14.298001288 -0500
+Index: libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
+===================================================================
+--- /dev/null
++++ libc/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
-- 
1.9.0


