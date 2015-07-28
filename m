Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 21858601F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 05:40:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S5ejuK029108
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 22:40:45 -0700 (PDT)
Received: from PEK-JWANG7-D1.wrs.com (128.224.162.190) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 27 Jul 2015 22:40:29 -0700
From: <jianchuan.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 13:40:38 +0800
Message-ID: <1438062038-10291-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libhugetlbfs: Uprev to v2.19 from v2.18
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
X-List-Received-Date: Tue, 28 Jul 2015 05:40:46 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

The 5 patches which are deleted have been in the v2.19

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 ...tend-arm32-support-to-include-BE-variants.patch | 38 ---------------
 .../0001-Makefile-Recognize-all-ix86-arches.patch  | 32 ------------
 .../files/0001-aarch64-fix-cross-compilation.patch | 34 -------------
 ...s-arm-arches-fix-page-size-and-text-offse.patch | 57 ----------------------
 ...-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch | 29 -----------
 .../libhugetlbfs/libhugetlbfs_git.bb               |  9 +---
 6 files changed, 2 insertions(+), 197 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-cross-compilation.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
deleted file mode 100644
index f6147cb..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Extend-arm32-support-to-include-BE-variants.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5af6dec8764375ca4f13bd9fed96af090228351a Mon Sep 17 00:00:00 2001
-From: "Gary S. Robertson" <gary.robertson@linaro.org>
-Date: Mon, 11 Aug 2014 11:06:04 -0500
-Subject: [libhugetlbfs][PATCH] Extend arm32 support to include BE variants
-    
-This patch applies the same technique used by Koen Kool in the following patch
-which was accepted by the libhugetlbfs project:
-    
-[0a4f6] Add aarch64_be_support 2014-03-31 10:52:37
-    
-It modifies the libhugetlbfs Makefile to mark all 32-bit arm architectures
-as supported by the libhugetlbfs build.  Builds and successful functional
-tests have been performed for armv7a LE and BE runtime platforms.
-    
-This patch replaces and renders obsolete the following patch:
-arm32-support.patch submitted by: Chunrong Guo <B40290@freescale.com>
-
-Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 91502e1..ba79607 100644
---- a/Makefile
-+++ b/Makefile
-@@ -59,7 +59,7 @@ ELF32 = elf32ppclinux
- TMPLIB32 = lib
- CPPFLAGS += -DPPC_NO_SEGMENTS
- else
--ifeq ($(ARCH),armv7l)
-+ifneq (,$(findstring arm,$(ARCH)))
- CC32 = $(CC)
- TMPLIB32 = lib
- ELF32 += armelf_linux_eabi
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch
deleted file mode 100644
index 2718275..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a0166583ba5f7b6a6d2de434f633126fb12c9d29 Mon Sep 17 00:00:00 2001
-From: "Gary S. Robertson" <gary.robertson@linaro.org>
-Date: Wed, 24 Sep 2014 15:27:31 -0500
-Subject: [PATCH] Makefile: Recognize all ix86 arches
-
-In a non-native build scenario, the makefile
-only recognized i386 or x86_64 arches.  Added support
-to recognize i486, i586, i686.
-
-Upstream Status: Accepted by libhugetlbfs project
-
-Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 91502e1..0bfaee8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -71,7 +71,7 @@ ELF64 = aarch64elf
- TMPLIB64 = lib64
- CUSTOM_LDSCRIPTS = no
- else
--ifeq ($(ARCH),i386)
-+ifneq (,$(filter i386 i486 i586 i686,$(ARCH)))
- CC32 = $(CC)
- ELF32 = elf_i386
- TMPLIB32 = lib
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-cross-compilation.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-cross-compilation.patch
deleted file mode 100644
index 215ae72..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-aarch64-fix-cross-compilation.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Subject: [PATCH] aarch64: fix cross compilation
-
-This patch allow to override CC and use it for aarch64 case like
-the other architectures.
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
-
-Upstream-Status: Submitted
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 91502e1..5aa1e12 100644
---- a/Makefile
-+++ b/Makefile
-@@ -33,7 +33,7 @@ CFLAGS += -Wall -fPIC
- CPPFLAGS += -D__LIBHUGETLBFS__
- 
- ARCH = $(shell uname -m | sed -e s/i.86/i386/)
--CC = gcc
-+CC ?= gcc
- 
- CUSTOM_LDSCRIPTS = yes
- 
-@@ -66,7 +66,7 @@ ELF32 += armelf_linux_eabi
- CUSTOM_LDSCRIPTS = no
- else
- ifneq (,$(findstring aarch64,$(ARCH)))
--CC64 = gcc
-+CC64 = $(CC)
- ELF64 = aarch64elf
- TMPLIB64 = lib64
- CUSTOM_LDSCRIPTS = no
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
deleted file mode 100644
index 4e5b7bb..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 1ab6f7f9b34fc745451140fc21db6763dffc5785 Mon Sep 17 00:00:00 2001
-From: "Gary S. Robertson" <gary.robertson@linaro.org>
-Date: Thu, 25 Sep 2014 14:57:06 -0500
-Subject: [PATCH] ld.hugetlbfs: arm arches - fix page size and text offset
- setup
-
-There's 3 issues fixed:
-* typo on MB variable (MB -> $MB)
-* some linker variants are missing (linux and big endian)
-  - armelfb_linux_eabi
-  - aarch64elfb
-  - aarch64linux
-  - aarch64linuxb
-* text segment offset was not specified for armv7 BE
-
-NOTE: This patch replaces and makes obsolete the following previously
-      submitted patch:
-
-      aarch64: fix page size not properly computed
-      by: Fathi Boudra <fathi.boudra@linaro.org>
-
-Upstream Status: Accepted at libhugetlbfs project
-
-Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
----
- ld.hugetlbfs |    8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/ld.hugetlbfs b/ld.hugetlbfs
-index df446dd..4417442 100755
---- a/ld.hugetlbfs
-+++ b/ld.hugetlbfs
-@@ -87,7 +87,7 @@ elf32ppclinux|elf64ppc)	HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
- elf64lppc)		HPAGE_SIZE=$((16*$MB)) SLICE_SIZE=$((256*$MB)) ;;
- elf_i386|elf_x86_64)	HPAGE_SIZE=$((4*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
- elf_s390|elf64_s390)	HPAGE_SIZE=$((1*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
--armelf_linux_eabi|aarch64elf)	HPAGE_SIZE=$((2*MB)) SLICE_SIZE=$HPAGE_SIZE ;;
-+armelf*_linux_eabi|aarch64elf*|aarch64linux*)	HPAGE_SIZE=$((2*$MB)) SLICE_SIZE=$HPAGE_SIZE ;;
- esac
- 
- if [ "$HTLB_ALIGN" == "slice" ]; then
-@@ -96,9 +96,9 @@ if [ "$HTLB_ALIGN" == "slice" ]; then
- 
- 	# targeting the ARM platform one needs to explicitly set the text segment offset
- 	# otherwise it will be NULL.
--	if [ "$EMU" == "armelf_linux_eabi" ]; then
--		HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE"
--	fi
-+	case "$EMU" in
-+	armelf*_linux_eabi)	HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE" ;;
-+	esac
- fi
- 
- ${LD} "${args[@]}" ${HTLBOPTS}
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch
deleted file mode 100644
index 9e2a5e5..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Subject: [PATCH 1/1] Replace lib/lib64 hardcoded values by LIBDIR32/LIBDIR64
- variables
-
-Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
-
-Upstream-Status: Submitted
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 91502e1..682c0db 100644
---- a/Makefile
-+++ b/Makefile
-@@ -181,9 +181,9 @@ BINDIR = $(PREFIX)/share/libhugetlbfs
- EXEDIR = $(PREFIX)/bin
- DOCDIR = $(PREFIX)/share/doc/libhugetlbfs
- ifdef CC32
--PMDIR = $(PREFIX)/lib/perl5/TLBC
-+PMDIR = $(LIBDIR32)/perl5/TLBC
- else
--PMDIR = $(PREFIX)/lib64/perl5/TLBC
-+PMDIR = $(LIBDIR64)/perl5/TLBC
- endif
- MANDIR1 = $(PREFIX)/share/man/man1
- MANDIR3 = $(PREFIX)/share/man/man3
--- 
-1.9.2
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index ce0c6af..a2d3922 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -7,21 +7,16 @@ DEPENDS = "sysfsutils perl"
 RDEPENDS_${PN} += "bash perl python python-io python-lang python-subprocess python-resource"
 RDEPENDS_${PN}-tests += "bash"
 
-PV = "2.18"
+PV = "2.19"
 PE = "1"
 
-SRCREV = "ea3f6b273f535aab38cefae30030774457bbbfe6"
+SRCREV = "426c22d65415fcb8927f68fbc5887e075a8dc40a"
 SRC_URI = " \
     git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
     file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
-    file://0001-aarch64-fix-cross-compilation.patch \
-    file://0001-ld.hugetlbfs-arm-arches-fix-page-size-and-text-offse.patch \
-    file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
-    file://0001-Extend-arm32-support-to-include-BE-variants.patch \
-    file://0001-Makefile-Recognize-all-ix86-arches.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


