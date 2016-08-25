Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6260B7325A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 21:09:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 25 Aug 2016 13:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,577,1464678000"; d="scan'208";a="871144485"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga003.jf.intel.com with ESMTP; 25 Aug 2016 13:59:49 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2016 14:01:18 -0700
Message-Id: <1472158878-25011-2-git-send-email-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472158878-25011-1-git-send-email-timothy.t.orling@linux.intel.com>
References: <1472158878-25011-1-git-send-email-timothy.t.orling@linux.intel.com>
Subject: [krogoth][PATCH 1/1] lzop: Fix build with gcc-6
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
X-List-Received-Date: Thu, 25 Aug 2016 21:09:25 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-support/lzop/lzop/lzop-1.03-gcc6.patch | 37 ++++++++++++++++++++++
 meta/recipes-support/lzop/lzop_1.03.bb             |  6 ++--
 2 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch

diff --git a/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch b/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
new file mode 100644
index 0000000..72b3397
--- /dev/null
+++ b/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
@@ -0,0 +1,37 @@
+gcc-6 has additional errors e.g.
+
+./test.c:1:12: error: variably modified '__acc_cta' at file scope
+ extern int __acc_cta[1-2*!((1l << (8*8 -1)) < 0)];
+            ^~~~~~~~~
+
+This is rightly pointed out since that index is undefined
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+--- a/src/miniacc.h.orig	2016-02-10 16:09:23.247315866 +0100
++++ a/src/miniacc.h	2016-02-10 16:12:14.973297054 +0100
+@@ -4469,12 +4469,12 @@
+ #if defined(__MSDOS__) && defined(__TURBOC__) && (__TURBOC__ < 0x0150)
+ #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #else
+-    ACCCHK_ASSERT((1   << (8*SIZEOF_INT-1)) < 0)
++    ACCCHK_ASSERT((int)(1u   << (8*SIZEOF_INT-1)) < 0)
+ #endif
+     ACCCHK_ASSERT((1u  << (8*SIZEOF_INT-1)) > 0)
+ #if 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #else
+-    ACCCHK_ASSERT((1l  << (8*SIZEOF_LONG-1)) < 0)
++    ACCCHK_ASSERT((long)(1ul  << (8*SIZEOF_LONG-1)) < 0)
+ #endif
+     ACCCHK_ASSERT((1ul << (8*SIZEOF_LONG-1)) > 0)
+ #if defined(acc_int16e_t)
+@@ -4703,7 +4703,7 @@
+ #elif 1 && (ACC_CC_LCC || ACC_CC_LCCWIN32) && !defined(ACCCHK_CFG_PEDANTIC)
+ #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #elif !(ACC_BROKEN_INTEGRAL_PROMOTION) && (SIZEOF_INT > 1)
+-    ACCCHK_ASSERT( (((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
++    ACCCHK_ASSERT( (int)((unsigned int)((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
+ #endif
+ #if (ACC_CC_BORLANDC && (__BORLANDC__ >= 0x0530) && (__BORLANDC__ < 0x0560))
+ #  pragma option pop
diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
index 07d6289..649e724 100644
--- a/meta/recipes-support/lzop/lzop_1.03.bb
+++ b/meta/recipes-support/lzop/lzop_1.03.bb
@@ -15,15 +15,15 @@ SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
            file://acinclude.m4 \
            file://x32_abi_miniacc_h.patch \
            file://0001-use-static-inlines-as-the-external-inline-definition.patch \
+           file://lzop-1.03-gcc6.patch \
           "
 SRC_URI[md5sum] = "006c5e27fb78cdd14a628fdfa5aa1905"
 SRC_URI[sha256sum] = "c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9"
 
 inherit autotools
 
-do_configure () {
-    ln -sf  ../acinclude.m4 ${S}/acinclude.m4
-    autotools_do_configure
+do_configure_prepend () {
+    install -Dm 0644 ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
 }
 
 BBCLASSEXTEND += "native nativesdk"
-- 
2.7.4


