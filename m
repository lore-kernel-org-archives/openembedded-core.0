Return-Path: <megha.dey@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 66C0C7861E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 00:01:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Sep 2017 17:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,395,1500966000"; d="scan'208";a="1014615598"
Received: from megha-z97x-ud7-th.sc.intel.com ([143.183.85.162])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2017 17:01:59 -0700
From: Megha Dey <megha.dey@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 17:15:30 -0700
Message-Id: <1505434530-22152-1-git-send-email-megha.dey@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: megha.dey@intel.com
Subject: [PATCH] kexec-tools: Update to 2.0.15
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
X-List-Received-Date: Fri, 15 Sep 2017 00:01:59 -0000

Starting with 4.12 kernels, kexec-tools cannot load a crash kernel
because ELF core parsing fails with errors like:

  Unknown type (Reserved) while parsing /sys/firmware/memmap/5/type.
  Please report this as bug. Using RANGE_RESERVED now.
  ...
  ELF core (kcore) parse failed
  Cannot load <path to>/vmlinuz

The issue is fixed upstream in kexec-tools 2.0.15.

This patch updates to the latest version of the kexec-tools and
removes patches which are already merged upstream.

Signed-off-by: Megha Dey <megha.dey@linux.intel.com>
---
 .../kexec-tools/0001-Disable-PIE-during-link.patch |  31 ----
 .../kexec/kexec-tools/0001-arm64-Disable-PIC.patch |  31 ----
 ...nd-the-semantics-of-kexec_iomem_for_each_.patch |  78 --------
 .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     |  31 ----
 ...01-x86-x86_64-Fix-format-warning-with-die.patch |  78 --------
 ...eneralize-and-rename-get_kernel_stext_sym.patch | 194 --------------------
 .../0002-ppc-Fix-format-warning-with-die.patch     |  43 -----
 ...0003-arm64-identify-PHYS_OFFSET-correctly.patch |  76 --------
 .../0004-arm64-kdump-identify-memory-regions.patch | 202 ---------------------
 ...5-arm64-kdump-add-elf-core-header-segment.patch | 191 -------------------
 ...6-arm64-kdump-set-up-kernel-image-segment.patch | 137 --------------
 .../0007-arm64-kdump-set-up-other-segments.patch   |  35 ----
 ...-add-DT-properties-to-crash-dump-kernel-s.patch | 150 ---------------
 ...-kdump-Add-support-for-binary-image-files.patch |  52 ------
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  52 ------
 meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb    |  38 ++++
 16 files changed, 38 insertions(+), 1381 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
