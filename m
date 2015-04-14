Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D140773912
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 18:55:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2015 11:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,577,1422950400"; d="scan'208";a="680042633"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by orsmga001.jf.intel.com with ESMTP; 14 Apr 2015 11:55:42 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Apr 2015 19:54:32 +0100
Message-Id: <1429037672-6239-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH][daisy] openssl: Fix x32 openssl patch which was not building
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
X-List-Received-Date: Tue, 14 Apr 2015 18:55:41 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

x32 builds where broken due to patch rebase not having been done correctly for
this patch

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 .../openssl/openssl/openssl_fix_for_x32.patch      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
index 0d3902f..ab1434a 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
+++ b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.patch
@@ -52,6 +52,36 @@ Index: openssl-1.0.1e/crypto/bn/bn.h
  /*
   * assuming long is 64bit - this is the DEC Alpha unsigned long long is only
   * 64 bits :-(, don't define BN_LLONG for the DEC Alpha
+Index: openssl-1.0.1e/crypto/bn/asm/x86_64-gcc.c
+===================================================================
+--- openssl-1.0.1m/crypto/bn/asm/x86_64-gcc.c	2015-03-19 13:37:10.000000000 +0000
++++ openssl-1.0.1m-modif/crypto/bn/asm/x86_64-gcc.c	2015-04-14 17:09:11.876533194 +0100
+@@ -211,9 +211,9 @@
+
+     asm volatile ("       subq    %2,%2           \n"
+                   ".p2align 4                     \n"
+-                  "1:     movq    (%4,%2,8),%0    \n"
+-                  "       adcq    (%5,%2,8),%0    \n"
+-                  "       movq    %0,(%3,%2,8)    \n"
++                  "1:     movq    (%q4,%2,8),%0   \n"
++                  "       adcq    (%q5,%2,8),%0   \n"
++                  "       movq    %0,(%q3,%2,8)   \n"
+                   "       leaq    1(%2),%2        \n"
+                   "       loop    1b              \n"
+                   "       sbbq    %0,%0           \n":"=&a" (ret), "+c"(n),
+@@ -235,9 +235,9 @@
+
+     asm volatile ("       subq    %2,%2           \n"
+                   ".p2align 4                     \n"
+-                  "1:     movq    (%4,%2,8),%0    \n"
+-                  "       sbbq    (%5,%2,8),%0    \n"
+-                  "       movq    %0,(%3,%2,8)    \n"
++                  "1:     movq    (%q4,%2,8),%0   \n"
++                  "       sbbq    (%q5,%2,8),%0   \n"
++                  "       movq    %0,(%q3,%2,8)   \n"
+                   "       leaq    1(%2),%2        \n"
+                   "       loop    1b              \n"
+                   "       sbbq    %0,%0           \n":"=&a" (ret), "+c"(n)
 Index: openssl-1.0.1e/crypto/bn/bn_exp.c
 ===================================================================
 --- openssl-1.0.1e.orig/crypto/bn/bn_exp.c
-- 
2.3.5


