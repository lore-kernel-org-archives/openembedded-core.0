Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3F565C8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 09:55:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBL9tsHA003748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 01:55:54 -0800 (PST)
Received: from PEK-ZHE-D1.wrs.com (128.224.163.136) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Dec 2016 01:55:53 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2016 17:56:23 +0800
Message-ID: <1482314183-15786-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kexec-tools: Update to 2.0.14
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
X-List-Received-Date: Wed, 21 Dec 2016 09:55:53 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Remove kexec-aarch64.patch since it has been merged upstream
Remove kexec-x32.patch since it has been reverted upstream
Backport patches for kdump arm64 from:
https://git.linaro.org/people/takahiro.akashi/kexec-tools.git

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...nd-the-semantics-of-kexec_iomem_for_each_.patch |  78 ++++++++
 ...eneralize-and-rename-get_kernel_stext_sym.patch | 194 ++++++++++++++++++++
 ...0003-arm64-identify-PHYS_OFFSET-correctly.patch |  76 ++++++++
 .../0004-arm64-kdump-identify-memory-regions.patch | 202 +++++++++++++++++++++
 ...5-arm64-kdump-add-elf-core-header-segment.patch | 191 +++++++++++++++++++
 ...6-arm64-kdump-set-up-kernel-image-segment.patch | 137 ++++++++++++++
 .../0007-arm64-kdump-set-up-other-segments.patch   |  35 ++++
 ...-add-DT-properties-to-crash-dump-kernel-s.patch | 150 +++++++++++++++
 ...-kdump-Add-support-for-binary-image-files.patch |  52 ++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb    |  37 ----
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  44 +++++
 11 files changed, 1159 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
