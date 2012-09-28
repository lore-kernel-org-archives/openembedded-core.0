Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THPei-0004sI-W5
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 03:46:17 +0200
Received: from mail218-co1-R.bigfish.com (10.243.78.226) by
	CO1EHSOBE003.bigfish.com (10.243.66.66) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 01:33:23 +0000
Received: from mail218-co1 (localhost [127.0.0.1])	by
	mail218-co1-R.bigfish.com (Postfix) with ESMTP id D1EB98C008B	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 2
X-BigFish: VS2(zz936eIzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail218-co1 (localhost.localdomain [127.0.0.1]) by mail218-co1
	(MessageSwitch) id 1348796002105469_2668;
	Fri, 28 Sep 2012 01:33:22 +0000 (UTC)
Received: from CO1EHSMHS027.bigfish.com (unknown [10.243.78.231])	by
	mail218-co1.bigfish.com (Postfix) with ESMTP id 0D2C3660045	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS027.bigfish.com
	(10.243.66.37) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 01:33:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 27 Sep 2012 20:33:20 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8S1XJaL007331 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 18:33:20 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 20:33:08 -0500
Message-ID: <1348795994-21695-4-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348795994-21695-1-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 04/10] eglibc_2.16.bb: refresh fsl-ppc-no-fsqrt.patch for Freescale targets
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
v2: refresh for all Freescale targets, and fix mixup between
    single and double precision

 .../eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch      |   50 ++++++++++++++++++--
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    2 +-
 2 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch b/meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch
index 712b353..f619f08 100644
--- a/meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch
@@ -9,8 +9,8 @@ Upstream-Status: Pending
 
 Index: libc/sysdeps/powerpc/fpu/math_private.h
 ===================================================================
---- libc.orig/sysdeps/powerpc/fpu/math_private.h	2012-09-03 22:37:58.000000000 -0700
-+++ libc/sysdeps/powerpc/fpu/math_private.h	2012-09-17 09:35:09.709124003 -0700
+--- libc.orig/sysdeps/powerpc/fpu/math_private.h
++++ libc/sysdeps/powerpc/fpu/math_private.h
 @@ -25,10 +25,12 @@
  #include <dl-procinfo.h>
  #include_next <math_private.h>
@@ -30,8 +30,50 @@ Index: libc/sysdeps/powerpc/fpu/math_private.h
  extern double __slow_ieee754_sqrt (double);
 Index: libc/ports/sysdeps/powerpc/powerpc64/e5500/fpu/math_private.h
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libc/ports/sysdeps/powerpc/powerpc64/e5500/fpu/math_private.h	2012-09-17 09:56:59.129124074 -0700
+--- /dev/null
++++ libc/ports/sysdeps/powerpc/powerpc64/e5500/fpu/math_private.h
+@@ -0,0 +1,9 @@
++#ifndef _E5500_MATH_PRIVATE_H_
++#define _E5500_MATH_PRIVATE_H_ 1
++/* E5500 core FPU does not implement
++   fsqrt */
++
++#define __CPU_HAS_FSQRT 0
++#include_next <math_private.h>
++
++#endif /* _E5500_MATH_PRIVATE_H_ */
+Index: libc/ports/sysdeps/powerpc/powerpc64/e6500/fpu/math_private.h
+===================================================================
+--- /dev/null
++++ libc/ports/sysdeps/powerpc/powerpc64/e6500/fpu/math_private.h
+@@ -0,0 +1,9 @@
++#ifndef _E6500_MATH_PRIVATE_H_
++#define _E6500_MATH_PRIVATE_H_ 1
++/* E6500 core FPU does not implement
++   fsqrt */
++
++#define __CPU_HAS_FSQRT 0
++#include_next <math_private.h>
++
++#endif /* _E6500_MATH_PRIVATE_H_ */
+Index: libc/ports/sysdeps/powerpc/powerpc32/e500mc/fpu/math_private.h
+===================================================================
+--- /dev/null
++++ libc/ports/sysdeps/powerpc/powerpc32/e500mc/fpu/math_private.h
+@@ -0,0 +1,9 @@
++#ifndef _E500MC_MATH_PRIVATE_H_
++#define _E500MC_MATH_PRIVATE_H_ 1
++/* E500MC core FPU does not implement
++   fsqrt */
++
++#define __CPU_HAS_FSQRT 0
++#include_next <math_private.h>
++
++#endif /* _E500MC_MATH_PRIVATE_H_ */
+Index: libc/ports/sysdeps/powerpc/powerpc32/e5500/fpu/math_private.h
+===================================================================
+--- /dev/null
++++ libc/ports/sysdeps/powerpc/powerpc32/e5500/fpu/math_private.h
 @@ -0,0 +1,9 @@
 +#ifndef _E5500_MATH_PRIVATE_H_
 +#define _E5500_MATH_PRIVATE_H_ 1
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 5d88831..a0824cd 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r13"
+PR = "r14"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-- 
1.7.9.7




