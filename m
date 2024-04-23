Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8778C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 21:56:20 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.2467.1713909369819627053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 14:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iI0z1vaq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024042321560653b758833fed8d81a3-dohyob@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024042321560653b758833fed8d81a3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 23 Apr 2024 23:56:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/ds+baNorOBkdAHJYJju4VQBdXQeGfPHA75vNWPV4KQ=;
 b=iI0z1vaqJqNlZ7BEl42GaasjYtcmMn2uHcwz4wDLQeKwcIRrXHZa+24WeF8qJ1CbJKOZxh
 LhQ7x/S1SaWpYadkNC/F9T+V6ZK5+5RT7LEgW1hcAU8fof6Yft31SQ55D3GZ8chouGBSRTM2
 Ey0WYpkoQfyMFc+RoyGJAkIibNi9U=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][scarthgap][PATCH] glibc: Update to latest on stable 2.39 branch
Date: Tue, 23 Apr 2024 23:54:45 +0200
Message-Id: <20240423215445.1731153-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 21:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198633

From: Peter Marko <peter.marko@siemens.com>

Adresses CVE-2024-2961

Remove backported patch included in hash update.

Changes:
31da30f23c iconv: ISO-2022-CN-EXT: fix out-of-bound writes when writing escape sequence (CVE-2024-2961)
423099a032 x86_64: Exclude SSE, AVX and FMA4 variants in libm multiarch
04df8652eb Apply the Makefile sorting fix
edb9a76e30 powerpc: Fix ld.so address determination for PCREL mode (bug 31640)
7b92f46f04 x86-64: Simplify minimum ISA check ifdef conditional with if
9883f4304c x86-64: Don't use SSE resolvers for ISA level 3 or above
9d92452c70 AArch64: Check kernel version for SVE ifuncs
395a89f61e aarch64: fix check for SVE support in assembler
b0e0a07018 aarch64/fpu: Sync libmvec routines from 2.39 and before with AOR
31c7d69af5 i386: Use generic memrchr in libc (bug 31316)
5d070d12b3 x86: Expand the comment on when REP STOSB is used on memset
6484a92698 x86: Do not prefer ERMS for memset on Zen3+
aa4249266e x86: Fix Zen3/Zen4 ERMS selection (BZ 30994)
5a461f2949 Add tst-gnu2-tls2mod1 to test-internal-extras
aded2fc004 elf: Enable TLS descriptor tests on aarch64
a8ba52bde5 arm: Update _dl_tlsdesc_dynamic to preserve caller-saved registers (BZ 31372)
15aebdbada Ignore undefined symbols for -mtls-dialect=gnu2
354cabcb26 x86-64: Allocate state buffer space for RDI, RSI and RBX
853e915fdd x86-64: Update _dl_tlsdesc_dynamic to preserve AMX registers
a364304718 x86: Update _dl_tlsdesc_dynamic to preserve caller-saved registers
7fc8242bf8 x86-64: Save APX registers in ld.so trampoline
983f34a125 LoongArch: Correct {__ieee754, _}_scalb -> {__ieee754, _}_scalbf
aad45c8ac3 powerpc: Placeholder and infrastructure/build support to add Power11 related changes.
ee7f4c54e1 powerpc: Add HWCAP3/HWCAP4 data to TCB for Power Architecture.
71fcdba577 linux: Use rseq area unconditionally in sched_getcpu (bug 31479)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...e-Pass-mcpu-along-with-march-to-dete.patch | 62 -------------------
 ...ss.patch => 0023-qemu-stale-process.patch} |  0
 meta/recipes-core/glibc/glibc_2.39.bb         |  7 ++-
 4 files changed, 6 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
 rename meta/recipes-core/glibc/glibc/{0024-qemu-stale-process.patch => 0023-qemu-stale-process.patch} (100%)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 618a574566..4fc6986ffc 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "1b9c1a0047fb26a65a9b2a7b8cd977243f7d353c"
+SRCREV_glibc ?= "31da30f23cddd36db29d5b6a1c7619361b271fb4"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
deleted file mode 100644
index f6523c5498..0000000000
--- a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 73c26018ed0ecd9c807bb363cc2c2ab4aca66a82 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <szabolcs.nagy@arm.com>
-Date: Wed, 13 Mar 2024 14:34:14 +0000
-Subject: [PATCH] aarch64: fix check for SVE support in assembler
-
-Due to GCC bug 110901 -mcpu can override -march setting when compiling
-asm code and thus a compiler targetting a specific cpu can fail the
-configure check even when binutils gas supports SVE.
-
-The workaround is that explicit .arch directive overrides both -mcpu
-and -march, and since that's what the actual SVE memcpy uses the
-configure check should use that too even if the GCC issue is fixed
-independently.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=73c26018ed0ecd9c807bb363cc2c2ab4aca66a82]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Florian Weimer <fweimer@redhat.com>
----
- sysdeps/aarch64/configure    | 5 +++--
- sysdeps/aarch64/configure.ac | 5 +++--
- 2 files changed, 6 insertions(+), 4 deletions(-)
- mode change 100644 => 100755 sysdeps/aarch64/configure
-
-diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-old mode 100644
-new mode 100755
-index ca57edce47..9606137e8d
---- a/sysdeps/aarch64/configure
-+++ b/sysdeps/aarch64/configure
-@@ -325,9 +325,10 @@ then :
-   printf %s "(cached) " >&6
- else $as_nop
-   cat > conftest.s <<\EOF
--        ptrue p0.b
-+	.arch armv8.2-a+sve
-+	ptrue p0.b
- EOF
--if { ac_try='${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&5'
-+if { ac_try='${CC-cc} -c conftest.s 1>&5'
-   { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
-   (eval $ac_try) 2>&5
-   ac_status=$?
-diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 27874eceb4..56d12d661d 100644
---- a/sysdeps/aarch64/configure.ac
-+++ b/sysdeps/aarch64/configure.ac
-@@ -90,9 +90,10 @@ LIBC_CONFIG_VAR([aarch64-variant-pcs], [$libc_cv_aarch64_variant_pcs])
- # Check if asm support armv8.2-a+sve
- AC_CACHE_CHECK([for SVE support in assembler], [libc_cv_aarch64_sve_asm], [dnl
- cat > conftest.s <<\EOF
--        ptrue p0.b
-+	.arch armv8.2-a+sve
-+	ptrue p0.b
- EOF
--if AC_TRY_COMMAND(${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
-+if AC_TRY_COMMAND(${CC-cc} -c conftest.s 1>&AS_MESSAGE_LOG_FD); then
-   libc_cv_aarch64_sve_asm=yes
- else
-   libc_cv_aarch64_sve_asm=no
--- 
-2.44.0
-
diff --git a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch b/meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
similarity index 100%
rename from meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
rename to meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 9122472689..988e43c014 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -16,6 +16,10 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
+CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961"
+CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
+
 DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
@@ -48,8 +52,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
-           file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
-           file://0024-qemu-stale-process.patch \
+           file://0023-qemu-stale-process.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.30.2


