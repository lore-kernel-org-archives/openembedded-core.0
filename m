Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F056D6E752
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 02:14:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2D2EWfI001812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Mar 2014 19:14:32 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 12 Mar 2014 19:14:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Mar 2014 10:14:20 +0800
Message-ID: <a551f14de61173848ef60b768149f994d4ae3ac5.1394676641.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394676641.git.hongxu.jia@windriver.com>
References: <cover.1394676641.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: msm@freescale.com, saul.wold@intel.com
Subject: [PATCH 1/1] eglibc: tweak glibc.fix_sqrt2.patch for eglibc-2.19
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
X-List-Received-Date: Thu, 13 Mar 2014 02:14:39 -0000
Content-Type: text/plain

While the type of powerpc32 cpu is 603e (In meta/conf/machine/
qemuppc.conf, require conf/machine/include/tune-ppc603e.inc),
there was a failure to build eglibc-2.19:
...
| ../sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c: In function
'__slow_ieee754_sqrt':
| ../sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c:122:15: error:
subscripted value is neither array nor pointer nor vector
|        if ((u.l[1] & FE_INVALID) == 0)
|                ^
| ../sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c:121:20: warning:
variable 'u' set but not used [-Wunused-but-set-variable]
|        fenv_union_t u = { .fenv = fegetenv_register () };
...

In 'eglibc-2.19/libc/sysdeps/powerpc/fpu/fenv_libc.h', the above
struct fenv_union_t is defined as:
...
typedef union
{
  fenv_t fenv;
  unsigned long long l;
} fenv_union_t;
...

Rather than 'eglibc-2.16/libc/sysdeps/powerpc/fpu/fenv_libc.h':
...
typedef union
{
  fenv_t fenv;
  unsigned int l[2];
} fenv_union_t;
...

So we should update the glibc.fix_sqrt2.patch for eglibc-2.19.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../eglibc/eglibc-2.19/glibc.fix_sqrt2.patch       | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch b/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch
index a669729..0dcca7c 100644
--- a/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.19/glibc.fix_sqrt2.patch
@@ -132,7 +132,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c libc/sysdeps/pow
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -237,7 +237,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -375,7 +375,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -480,7 +480,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c libc/sysdeps/
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -618,7 +618,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -723,7 +723,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -861,7 +861,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -966,7 +966,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -1104,7 +1104,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -1209,7 +1209,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -1347,7 +1347,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c libc/sysdeps/po
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
@@ -1452,7 +1452,7 @@ diff -ruN libc-orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c libc/sysdeps/p
 +      feraiseexcept (FE_INVALID_SQRT);
 +
 +      fenv_union_t u = { .fenv = fegetenv_register () };
-+      if ((u.l[1] & FE_INVALID) == 0)
++      if ((u.l & FE_INVALID) == 0)
 +#endif
 +	feraiseexcept (FE_INVALID);
 +      b = a_nan.value;
-- 
1.8.1.2


