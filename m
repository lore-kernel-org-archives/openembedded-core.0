Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TsWne-0008AM-4b
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:52:59 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 85EFBD22CD;
	Tue,  8 Jan 2013 11:37:44 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 11:37:39 +0100
Message-Id: <1357641459-18676-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <50EBE1E3.8060408@linaro.org>
References: <50EBE1E3.8060408@linaro.org>
Subject: [PATCH] gmp: add patch from upstream to unbreak AArch64
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
X-List-Received-Date: Tue, 08 Jan 2013 10:53:04 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../gmp/gmp-5.1.0/187b7b1646ee.patch               | 44 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp_5.1.0.bb              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch

diff --git a/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch b/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
new file mode 100644
index 0000000..486f8c5
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
@@ -0,0 +1,44 @@
+Upstream-status: Backport
+
+# HG changeset patch
+# User Torbjorn Granlund <tege@gmplib.org>
+# Date 1357413121 -3600
+# Node ID 187b7b1646ee0ace782768bb36117b62c8408bb6
+# Parent  87a24013e9ee2cabf74e32282c18584a2c669009
+(aarch64): Make add_ssaaaa and sub_ddmmss actually work.
+
+diff -r 87a24013e9ee -r 187b7b1646ee longlong.h
+--- a/longlong.h	Fri Jan 04 16:32:01 2013 +0100
++++ b/longlong.h	Sat Jan 05 20:12:01 2013 +0100
+@@ -530,23 +530,16 @@
+ #endif /* __arm__ */
+ 
+ #if defined (__aarch64__) && W_TYPE_SIZE == 64
++/* FIXME: Extend the immediate range for the low word by using both
++   ADDS and SUBS, since they set carry in the same way.  */
+ #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
+-  __asm__ ("adds\t%1, %4, %5\n\tadc\t%0, %2, %3"			\
++  __asm__ ("adds\t%1, %x4, %5\n\tadc\t%0, %x2, %x3"			\
+ 	   : "=r" (sh), "=&r" (sl)					\
+-	   : "r" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
++	   : "rZ" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
+ #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
+-  do {									\
+-    if (__builtin_constant_p (bl))					\
+-      {									\
+-	__asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
+-		 : "=r" (sh), "=&r" (sl)				\
+-		 : "r" (ah), "r" (bh), "r" (al), "rI" (bl) __CLOBBER_CC); \
+-      }									\
+-    else /* only bh might be a constant */				\
+-      __asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
+-	       : "=r" (sh), "=&r" (sl)					\
+-	       : "r" (ah), "rZ" (bh), "r" (al), "rI" (bl) __CLOBBER_CC);\
+-    } while (0)
++  __asm__ ("subs\t%1, %x4, %5\n\tsbc\t%0, %x2, %x3"			\
++	   : "=r,r" (sh), "=&r,&r" (sl)					\
++	   : "rZ,rZ" (ah), "rZ,rZ" (bh), "r,Z" (al), "rI,r" (bl) __CLOBBER_CC)
+ #define umul_ppmm(ph, pl, m0, m1) \
+   do {									\
+     UDItype __m0 = (m0), __m1 = (m1);					\
+
diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bb b/meta/recipes-support/gmp/gmp_5.1.0.bb
index 9cb80fe..eb5ef33 100644
--- a/meta/recipes-support/gmp/gmp_5.1.0.bb
+++ b/meta/recipes-support/gmp/gmp_5.1.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI_append = " file://use-includedir.patch \
                    file://gmp_fix_for_x32.patch \
+                   file://187b7b1646ee.patch \
                    "
 
 SRC_URI[md5sum] = "362cf515aff8dc240958ce47418e4c78"
-- 
1.8.0



