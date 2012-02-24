Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0v7K-0001Zb-En
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 14:23:22 +0100
Received: by eaal10 with SMTP id l10so1109426eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 05:15:00 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.22.65 as permitted sender) client-ip=10.14.22.65; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.22.65 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.22.65])
	by 10.14.22.65 with SMTP id s41mr1470109ees.50.1330089299999 (num_hops
	= 1); Fri, 24 Feb 2012 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Uq1Uv5uBTGoY6898X6jHTXzkRyCueJUL6pyV/16ze/0=;
	b=LyQ+yfnTtMwrnE+3t6fByydLX/4IV50nzFSuCIURuXqdnax+bblUm64erH32nhy3RO
	tsVHXkqL6x2gKolJMEpiAfFk8OW/dpxDT6BcW71ASMdBmQt9X4r7DiWHHISpuqyx7tcX
	VppVzjEaI1irqKPEFrGMpo3PasyvIL1PIq0uk=
Received: by 10.14.22.65 with SMTP id s41mr1111349ees.50.1330089299904;
	Fri, 24 Feb 2012 05:14:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm18119797eem.0.2012.02.24.05.14.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 05:14:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 14:14:50 +0100
Message-Id: <1330089290-12361-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [PATCH] mpfr: add patch to fix build for thumb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 13:23:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../mpfr/mpfr-3.1.0/long-long-thumb.patch          |   39 ++++++++++++++++++++
 meta/recipes-support/mpfr/mpfr_3.1.0.bb            |    6 ++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/mpfr/mpfr-3.1.0/long-long-thumb.patch

diff --git a/meta/recipes-support/mpfr/mpfr-3.1.0/long-long-thumb.patch b/meta/recipes-support/mpfr/mpfr-3.1.0/long-long-thumb.patch
new file mode 100644
index 0000000..ca7100e
--- /dev/null
+++ b/meta/recipes-support/mpfr/mpfr-3.1.0/long-long-thumb.patch
@@ -0,0 +1,39 @@
+From 84021b1e236508169be65e802a9c0a25fc9a8827 Mon Sep 17 00:00:00 2001
+From: Phil Blundell <philb@gnu.org>
+Date: Mon, 27 Oct 2008 22:26:35 +0000
+Subject: [PATCH] mpfr: crusade against inline assembler
+
+Without this, build fails for thumb:
+| {standard input}: Assembler messages:
+| {standard input}:199: Error: selected processor does not support Thumb mode `umull sl,r0,r2,r1'
+| {standard input}:214: Error: selected processor does not support Thumb mode `umull sl,r2,r1,fp'
+| {standard input}:219: Error: instruction not supported in Thumb16 mode -- `adds fp,r0,sl'
+| {standard input}:220: Error: unshifted register required -- `adc r2,r2,#0'
+| {standard input}:235: Error: selected processor does not support Thumb mode `umull r0,sl,r1,r3'
+| {standard input}:244: Error: selected processor does not support Thumb mode `umull fp,ip,r1,r3'
+| {standard input}:253: Error: instruction not supported in Thumb16 mode -- `adds r3,sl,fp'
+| {standard input}:254: Error: unshifted register required -- `adc ip,ip,#0'
+| {standard input}:259: Error: instruction not supported in Thumb16 mode -- `adds sl,r1,r0'
+| {standard input}:642: Error: selected processor does not support Thumb mode `umull r0,r2,r3,r1'
+| ../arm-oe-linux-gnueabi-libtool --tag=CC   --mode=compile arm-oe-linux-gnueabi-gcc  -march=armv5te  -mthumb -mthumb-interwork  -mtune=xscale --sysroot=/OE/shr-core/tmp-eglibc/sysroots/spitz -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DTIME_WITH_SYS_TIME=1 -DHAVE_LOCALE_H=1 -DHAVE_WCHAR_H=1 -DHAVE_STDARG=1 -DHAVE_SYS_TIME_H=1 -DHAVE_ALLOCA_H=1 -DHAVE_STDINT_H=1 -DHAVE_VA_COPY=1 -DHAVE_SETLOCALE=1 -DHAVE_GETTIMEOFDAY=1 -DHAVE_LONG_LONG=1 -DHAVE_INTMAX_T=1 -DMPFR_HAVE_INTMAX_MAX=1 -DMPFR_HAVE_FESETROUND=1 -DHAVE_ROUND=1 -DHAVE_TRUNC=1 -DHAVE_FLOOR=1 -DHAVE_CEIL=1 -DHAVE_NEARBYINT=1 -DLT_OBJDIR=\".libs/\" -DHAVE_ATTRIBUTE_MODE=1 -DHAVE___GMPN_ROOTREM=1 -DHAVE___GMPN_SBPI1_DIVAPPR_Q=1 -I.     -O2 -pipe -g -feliminate-unused-debug-types -ffloat-store -c -o pow.lo pow.c
+| {standard input}:1154: Error: selected processor does not support Thumb mode `umull r0,r1,sl,ip'
+| {standard input}:1166: Error: selected processor does not support Thumb mode `umull r3,r2,ip,r0'
+| {standard input}:1171: Error: instruction not supported in Thumb16 mode -- `adds r0,r1,r3'
+| {standard input}:1172: Error: unshifted register required -- `adc r2,r2,#0'
+| make[2]: *** [mul.lo] Error 1
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Pending
+
+--- mpfr.old/src/mpfr-longlong.h	2008-01-01 03:29:09.000000000 +0000
++++ mpfr/src/mpfr-longlong.h	2008-10-27 21:46:44.000000000 +0000
+@@ -406,7 +406,7 @@
+ 	     "rIJ" ((USItype) (bl)))
+ #endif
+ 
+-#if defined (__arm__) && W_TYPE_SIZE == 32
++#if defined (__arm__) && W_TYPE_SIZE == 32 && !defined(__thumb__)
+ #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
+   __asm__ ("adds\t%1, %4, %5\n\tadc\t%0, %2, %3"			\
+ 	   : "=r" (sh), "=&r" (sl)					\
diff --git a/meta/recipes-support/mpfr/mpfr_3.1.0.bb b/meta/recipes-support/mpfr/mpfr_3.1.0.bb
index 8e67fc2..102ec69 100644
--- a/meta/recipes-support/mpfr/mpfr_3.1.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.0.bb
@@ -3,9 +3,11 @@ LICENSE="GPLv3&LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "gmp"
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2"
+SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2 \
+  file://long-long-thumb.patch \
+"
 
 SRC_URI[md5sum] = "238ae4a15cc3a5049b723daef5d17938"
 SRC_URI[sha256sum] = "74a7bbbad168dd1cc414f1c9210b8fc16ccfc8e422d34b3371a8978e31eab680"
-- 
1.7.8.4



