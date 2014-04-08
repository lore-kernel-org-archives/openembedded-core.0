Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe010.messaging.microsoft.com [216.32.180.30])
	by mail.openembedded.org (Postfix) with ESMTP id D0B6D65D70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 10:17:51 +0000 (UTC)
Received: from mail113-va3-R.bigfish.com (10.7.14.241) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.22; Tue, 8 Apr 2014 10:17:33 +0000
Received: from mail113-va3 (localhost [127.0.0.1])	by
	mail113-va3-R.bigfish.com (Postfix) with ESMTP id 934E6203E9	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 10:17:33 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h2148h1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6h208chzz1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh26d3h1155h)
Received: from mail113-va3 (localhost.localdomain [127.0.0.1]) by mail113-va3
	(MessageSwitch) id 1396952251737247_25870;
	Tue,  8 Apr 2014 10:17:31 +0000 (UTC)
Received: from VA3EHSMHS016.bigfish.com (unknown [10.7.14.227])	by
	mail113-va3.bigfish.com (Postfix) with ESMTP id 9E4EB300047;
	Tue,  8 Apr 2014 10:17:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS016.bigfish.com
	(10.7.99.26) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 8 Apr 2014 10:17:30 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.174.2; Tue, 8 Apr 2014 10:17:46 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s38AHhKP021848; Tue, 8 Apr 2014 03:17:44 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Apr 2014 18:17:29 +0800
Message-ID: <1396952249-32452-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] eglibc: __slow_ieee754_sqrt{, f} functions for ppc e6500-32b
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
X-List-Received-Date: Tue, 08 Apr 2014 10:17:52 -0000
Content-Type: text/plain

    *fix the following error:
    |/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c:138:1:
    | error: redefinition of '__ieee754_sqrt'
    | __ieee754_sqrt (double x)

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../ppce6500-32b_slow_ieee754_sqrt.patch           | 47 ++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.19.bb            |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/ppce6500-32b_slow_ieee754_sqrt.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/ppce6500-32b_slow_ieee754_sqrt.patch b/meta/recipes-core/eglibc/eglibc-2.19/ppce6500-32b_slow_ieee754_sqrt.patch
new file mode 100644
index 0000000..4c6c107
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.19/ppce6500-32b_slow_ieee754_sqrt.patch
@@ -0,0 +1,47 @@
+ __ieee754_sqrt{,f} are now inline functions and call out __slow versions
+
+
+Signed-off-by: chunrong guo <B40290@freescale.com>
+Upstream-Status: Pending
+
+diff -rNu libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
+--- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2014-04-08 04:39:58.487229887 -0500
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c	2014-04-08 04:40:52.643069198 -0500
+@@ -41,10 +41,10 @@
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
+@@ -83,7 +83,7 @@
+ 
+           /* Handle small numbers by scaling.  */
+           if (__builtin_expect ((u.parts.msw & 0x7ff00000) <= 0x02000000, 0))
+-            return __ieee754_sqrt (b * two108) * twom54;
++            return __slow_ieee754_sqrt (b * two108) * twom54;
+ 
+ #define FMADD(a_, c_, b_)                                               \
+           ({ double __r;                                                \
+diff -rNu libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
+--- libc-orig/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2014-04-08 04:39:58.487229887 -0500
++++ libc/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c	2014-04-08 04:41:26.017067682 -0500
+@@ -39,10 +39,10 @@
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
diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
index 2bedf26..8f09676 100644
--- a/meta/recipes-core/eglibc/eglibc_2.19.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
            file://0001-R_ARM_TLS_DTPOFF32.patch \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
+	   file://ppce6500-32b_slow_ieee754_sqrt.patch \
           "
 SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
 SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
-- 
1.8.3.2



