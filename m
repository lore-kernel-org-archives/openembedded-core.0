Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF5073C0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:39:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 26 Mar 2015 07:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,472,1422950400"; d="scan'208";a="546725233"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga003.jf.intel.com with ESMTP; 26 Mar 2015 07:39:31 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Mar 2015 14:39:25 +0000
Message-Id: <1427380765-14254-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCHv2] lzop: Fix build using x32 ABI
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
X-List-Received-Date: Thu, 26 Mar 2015 14:39:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When tries to build lzop using x32 ABI fails trying to get
FLAGS register that is 64-bit and destination variable is
32-bit size_t.

[YOCTO #7424]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../lzop/lzop/x32_abi_miniacc_h.patch              | 36 ++++++++++++++++++++++
 meta/recipes-support/lzop/lzop_1.03.bb             |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch

diff --git a/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch b/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
new file mode 100644
index 0000000..527589f
--- /dev/null
+++ b/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
@@ -0,0 +1,36 @@
+Fix get of FLAGS register in x32 ABI,
+
+x32 ABI requires to have 64-bit variable to store FLAGS register
+instead of size_t that is 32-bit variable, this fix operand
+type mismatch when try to pop previous pushf value.
+
+Upstream-status: Submitted
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Index: lzop-1.03/src/miniacc.h
+===================================================================
+--- lzop-1.03.orig/src/miniacc.h
++++ lzop-1.03/src/miniacc.h
+@@ -754,6 +754,9 @@
+ #elif defined(__amd64__) || defined(__x86_64__) || defined(_M_AMD64)
+ #  define ACC_ARCH_AMD64            1
+ #  define ACC_INFO_ARCH             "amd64"
++#  if defined(__ILP32__)
++#    define ACC_ARCH_AMD64_X32      1
++#  endif
+ #elif defined(__thumb__) || (defined(_M_ARM) && defined(_M_THUMB))
+ #  define ACC_ARCH_ARM              1
+ #  define ACC_ARCH_ARM_THUMB        1
+@@ -6787,7 +6790,11 @@ ACCLIB_PUBLIC_NOINLINE(void, acc_debug_n
+ ACCLIB_PUBLIC_NOINLINE(int, acc_debug_align_check_query) (void)
+ {
+ #if (ACC_ARCH_AMD64 || ACC_ARCH_I386) && (ACC_ASM_SYNTAX_GNUC)
++#  if defined(ACC_ARCH_AMD64_X32)
++    unsigned long long r;
++#  else
+     size_t r;
++#  endif
+     __asm__ __volatile__("pushf\n pop %0\n" : "=a" (r) : : __ACC_ASM_CLOBBER);
+     return (int)(r >> 18) & 1;
+ #elif (ACC_ARCH_I386) && (ACC_ASM_SYNTAX_MSC)
diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
index abfc81c..1fcd81d 100644
--- a/meta/recipes-support/lzop/lzop_1.03.bb
+++ b/meta/recipes-support/lzop/lzop_1.03.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dfeaf3dc4beef4f5a7bdbc35b197f39e \
                     file://src/lzop.c;beginline=5;endline=21;md5=6797bd3ed0a1a49327b7ebf9366ebd86"
 
 SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
-           file://acinclude.m4"
+           file://acinclude.m4 \
+           file://x32_abi_miniacc_h.patch "
 SRC_URI[md5sum] = "006c5e27fb78cdd14a628fdfa5aa1905"
 SRC_URI[sha256sum] = "c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9"
 
-- 
1.8.4.5