deleted file mode 100644
index 3f2f85e..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ea7be6d71b85880e8e8a2c8a4f49a696c5f31ae4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 10 Jun 2017 11:18:49 -0700
-Subject: [PATCH] Disable PIE during link
-
-We have explcitly disabled PIE during compile so we
-just need to match it with linker flags
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- purgatory/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 564bdb7..a08e41f 100644
---- a/purgatory/Makefile
-+++ b/purgatory/Makefile
-@@ -59,7 +59,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
- 			-Iinclude \
- 			-I$(shell $(CC) -print-file-name=include)
- $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
--			-Wl,--no-undefined -nostartfiles -nostdlib \
-+			-Wl,--no-undefined -no-pie -nostartfiles -nostdlib \
- 			-nodefaultlibs -e purgatory_start -Wl,-r \
- 			-Wl,-Map=$(PURGATORY_MAP)
- 
--- 
-2.13.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
deleted file mode 100644
index 84e94d7..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3bb73e5e5649b455e15d5ca3a7ad1a90c4960972 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 10 Jun 2017 11:54:36 -0700
-Subject: [PATCH] arm64: Disable PIC
-
-Fix
-| cc1: sorry, unimplemented: code model 'large' with -fPIC
-| make: *** [Makefile:118: purgatory/arch/arm64/entry.o] Error 1
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- purgatory/arch/arm64/Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/purgatory/arch/arm64/Makefile b/purgatory/arch/arm64/Makefile
-index 636abea..80068ca 100644
---- a/purgatory/arch/arm64/Makefile
-+++ b/purgatory/arch/arm64/Makefile
-@@ -1,6 +1,7 @@
- 
- arm64_PURGATORY_EXTRA_CFLAGS = \
- 	-mcmodel=large \
-+	-fno-PIC \
- 	-fno-stack-protector \
- 	-fno-asynchronous-unwind-tables \
- 	-Wundef \
--- 
-2.13.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
deleted file mode 100644
index 822f28c..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 02eed0f8f2748fd7579f69e5373445b52b2b8754 Mon Sep 17 00:00:00 2001
-From: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Date: Mon, 17 Oct 2016 13:56:58 +0900
-Subject: [PATCH 1/9] kexec: exntend the semantics of kexec_iomem_for_each_line
-
-The current kexec_iomem_for_each_line() counts up all the lines for which
-a callback function returns zero(0) or positive, and otherwise it stops
-further scanning.
-This behavior is incovenient in some cases. For instance, on arm64, we want
-to count up "System RAM" entries, but need to skip "reserved" entries.
-
-So this patch extends the semantics so that we will continue to scan
-succeeding entries but not count lines for which a callback function
-returns positive.
-
-The current users of kexec_iomem_for_each_line(), arm, sh and x86, will not
-be affected by this change because
-* arm
-  The callback function only returns -1 or 0, and the return value of
-  kexec_iomem_for_each_line() will never be used.
-* sh, x86
-  The callback function may return (-1 for sh,) 0 or 1, but always returns
-  1 once we have reached the maximum number of entries allowed.
-  Even so the current kexec_iomem_for_each_line() counts them up.
-  This change actually fixes this bug.
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/kexec-iomem.c | 15 ++++++++++-----
- 1 file changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/kexec/kexec-iomem.c b/kexec/kexec-iomem.c
-index 485a2e8..0a0277a 100644
---- a/kexec/kexec-iomem.c
-+++ b/kexec/kexec-iomem.c
-@@ -18,6 +18,9 @@
-  * Iterate over each line in the file returned by proc_iomem(). If match is
-  * NULL or if the line matches with our match-pattern then call the
-  * callback if non-NULL.
-+ * If match is NULL, callback should return a negative if error.
-+ * Otherwise the interation goes on, incrementing nr but only if callback
-+ * returns 0 (matched).
-  *
-  * Return the number of lines matched.
-  */
-@@ -37,7 +40,7 @@ int kexec_iomem_for_each_line(char *match,
- 	char *str;
- 	int consumed;
- 	int count;
--	int nr = 0;
-+	int nr = 0, ret;
- 
- 	fp = fopen(iomem, "r");
- 	if (!fp)
-@@ -50,11 +53,13 @@ int kexec_iomem_for_each_line(char *match,
- 		str = line + consumed;
- 		size = end - start + 1;
- 		if (!match || memcmp(str, match, strlen(match)) == 0) {
--			if (callback
--			    && callback(data, nr, str, start, size) < 0) {
--				break;
-+			if (callback) {
-+				ret = callback(data, nr, str, start, size);
-+				if (ret < 0)
-+					break;
-+				else if (ret == 0)
-+					nr++;
- 			}
--			nr++;
- 		}
- 	}
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
deleted file mode 100644
index 90c2f6e..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d811875a41b4628040abaada3da29b7b9592e757 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Jan 2016 17:16:16 -0800
-Subject: [PATCH] vmcore-dmesg: Define _GNU_SOURCE
-
-loff_t is guarded with _GNU_SOURCE on some C library implementations
-e.g. musl since this type is not defined by POSIX. Define _GNU_SOURCE to
-include this define, it should help compiling on musl while nothing
-changes for glibc based systems since there _GNU_SOURCE is already
-defined
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- vmcore-dmesg/vmcore-dmesg.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
-index 0364636..a8f56df 100644
---- a/vmcore-dmesg/vmcore-dmesg.c
-+++ b/vmcore-dmesg/vmcore-dmesg.c
-@@ -1,4 +1,5 @@
- #define _XOPEN_SOURCE 600
-+#define _GNU_SOURCE
- #define _LARGEFILE_SOURCE 1
- #define _FILE_OFFSET_BITS 64
- #include <endian.h>
--- 
-2.7.0
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch
deleted file mode 100644
index e601f52..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-
-From 1550f81bf1886aa0520da0b6181cd61c1a75d4ad Mon Sep 17 00:00:00 2001
-From: Pratyush Anand <panand@redhat.com>
-Date: Tue, 14 Mar 2017 17:59:22 +0530
-Subject: [PATCH 1/2] x86/x86_64: Fix format warning with die()
-
-Fedora koji uses gcc version 7.0.1-0.12.fc27, and it generates a build
-warning
-
-   kexec/arch/i386/kexec-elf-x86.c:299:3: error: format not a string
-   literal and no format arguments [-Werror=format-security]
-       die(error_msg);
-       ^~~
-    cc1: some warnings being treated as errors
-
-error_msg can have a format specifier as well in string. In such cases,
-if there is no other arguments for the format variable then code will
-try to access a non existing argument. Therefore, use 1st argument as
-format specifier for string print and pass error_msg as the string to be
-printed.
-
-While doing that,also use const qualifier before "char *error_msg".
-
-Signed-off-by: Pratyush Anand <panand@redhat.com>
-Signed-off-by: Simon Horman <horms@verge.net.au>
----
- kexec/arch/i386/kexec-elf-x86.c      | 4 ++--
- kexec/arch/x86_64/kexec-elf-x86_64.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/kexec/arch/i386/kexec-elf-x86.c b/kexec/arch/i386/kexec-elf-x86.c
-index de00dcb..fedf031 100644
---- a/kexec/arch/i386/kexec-elf-x86.c
-+++ b/kexec/arch/i386/kexec-elf-x86.c
-@@ -91,7 +91,7 @@ int elf_x86_load(int argc, char **argv, const char *buf, off_t len,
- 	char *command_line = NULL, *modified_cmdline = NULL;
- 	const char *append = NULL;
- 	char *tmp_cmdline = NULL;
--	char *error_msg = NULL;
-+	const char *error_msg = NULL;
- 	int result;
- 	int command_line_len;
- 	const char *ramdisk;
-@@ -296,6 +296,6 @@ out:
- 	free(command_line);
- 	free(modified_cmdline);
- 	if (error_msg)
--		die(error_msg);
-+		die("%s", error_msg);
- 	return result;
- }
-diff --git a/kexec/arch/x86_64/kexec-elf-x86_64.c b/kexec/arch/x86_64/kexec-elf-x86_64.c
-index ae65692..ad22311 100644
---- a/kexec/arch/x86_64/kexec-elf-x86_64.c
-+++ b/kexec/arch/x86_64/kexec-elf-x86_64.c
-@@ -99,7 +99,7 @@ int elf_x86_64_load(int argc, char **argv, const char *buf, off_t len,
- #define ARG_STYLE_NONE  2
- 	int opt;
- 	int result = 0;
--	char *error_msg = NULL;
-+	const char *error_msg = NULL;
- 
- 	/* See options.h and add any new options there too! */
- 	static const struct option options[] = {
-@@ -276,6 +276,6 @@ out:
- 	free(command_line);
- 	free(modified_cmdline);
- 	if (error_msg)
--		die(error_msg);
-+		die("%s", error_msg);
- 	return result;
- }
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
deleted file mode 100644
index 953f13b..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From d29f37bb6e9114aba96c606103b110f511bee9a1 Mon Sep 17 00:00:00 2001
-From: Pratyush Anand <panand@redhat.com>
-Date: Wed, 2 Nov 2016 15:05:25 +0530
-Subject: [PATCH 2/9] kexec: generalize and rename get_kernel_stext_sym()
-
-get_kernel_stext_sym() has been defined for both arm and i386. Other
-architecture might need some other kernel symbol address. Therefore rewrite
-this function as generic function to get any kernel symbol address.
-
-More over, kallsyms is not arch specific representation, therefore have
-common function for all arches.
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: Pratyush Anand <panand@redhat.com>
-[created symbols.c]
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/Makefile                  |  1 +
- kexec/arch/arm/crashdump-arm.c  | 40 +---------------------------------------
- kexec/arch/i386/crashdump-x86.c | 29 -----------------------------
- kexec/kexec.h                   |  2 ++
- kexec/symbols.c                 | 41 +++++++++++++++++++++++++++++++++++++++++
- 5 files changed, 45 insertions(+), 68 deletions(-)
- create mode 100644 kexec/symbols.c
-
-diff --git a/kexec/Makefile b/kexec/Makefile
-index 39f365f..2b4fb3d 100644
---- a/kexec/Makefile
-+++ b/kexec/Makefile
-@@ -26,6 +26,7 @@ KEXEC_SRCS_base += kexec/kernel_version.c
- KEXEC_SRCS_base += kexec/lzma.c
- KEXEC_SRCS_base += kexec/zlib.c
- KEXEC_SRCS_base += kexec/kexec-xen.c
-+KEXEC_SRCS_base += kexec/symbols.c
- 
- KEXEC_GENERATED_SRCS += $(PURGATORY_HEX_C)
- 
-diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index 4a89b5e..245c21a 100644
---- a/kexec/arch/arm/crashdump-arm.c
-+++ b/kexec/arch/arm/crashdump-arm.c
-@@ -73,48 +73,10 @@ static struct crash_elf_info elf_info = {
- 
- extern unsigned long long user_page_offset;
- 
--/* Retrieve kernel _stext symbol virtual address from /proc/kallsyms */
--static unsigned long long get_kernel_stext_sym(void)
--{
--	const char *kallsyms = "/proc/kallsyms";
--	const char *stext = "_stext";
--	char sym[128];
--	char line[128];
--	FILE *fp;
--	unsigned long long vaddr = 0;
--	char type;
--
--	fp = fopen(kallsyms, "r");
--	if (!fp) {
--		fprintf(stderr, "Cannot open %s\n", kallsyms);
--		return 0;
--	}
--
--	while(fgets(line, sizeof(line), fp) != NULL) {
--		unsigned long long addr;
--
--		if (sscanf(line, "%Lx %c %s", &addr, &type, sym) != 3)
--			continue;
--
--		if (strcmp(sym, stext) == 0) {
--			dbgprintf("kernel symbol %s vaddr = %#llx\n", stext, addr);
--			vaddr = addr;
--			break;
--		}
--	}
--
--	fclose(fp);
--
--	if (vaddr == 0)
--		fprintf(stderr, "Cannot get kernel %s symbol address\n", stext);
--
--	return vaddr;
--}
--
- static int get_kernel_page_offset(struct kexec_info *info,
- 		struct crash_elf_info *elf_info)
- {
--	unsigned long long stext_sym_addr = get_kernel_stext_sym();
-+	unsigned long long stext_sym_addr = get_kernel_sym("_stext");
- 	if (stext_sym_addr == 0) {
- 		if (user_page_offset != (-1ULL)) {
- 			elf_info->page_offset = user_page_offset;
-diff --git a/kexec/arch/i386/crashdump-x86.c b/kexec/arch/i386/crashdump-x86.c
-index ab833d4..abf82a5 100644
---- a/kexec/arch/i386/crashdump-x86.c
-+++ b/kexec/arch/i386/crashdump-x86.c
-@@ -102,35 +102,6 @@ static int get_kernel_paddr(struct kexec_info *UNUSED(info),
- 	return -1;
- }
- 
--/* Retrieve kernel symbol virtual address from /proc/kallsyms */
--static unsigned long long get_kernel_sym(const char *symbol)
--{
--	const char *kallsyms = "/proc/kallsyms";
--	char sym[128];
--	char line[128];
--	FILE *fp;
--	unsigned long long vaddr;
--	char type;
--
--	fp = fopen(kallsyms, "r");
--	if (!fp) {
--		fprintf(stderr, "Cannot open %s\n", kallsyms);
--		return 0;
--	}
--
--	while(fgets(line, sizeof(line), fp) != NULL) {
--		if (sscanf(line, "%Lx %c %s", &vaddr, &type, sym) != 3)
--			continue;
--		if (strcmp(sym, symbol) == 0) {
--			dbgprintf("kernel symbol %s vaddr = %16llx\n", symbol, vaddr);
--			return vaddr;
--		}
--	}
--
--	fprintf(stderr, "Cannot get kernel %s symbol address\n", symbol);
--	return 0;
--}
--
- /* Retrieve info regarding virtual address kernel has been compiled for and
-  * size of the kernel from /proc/kcore. Current /proc/kcore parsing from
-  * from kexec-tools fails because of malformed elf notes. A kernel patch has
-diff --git a/kexec/kexec.h b/kexec/kexec.h
-index 9194f1c..b4fafad 100644
---- a/kexec/kexec.h
-+++ b/kexec/kexec.h
-@@ -312,4 +312,6 @@ int xen_kexec_load(struct kexec_info *info);
- int xen_kexec_unload(uint64_t kexec_flags);
- void xen_kexec_exec(void);
- 
-+extern unsigned long long get_kernel_sym(const char *text);
-+
- #endif /* KEXEC_H */
-diff --git a/kexec/symbols.c b/kexec/symbols.c
-new file mode 100644
-index 0000000..ea6e327
---- /dev/null
-+++ b/kexec/symbols.c
-@@ -0,0 +1,41 @@
-+#include <stdio.h>
-+#include <string.h>
-+#include "kexec.h"
-+
-+/* Retrieve kernel symbol virtual address from /proc/kallsyms */
-+unsigned long long get_kernel_sym(const char *text)
-+{
-+	const char *kallsyms = "/proc/kallsyms";
-+	char sym[128];
-+	char line[128];
-+	FILE *fp;
-+	unsigned long long vaddr = 0;
-+	char type;
-+
-+	fp = fopen(kallsyms, "r");
-+	if (!fp) {
-+		fprintf(stderr, "Cannot open %s\n", kallsyms);
-+		return 0;
-+	}
-+
-+	while (fgets(line, sizeof(line), fp) != NULL) {
-+		unsigned long long addr;
-+
-+		if (sscanf(line, "%Lx %c %s", &addr, &type, sym) != 3)
-+			continue;
-+
-+		if (strcmp(sym, text) == 0) {
-+			dbgprintf("kernel symbol %s vaddr = %#llx\n",
-+								text, addr);
-+			vaddr = addr;
-+			break;
-+		}
-+	}
-+
-+	fclose(fp);
-+
-+	if (vaddr == 0)
-+		fprintf(stderr, "Cannot get kernel %s symbol address\n", text);
-+
-+	return vaddr;
-+}
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch
deleted file mode 100644
index 6a1c06d..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1c956fc8c6b6324d8d38bba5f9e60a018051c6f5 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 16 Mar 2017 15:39:06 +0200
-Subject: [PATCH 2/2] ppc: Fix format warning with die()
-
-Enable compiling kexec-tools for ppc with -Werror=format-security.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [Mailing list]
----
- kexec/arch/ppc/kexec-elf-ppc.c    | 2 +-
- kexec/arch/ppc/kexec-uImage-ppc.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/kexec/arch/ppc/kexec-elf-ppc.c b/kexec/arch/ppc/kexec-elf-ppc.c
-index 291f06d..ad43ad1 100644
---- a/kexec/arch/ppc/kexec-elf-ppc.c
-+++ b/kexec/arch/ppc/kexec-elf-ppc.c
-@@ -453,7 +453,7 @@ out:
- 	if (!tmp_cmdline)
- 		free(command_line);
- 	if (error_msg)
--		die(error_msg);
-+		die("%s", error_msg);
- 
- 	return result;
- }
-diff --git a/kexec/arch/ppc/kexec-uImage-ppc.c b/kexec/arch/ppc/kexec-uImage-ppc.c
-index 5eec6e4..e8f7adc 100644
---- a/kexec/arch/ppc/kexec-uImage-ppc.c
-+++ b/kexec/arch/ppc/kexec-uImage-ppc.c
-@@ -306,7 +306,7 @@ out:
- 	if (!tmp_cmdline)
- 		free(command_line);
- 	if (error_msg)
--		die(error_msg);
-+		die("%s", error_msg);
- 	return ret;
- }
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
deleted file mode 100644
index 1a1c317..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 16df170ad4808d12acd5e919ac4f6e7f33a247b3 Mon Sep 17 00:00:00 2001
-From: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Date: Thu, 1 Sep 2016 10:57:42 +0900
-Subject: [PATCH 3/9] arm64: identify PHYS_OFFSET correctly
-
-Due to the kernel patch, commit e7cd190385d1 ("arm64: mark reserved
-memblock regions explicitly in iomem"), the current code will not be able
-to identify the correct value of PHYS_OFFSET if some "reserved" memory
-region, which is likely to be UEFI runtime services code/data, exists at
-an address below the first "System RAM" regions.
-
-This patch fixes this issue.
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/arch/arm64/iomem.h       |  7 +++++++
- kexec/arch/arm64/kexec-arm64.c | 12 ++++++++++--
- 2 files changed, 17 insertions(+), 2 deletions(-)
- create mode 100644 kexec/arch/arm64/iomem.h
-
-diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
-new file mode 100644
-index 0000000..7fd66eb
---- /dev/null
-+++ b/kexec/arch/arm64/iomem.h
-@@ -0,0 +1,7 @@
-+#ifndef IOMEM_H
-+#define IOMEM_H
-+
-+#define SYSTEM_RAM		"System RAM\n"
-+#define IOMEM_RESERVED		"reserved\n"
-+
-+#endif
-diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
-index 2e8839a..8ac811d 100644
---- a/kexec/arch/arm64/kexec-arm64.c
-+++ b/kexec/arch/arm64/kexec-arm64.c
-@@ -21,6 +21,7 @@
- #include "crashdump-arm64.h"
- #include "dt-ops.h"
- #include "fs2dt.h"
-+#include "iomem.h"
- #include "kexec-syscall.h"
- #include "arch/options.h"
- 
-@@ -475,7 +476,14 @@ static int get_memory_ranges_iomem_cb(void *data, int nr, char *str,
- 		return -1;
- 
- 	r = (struct memory_range *)data + nr;
--	r->type = RANGE_RAM;
-+
-+	if (!strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)))
-+		r->type = RANGE_RAM;
-+	else if (!strncmp(str, IOMEM_RESERVED, strlen(IOMEM_RESERVED)))
-+		r->type = RANGE_RESERVED;
-+	else
-+		return 1;
-+
- 	r->start = base;
- 	r->end = base + length - 1;
- 
-@@ -494,7 +502,7 @@ static int get_memory_ranges_iomem_cb(void *data, int nr, char *str,
- static int get_memory_ranges_iomem(struct memory_range *array,
- 	unsigned int *count)
- {
--	*count = kexec_iomem_for_each_line("System RAM\n",
-+	*count = kexec_iomem_for_each_line(NULL,
- 		get_memory_ranges_iomem_cb, array);
- 
- 	if (!*count) {
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch b/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
deleted file mode 100644
index 66600f3..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-From 48a4c7874d8264ddbfaec2e9858d7866a2d2eb60 Mon Sep 17 00:00:00 2001
-From: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Date: Wed, 5 Aug 2015 13:16:30 +0900
-Subject: [PATCH 4/9] arm64: kdump: identify memory regions
-
-The following regions need to be identified for later use:
- a) memory regions which belong to the 1st kernel
- b) usable memory reserved for crash dump kernel
-
-We go through /proc/iomem to find out a) and b) which are marked
-as "System RAM" and "Crash kernel", respectively.
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/arch/arm64/Makefile          |   2 +
- kexec/arch/arm64/crashdump-arm64.c | 100 ++++++++++++++++++++++++++++++++++++-
- kexec/arch/arm64/crashdump-arm64.h |  14 +++++-
- kexec/arch/arm64/iomem.h           |   1 +
- 4 files changed, 114 insertions(+), 3 deletions(-)
-
-diff --git a/kexec/arch/arm64/Makefile b/kexec/arch/arm64/Makefile
-index 74b677f..2d4ae0e 100644
---- a/kexec/arch/arm64/Makefile
-+++ b/kexec/arch/arm64/Makefile
-@@ -6,6 +6,8 @@ arm64_FS2DT_INCLUDE += \
- 
- arm64_DT_OPS += kexec/dt-ops.c
- 
-+arm64_MEM_REGIONS = kexec/mem_regions.c
-+
- arm64_CPPFLAGS += -I $(srcdir)/kexec/
- 
- arm64_KEXEC_SRCS += \
-diff --git a/kexec/arch/arm64/crashdump-arm64.c b/kexec/arch/arm64/crashdump-arm64.c
-index d2272c8..dcaca43 100644
---- a/kexec/arch/arm64/crashdump-arm64.c
-+++ b/kexec/arch/arm64/crashdump-arm64.c
-@@ -1,5 +1,13 @@
- /*
-  * ARM64 crashdump.
-+ *     partly derived from arm implementation
-+ *
-+ * Copyright (c) 2014-2016 Linaro Limited
-+ * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-  */
- 
- #define _GNU_SOURCE
-@@ -10,12 +18,102 @@
- #include "kexec.h"
- #include "crashdump.h"
- #include "crashdump-arm64.h"
-+#include "iomem.h"
- #include "kexec-arm64.h"
- #include "kexec-elf.h"
-+#include "mem_regions.h"
- 
--struct memory_ranges usablemem_rgns = {};
-+/* memory ranges on crashed kernel */
-+static struct memory_range crash_memory_ranges[CRASH_MAX_MEMORY_RANGES];
-+static struct memory_ranges crash_memory_rgns = {
-+	.size = 0,
-+	.max_size = CRASH_MAX_MEMORY_RANGES,
-+	.ranges = crash_memory_ranges,
-+};
-+
-+/* memory range reserved for crashkernel */
-+struct memory_range crash_reserved_mem;
-+struct memory_ranges usablemem_rgns = {
-+	.size = 0,
-+	.max_size = 1,
-+	.ranges = &crash_reserved_mem,
-+};
-+
-+/*
-+ * iomem_range_callback() - callback called for each iomem region
-+ * @data: not used
-+ * @nr: not used
-+ * @str: name of the memory region
-+ * @base: start address of the memory region
-+ * @length: size of the memory region
-+ *
-+ * This function is called once for each memory region found in /proc/iomem.
-+ * It locates system RAM and crashkernel reserved memory and places these to
-+ * variables, respectively, crash_memory_ranges and crash_reserved_mem.
-+ */
-+
-+static int iomem_range_callback(void *UNUSED(data), int UNUSED(nr),
-+				char *str, unsigned long long base,
-+				unsigned long long length)
-+{
-+	if (strncmp(str, CRASH_KERNEL, strlen(CRASH_KERNEL)) == 0)
-+		return mem_regions_add(&usablemem_rgns,
-+				       base, length, RANGE_RAM);
-+	else if (strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)) == 0)
-+		return mem_regions_add(&crash_memory_rgns,
-+				       base, length, RANGE_RAM);
-+
-+	return 0;
-+}
- 
- int is_crashkernel_mem_reserved(void)
- {
-+	if (!crash_reserved_mem.end)
-+		kexec_iomem_for_each_line(NULL, iomem_range_callback, NULL);
-+
-+	return crash_reserved_mem.start != crash_reserved_mem.end;
-+}
-+
-+/*
-+ * crash_get_memory_ranges() - read system physical memory
-+ *
-+ * Function reads through system physical memory and stores found memory
-+ * regions in crash_memory_ranges.
-+ * Regions are sorted in ascending order.
-+ *
-+ * Returns 0 in case of success and -1 otherwise (errno is set).
-+ */
-+static int crash_get_memory_ranges(void)
-+{
-+	/*
-+	 * First read all memory regions that can be considered as
-+	 * system memory including the crash area.
-+	 */
-+	if (!usablemem_rgns.size)
-+		kexec_iomem_for_each_line(NULL, iomem_range_callback, NULL);
-+
-+	/* allow only a single region for crash dump kernel */
-+	if (usablemem_rgns.size != 1) {
-+		errno = EINVAL;
-+		return -1;
-+	}
-+
-+	dbgprint_mem_range("Reserved memory range", &crash_reserved_mem, 1);
-+
-+	if (mem_regions_exclude(&crash_memory_rgns, &crash_reserved_mem)) {
-+		fprintf(stderr,
-+			"Error: Number of crash memory ranges excedeed the max limit\n");
-+		errno = ENOMEM;
-+		return -1;
-+	}
-+
-+	/*
-+	 * Make sure that the memory regions are sorted.
-+	 */
-+	mem_regions_sort(&crash_memory_rgns);
-+
-+	dbgprint_mem_range("Coredump memory ranges",
-+			   crash_memory_rgns.ranges, crash_memory_rgns.size);
-+
- 	return 0;
- }
-diff --git a/kexec/arch/arm64/crashdump-arm64.h b/kexec/arch/arm64/crashdump-arm64.h
-index f33c7a2..07a0ed0 100644
---- a/kexec/arch/arm64/crashdump-arm64.h
-+++ b/kexec/arch/arm64/crashdump-arm64.h
-@@ -1,12 +1,22 @@
- /*
-  * ARM64 crashdump.
-+ *
-+ * Copyright (c) 2014-2016 Linaro Limited
-+ * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-  */
- 
--#if !defined(CRASHDUMP_ARM64_H)
-+#ifndef CRASHDUMP_ARM64_H
- #define CRASHDUMP_ARM64_H
- 
- #include "kexec.h"
- 
-+#define CRASH_MAX_MEMORY_RANGES	32
-+
- extern struct memory_ranges usablemem_rgns;
-+extern struct memory_range crash_reserved_mem;
- 
--#endif
-+#endif /* CRASHDUMP_ARM64_H */
-diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
-index 7fd66eb..20cda87 100644
---- a/kexec/arch/arm64/iomem.h
-+++ b/kexec/arch/arm64/iomem.h
-@@ -2,6 +2,7 @@
- #define IOMEM_H
- 
- #define SYSTEM_RAM		"System RAM\n"
-+#define CRASH_KERNEL		"Crash kernel\n"
- #define IOMEM_RESERVED		"reserved\n"
- 
- #endif
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
deleted file mode 100644
index fe535b6..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From 769da25627cebb2a53caee5d5be78a32d376adc1 Mon Sep 17 00:00:00 2001
-From: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Date: Wed, 5 Aug 2015 13:45:15 +0900
-Subject: [PATCH 5/9] arm64: kdump: add elf core header segment
-
-Elf core header contains the information necessary for the coredump of
-the 1st kernel, including its physcal memory layout as well as cpu register
-states at the panic.
-The segment is allocated inside the reserved memory of crash dump kernel.
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/arch/arm64/crashdump-arm64.c | 96 ++++++++++++++++++++++++++++++++++++++
- kexec/arch/arm64/crashdump-arm64.h |  3 ++
- kexec/arch/arm64/iomem.h           |  2 +
- kexec/arch/arm64/kexec-elf-arm64.c | 10 ++++
- 4 files changed, 111 insertions(+)
-
-diff --git a/kexec/arch/arm64/crashdump-arm64.c b/kexec/arch/arm64/crashdump-arm64.c
-index dcaca43..8346131 100644
---- a/kexec/arch/arm64/crashdump-arm64.c
-+++ b/kexec/arch/arm64/crashdump-arm64.c
-@@ -39,6 +39,39 @@ struct memory_ranges usablemem_rgns = {
- 	.ranges = &crash_reserved_mem,
- };
- 
-+struct memory_range elfcorehdr_mem;
-+
-+static struct crash_elf_info elf_info = {
-+	.class		= ELFCLASS64,
-+#if (__BYTE_ORDER == __LITTLE_ENDIAN)
-+	.data		= ELFDATA2LSB,
-+#else
-+	.data		= ELFDATA2MSB,
-+#endif
-+	.machine	= EM_AARCH64,
-+};
-+
-+/*
-+ * Note: The returned value is correct only if !CONFIG_RANDOMIZE_BASE.
-+ */
-+static uint64_t get_kernel_page_offset(void)
-+{
-+	int i;
-+
-+	if (elf_info.kern_vaddr_start == UINT64_MAX)
-+		return UINT64_MAX;
-+
-+	/* Current max virtual memory range is 48-bits. */
-+	for (i = 48; i > 0; i--)
-+		if (!(elf_info.kern_vaddr_start & (1UL << i)))
-+			break;
-+
-+	if (i <= 0)
-+		return UINT64_MAX;
-+	else
-+		return UINT64_MAX << i;
-+}
-+
- /*
-  * iomem_range_callback() - callback called for each iomem region
-  * @data: not used
-@@ -62,6 +95,10 @@ static int iomem_range_callback(void *UNUSED(data), int UNUSED(nr),
- 	else if (strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)) == 0)
- 		return mem_regions_add(&crash_memory_rgns,
- 				       base, length, RANGE_RAM);
-+	else if (strncmp(str, KERNEL_CODE, strlen(KERNEL_CODE)) == 0)
-+		elf_info.kern_paddr_start = base;
-+	else if (strncmp(str, KERNEL_DATA, strlen(KERNEL_DATA)) == 0)
-+		elf_info.kern_size = base + length - elf_info.kern_paddr_start;
- 
- 	return 0;
- }
-@@ -115,5 +152,64 @@ static int crash_get_memory_ranges(void)
- 	dbgprint_mem_range("Coredump memory ranges",
- 			   crash_memory_rgns.ranges, crash_memory_rgns.size);
- 
-+	/*
-+	 * For additional kernel code/data segment.
-+	 * kern_paddr_start/kern_size are determined in iomem_range_callback
-+	 */
-+	elf_info.kern_vaddr_start = get_kernel_sym("_text");
-+	if (!elf_info.kern_vaddr_start)
-+		elf_info.kern_vaddr_start = UINT64_MAX;
-+
-+	return 0;
-+}
-+
-+/*
-+ * load_crashdump_segments() - load the elf core header
-+ * @info: kexec info structure
-+ *
-+ * This function creates and loads an additional segment of elf core header
-+ : which is used to construct /proc/vmcore on crash dump kernel.
-+ *
-+ * Return 0 in case of success and -1 in case of error.
-+ */
-+
-+int load_crashdump_segments(struct kexec_info *info)
-+{
-+	unsigned long elfcorehdr;
-+	unsigned long bufsz;
-+	void *buf;
-+	int err;
-+
-+	/*
-+	 * First fetch all the memory (RAM) ranges that we are going to
-+	 * pass to the crash dump kernel during panic.
-+	 */
-+
-+	err = crash_get_memory_ranges();
-+
-+	if (err)
-+		return err;
-+
-+	elf_info.page_offset = get_kernel_page_offset();
-+	dbgprintf("%s: page_offset:   %016llx\n", __func__,
-+			elf_info.page_offset);
-+
-+	err = crash_create_elf64_headers(info, &elf_info,
-+			crash_memory_rgns.ranges, crash_memory_rgns.size,
-+			&buf, &bufsz, ELF_CORE_HEADER_ALIGN);
-+
-+	if (err)
-+		return err;
-+
-+	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 0,
-+		crash_reserved_mem.start, crash_reserved_mem.end,
-+		-1, 0);
-+
-+	elfcorehdr_mem.start = elfcorehdr;
-+	elfcorehdr_mem.end = elfcorehdr + bufsz - 1;
-+
-+	dbgprintf("%s: elfcorehdr 0x%llx-0x%llx\n", __func__,
-+			elfcorehdr_mem.start, elfcorehdr_mem.end);
-+
- 	return 0;
- }
-diff --git a/kexec/arch/arm64/crashdump-arm64.h b/kexec/arch/arm64/crashdump-arm64.h
-index 07a0ed0..da75a2d 100644
---- a/kexec/arch/arm64/crashdump-arm64.h
-+++ b/kexec/arch/arm64/crashdump-arm64.h
-@@ -18,5 +18,8 @@
- 
- extern struct memory_ranges usablemem_rgns;
- extern struct memory_range crash_reserved_mem;
-+extern struct memory_range elfcorehdr_mem;
-+
-+extern int load_crashdump_segments(struct kexec_info *info);
- 
- #endif /* CRASHDUMP_ARM64_H */
-diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
-index 20cda87..d4864bb 100644
---- a/kexec/arch/arm64/iomem.h
-+++ b/kexec/arch/arm64/iomem.h
-@@ -2,6 +2,8 @@
- #define IOMEM_H
- 
- #define SYSTEM_RAM		"System RAM\n"
-+#define KERNEL_CODE		"Kernel code\n"
-+#define KERNEL_DATA		"Kernel data\n"
- #define CRASH_KERNEL		"Crash kernel\n"
- #define IOMEM_RESERVED		"reserved\n"
- 
-diff --git a/kexec/arch/arm64/kexec-elf-arm64.c b/kexec/arch/arm64/kexec-elf-arm64.c
-index daf8bf0..c70a37a 100644
---- a/kexec/arch/arm64/kexec-elf-arm64.c
-+++ b/kexec/arch/arm64/kexec-elf-arm64.c
-@@ -119,6 +119,16 @@ int elf_arm64_load(int argc, char **argv, const char *kernel_buf,
- 	dbgprintf("%s: PE format:      %s\n", __func__,
- 		(arm64_header_check_pe_sig(header) ? "yes" : "no"));
- 
-+	if (info->kexec_flags & KEXEC_ON_CRASH) {
-+		/* create and initialize elf core header segment */
-+		result = load_crashdump_segments(info);
-+		if (result) {
-+			dbgprintf("%s: Creating eflcorehdr failed.\n",
-+								__func__);
-+			goto exit;
-+		}
-+	}
-+
- 	/* load the kernel */
- 	result = elf_exec_load(&ehdr, info);
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch b/meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
deleted file mode 100644
index 4149551..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 4079c93ac5453ef5f7889ab64920c1e9427690ef Mon Sep 17 00:00:00 2001
-From: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Date: Tue, 17 Feb 2015 16:06:55 +0900
-Subject: [PATCH 6/9] arm64: kdump: set up kernel image segment
-
-On arm64, we can use the same kernel image as 1st kernel, but
-we have to modify the entry point as well as segments' addresses
-in the kernel's elf header in order to load them into correct places.
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/arch/arm64/crashdump-arm64.c | 23 +++++++++++++++++++++++
- kexec/arch/arm64/crashdump-arm64.h |  1 +
- kexec/arch/arm64/kexec-arm64.c     | 25 ++++++++++++++++++++-----
- kexec/arch/arm64/kexec-elf-arm64.c | 10 +++++++++-
- 4 files changed, 53 insertions(+), 6 deletions(-)
-
-diff --git a/kexec/arch/arm64/crashdump-arm64.c b/kexec/arch/arm64/crashdump-arm64.c
-index 8346131..9517329 100644
---- a/kexec/arch/arm64/crashdump-arm64.c
-+++ b/kexec/arch/arm64/crashdump-arm64.c
-@@ -213,3 +213,26 @@ int load_crashdump_segments(struct kexec_info *info)
- 
- 	return 0;
- }
-+
-+/*
-+ * e_entry and p_paddr are actually in virtual address space.
-+ * Those values will be translated to physcal addresses by
-+ * using virt_to_phys().
-+ * So let's get ready for later use so the memory base (phys_offset)
-+ * will be correctly replaced with crash_reserved_mem.start.
-+ */
-+void modify_ehdr_for_crashdump(struct mem_ehdr *ehdr)
-+{
-+	struct mem_phdr *phdr;
-+	int i;
-+
-+	ehdr->e_entry += - arm64_mem.phys_offset + crash_reserved_mem.start;
-+
-+	for (i = 0; i < ehdr->e_phnum; i++) {
-+		phdr = &ehdr->e_phdr[i];
-+		if (phdr->p_type != PT_LOAD)
-+			continue;
-+		phdr->p_paddr +=
-+			(-arm64_mem.phys_offset + crash_reserved_mem.start);
-+	}
-+}
-diff --git a/kexec/arch/arm64/crashdump-arm64.h b/kexec/arch/arm64/crashdump-arm64.h
-index da75a2d..382f571 100644
---- a/kexec/arch/arm64/crashdump-arm64.h
-+++ b/kexec/arch/arm64/crashdump-arm64.h
-@@ -21,5 +21,6 @@ extern struct memory_range crash_reserved_mem;
- extern struct memory_range elfcorehdr_mem;
- 
- extern int load_crashdump_segments(struct kexec_info *info);
-+extern void modify_ehdr_for_crashdump(struct mem_ehdr *ehdr);
- 
- #endif /* CRASHDUMP_ARM64_H */
-diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
-index 8ac811d..cec4e41 100644
---- a/kexec/arch/arm64/kexec-arm64.c
-+++ b/kexec/arch/arm64/kexec-arm64.c
-@@ -307,12 +307,27 @@ unsigned long arm64_locate_kernel_segment(struct kexec_info *info)
- {
- 	unsigned long hole;
- 
--	hole = locate_hole(info,
--		arm64_mem.text_offset + arm64_mem.image_size,
--		MiB(2), 0, ULONG_MAX, 1);
-+	if (info->kexec_flags & KEXEC_ON_CRASH) {
-+		unsigned long hole_end;
-+
-+		hole = (crash_reserved_mem.start < mem_min ?
-+				mem_min : crash_reserved_mem.start);
-+		hole = _ALIGN_UP(hole, MiB(2));
-+		hole_end = hole + arm64_mem.text_offset + arm64_mem.image_size;
-+
-+		if ((hole_end > mem_max) ||
-+		    (hole_end > crash_reserved_mem.end)) {
-+			dbgprintf("%s: Crash kernel out of range\n", __func__);
-+			hole = ULONG_MAX;
-+		}
-+	} else {
-+		hole = locate_hole(info,
-+			arm64_mem.text_offset + arm64_mem.image_size,
-+			MiB(2), 0, ULONG_MAX, 1);
- 
--	if (hole == ULONG_MAX)
--		dbgprintf("%s: locate_hole failed\n", __func__);
-+		if (hole == ULONG_MAX)
-+			dbgprintf("%s: locate_hole failed\n", __func__);
-+	}
- 
- 	return hole;
- }
-diff --git a/kexec/arch/arm64/kexec-elf-arm64.c b/kexec/arch/arm64/kexec-elf-arm64.c
-index c70a37a..842ce21 100644
---- a/kexec/arch/arm64/kexec-elf-arm64.c
-+++ b/kexec/arch/arm64/kexec-elf-arm64.c
-@@ -9,6 +9,7 @@
- #include <stdlib.h>
- #include <linux/elf.h>
- 
-+#include "crashdump-arm64.h"
- #include "kexec-arm64.h"
- #include "kexec-elf.h"
- #include "kexec-syscall.h"
-@@ -105,7 +106,8 @@ int elf_arm64_load(int argc, char **argv, const char *kernel_buf,
- 	}
- 
- 	arm64_mem.vp_offset = _ALIGN_DOWN(ehdr.e_entry, MiB(2));
--	arm64_mem.vp_offset -= kernel_segment - get_phys_offset();
-+	if (!(info->kexec_flags & KEXEC_ON_CRASH))
-+		arm64_mem.vp_offset -= kernel_segment - get_phys_offset();
- 
- 	dbgprintf("%s: kernel_segment: %016lx\n", __func__, kernel_segment);
- 	dbgprintf("%s: text_offset:    %016lx\n", __func__,
-@@ -127,6 +129,12 @@ int elf_arm64_load(int argc, char **argv, const char *kernel_buf,
- 								__func__);
- 			goto exit;
- 		}
-+
-+		/*
-+		 * offset addresses in order to fit vmlinux
-+		 * (elf_exec) into crash kernel's memory
-+		 */
-+		modify_ehdr_for_crashdump(&ehdr);
- 	}
- 
- 	/* load the kernel */
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch b/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
deleted file mode 100644
index 2745466..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 07ad14e12665221d754fde8e47c32ac18c24586a Mon Sep 17 00:00:00 2001
-From: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Date: Fri, 31 Jul 2015 20:01:39 +0900
-Subject: [PATCH 7/9] arm64: kdump: set up other segments
-
-We make sure that all the other segments, initrd and device-tree blob,
-also be loaded into the reserved memory of crash dump kernel.
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/arch/arm64/kexec-arm64.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
-index cec4e41..78a0035 100644
---- a/kexec/arch/arm64/kexec-arm64.c
-+++ b/kexec/arch/arm64/kexec-arm64.c
-@@ -374,7 +374,10 @@ int arm64_load_other_segments(struct kexec_info *info,
- 	/* Put the other segments after the image. */
- 
- 	hole_min = image_base + arm64_mem.image_size;
--	hole_max = ULONG_MAX;
-+	if (info->kexec_flags & KEXEC_ON_CRASH)
-+		hole_max = crash_reserved_mem.end;
-+	else
-+		hole_max = ULONG_MAX;
- 
- 	if (arm64_opts.initrd) {
- 		initrd_buf = slurp_file(arm64_opts.initrd, &initrd_size);
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch b/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
deleted file mode 100644
index 31c3d85..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 23bf7ac189cc3b87ceb9d1d3b69b5c4815354add Mon Sep 17 00:00:00 2001
-From: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Date: Wed, 27 Jan 2016 13:38:39 +0900
-Subject: [PATCH 8/9] arm64: kdump: add DT properties to crash dump kernel's
- dtb
-
-We pass the following properties to crash dump kernel:
-linux,elfcorehdr: elf core header segment,
-		  same as "elfcorehdr=" kernel parameter on other archs
-linux,usable-memory-range: usable memory reserved for crash dump kernel
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/arch/arm64/kexec-arm64.c     | 76 +++++++++++++++++++++++++++++++++++---
- kexec/arch/arm64/kexec-elf-arm64.c |  5 ---
- 2 files changed, 71 insertions(+), 10 deletions(-)
-
-diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
-index 78a0035..a8fb64f 100644
---- a/kexec/arch/arm64/kexec-arm64.c
-+++ b/kexec/arch/arm64/kexec-arm64.c
-@@ -128,9 +128,6 @@ int arch_process_options(int argc, char **argv)
- 		case OPT_INITRD:
- 			arm64_opts.initrd = optarg;
- 			break;
--		case OPT_PANIC:
--			die("load-panic (-p) not supported");
--			break;
- 		default:
- 			break; /* Ignore core and unknown options. */
- 		}
-@@ -285,8 +282,12 @@ on_success:
-  * setup_2nd_dtb - Setup the 2nd stage kernel's dtb.
-  */
- 
--static int setup_2nd_dtb(struct dtb *dtb, char *command_line)
-+static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
- {
-+	char *new_buf;
-+	int new_size;
-+	int nodeoffset;
-+	uint64_t range[2];
- 	int result;
- 
- 	result = fdt_check_header(dtb->buf);
-@@ -298,8 +299,72 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line)
- 
- 	result = set_bootargs(dtb, command_line);
- 
-+	/* remove those anyway */
-+	nodeoffset = fdt_path_offset(dtb->buf, "/chosen");
-+	fdt_delprop(dtb->buf, nodeoffset, "linux,crashkernel-base");
-+	fdt_delprop(dtb->buf, nodeoffset, "linux,crashkernel-size");
-+
-+	if (on_crash) {
-+		nodeoffset = fdt_path_offset(dtb->buf, "/chosen");
-+		fdt_delprop(dtb->buf, nodeoffset, "linux,elfcorehdr");
-+		fdt_delprop(dtb->buf, nodeoffset, "linux,usable-memory-range");
-+		new_size = fdt_totalsize(dtb->buf)
-+			+ 2 * (sizeof(struct fdt_property)
-+					+ FDT_TAGALIGN(sizeof(range)))
-+			+ strlen("linux,elfcorehdr") + 1
-+			+ strlen("linux,usable-memory-range") + 1;
-+
-+		new_buf = xmalloc(new_size);
-+		result = fdt_open_into(dtb->buf, new_buf, new_size);
-+		if (result) {
-+			dbgprintf("%s: fdt_open_into failed: %s\n", __func__,
-+				fdt_strerror(result));
-+			result = -ENOSPC;
-+			goto on_error;
-+		}
-+
-+		range[0] = cpu_to_be64(elfcorehdr_mem.start);
-+		range[1] = cpu_to_be64(elfcorehdr_mem.end
-+				- elfcorehdr_mem.start + 1);
-+		nodeoffset = fdt_path_offset(new_buf, "/chosen");
-+		result = fdt_setprop(new_buf, nodeoffset, "linux,elfcorehdr",
-+				(void *)range, sizeof(range));
-+		if (result) {
-+			dbgprintf("%s: fdt_setprop failed: %s\n", __func__,
-+				fdt_strerror(result));
-+			result = -EINVAL;
-+			goto on_error;
-+		}
-+
-+		range[0] = cpu_to_be64(crash_reserved_mem.start);
-+		range[1] = cpu_to_be64(crash_reserved_mem.end
-+				- crash_reserved_mem.start + 1);
-+		nodeoffset = fdt_path_offset(new_buf, "/chosen");
-+		result = fdt_setprop(new_buf, nodeoffset,
-+				"linux,usable-memory-range",
-+				(void *)range, sizeof(range));
-+		if (result) {
-+			dbgprintf("%s: fdt_setprop failed: %s\n", __func__,
-+				fdt_strerror(result));
-+			result = -EINVAL;
-+			goto on_error;
-+		}
-+
-+		fdt_pack(new_buf);
-+		dtb->buf = new_buf;
-+		dtb->size = fdt_totalsize(new_buf);
-+	}
-+
- 	dump_reservemap(dtb);
- 
-+
-+	return result;
-+
-+on_error:
-+	fprintf(stderr, "kexec: %s failed.\n", __func__);
-+	if (new_buf)
-+		free(new_buf);
-+
- 	return result;
- }
- 
-@@ -366,7 +431,8 @@ int arm64_load_other_segments(struct kexec_info *info,
- 		}
- 	}
- 
--	result = setup_2nd_dtb(&dtb, command_line);
-+	result = setup_2nd_dtb(&dtb, command_line,
-+			info->kexec_flags & KEXEC_ON_CRASH);
- 
- 	if (result)
- 		return -EFAILED;
-diff --git a/kexec/arch/arm64/kexec-elf-arm64.c b/kexec/arch/arm64/kexec-elf-arm64.c
-index 842ce21..b17a31a 100644
---- a/kexec/arch/arm64/kexec-elf-arm64.c
-+++ b/kexec/arch/arm64/kexec-elf-arm64.c
-@@ -47,11 +47,6 @@ int elf_arm64_load(int argc, char **argv, const char *kernel_buf,
- 	int result;
- 	int i;
- 
--	if (info->kexec_flags & KEXEC_ON_CRASH) {
--		fprintf(stderr, "kexec: kdump not yet supported on arm64\n");
--		return -EFAILED;
--	}
--
- 	result = build_elf_exec_info(kernel_buf, kernel_size, &ehdr, 0);
- 
- 	if (result < 0) {
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch b/meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
deleted file mode 100644
index 8b1c018..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 5a4958f01a793c3e7f440f5bae75666a4349cc50 Mon Sep 17 00:00:00 2001
-From: Pratyush Anand <panand@redhat.com>
-Date: Thu, 14 May 2015 11:25:37 +0530
-Subject: [PATCH 9/9] arm64: kdump: Add support for binary image files
-
-This patch adds support to use binary image ie arch/arm64/boot/Image with
-kdump.
-
-Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
-
-Signed-off-by: Pratyush Anand <panand@redhat.com>
-[takahiro.akashi@linaro.org: a bit reworked]
-Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- kexec/arch/arm64/kexec-image-arm64.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/kexec/arch/arm64/kexec-image-arm64.c b/kexec/arch/arm64/kexec-image-arm64.c
-index 960ed96..982e431 100644
---- a/kexec/arch/arm64/kexec-image-arm64.c
-+++ b/kexec/arch/arm64/kexec-image-arm64.c
-@@ -4,7 +4,9 @@
- 
- #define _GNU_SOURCE
- 
-+#include "crashdump-arm64.h"
- #include "kexec-arm64.h"
-+#include "kexec-syscall.h"
- #include <limits.h>
- 
- int image_arm64_probe(const char *kernel_buf, off_t kernel_size)
-@@ -58,6 +60,16 @@ int image_arm64_load(int argc, char **argv, const char *kernel_buf,
- 	dbgprintf("%s: PE format:      %s\n", __func__,
- 		(arm64_header_check_pe_sig(header) ? "yes" : "no"));
- 
-+	if (info->kexec_flags & KEXEC_ON_CRASH) {
-+		/* create and initialize elf core header segment */
-+		result = load_crashdump_segments(info);
-+		if (result) {
-+			dbgprintf("%s: Creating eflcorehdr failed.\n",
-+								__func__);
-+			goto exit;
-+		}
-+	}
-+
- 	/* load the kernel */
- 	add_segment_phys_virt(info, kernel_buf, kernel_size,
- 			kernel_segment + arm64_mem.text_offset,
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
deleted file mode 100644
index bd89720..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-require kexec-tools.inc
-export LDFLAGS = "-L${STAGING_LIBDIR}"
-EXTRA_OECONF = " --with-zlib=yes"
-
-SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
-            file://0002-powerpc-change-the-memory-size-limit.patch \
-            file://0001-purgatory-Pass-r-directly-to-linker.patch \
-            file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
-            file://0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch \
-            file://0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch \
-            file://0003-arm64-identify-PHYS_OFFSET-correctly.patch \
-            file://0004-arm64-kdump-identify-memory-regions.patch \
-            file://0005-arm64-kdump-add-elf-core-header-segment.patch \
-            file://0006-arm64-kdump-set-up-kernel-image-segment.patch \
-            file://0007-arm64-kdump-set-up-other-segments.patch \
-            file://0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch \
-            file://0009-arm64-kdump-Add-support-for-binary-image-files.patch \
-            file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
-            file://0001-x86-x86_64-Fix-format-warning-with-die.patch \
-            file://0002-ppc-Fix-format-warning-with-die.patch \
-            file://kexec-x32.patch \
-            file://0001-Disable-PIE-during-link.patch \
-            file://0001-arm64-Disable-PIC.patch \
-         "
-
-SRC_URI[md5sum] = "b2b2c5e6b29d467d6e99d587fb6b7cf5"
-SRC_URI[sha256sum] = "b3e69519d2acced256843b1e8f1ecfa00d9b54fa07449ed78f05b9193f239370"
-
-SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
-
-PACKAGES =+ "kexec kdump vmcore-dmesg"
-
-ALLOW_EMPTY_${PN} = "1"
-RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
-
-FILES_kexec = "${sbindir}/kexec"
-FILES_kdump = "${sbindir}/kdump ${sysconfdir}/init.d/kdump \
-               ${sysconfdir}/sysconfig/kdump.conf"
-FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
-
-inherit update-rc.d
-
-INITSCRIPT_PACKAGES = "kdump"
-INITSCRIPT_NAME_kdump = "kdump"
-INITSCRIPT_PARAMS_kdump = "start 56 2 3 4 5 . stop 56 0 1 6 ."
-
-do_install_append () {
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
-        install -d ${D}${sysconfdir}/sysconfig
-        install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
-}
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb
new file mode 100644
index 0000000..e687e81
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb
@@ -0,0 +1,38 @@
+require kexec-tools.inc
+export LDFLAGS = "-L${STAGING_LIBDIR}"
+EXTRA_OECONF = " --with-zlib=yes"
+
+SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
+            file://0002-powerpc-change-the-memory-size-limit.patch \
+            file://0001-purgatory-Pass-r-directly-to-linker.patch \
+            file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
+            file://kexec-x32.patch \
+         "
+
+SRC_URI[md5sum] = "78906fdc255656fa2b9996c8acb3ef62"
+SRC_URI[sha256sum] = "42dbd0dab9964cd1ed89fa4571c8d13191eb7132b361ade5ac44517c91ecb97e"
+
+SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
+
+PACKAGES =+ "kexec kdump vmcore-dmesg"
+
+ALLOW_EMPTY_${PN} = "1"
+RRECOMMENDS_${PN} = "kexec kdump vmcore-dmesg"
+
+FILES_kexec = "${sbindir}/kexec"
+FILES_kdump = "${sbindir}/kdump ${sysconfdir}/init.d/kdump \
+               ${sysconfdir}/sysconfig/kdump.conf"
+FILES_vmcore-dmesg = "${sbindir}/vmcore-dmesg"
+
+inherit update-rc.d
+
+INITSCRIPT_PACKAGES = "kdump"
+INITSCRIPT_NAME_kdump = "kdump"
+INITSCRIPT_PARAMS_kdump = "start 56 2 3 4 5 . stop 56 0 1 6 ."
+
+do_install_append () {
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/kdump ${D}${sysconfdir}/init.d/kdump
+        install -d ${D}${sysconfdir}/sysconfig
+        install -m 0644 ${WORKDIR}/kdump.conf ${D}${sysconfdir}/sysconfig
+}
-- 
1.9.1


