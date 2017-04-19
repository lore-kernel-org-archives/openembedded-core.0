Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 057C8719B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 21:25:42 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 19 Apr 2017 14:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,222,1488873600"; d="scan'208";a="91528953"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.141])
	by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2017 14:25:42 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 16:30:06 -0500
Message-Id: <1492637407-15757-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: richerd.purdie@linuxfoundation.com, flavio.santes@intel.com,
	saul.wold@intel.com
Subject: [PATCH 1/2] Revert "kexec-tools: Remove unused patch"
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
X-List-Received-Date: Wed, 19 Apr 2017 21:25:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit ec1f1c4abe1d40708fefd56f01c58fff38f28960.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../kexec/kexec-tools/kexec-x32.patch              | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
new file mode 100644
index 0000000..26d18eb
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
@@ -0,0 +1,88 @@
+x86_64: Add support to build kexec-tools with x32 ABI
+
+Summary of changes,
+
+configure.ac: Add test for detect x32 ABI.
+purgatory/arch/x86_64/Makefile: Not use mcmodel large when
+	x32 ABI is set.
+kexec/arch/x86_64/kexec-elf-rel-x86_64.c: When x32 ABI is set
+	use ELFCLASS32 instead of ELFCLASS64.
+kexec/kexec-syscall.h: Add correct syscall number for x32 ABI.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
+
+---
+ configure.ac                             | 9 +++++++++
+ kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 4 ++++
+ kexec/kexec-syscall.h                    | 4 ++++
+ purgatory/arch/x86_64/Makefile           | 4 +++-
+ 4 files changed, 20 insertions(+), 1 deletion(-)
+
+Index: kexec-tools-2.0.10/configure.ac
+===================================================================
+--- kexec-tools-2.0.10.orig/configure.ac
++++ kexec-tools-2.0.10/configure.ac
+@@ -56,6 +56,15 @@ case $target_cpu in
+ 		;;
+ 	ia64|x86_64|alpha|m68k )
+ 		ARCH="$target_cpu"
++
++		dnl ---Test for x32 ABI in x86_64
++		if test "x$ARCH" = "xx86_64" ; then
++			AC_EGREP_CPP(x32_test,
++			[#if defined(__x86_64__) && defined (__ILP32__)
++				x32_test
++			#endif
++			], SUBARCH='x32', SUBARCH='64')
++		fi
+ 		;;
+ 	* )
+ 		AC_MSG_ERROR([unsupported architecture $target_cpu])
+Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
++++ kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
+@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_eh
+ 	if (ehdr->ei_data != ELFDATA2LSB) {
+ 		return 0;
+ 	}
++#ifdef __ILP32__
++	if (ehdr->ei_class != ELFCLASS32) {
++#else
+ 	if (ehdr->ei_class != ELFCLASS64) {
++#endif
+ 		return 0;
+ 	}
+ 	if (ehdr->e_machine != EM_X86_64) {
+Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
+===================================================================
+--- kexec-tools-2.0.10.orig/kexec/kexec-syscall.h
++++ kexec-tools-2.0.10/kexec/kexec-syscall.h
+@@ -31,8 +31,12 @@
+ #define __NR_kexec_load		268
+ #endif
+ #ifdef __x86_64__
++#ifdef __ILP32__
++#define __NR_kexec_load		528
++#else
+ #define __NR_kexec_load		246
+ #endif
++#endif
+ #ifdef __s390x__
+ #define __NR_kexec_load		277
+ #endif
+Index: kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
+===================================================================
+--- kexec-tools-2.0.10.orig/purgatory/arch/x86_64/Makefile
++++ kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
+@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/
+ x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
+ x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
+ 
+-x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
++ifeq ($(SUBARCH),64)
++        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
++endif
-- 
2.1.4


