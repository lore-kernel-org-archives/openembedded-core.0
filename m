Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6DE60125
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 09:09:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0399QDv008740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jan 2017 01:09:27 -0800 (PST)
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 3 Jan 2017 01:09:26 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jan 2017 17:05:04 +0800
Message-ID: <1483434305-15926-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kexec: ARM: fix align issue of add_buffer_phys_virt() for LPAE kernel.
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
X-List-Received-Date: Tue, 03 Jan 2017 09:09:27 -0000
Content-Type: text/plain

If LPAE is enabled, 3 level page table is used and the 'SECTION_SIZE'
is (1<<21), so add_buffer_phys_virt() should align to (1 << 21).

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 ...-ARM-fix-add_buffer_phys_virt-align-issue.patch | 52 ++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb    |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch
new file mode 100644
index 0000000..7d1f95e
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch
@@ -0,0 +1,52 @@
+From 380019f68e19ac863cf32dc7ff6784e8fe1d751f Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Mon, 19 Dec 2016 14:52:02 +0800
+Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue.
+
+When "CONFIG_ARM_LPAE" is enabled,3 level page table
+is used by MMU, the "SECTION_SIZE" is defined with
+(1 << 21), but 'add_buffer_phys_virt()' hardcode this
+to (1 << 20).
+
+Upstream-Status: Pending
+
+Suggested-By:fredrik.markstrom@gmail.com
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ kexec/arch/arm/crashdump-arm.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
+index 38a1401..e41b7fb 100644
+--- a/kexec/arch/arm/crashdump-arm.c
++++ b/kexec/arch/arm/crashdump-arm.c
+@@ -271,6 +271,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+ 	void *buf;
+ 	int err;
+ 	int last_ranges;
++	unsigned short align_bit_shift = 20;
+ 
+ 	/*
+ 	 * First fetch all the memory (RAM) ranges that we are going to pass to
+@@ -295,6 +296,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+ 
+ 		/* for support LPAE enabled kernel*/
+ 		elf_info.class = ELFCLASS64;
++		align_bit_shift = 21;
+ 
+ 		err = crash_create_elf64_headers(info, &elf_info,
+ 					 usablemem_rgns.ranges,
+@@ -315,8 +317,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
+ 	 * 1MB) so that available memory passed in kernel command line will be
+ 	 * aligned to 1MB. This is because kernel create_mapping() wants memory
+ 	 * regions to be aligned to SECTION_SIZE.
++         * The SECTION_SIZE of LPAE kernel is '1UL << 21' defined in pgtable-3level.h
+ 	 */
+-	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << 20,
++	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << align_bit_shift,
+ 					  crash_reserved_mem.start,
+ 					  crash_reserved_mem.end, -1, 0);
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
index 59376c8..3e38923 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
@@ -8,6 +8,7 @@ SRC_URI += " \
             file://0002-powerpc-change-the-memory-size-limit.patch \
             file://0001-purgatory-Pass-r-directly-to-linker.patch \
             file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
+            file://kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch \
          "
 
 SRC_URI[md5sum] = "10ddaae0e86af54407b164a1f5a39cc3"
-- 
1.9.1


