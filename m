Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8C1745B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 09:12:06 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 0322910C10F2;
	Thu, 18 Oct 2018 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1539853927; bh=n9X+Wzpf+dD8vGYrfqu0w2QnS0Aud+Zlb9NPEtj9B5U=;
	h=From:To:Cc:Subject:Date:From;
	b=I33sAmsLEgXv+WJGcD6Qd56UaWORR8zUm4wgkWY5k2Byfz46smt+1zSkz3Y3yEU0b
	23/fbuoL4DsC0/CgfLudFtyfHDC/rRYU79Ki6a3seG+OhkpshchxRNOioyBDBImb4b
	Nqn4p+SqcoZi1FPWCDzc2a2cPq+MOu9a7ZzqS9Sj6iKmajgG1aZ7Z4Fr2n3HCL307l
	icjVnAfeXXx2M/hzaGz3Qm3Hjnz1pfshwW2CfI/jvwfRpcotAJ9wGT2LKdE4Imw47B
	7+4fVD92ULBpR0ODdAdcoGDCkQejhOy2+B9SEJg513DQnz1S4+XE/vAXI5MNt2i+lS
	OkKHIK4kCmm7Q==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 47C205B46;
	Thu, 18 Oct 2018 02:12:04 -0700 (PDT)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 12:12:03 +0300
Message-Id: <20181018091203.22480-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] mpfr: Fix compilation for ARC
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
X-List-Received-Date: Thu, 18 Oct 2018 09:12:06 -0000

MPFR has a couple of things implemented in assembly and in case of
ARC those parts were written long ago when ARC GCC port was not yet
upstreamed. On upstreaming of GCC some constraints were changed and
so we can no longer build MPFR for ARC with up-to-date tools seeing
something like that:
| In file included from ../../mpfr-4.0.1/src/mpfr-impl.h:112,
|                  from ../../mpfr-4.0.1/src/mul.c:24:
| ../../mpfr-4.0.1/src/mul.c: In function 'mpfr_mul':
| ../../mpfr-4.0.1/src/mpfr-longlong.h:415:3: error: impossible constraint in 'asm'
|    __asm__ ("add.f\t%1, %4, %5\n\tadc\t%0, %2, %3"   \
|    ^~~~~~~

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 .../0001-Fix-obsolete-ARC-asm-constraints.patch    | 45 ++++++++++++++++++++++
 meta/recipes-support/mpfr/mpfr_4.0.1.bb            |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/mpfr/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch

diff --git a/meta/recipes-support/mpfr/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch b/meta/recipes-support/mpfr/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
new file mode 100644
index 0000000000..59d1b0db67
--- /dev/null
+++ b/meta/recipes-support/mpfr/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
@@ -0,0 +1,45 @@
+mpfr-longlong.h: Fix obsolete ARC asm constraints
+
+This patch replaces obsolete ARC "J" asm constraint with
+up-to-date "Cal" constraint.
+
+"J" constraint only existed in pre-upstream GCC port for ARC.
+In current upstream port "Cal" constraint is used which leads
+to compile-time error.
+
+Proposed fix is known to work in Buildroot, Crosstool-NG etc.
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=09cb6a17e71bd40d2fbfaf82a1502fc210e33c87
+
+Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+
+Upstream-Status: Backport [https://gforge.inria.fr/scm/viewvc.php/mpfr?view=revision&revision=13251]
+---
+Index: src/mpfr-longlong.h
+===================================================================
+--- a/src/mpfr-longlong.h	(revision 10963)
++++ b/src/mpfr-longlong.h	(working copy)
+@@ -416,17 +416,17 @@
+ 	   : "=r" (sh),							\
+ 	     "=&r" (sl)							\
+ 	   : "r"  ((USItype) (ah)),					\
+-	     "rIJ" ((USItype) (bh)),					\
++	     "rICal" ((USItype) (bh)),					\
+ 	     "%r" ((USItype) (al)),					\
+-	     "rIJ" ((USItype) (bl)))
++	     "rICal" ((USItype) (bl)))
+ #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
+   __asm__ ("sub.f\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
+ 	   : "=r" (sh),							\
+ 	     "=&r" (sl)							\
+ 	   : "r" ((USItype) (ah)),					\
+-	     "rIJ" ((USItype) (bh)),					\
++	     "rICal" ((USItype) (bh)),					\
+ 	     "r" ((USItype) (al)),					\
+-	     "rIJ" ((USItype) (bl)))
++	     "rICal" ((USItype) (bl)))
+ #endif
+ 
+ #if defined (__arm__) && (defined (__thumb2__) || !defined (__thumb__)) \
diff --git a/meta/recipes-support/mpfr/mpfr_4.0.1.bb b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
index f85a846e33..2eee76a357 100644
--- a/meta/recipes-support/mpfr/mpfr_4.0.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "gmp autoconf-archive"
 
-SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
+SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
+           file://0001-Fix-obsolete-ARC-asm-constraints.patch"
 SRC_URI[md5sum] = "b8dd19bd9bb1ec8831a6a582a7308073"
 SRC_URI[sha256sum] = "67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e"
 
-- 
2.16.2