new file mode 100644
index 0000000..822f28c
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
@@ -0,0 +1,78 @@
+From 02eed0f8f2748fd7579f69e5373445b52b2b8754 Mon Sep 17 00:00:00 2001
+From: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Date: Mon, 17 Oct 2016 13:56:58 +0900
+Subject: [PATCH 1/9] kexec: exntend the semantics of kexec_iomem_for_each_line
+
+The current kexec_iomem_for_each_line() counts up all the lines for which
+a callback function returns zero(0) or positive, and otherwise it stops
+further scanning.
+This behavior is incovenient in some cases. For instance, on arm64, we want
+to count up "System RAM" entries, but need to skip "reserved" entries.
+
+So this patch extends the semantics so that we will continue to scan
+succeeding entries but not count lines for which a callback function
+returns positive.
+
+The current users of kexec_iomem_for_each_line(), arm, sh and x86, will not
+be affected by this change because
+* arm
+  The callback function only returns -1 or 0, and the return value of
+  kexec_iomem_for_each_line() will never be used.
+* sh, x86
+  The callback function may return (-1 for sh,) 0 or 1, but always returns
+  1 once we have reached the maximum number of entries allowed.
+  Even so the current kexec_iomem_for_each_line() counts them up.
+  This change actually fixes this bug.
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/kexec-iomem.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/kexec/kexec-iomem.c b/kexec/kexec-iomem.c
+index 485a2e8..0a0277a 100644
+--- a/kexec/kexec-iomem.c
++++ b/kexec/kexec-iomem.c
+@@ -18,6 +18,9 @@
+  * Iterate over each line in the file returned by proc_iomem(). If match is
+  * NULL or if the line matches with our match-pattern then call the
+  * callback if non-NULL.
++ * If match is NULL, callback should return a negative if error.
++ * Otherwise the interation goes on, incrementing nr but only if callback
++ * returns 0 (matched).
+  *
+  * Return the number of lines matched.
+  */
+@@ -37,7 +40,7 @@ int kexec_iomem_for_each_line(char *match,
+ 	char *str;
+ 	int consumed;
+ 	int count;
+-	int nr = 0;
++	int nr = 0, ret;
+ 
+ 	fp = fopen(iomem, "r");
+ 	if (!fp)
+@@ -50,11 +53,13 @@ int kexec_iomem_for_each_line(char *match,
+ 		str = line + consumed;
+ 		size = end - start + 1;
+ 		if (!match || memcmp(str, match, strlen(match)) == 0) {
+-			if (callback
+-			    && callback(data, nr, str, start, size) < 0) {
+-				break;
++			if (callback) {
++				ret = callback(data, nr, str, start, size);
++				if (ret < 0)
++					break;
++				else if (ret == 0)
++					nr++;
+ 			}
+-			nr++;
+ 		}
+ 	}
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
new file mode 100644
index 0000000..953f13b
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
@@ -0,0 +1,194 @@
+From d29f37bb6e9114aba96c606103b110f511bee9a1 Mon Sep 17 00:00:00 2001
+From: Pratyush Anand <panand@redhat.com>
+Date: Wed, 2 Nov 2016 15:05:25 +0530
+Subject: [PATCH 2/9] kexec: generalize and rename get_kernel_stext_sym()
+
+get_kernel_stext_sym() has been defined for both arm and i386. Other
+architecture might need some other kernel symbol address. Therefore rewrite
+this function as generic function to get any kernel symbol address.
+
+More over, kallsyms is not arch specific representation, therefore have
+common function for all arches.
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: Pratyush Anand <panand@redhat.com>
+[created symbols.c]
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/Makefile                  |  1 +
+ kexec/arch/arm/crashdump-arm.c  | 40 +---------------------------------------
+ kexec/arch/i386/crashdump-x86.c | 29 -----------------------------
+ kexec/kexec.h                   |  2 ++
+ kexec/symbols.c                 | 41 +++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 45 insertions(+), 68 deletions(-)
+ create mode 100644 kexec/symbols.c
+
+diff --git a/kexec/Makefile b/kexec/Makefile
+index 39f365f..2b4fb3d 100644
+--- a/kexec/Makefile
++++ b/kexec/Makefile
+@@ -26,6 +26,7 @@ KEXEC_SRCS_base += kexec/kernel_version.c
+ KEXEC_SRCS_base += kexec/lzma.c
+ KEXEC_SRCS_base += kexec/zlib.c
+ KEXEC_SRCS_base += kexec/kexec-xen.c
++KEXEC_SRCS_base += kexec/symbols.c
+ 
+ KEXEC_GENERATED_SRCS += $(PURGATORY_HEX_C)
+ 
+diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
+index 4a89b5e..245c21a 100644
+--- a/kexec/arch/arm/crashdump-arm.c
++++ b/kexec/arch/arm/crashdump-arm.c
+@@ -73,48 +73,10 @@ static struct crash_elf_info elf_info = {
+ 
+ extern unsigned long long user_page_offset;
+ 
+-/* Retrieve kernel _stext symbol virtual address from /proc/kallsyms */
+-static unsigned long long get_kernel_stext_sym(void)
+-{
+-	const char *kallsyms = "/proc/kallsyms";
+-	const char *stext = "_stext";
+-	char sym[128];
+-	char line[128];
+-	FILE *fp;
+-	unsigned long long vaddr = 0;
+-	char type;
+-
+-	fp = fopen(kallsyms, "r");
+-	if (!fp) {
+-		fprintf(stderr, "Cannot open %s\n", kallsyms);
+-		return 0;
+-	}
+-
+-	while(fgets(line, sizeof(line), fp) != NULL) {
+-		unsigned long long addr;
+-
+-		if (sscanf(line, "%Lx %c %s", &addr, &type, sym) != 3)
+-			continue;
+-
+-		if (strcmp(sym, stext) == 0) {
+-			dbgprintf("kernel symbol %s vaddr = %#llx\n", stext, addr);
+-			vaddr = addr;
+-			break;
+-		}
+-	}
+-
+-	fclose(fp);
+-
+-	if (vaddr == 0)
+-		fprintf(stderr, "Cannot get kernel %s symbol address\n", stext);
+-
+-	return vaddr;
+-}
+-
+ static int get_kernel_page_offset(struct kexec_info *info,
+ 		struct crash_elf_info *elf_info)
+ {
+-	unsigned long long stext_sym_addr = get_kernel_stext_sym();
++	unsigned long long stext_sym_addr = get_kernel_sym("_stext");
+ 	if (stext_sym_addr == 0) {
+ 		if (user_page_offset != (-1ULL)) {
+ 			elf_info->page_offset = user_page_offset;
+diff --git a/kexec/arch/i386/crashdump-x86.c b/kexec/arch/i386/crashdump-x86.c
+index ab833d4..abf82a5 100644
+--- a/kexec/arch/i386/crashdump-x86.c
++++ b/kexec/arch/i386/crashdump-x86.c
+@@ -102,35 +102,6 @@ static int get_kernel_paddr(struct kexec_info *UNUSED(info),
+ 	return -1;
+ }
+ 
+-/* Retrieve kernel symbol virtual address from /proc/kallsyms */
+-static unsigned long long get_kernel_sym(const char *symbol)
+-{
+-	const char *kallsyms = "/proc/kallsyms";
+-	char sym[128];
+-	char line[128];
+-	FILE *fp;
+-	unsigned long long vaddr;
+-	char type;
+-
+-	fp = fopen(kallsyms, "r");
+-	if (!fp) {
+-		fprintf(stderr, "Cannot open %s\n", kallsyms);
+-		return 0;
+-	}
+-
+-	while(fgets(line, sizeof(line), fp) != NULL) {
+-		if (sscanf(line, "%Lx %c %s", &vaddr, &type, sym) != 3)
+-			continue;
+-		if (strcmp(sym, symbol) == 0) {
+-			dbgprintf("kernel symbol %s vaddr = %16llx\n", symbol, vaddr);
+-			return vaddr;
+-		}
+-	}
+-
+-	fprintf(stderr, "Cannot get kernel %s symbol address\n", symbol);
+-	return 0;
+-}
+-
+ /* Retrieve info regarding virtual address kernel has been compiled for and
+  * size of the kernel from /proc/kcore. Current /proc/kcore parsing from
+  * from kexec-tools fails because of malformed elf notes. A kernel patch has
+diff --git a/kexec/kexec.h b/kexec/kexec.h
+index 9194f1c..b4fafad 100644
+--- a/kexec/kexec.h
++++ b/kexec/kexec.h
+@@ -312,4 +312,6 @@ int xen_kexec_load(struct kexec_info *info);
+ int xen_kexec_unload(uint64_t kexec_flags);
+ void xen_kexec_exec(void);
+ 
++extern unsigned long long get_kernel_sym(const char *text);
++
+ #endif /* KEXEC_H */
+diff --git a/kexec/symbols.c b/kexec/symbols.c
+new file mode 100644
+index 0000000..ea6e327
+--- /dev/null
++++ b/kexec/symbols.c
+@@ -0,0 +1,41 @@
++#include <stdio.h>
++#include <string.h>
++#include "kexec.h"
++
++/* Retrieve kernel symbol virtual address from /proc/kallsyms */
++unsigned long long get_kernel_sym(const char *text)
++{
++	const char *kallsyms = "/proc/kallsyms";
++	char sym[128];
++	char line[128];
++	FILE *fp;
++	unsigned long long vaddr = 0;
++	char type;
++
++	fp = fopen(kallsyms, "r");
++	if (!fp) {
++		fprintf(stderr, "Cannot open %s\n", kallsyms);
++		return 0;
++	}
++
++	while (fgets(line, sizeof(line), fp) != NULL) {
++		unsigned long long addr;
++
++		if (sscanf(line, "%Lx %c %s", &addr, &type, sym) != 3)
++			continue;
++
++		if (strcmp(sym, text) == 0) {
++			dbgprintf("kernel symbol %s vaddr = %#llx\n",
++								text, addr);
++			vaddr = addr;
++			break;
++		}
++	}
++
++	fclose(fp);
++
++	if (vaddr == 0)
++		fprintf(stderr, "Cannot get kernel %s symbol address\n", text);
++
++	return vaddr;
++}
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
new file mode 100644
index 0000000..1a1c317
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
@@ -0,0 +1,76 @@
+From 16df170ad4808d12acd5e919ac4f6e7f33a247b3 Mon Sep 17 00:00:00 2001
+From: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Date: Thu, 1 Sep 2016 10:57:42 +0900
+Subject: [PATCH 3/9] arm64: identify PHYS_OFFSET correctly
+
+Due to the kernel patch, commit e7cd190385d1 ("arm64: mark reserved
+memblock regions explicitly in iomem"), the current code will not be able
+to identify the correct value of PHYS_OFFSET if some "reserved" memory
+region, which is likely to be UEFI runtime services code/data, exists at
+an address below the first "System RAM" regions.
+
+This patch fixes this issue.
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/arch/arm64/iomem.h       |  7 +++++++
+ kexec/arch/arm64/kexec-arm64.c | 12 ++++++++++--
+ 2 files changed, 17 insertions(+), 2 deletions(-)
+ create mode 100644 kexec/arch/arm64/iomem.h
+
+diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
+new file mode 100644
+index 0000000..7fd66eb
+--- /dev/null
++++ b/kexec/arch/arm64/iomem.h
+@@ -0,0 +1,7 @@
++#ifndef IOMEM_H
++#define IOMEM_H
++
++#define SYSTEM_RAM		"System RAM\n"
++#define IOMEM_RESERVED		"reserved\n"
++
++#endif
+diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
+index 2e8839a..8ac811d 100644
+--- a/kexec/arch/arm64/kexec-arm64.c
++++ b/kexec/arch/arm64/kexec-arm64.c
+@@ -21,6 +21,7 @@
+ #include "crashdump-arm64.h"
+ #include "dt-ops.h"
+ #include "fs2dt.h"
++#include "iomem.h"
+ #include "kexec-syscall.h"
+ #include "arch/options.h"
+ 
+@@ -475,7 +476,14 @@ static int get_memory_ranges_iomem_cb(void *data, int nr, char *str,
+ 		return -1;
+ 
+ 	r = (struct memory_range *)data + nr;
+-	r->type = RANGE_RAM;
++
++	if (!strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)))
++		r->type = RANGE_RAM;
++	else if (!strncmp(str, IOMEM_RESERVED, strlen(IOMEM_RESERVED)))
++		r->type = RANGE_RESERVED;
++	else
++		return 1;
++
+ 	r->start = base;
+ 	r->end = base + length - 1;
+ 
+@@ -494,7 +502,7 @@ static int get_memory_ranges_iomem_cb(void *data, int nr, char *str,
+ static int get_memory_ranges_iomem(struct memory_range *array,
+ 	unsigned int *count)
+ {
+-	*count = kexec_iomem_for_each_line("System RAM\n",
++	*count = kexec_iomem_for_each_line(NULL,
+ 		get_memory_ranges_iomem_cb, array);
+ 
+ 	if (!*count) {
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch b/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
new file mode 100644
index 0000000..66600f3
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
@@ -0,0 +1,202 @@
+From 48a4c7874d8264ddbfaec2e9858d7866a2d2eb60 Mon Sep 17 00:00:00 2001
+From: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Date: Wed, 5 Aug 2015 13:16:30 +0900
+Subject: [PATCH 4/9] arm64: kdump: identify memory regions
+
+The following regions need to be identified for later use:
+ a) memory regions which belong to the 1st kernel
+ b) usable memory reserved for crash dump kernel
+
+We go through /proc/iomem to find out a) and b) which are marked
+as "System RAM" and "Crash kernel", respectively.
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/arch/arm64/Makefile          |   2 +
+ kexec/arch/arm64/crashdump-arm64.c | 100 ++++++++++++++++++++++++++++++++++++-
+ kexec/arch/arm64/crashdump-arm64.h |  14 +++++-
+ kexec/arch/arm64/iomem.h           |   1 +
+ 4 files changed, 114 insertions(+), 3 deletions(-)
+
+diff --git a/kexec/arch/arm64/Makefile b/kexec/arch/arm64/Makefile
+index 74b677f..2d4ae0e 100644
+--- a/kexec/arch/arm64/Makefile
++++ b/kexec/arch/arm64/Makefile
+@@ -6,6 +6,8 @@ arm64_FS2DT_INCLUDE += \
+ 
+ arm64_DT_OPS += kexec/dt-ops.c
+ 
++arm64_MEM_REGIONS = kexec/mem_regions.c
++
+ arm64_CPPFLAGS += -I $(srcdir)/kexec/
+ 
+ arm64_KEXEC_SRCS += \
+diff --git a/kexec/arch/arm64/crashdump-arm64.c b/kexec/arch/arm64/crashdump-arm64.c
+index d2272c8..dcaca43 100644
+--- a/kexec/arch/arm64/crashdump-arm64.c
++++ b/kexec/arch/arm64/crashdump-arm64.c
+@@ -1,5 +1,13 @@
+ /*
+  * ARM64 crashdump.
++ *     partly derived from arm implementation
++ *
++ * Copyright (c) 2014-2016 Linaro Limited
++ * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
+  */
+ 
+ #define _GNU_SOURCE
+@@ -10,12 +18,102 @@
+ #include "kexec.h"
+ #include "crashdump.h"
+ #include "crashdump-arm64.h"
++#include "iomem.h"
+ #include "kexec-arm64.h"
+ #include "kexec-elf.h"
++#include "mem_regions.h"
+ 
+-struct memory_ranges usablemem_rgns = {};
++/* memory ranges on crashed kernel */
++static struct memory_range crash_memory_ranges[CRASH_MAX_MEMORY_RANGES];
++static struct memory_ranges crash_memory_rgns = {
++	.size = 0,
++	.max_size = CRASH_MAX_MEMORY_RANGES,
++	.ranges = crash_memory_ranges,
++};
++
++/* memory range reserved for crashkernel */
++struct memory_range crash_reserved_mem;
++struct memory_ranges usablemem_rgns = {
++	.size = 0,
++	.max_size = 1,
++	.ranges = &crash_reserved_mem,
++};
++
++/*
++ * iomem_range_callback() - callback called for each iomem region
++ * @data: not used
++ * @nr: not used
++ * @str: name of the memory region
++ * @base: start address of the memory region
++ * @length: size of the memory region
++ *
++ * This function is called once for each memory region found in /proc/iomem.
++ * It locates system RAM and crashkernel reserved memory and places these to
++ * variables, respectively, crash_memory_ranges and crash_reserved_mem.
++ */
++
++static int iomem_range_callback(void *UNUSED(data), int UNUSED(nr),
++				char *str, unsigned long long base,
++				unsigned long long length)
++{
++	if (strncmp(str, CRASH_KERNEL, strlen(CRASH_KERNEL)) == 0)
++		return mem_regions_add(&usablemem_rgns,
++				       base, length, RANGE_RAM);
++	else if (strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)) == 0)
++		return mem_regions_add(&crash_memory_rgns,
++				       base, length, RANGE_RAM);
++
++	return 0;
++}
+ 
+ int is_crashkernel_mem_reserved(void)
+ {
++	if (!crash_reserved_mem.end)
++		kexec_iomem_for_each_line(NULL, iomem_range_callback, NULL);
++
++	return crash_reserved_mem.start != crash_reserved_mem.end;
++}
++
++/*
++ * crash_get_memory_ranges() - read system physical memory
++ *
++ * Function reads through system physical memory and stores found memory
++ * regions in crash_memory_ranges.
++ * Regions are sorted in ascending order.
++ *
++ * Returns 0 in case of success and -1 otherwise (errno is set).
++ */
++static int crash_get_memory_ranges(void)
++{
++	/*
++	 * First read all memory regions that can be considered as
++	 * system memory including the crash area.
++	 */
++	if (!usablemem_rgns.size)
++		kexec_iomem_for_each_line(NULL, iomem_range_callback, NULL);
++
++	/* allow only a single region for crash dump kernel */
++	if (usablemem_rgns.size != 1) {
++		errno = EINVAL;
++		return -1;
++	}
++
++	dbgprint_mem_range("Reserved memory range", &crash_reserved_mem, 1);
++
++	if (mem_regions_exclude(&crash_memory_rgns, &crash_reserved_mem)) {
++		fprintf(stderr,
++			"Error: Number of crash memory ranges excedeed the max limit\n");
++		errno = ENOMEM;
++		return -1;
++	}
++
++	/*
++	 * Make sure that the memory regions are sorted.
++	 */
++	mem_regions_sort(&crash_memory_rgns);
++
++	dbgprint_mem_range("Coredump memory ranges",
++			   crash_memory_rgns.ranges, crash_memory_rgns.size);
++
+ 	return 0;
+ }
+diff --git a/kexec/arch/arm64/crashdump-arm64.h b/kexec/arch/arm64/crashdump-arm64.h
+index f33c7a2..07a0ed0 100644
+--- a/kexec/arch/arm64/crashdump-arm64.h
++++ b/kexec/arch/arm64/crashdump-arm64.h
+@@ -1,12 +1,22 @@
+ /*
+  * ARM64 crashdump.
++ *
++ * Copyright (c) 2014-2016 Linaro Limited
++ * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
+  */
+ 
+-#if !defined(CRASHDUMP_ARM64_H)
++#ifndef CRASHDUMP_ARM64_H
+ #define CRASHDUMP_ARM64_H
+ 
+ #include "kexec.h"
+ 
++#define CRASH_MAX_MEMORY_RANGES	32
++
+ extern struct memory_ranges usablemem_rgns;
++extern struct memory_range crash_reserved_mem;
+ 
+-#endif
++#endif /* CRASHDUMP_ARM64_H */
+diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
+index 7fd66eb..20cda87 100644
+--- a/kexec/arch/arm64/iomem.h
++++ b/kexec/arch/arm64/iomem.h
+@@ -2,6 +2,7 @@
+ #define IOMEM_H
+ 
+ #define SYSTEM_RAM		"System RAM\n"
++#define CRASH_KERNEL		"Crash kernel\n"
+ #define IOMEM_RESERVED		"reserved\n"
+ 
+ #endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch b/meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
new file mode 100644
index 0000000..fe535b6
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
@@ -0,0 +1,191 @@
+From 769da25627cebb2a53caee5d5be78a32d376adc1 Mon Sep 17 00:00:00 2001
+From: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Date: Wed, 5 Aug 2015 13:45:15 +0900
+Subject: [PATCH 5/9] arm64: kdump: add elf core header segment
+
+Elf core header contains the information necessary for the coredump of
+the 1st kernel, including its physcal memory layout as well as cpu register
+states at the panic.
+The segment is allocated inside the reserved memory of crash dump kernel.
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/arch/arm64/crashdump-arm64.c | 96 ++++++++++++++++++++++++++++++++++++++
+ kexec/arch/arm64/crashdump-arm64.h |  3 ++
+ kexec/arch/arm64/iomem.h           |  2 +
+ kexec/arch/arm64/kexec-elf-arm64.c | 10 ++++
+ 4 files changed, 111 insertions(+)
+
+diff --git a/kexec/arch/arm64/crashdump-arm64.c b/kexec/arch/arm64/crashdump-arm64.c
+index dcaca43..8346131 100644
+--- a/kexec/arch/arm64/crashdump-arm64.c
++++ b/kexec/arch/arm64/crashdump-arm64.c
+@@ -39,6 +39,39 @@ struct memory_ranges usablemem_rgns = {
+ 	.ranges = &crash_reserved_mem,
+ };
+ 
++struct memory_range elfcorehdr_mem;
++
++static struct crash_elf_info elf_info = {
++	.class		= ELFCLASS64,
++#if (__BYTE_ORDER == __LITTLE_ENDIAN)
++	.data		= ELFDATA2LSB,
++#else
++	.data		= ELFDATA2MSB,
++#endif
++	.machine	= EM_AARCH64,
++};
++
++/*
++ * Note: The returned value is correct only if !CONFIG_RANDOMIZE_BASE.
++ */
++static uint64_t get_kernel_page_offset(void)
++{
++	int i;
++
++	if (elf_info.kern_vaddr_start == UINT64_MAX)
++		return UINT64_MAX;
++
++	/* Current max virtual memory range is 48-bits. */
++	for (i = 48; i > 0; i--)
++		if (!(elf_info.kern_vaddr_start & (1UL << i)))
++			break;
++
++	if (i <= 0)
++		return UINT64_MAX;
++	else
++		return UINT64_MAX << i;
++}
++
+ /*
+  * iomem_range_callback() - callback called for each iomem region
+  * @data: not used
+@@ -62,6 +95,10 @@ static int iomem_range_callback(void *UNUSED(data), int UNUSED(nr),
+ 	else if (strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)) == 0)
+ 		return mem_regions_add(&crash_memory_rgns,
+ 				       base, length, RANGE_RAM);
++	else if (strncmp(str, KERNEL_CODE, strlen(KERNEL_CODE)) == 0)
++		elf_info.kern_paddr_start = base;
++	else if (strncmp(str, KERNEL_DATA, strlen(KERNEL_DATA)) == 0)
++		elf_info.kern_size = base + length - elf_info.kern_paddr_start;
+ 
+ 	return 0;
+ }
+@@ -115,5 +152,64 @@ static int crash_get_memory_ranges(void)
+ 	dbgprint_mem_range("Coredump memory ranges",
+ 			   crash_memory_rgns.ranges, crash_memory_rgns.size);
+ 
++	/*
++	 * For additional kernel code/data segment.
++	 * kern_paddr_start/kern_size are determined in iomem_range_callback
++	 */
++	elf_info.kern_vaddr_start = get_kernel_sym("_text");
++	if (!elf_info.kern_vaddr_start)
++		elf_info.kern_vaddr_start = UINT64_MAX;
++
++	return 0;
++}
++
++/*
++ * load_crashdump_segments() - load the elf core header
++ * @info: kexec info structure
++ *
++ * This function creates and loads an additional segment of elf core header
++ : which is used to construct /proc/vmcore on crash dump kernel.
++ *
++ * Return 0 in case of success and -1 in case of error.
++ */
++
++int load_crashdump_segments(struct kexec_info *info)
++{
++	unsigned long elfcorehdr;
++	unsigned long bufsz;
++	void *buf;
++	int err;
++
++	/*
++	 * First fetch all the memory (RAM) ranges that we are going to
++	 * pass to the crash dump kernel during panic.
++	 */
++
++	err = crash_get_memory_ranges();
++
++	if (err)
++		return err;
++
++	elf_info.page_offset = get_kernel_page_offset();
++	dbgprintf("%s: page_offset:   %016llx\n", __func__,
++			elf_info.page_offset);
++
++	err = crash_create_elf64_headers(info, &elf_info,
++			crash_memory_rgns.ranges, crash_memory_rgns.size,
++			&buf, &bufsz, ELF_CORE_HEADER_ALIGN);
++
++	if (err)
++		return err;
++
++	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 0,
++		crash_reserved_mem.start, crash_reserved_mem.end,
++		-1, 0);
++
++	elfcorehdr_mem.start = elfcorehdr;
++	elfcorehdr_mem.end = elfcorehdr + bufsz - 1;
++
++	dbgprintf("%s: elfcorehdr 0x%llx-0x%llx\n", __func__,
++			elfcorehdr_mem.start, elfcorehdr_mem.end);
++
+ 	return 0;
+ }
+diff --git a/kexec/arch/arm64/crashdump-arm64.h b/kexec/arch/arm64/crashdump-arm64.h
+index 07a0ed0..da75a2d 100644
+--- a/kexec/arch/arm64/crashdump-arm64.h
++++ b/kexec/arch/arm64/crashdump-arm64.h
+@@ -18,5 +18,8 @@
+ 
+ extern struct memory_ranges usablemem_rgns;
+ extern struct memory_range crash_reserved_mem;
++extern struct memory_range elfcorehdr_mem;
++
++extern int load_crashdump_segments(struct kexec_info *info);
+ 
+ #endif /* CRASHDUMP_ARM64_H */
+diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
+index 20cda87..d4864bb 100644
+--- a/kexec/arch/arm64/iomem.h
++++ b/kexec/arch/arm64/iomem.h
+@@ -2,6 +2,8 @@
+ #define IOMEM_H
+ 
+ #define SYSTEM_RAM		"System RAM\n"
++#define KERNEL_CODE		"Kernel code\n"
++#define KERNEL_DATA		"Kernel data\n"
+ #define CRASH_KERNEL		"Crash kernel\n"
+ #define IOMEM_RESERVED		"reserved\n"
+ 
+diff --git a/kexec/arch/arm64/kexec-elf-arm64.c b/kexec/arch/arm64/kexec-elf-arm64.c
+index daf8bf0..c70a37a 100644
+--- a/kexec/arch/arm64/kexec-elf-arm64.c
++++ b/kexec/arch/arm64/kexec-elf-arm64.c
+@@ -119,6 +119,16 @@ int elf_arm64_load(int argc, char **argv, const char *kernel_buf,
+ 	dbgprintf("%s: PE format:      %s\n", __func__,
+ 		(arm64_header_check_pe_sig(header) ? "yes" : "no"));
+ 
++	if (info->kexec_flags & KEXEC_ON_CRASH) {
++		/* create and initialize elf core header segment */
++		result = load_crashdump_segments(info);
++		if (result) {
++			dbgprintf("%s: Creating eflcorehdr failed.\n",
++								__func__);
++			goto exit;
++		}
++	}
++
+ 	/* load the kernel */
+ 	result = elf_exec_load(&ehdr, info);
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch b/meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
new file mode 100644
index 0000000..4149551
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
@@ -0,0 +1,137 @@
+From 4079c93ac5453ef5f7889ab64920c1e9427690ef Mon Sep 17 00:00:00 2001
+From: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Date: Tue, 17 Feb 2015 16:06:55 +0900
+Subject: [PATCH 6/9] arm64: kdump: set up kernel image segment
+
+On arm64, we can use the same kernel image as 1st kernel, but
+we have to modify the entry point as well as segments' addresses
+in the kernel's elf header in order to load them into correct places.
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/arch/arm64/crashdump-arm64.c | 23 +++++++++++++++++++++++
+ kexec/arch/arm64/crashdump-arm64.h |  1 +
+ kexec/arch/arm64/kexec-arm64.c     | 25 ++++++++++++++++++++-----
+ kexec/arch/arm64/kexec-elf-arm64.c | 10 +++++++++-
+ 4 files changed, 53 insertions(+), 6 deletions(-)
+
+diff --git a/kexec/arch/arm64/crashdump-arm64.c b/kexec/arch/arm64/crashdump-arm64.c
+index 8346131..9517329 100644
+--- a/kexec/arch/arm64/crashdump-arm64.c
++++ b/kexec/arch/arm64/crashdump-arm64.c
+@@ -213,3 +213,26 @@ int load_crashdump_segments(struct kexec_info *info)
+ 
+ 	return 0;
+ }
++
++/*
++ * e_entry and p_paddr are actually in virtual address space.
++ * Those values will be translated to physcal addresses by
++ * using virt_to_phys().
++ * So let's get ready for later use so the memory base (phys_offset)
++ * will be correctly replaced with crash_reserved_mem.start.
++ */
++void modify_ehdr_for_crashdump(struct mem_ehdr *ehdr)
++{
++	struct mem_phdr *phdr;
++	int i;
++
++	ehdr->e_entry += - arm64_mem.phys_offset + crash_reserved_mem.start;
++
++	for (i = 0; i < ehdr->e_phnum; i++) {
++		phdr = &ehdr->e_phdr[i];
++		if (phdr->p_type != PT_LOAD)
++			continue;
++		phdr->p_paddr +=
++			(-arm64_mem.phys_offset + crash_reserved_mem.start);
++	}
++}
+diff --git a/kexec/arch/arm64/crashdump-arm64.h b/kexec/arch/arm64/crashdump-arm64.h
+index da75a2d..382f571 100644
+--- a/kexec/arch/arm64/crashdump-arm64.h
++++ b/kexec/arch/arm64/crashdump-arm64.h
+@@ -21,5 +21,6 @@ extern struct memory_range crash_reserved_mem;
+ extern struct memory_range elfcorehdr_mem;
+ 
+ extern int load_crashdump_segments(struct kexec_info *info);
++extern void modify_ehdr_for_crashdump(struct mem_ehdr *ehdr);
+ 
+ #endif /* CRASHDUMP_ARM64_H */
+diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
+index 8ac811d..cec4e41 100644
+--- a/kexec/arch/arm64/kexec-arm64.c
++++ b/kexec/arch/arm64/kexec-arm64.c
+@@ -307,12 +307,27 @@ unsigned long arm64_locate_kernel_segment(struct kexec_info *info)
+ {
+ 	unsigned long hole;
+ 
+-	hole = locate_hole(info,
+-		arm64_mem.text_offset + arm64_mem.image_size,
+-		MiB(2), 0, ULONG_MAX, 1);
++	if (info->kexec_flags & KEXEC_ON_CRASH) {
++		unsigned long hole_end;
++
++		hole = (crash_reserved_mem.start < mem_min ?
++				mem_min : crash_reserved_mem.start);
++		hole = _ALIGN_UP(hole, MiB(2));
++		hole_end = hole + arm64_mem.text_offset + arm64_mem.image_size;
++
++		if ((hole_end > mem_max) ||
++		    (hole_end > crash_reserved_mem.end)) {
++			dbgprintf("%s: Crash kernel out of range\n", __func__);
++			hole = ULONG_MAX;
++		}
++	} else {
++		hole = locate_hole(info,
++			arm64_mem.text_offset + arm64_mem.image_size,
++			MiB(2), 0, ULONG_MAX, 1);
+ 
+-	if (hole == ULONG_MAX)
+-		dbgprintf("%s: locate_hole failed\n", __func__);
++		if (hole == ULONG_MAX)
++			dbgprintf("%s: locate_hole failed\n", __func__);
++	}
+ 
+ 	return hole;
+ }
+diff --git a/kexec/arch/arm64/kexec-elf-arm64.c b/kexec/arch/arm64/kexec-elf-arm64.c
+index c70a37a..842ce21 100644
+--- a/kexec/arch/arm64/kexec-elf-arm64.c
++++ b/kexec/arch/arm64/kexec-elf-arm64.c
+@@ -9,6 +9,7 @@
+ #include <stdlib.h>
+ #include <linux/elf.h>
+ 
++#include "crashdump-arm64.h"
+ #include "kexec-arm64.h"
+ #include "kexec-elf.h"
+ #include "kexec-syscall.h"
+@@ -105,7 +106,8 @@ int elf_arm64_load(int argc, char **argv, const char *kernel_buf,
+ 	}
+ 
+ 	arm64_mem.vp_offset = _ALIGN_DOWN(ehdr.e_entry, MiB(2));
+-	arm64_mem.vp_offset -= kernel_segment - get_phys_offset();
++	if (!(info->kexec_flags & KEXEC_ON_CRASH))
++		arm64_mem.vp_offset -= kernel_segment - get_phys_offset();
+ 
+ 	dbgprintf("%s: kernel_segment: %016lx\n", __func__, kernel_segment);
+ 	dbgprintf("%s: text_offset:    %016lx\n", __func__,
+@@ -127,6 +129,12 @@ int elf_arm64_load(int argc, char **argv, const char *kernel_buf,
+ 								__func__);
+ 			goto exit;
+ 		}
++
++		/*
++		 * offset addresses in order to fit vmlinux
++		 * (elf_exec) into crash kernel's memory
++		 */
++		modify_ehdr_for_crashdump(&ehdr);
+ 	}
+ 
+ 	/* load the kernel */
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch b/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
new file mode 100644
index 0000000..2745466
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
@@ -0,0 +1,35 @@
+From 07ad14e12665221d754fde8e47c32ac18c24586a Mon Sep 17 00:00:00 2001
+From: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Date: Fri, 31 Jul 2015 20:01:39 +0900
+Subject: [PATCH 7/9] arm64: kdump: set up other segments
+
+We make sure that all the other segments, initrd and device-tree blob,
+also be loaded into the reserved memory of crash dump kernel.
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/arch/arm64/kexec-arm64.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
+index cec4e41..78a0035 100644
+--- a/kexec/arch/arm64/kexec-arm64.c
++++ b/kexec/arch/arm64/kexec-arm64.c
+@@ -374,7 +374,10 @@ int arm64_load_other_segments(struct kexec_info *info,
+ 	/* Put the other segments after the image. */
+ 
+ 	hole_min = image_base + arm64_mem.image_size;
+-	hole_max = ULONG_MAX;
++	if (info->kexec_flags & KEXEC_ON_CRASH)
++		hole_max = crash_reserved_mem.end;
++	else
++		hole_max = ULONG_MAX;
+ 
+ 	if (arm64_opts.initrd) {
+ 		initrd_buf = slurp_file(arm64_opts.initrd, &initrd_size);
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch b/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
new file mode 100644
index 0000000..31c3d85
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
@@ -0,0 +1,150 @@
+From 23bf7ac189cc3b87ceb9d1d3b69b5c4815354add Mon Sep 17 00:00:00 2001
+From: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Date: Wed, 27 Jan 2016 13:38:39 +0900
+Subject: [PATCH 8/9] arm64: kdump: add DT properties to crash dump kernel's
+ dtb
+
+We pass the following properties to crash dump kernel:
+linux,elfcorehdr: elf core header segment,
+		  same as "elfcorehdr=" kernel parameter on other archs
+linux,usable-memory-range: usable memory reserved for crash dump kernel
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/arch/arm64/kexec-arm64.c     | 76 +++++++++++++++++++++++++++++++++++---
+ kexec/arch/arm64/kexec-elf-arm64.c |  5 ---
+ 2 files changed, 71 insertions(+), 10 deletions(-)
+
+diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
+index 78a0035..a8fb64f 100644
+--- a/kexec/arch/arm64/kexec-arm64.c
++++ b/kexec/arch/arm64/kexec-arm64.c
+@@ -128,9 +128,6 @@ int arch_process_options(int argc, char **argv)
+ 		case OPT_INITRD:
+ 			arm64_opts.initrd = optarg;
+ 			break;
+-		case OPT_PANIC:
+-			die("load-panic (-p) not supported");
+-			break;
+ 		default:
+ 			break; /* Ignore core and unknown options. */
+ 		}
+@@ -285,8 +282,12 @@ on_success:
+  * setup_2nd_dtb - Setup the 2nd stage kernel's dtb.
+  */
+ 
+-static int setup_2nd_dtb(struct dtb *dtb, char *command_line)
++static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
+ {
++	char *new_buf;
++	int new_size;
++	int nodeoffset;
++	uint64_t range[2];
+ 	int result;
+ 
+ 	result = fdt_check_header(dtb->buf);
+@@ -298,8 +299,72 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line)
+ 
+ 	result = set_bootargs(dtb, command_line);
+ 
++	/* remove those anyway */
++	nodeoffset = fdt_path_offset(dtb->buf, "/chosen");
++	fdt_delprop(dtb->buf, nodeoffset, "linux,crashkernel-base");
++	fdt_delprop(dtb->buf, nodeoffset, "linux,crashkernel-size");
++
++	if (on_crash) {
++		nodeoffset = fdt_path_offset(dtb->buf, "/chosen");
++		fdt_delprop(dtb->buf, nodeoffset, "linux,elfcorehdr");
++		fdt_delprop(dtb->buf, nodeoffset, "linux,usable-memory-range");
++		new_size = fdt_totalsize(dtb->buf)
++			+ 2 * (sizeof(struct fdt_property)
++					+ FDT_TAGALIGN(sizeof(range)))
++			+ strlen("linux,elfcorehdr") + 1
++			+ strlen("linux,usable-memory-range") + 1;
++
++		new_buf = xmalloc(new_size);
++		result = fdt_open_into(dtb->buf, new_buf, new_size);
++		if (result) {
++			dbgprintf("%s: fdt_open_into failed: %s\n", __func__,
++				fdt_strerror(result));
++			result = -ENOSPC;
++			goto on_error;
++		}
++
++		range[0] = cpu_to_be64(elfcorehdr_mem.start);
++		range[1] = cpu_to_be64(elfcorehdr_mem.end
++				- elfcorehdr_mem.start + 1);
++		nodeoffset = fdt_path_offset(new_buf, "/chosen");
++		result = fdt_setprop(new_buf, nodeoffset, "linux,elfcorehdr",
++				(void *)range, sizeof(range));
++		if (result) {
++			dbgprintf("%s: fdt_setprop failed: %s\n", __func__,
++				fdt_strerror(result));
++			result = -EINVAL;
++			goto on_error;
++		}
++
++		range[0] = cpu_to_be64(crash_reserved_mem.start);
++		range[1] = cpu_to_be64(crash_reserved_mem.end
++				- crash_reserved_mem.start + 1);
++		nodeoffset = fdt_path_offset(new_buf, "/chosen");
++		result = fdt_setprop(new_buf, nodeoffset,
++				"linux,usable-memory-range",
++				(void *)range, sizeof(range));
++		if (result) {
++			dbgprintf("%s: fdt_setprop failed: %s\n", __func__,
++				fdt_strerror(result));
++			result = -EINVAL;
++			goto on_error;
++		}
++
++		fdt_pack(new_buf);
++		dtb->buf = new_buf;
++		dtb->size = fdt_totalsize(new_buf);
++	}
++
+ 	dump_reservemap(dtb);
+ 
++
++	return result;
++
++on_error:
++	fprintf(stderr, "kexec: %s failed.\n", __func__);
++	if (new_buf)
++		free(new_buf);
++
+ 	return result;
+ }
+ 
+@@ -366,7 +431,8 @@ int arm64_load_other_segments(struct kexec_info *info,
+ 		}
+ 	}
+ 
+-	result = setup_2nd_dtb(&dtb, command_line);
++	result = setup_2nd_dtb(&dtb, command_line,
++			info->kexec_flags & KEXEC_ON_CRASH);
+ 
+ 	if (result)
+ 		return -EFAILED;
+diff --git a/kexec/arch/arm64/kexec-elf-arm64.c b/kexec/arch/arm64/kexec-elf-arm64.c
+index 842ce21..b17a31a 100644
+--- a/kexec/arch/arm64/kexec-elf-arm64.c
++++ b/kexec/arch/arm64/kexec-elf-arm64.c
+@@ -47,11 +47,6 @@ int elf_arm64_load(int argc, char **argv, const char *kernel_buf,
+ 	int result;
+ 	int i;
+ 
+-	if (info->kexec_flags & KEXEC_ON_CRASH) {
+-		fprintf(stderr, "kexec: kdump not yet supported on arm64\n");
+-		return -EFAILED;
+-	}
+-
+ 	result = build_elf_exec_info(kernel_buf, kernel_size, &ehdr, 0);
+ 
+ 	if (result < 0) {
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch b/meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
new file mode 100644
index 0000000..8b1c018
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
@@ -0,0 +1,52 @@
+From 5a4958f01a793c3e7f440f5bae75666a4349cc50 Mon Sep 17 00:00:00 2001
+From: Pratyush Anand <panand@redhat.com>
+Date: Thu, 14 May 2015 11:25:37 +0530
+Subject: [PATCH 9/9] arm64: kdump: Add support for binary image files
+
+This patch adds support to use binary image ie arch/arm64/boot/Image with
+kdump.
+
+Upstream-Status: Backport [https://git.linaro.org/people/takahiro.akashi/kexec-tools.git]
+
+Signed-off-by: Pratyush Anand <panand@redhat.com>
+[takahiro.akashi@linaro.org: a bit reworked]
+Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ kexec/arch/arm64/kexec-image-arm64.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/kexec/arch/arm64/kexec-image-arm64.c b/kexec/arch/arm64/kexec-image-arm64.c
+index 960ed96..982e431 100644
+--- a/kexec/arch/arm64/kexec-image-arm64.c
++++ b/kexec/arch/arm64/kexec-image-arm64.c
+@@ -4,7 +4,9 @@
+ 
+ #define _GNU_SOURCE
+ 
++#include "crashdump-arm64.h"
+ #include "kexec-arm64.h"
++#include "kexec-syscall.h"
+ #include <limits.h>
+ 
+ int image_arm64_probe(const char *kernel_buf, off_t kernel_size)
+@@ -58,6 +60,16 @@ int image_arm64_load(int argc, char **argv, const char *kernel_buf,
+ 	dbgprintf("%s: PE format:      %s\n", __func__,
+ 		(arm64_header_check_pe_sig(header) ? "yes" : "no"));
+ 
++	if (info->kexec_flags & KEXEC_ON_CRASH) {
++		/* create and initialize elf core header segment */
++		result = load_crashdump_segments(info);
++		if (result) {
++			dbgprintf("%s: Creating eflcorehdr failed.\n",
++								__func__);
++			goto exit;
++		}
++	}
++
+ 	/* load the kernel */
+ 	add_segment_phys_virt(info, kernel_buf, kernel_size,
+ 			kernel_segment + arm64_mem.text_offset,
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
deleted file mode 100644
index 59376c8..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require kexec-tools.inc
-export LDFLAGS = "-L${STAGING_LIBDIR}"
-EXTRA_OECONF = " --with-zlib=yes"
-
-SRC_URI += " \
-            file://kexec-aarch64.patch \
-            file://kexec-x32.patch \
-            file://0002-powerpc-change-the-memory-size-limit.patch \
-            file://0001-purgatory-Pass-r-directly-to-linker.patch \
-            file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
-         "
-
-SRC_URI[md5sum] = "10ddaae0e86af54407b164a1f5a39cc3"
-SRC_URI[sha256sum] = "cc7b60dad0da202004048a6179d8a53606943062dd627a2edba45a8ea3a85135"
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
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
new file mode 100644
index 0000000..899b391
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
@@ -0,0 +1,44 @@
+require kexec-tools.inc
+export LDFLAGS = "-L${STAGING_LIBDIR}"
+EXTRA_OECONF = " --with-zlib=yes"
+
+SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
+            file://0002-powerpc-change-the-memory-size-limit.patch \
+            file://0001-purgatory-Pass-r-directly-to-linker.patch \
+            file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
+            file://0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch \
+            file://0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch \
+            file://0003-arm64-identify-PHYS_OFFSET-correctly.patch \
+            file://0004-arm64-kdump-identify-memory-regions.patch \
+            file://0005-arm64-kdump-add-elf-core-header-segment.patch \
+            file://0006-arm64-kdump-set-up-kernel-image-segment.patch \
+            file://0007-arm64-kdump-set-up-other-segments.patch \
+            file://0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch \
+            file://0009-arm64-kdump-Add-support-for-binary-image-files.patch \
+         "
+
+SRC_URI[md5sum] = "b2b2c5e6b29d467d6e99d587fb6b7cf5"
+SRC_URI[sha256sum] = "b3e69519d2acced256843b1e8f1ecfa00d9b54fa07449ed78f05b9193f239370"
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
2.8.3


