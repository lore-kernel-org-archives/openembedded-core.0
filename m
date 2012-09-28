Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THPej-0004sL-8d
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 03:46:17 +0200
Received: from mail268-tx2-R.bigfish.com (10.9.14.248) by
	TX2EHSOBE011.bigfish.com (10.9.40.31) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 01:33:24 +0000
Received: from mail268-tx2 (localhost [127.0.0.1])	by
	mail268-tx2-R.bigfish.com (Postfix) with ESMTP id 074041F0015E	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:24 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz936eI154dMzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail268-tx2 (localhost.localdomain [127.0.0.1]) by mail268-tx2
	(MessageSwitch) id 1348796001828982_25628;
	Fri, 28 Sep 2012 01:33:21 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.239])	by
	mail268-tx2.bigfish.com (Postfix) with ESMTP id C46D6600044	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 01:33:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 27 Sep 2012 20:33:20 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8S1XJaJ007331 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 18:33:20 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 20:33:06 -0500
Message-ID: <1348795994-21695-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348795994-21695-1-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 02/10] eglibc_2.16.bb: refresh ppc-sqrt_finite.patch for Freescale targets
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
X-List-Received-Date: Fri, 28 Sep 2012 01:46:17 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: add the current changes for the new arches here as well

 .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  104 +++++++++++++++++---
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    2 +-
 2 files changed, 89 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch b/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
index 5289051..6ea666b 100644
--- a/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
@@ -16,9 +16,9 @@ ChangeLog
  
 Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 ===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-01-06 18:07:42.296909187 -0800
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c	2012-01-06 18:09:22.572914856 -0800
-@@ -39,14 +39,8 @@
+--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
+@@ -39,14 +39,8 @@ static const float half = 0.5;
     We find the actual square root and half of its reciprocal
     simultaneously.  */
  
@@ -33,16 +33,16 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -132,3 +126,4 @@
+@@ -132,3 +126,4 @@ __ieee754_sqrt (b)
      }
    return f_wash (b);
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
 Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 ===================================================================
---- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-01-06 18:10:37.068917644 -0800
-+++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c	2012-01-06 18:11:33.408920635 -0800
-@@ -37,14 +37,8 @@
+--- libc.orig/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
+@@ -37,14 +37,8 @@ static const float threehalf = 1.5;
     We find the reciprocal square root and use that to compute the actual
     square root.  */
  
@@ -57,16 +57,16 @@ Index: libc/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -99,3 +93,4 @@
+@@ -99,3 +93,4 @@ __ieee754_sqrtf (b)
      }
    return f_washf (b);
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 ===================================================================
---- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-01-06 18:11:51.460925644 -0800
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c	2012-01-06 18:12:39.344924405 -0800
-@@ -39,14 +39,8 @@
+--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
+@@ -39,14 +39,8 @@ static const float half = 0.5;
     We find the actual square root and half of its reciprocal
     simultaneously.  */
  
@@ -81,16 +81,16 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -132,3 +126,4 @@
+@@ -132,3 +126,4 @@ __ieee754_sqrt (b)
      }
    return f_wash (b);
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
 Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 ===================================================================
---- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-01-06 18:13:00.892924586 -0800
-+++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c	2012-01-06 18:15:27.992931106 -0800
-@@ -37,14 +37,8 @@
+--- libc.orig/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
+@@ -37,14 +37,8 @@ static const float threehalf = 1.5;
     We find the reciprocal square root and use that to compute the actual
     square root.  */
  
@@ -105,7 +105,79 @@ Index: libc/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
  {
    if (__builtin_expect (b > 0, 1))
      {
-@@ -99,3 +93,4 @@
+@@ -99,3 +93,4 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
+@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
+@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
+@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
+@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
+@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
+@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
+     }
+   return f_washf (b);
+ }
++strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+@@ -132,3 +132,4 @@ __ieee754_sqrt (b)
+     }
+   return f_wash (b);
+ }
++strong_alias (__ieee754_sqrt, __sqrt_finite)
+Index: libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+===================================================================
+--- libc.orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+@@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
      }
    return f_washf (b);
  }
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index c97a792..b7f297f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r11"
+PR = "r12"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-- 
1.7.9.7




