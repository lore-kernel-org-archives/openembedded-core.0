Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 16FB3731CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655758; x=1521191758;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=rhvbbEcpcJyTjm0g5C5wduG+z21adU07C8OhY8JSWAA=;
	b=g+iArdF/sGzLEOFuOWZ8TBvRcCE7vZOLqp9w/enfvDEdagJKXj4VdPsG
	MwjNuPRQCPL4dG0pZk9HB69r0PbJKA==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1123331327"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2017 02:15:57 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id C43FD2C8001;
	Thu, 16 Mar 2017 02:15:52 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:39 +0200
Message-Id: <b1c1ce2783a3512562cd8e4a6ef400511da627a3.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] kexec-tools: Remove unused patch
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch was removed from SRC_URI as merged upstream in 587778e24c9.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../kexec/kexec-tools/kexec-x32.patch              | 88 ----------------------
 1 file changed, 88 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
deleted file mode 100644
index 26d18eb..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/kexec-x32.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-x86_64: Add support to build kexec-tools with x32 ABI
-
-Summary of changes,
-
-configure.ac: Add test for detect x32 ABI.
-purgatory/arch/x86_64/Makefile: Not use mcmodel large when
-	x32 ABI is set.
-kexec/arch/x86_64/kexec-elf-rel-x86_64.c: When x32 ABI is set
-	use ELFCLASS32 instead of ELFCLASS64.
-kexec/kexec-syscall.h: Add correct syscall number for x32 ABI.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
-
----
- configure.ac                             | 9 +++++++++
- kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 4 ++++
- kexec/kexec-syscall.h                    | 4 ++++
- purgatory/arch/x86_64/Makefile           | 4 +++-
- 4 files changed, 20 insertions(+), 1 deletion(-)
-
-Index: kexec-tools-2.0.10/configure.ac
-===================================================================
---- kexec-tools-2.0.10.orig/configure.ac
-+++ kexec-tools-2.0.10/configure.ac
-@@ -56,6 +56,15 @@ case $target_cpu in
- 		;;
- 	ia64|x86_64|alpha|m68k )
- 		ARCH="$target_cpu"
-+
-+		dnl ---Test for x32 ABI in x86_64
-+		if test "x$ARCH" = "xx86_64" ; then
-+			AC_EGREP_CPP(x32_test,
-+			[#if defined(__x86_64__) && defined (__ILP32__)
-+				x32_test
-+			#endif
-+			], SUBARCH='x32', SUBARCH='64')
-+		fi
- 		;;
- 	* )
- 		AC_MSG_ERROR([unsupported architecture $target_cpu])
-Index: kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-===================================================================
---- kexec-tools-2.0.10.orig/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-+++ kexec-tools-2.0.10/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-@@ -8,7 +8,11 @@ int machine_verify_elf_rel(struct mem_eh
- 	if (ehdr->ei_data != ELFDATA2LSB) {
- 		return 0;
- 	}
-+#ifdef __ILP32__
-+	if (ehdr->ei_class != ELFCLASS32) {
-+#else
- 	if (ehdr->ei_class != ELFCLASS64) {
-+#endif
- 		return 0;
- 	}
- 	if (ehdr->e_machine != EM_X86_64) {
-Index: kexec-tools-2.0.10/kexec/kexec-syscall.h
-===================================================================
---- kexec-tools-2.0.10.orig/kexec/kexec-syscall.h
-+++ kexec-tools-2.0.10/kexec/kexec-syscall.h
-@@ -31,8 +31,12 @@
- #define __NR_kexec_load		268
- #endif
- #ifdef __x86_64__
-+#ifdef __ILP32__
-+#define __NR_kexec_load		528
-+#else
- #define __NR_kexec_load		246
- #endif
-+#endif
- #ifdef __s390x__
- #define __NR_kexec_load		277
- #endif
-Index: kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
-===================================================================
---- kexec-tools-2.0.10.orig/purgatory/arch/x86_64/Makefile
-+++ kexec-tools-2.0.10/purgatory/arch/x86_64/Makefile
-@@ -23,4 +23,6 @@ x86_64_PURGATORY_SRCS += purgatory/arch/
- x86_64_PURGATORY_SRCS += purgatory/arch/i386/vga.c
- x86_64_PURGATORY_SRCS += purgatory/arch/i386/pic.c
- 
--x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
-+ifeq ($(SUBARCH),64)
-+        x86_64_PURGATORY_EXTRA_CFLAGS = -mcmodel=large
-+endif
-- 
2.1.4


