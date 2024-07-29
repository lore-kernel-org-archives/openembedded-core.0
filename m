Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA828C52D74
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.46588.1722215424359450708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hHLYa885;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215424; x=1753751424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aSEf254F0Bez3XDt4kW+1SrSxmv//vZWk7J0lpPlh/I=;
  b=hHLYa885fHuFcEL1lvO1d81i3yK0u17AgpIIXLNBqH2ZIwJh+grN7e85
   AcQeEZmEP6bC/KFi/OcI3XC22SPiTF8BSfsuhFc0ipJN41MLGeTYQgQHN
   I28qYLjH4xYNjSmBPi2+h7Jv1Z9QPVVWHyZy3RSXj8D7D8FK6eUBdmtxa
   4zejRJC6c/9EwKDxj2yMeSFstj0rO2eDc+KRBvnYFKebJRwxaXiO4PaYB
   Hb3BHR7D9+ercmZ93X/gcbW1+Hml4sM1F9/NqtelZQMsEf22I9gabaJfK
   0aGrZdmzyC1frS4TNrH/EirHrDJnjYXOw2h/4nBWYE4jdetgA5ynARlYs
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="147911695"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="147911695"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 89694E8D40
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BB1ABD9003
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 396BD20071A2C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2F201A0002;
	Mon, 29 Jul 2024 09:10:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/33] kexec-tools: upgrade 2.0.28 -> 2.0.29
Date: Mon, 29 Jul 2024 09:09:40 +0800
Message-Id: <1722215408-27541-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--20.070400-10.000000
X-TMASE-MatchedRID: znUqJL/3pyajz0nOeth/yTo39wOA02LhTfK5j0EZbyvozDhGeQC9EgLt
	Av8b4f0onJ0c0AWmZwFEOP/MktCQ9nzLTypR/JvIxvp0tuDMx3lMkOX0UoduuZjmdWmKHGLDlSG
	36bKvRczbyQpcPtsJ2cYoh/qEF/tVG+3Eurjmqb0/QdUh6LEl0ME5XPQnBzGXR/IzlV+CMbbT0P
	pHDbMis/GreLFhOYYLGvhXCgvvcSfEbXUPgcnfBP7FEhWgo0y8lq8SLDWROoc+DPAp9Rd6bzpIh
	honTuyPiHx2aBAtHgoa31Xck7ZS4T9AwXUHipV9fUkgDiuGxn/QxDD776KHL9MvYZEcBz1xbNNG
	UMZTc/NR9jZ1j+m7/qSHnUpJSz+F+pXMjwUDmBQdZEkR8Y/meaEetkTb5LzrhextWx1dUiH3MMl
	WBma+yHMIRXM0AGgXJ1NZMNkS1JUxf2YzVzIJI2e0R3NAF/ch/Dirw+EwLHKJy/P0PFqswZlA4I
	pB7gNO+7nMblhClnfkfjIklf3s+h5R9ALx1qW9SJA7ysb1rf6NCqGZ2ehflzVjvc93O9dkrZ2vw
	xCmX+kBrZo6E42qzhrfohCt2KC+5s2E/HDpG1my7DNFQWhX4DYvC/PFFfSAP4H+2nyK0FPuDAFk
	OSPhC/EFvlgcSS0F3kAavx3Zl3FyNLIRgHOxXgrcxrzwsv5u/soTtcgqC3x87SYDlCxfa1I6k4I
	L2fsun0GM/A+Xcc5atvUzMDckKpH0YXYnbGozFEUknJ/kEl5oFT3KzpHqEzOrHoO19Vm29xS3mV
	zWUuC1PimItaljun7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202578

From: Wang Mingyu <wangmy@fujitsu.com>

0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
Fix-building-on-x86_64-with-binutils-2.41.patch
removed since they're included in 2.0.29

License-Update:
 "GNU Library General" changedto "GNU Lesser General"
 file format changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...linux-setup.c-Use-POSIX-basename-API.patch | 54 -----------
 ...Fix-add_buffer_phys_virt-align-issue.patch | 50 ----------
 ...uilding-on-x86_64-with-binutils-2.41.patch | 95 -------------------
 ...-tools_2.0.28.bb => kexec-tools_2.0.29.bb} | 11 +--
 4 files changed, 4 insertions(+), 206 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.28.bb => kexec-tools_2.0.29.bb} (87%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
deleted file mode 100644
index e223f45998..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-linux-setup.c-Use-POSIX-basename-API.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 32c8ffa7ace6f1b7e63f9ddffab00b00c36a7b57 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 May 2024 21:18:08 -0700
-Subject: [PATCH] x86-linux-setup.c: Use POSIX basename API
-
-Musl C library only supports POSIX basename function. while glibc has
-both GNU extention as well as POSIX basename implemented. Switch to
-using posix version, so it can work across musl and glibc
-
-basename prototype has been removed from string.h from latest musl [1]
-compilers e.g. clang-18/GCC-14 flags the absense of prototype as error.
-therefore include libgen.h for providing it.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/kexec/2024-May/030034.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- kexec/arch/i386/x86-linux-setup.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
-index 9a281dc..73251b9 100644
---- a/kexec/arch/i386/x86-linux-setup.c
-+++ b/kexec/arch/i386/x86-linux-setup.c
-@@ -14,6 +14,7 @@
-  *
-  */
- #define _GNU_SOURCE
-+#include <libgen.h>
- #include <stdint.h>
- #include <stdio.h>
- #include <string.h>
-@@ -329,12 +330,14 @@ static int add_edd_entry(struct x86_linux_param_header *real_mode,
- 	memset(edd_info, 0, sizeof(struct edd_info));
- 
- 	/* extract the device number */
--	if (sscanf(basename(sysfs_name), "int13_dev%hhx", &devnum) != 1) {
-+	char* sysfs_name_copy = strdup(sysfs_name);
-+	if (sscanf(basename(sysfs_name_copy), "int13_dev%hhx", &devnum) != 1) {
- 		fprintf(stderr, "Invalid format of int13_dev dir "
--				"entry: %s\n", basename(sysfs_name));
-+				"entry: %s\n", basename(sysfs_name_copy));
-+		free(sysfs_name_copy);
- 		return -1;
- 	}
--
-+	free(sysfs_name_copy);
- 	/* if there's a MBR signature, then add it */
- 	if (file_scanf(sysfs_name, "mbr_signature", "0x%x", &mbr_sig) == 1) {
- 		real_mode->edd_mbr_sig_buffer[*current_mbr] = mbr_sig;
--- 
-2.45.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
deleted file mode 100644
index 489b109285..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From b62c1da8f8e641397add10367ee9c4cfdedb1cc0 Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Mon, 9 Jan 2017 15:26:29 +0800
-Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue
-
-When "CONFIG_ARM_LPAE" is enabled,3 level page table
-is used by MMU, the "SECTION_SIZE" is defined with
-(1 << 21), but 'add_buffer_phys_virt()' hardcode this
-to (1 << 20).
-
-Upstream-Status: Submitted [via email to horms@kernel.org,http://lists.infradead.org/pipermail/kexec/2024-April/029903.html]
-
-Suggested-By:fredrik.markstrom@gmail.com
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-
----
- kexec/arch/arm/crashdump-arm.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-arm.c
-index 1ec1826..cc20f63 100644
---- a/kexec/arch/arm/crashdump-arm.c
-+++ b/kexec/arch/arm/crashdump-arm.c
-@@ -242,6 +242,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
- 	void *buf;
- 	int err;
- 	int last_ranges;
-+	unsigned short align_bit_shift = 20;
- 
- 	/*
- 	 * First fetch all the memory (RAM) ranges that we are going to pass to
-@@ -283,6 +284,7 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
- 
- 		/* for support LPAE enabled kernel*/
- 		elf_info.class = ELFCLASS64;
-+		align_bit_shift = 21;
- 
- 		err = crash_create_elf64_headers(info, &elf_info,
- 					 usablemem_rgns.ranges,
-@@ -304,8 +306,9 @@ int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline)
- 	 * 1MB) so that available memory passed in kernel command line will be
- 	 * aligned to 1MB. This is because kernel create_mapping() wants memory
- 	 * regions to be aligned to SECTION_SIZE.
-+	 * The SECTION_SIZE of LPAE kernel is '1UL << 21' defined in pgtable-3level.h
- 	 */
--	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << 20,
-+	elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 << align_bit_shift,
- 					  crash_kernel_mem.start,
- 					  crash_kernel_mem.end, -1, 0);
- 
diff --git a/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch b/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch
deleted file mode 100644
index 4894f044fc..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Michel Lind <salimma@fedoraproject.org>
-Date: Tue, 30 Jan 2024 04:14:31 -0600
-Subject: [PATCH] Fix building on x86_64 with binutils 2.41
-
-Newer versions of the GNU assembler (observed with binutils 2.41) will
-complain about the ".arch i386" in files assembled with "as --64",
-with the message "Error: 64bit mode not supported on 'i386'".
-
-Fix by moving ".arch i386" below the relevant ".code32" directive, so
-that the assembler is no longer expecting 64-bit instructions to be used
-by the time that the ".arch i386" directive is encountered.
-
-Based on similar iPXE fix:
-https://github.com/ipxe/ipxe/commit/6ca597eee
-
-Signed-off-by: Michel Lind <michel@michel-slm.name>
-Signed-off-by: Simon Horman <horms@kernel.org>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?h=main&id=328de8e00e298f00d7ba6b25dc3950147e9642e6]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- purgatory/arch/i386/entry32-16-debug.S | 2 +-
- purgatory/arch/i386/entry32-16.S       | 2 +-
- purgatory/arch/i386/entry32.S          | 2 +-
- purgatory/arch/i386/setup-x86.S        | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
-index 5167944..12e1164 100644
---- a/purgatory/arch/i386/entry32-16-debug.S
-+++ b/purgatory/arch/i386/entry32-16-debug.S
-@@ -25,10 +25,10 @@
- 	.globl entry16_debug_pre32
- 	.globl entry16_debug_first32
- 	.globl entry16_debug_old_first32
--	.arch i386
- 	.balign 16
- entry16_debug:
- 	.code32
-+	.arch i386
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
-index c051aab..eace095 100644
---- a/purgatory/arch/i386/entry32-16.S
-+++ b/purgatory/arch/i386/entry32-16.S
-@@ -20,10 +20,10 @@
- #undef i386	
- 	.text
- 	.globl entry16, entry16_regs
--	.arch i386
- 	.balign 16
- entry16:
- 	.code32
-+	.arch i386
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32.S b/purgatory/arch/i386/entry32.S
-index f7a494f..8ce9e31 100644
---- a/purgatory/arch/i386/entry32.S
-+++ b/purgatory/arch/i386/entry32.S
-@@ -20,10 +20,10 @@
- #undef i386
- 
- 	.text
--	.arch	i386
- 	.globl entry32, entry32_regs
- entry32:
- 	.code32
-+	.arch	i386
- 
- 	/* Setup a gdt that should that is generally usefully */
- 	lgdt	%cs:gdt
-diff --git a/purgatory/arch/i386/setup-x86.S b/purgatory/arch/i386/setup-x86.S
-index 201bb2c..a212eed 100644
---- a/purgatory/arch/i386/setup-x86.S
-+++ b/purgatory/arch/i386/setup-x86.S
-@@ -21,10 +21,10 @@
- #undef i386
- 
- 	.text
--	.arch	i386
- 	.globl purgatory_start
- purgatory_start:
- 	.code32
-+	.arch	i386
- 
- 	/* Load a gdt so I know what the segment registers are */
- 	lgdt	%cs:gdt
--- 
-2.39.2
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
similarity index 87%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
index b60c51df4a..b88db60ee8 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
@@ -1,11 +1,11 @@
-
 SUMMARY = "Kexec fast reboot tools"
 DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linux kernel"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
-                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09 \
+                    "
 DEPENDS = "zlib xz"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
@@ -14,14 +14,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://kdump.service \
            file://0001-powerpc-change-the-memory-size-limit.patch \
            file://0002-purgatory-Pass-r-directly-to-linker.patch \
-           file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
-           file://Fix-building-on-x86_64-with-binutils-2.41.patch \
-           file://0001-x86-linux-setup.c-Use-POSIX-basename-API.patch \
            "
 
-SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
+SRC_URI[sha256sum] = "0756dd54dab2f2a437e5d4df64b9760c3e6cf6a7d29fb296bdeeeb749f6ea28e"
 
 inherit autotools update-rc.d systemd
 
-- 
2.34.1


