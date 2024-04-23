Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403C1C04FFE
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 19:50:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.4862.1713901826203956058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 12:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ggse12TN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240423195022b3f959b6d29909f91b-koigz9@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240423195022b3f959b6d29909f91b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 23 Apr 2024 21:50:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EZnr/4VsllcWFW2KHuqThNKBQR6EaD+IryFxj2txoCU=;
 b=ggse12TNx5/DAC8b8+k99QTT8d6YW8KzLjEP1bfgcjhkIpFDdCVeo2wWZjEp/RJYRQJjd6
 YU0lKP0312Qzt7jnLfKHlXLao/kazDfi+Xvle1+JMQ3w66npplFLn3jE1XR55ChH+mYexFtA
 6kNu4m56W9wuFU87GYsQjAdntfNwc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glibc: Update to latest on stable 2.35 branch
Date: Tue, 23 Apr 2024 21:49:25 +0200
Message-Id: <20240423194925.3856376-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 19:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198632

From: Peter Marko <peter.marko@siemens.com>

Adresses CVE-2024-2961

Changes:
36280d1ce5 iconv: ISO-2022-CN-EXT: fix out-of-bound writes when writing escape sequence (CVE-2024-2961)
4a7de5e215 powerpc: Fix ld.so address determination for PCREL mode (bug 31640)
f4a45af368 AArch64: Check kernel version for SVE ifuncs
7f3c143381 aarch64: fix check for SVE support in assembler
9112cda4c6 aarch64: correct CFI in rawmemchr (bug 31113)
153012dda2 AArch64: Remove Falkor memcpy
90b03336d9 AArch64: Add memset_zva64
d166309459 AArch64: Cleanup emag memset
650300d233 AArch64: Cleanup ifuncs
5bfa9f4369 AArch64: Add support for MOPS memcpy/memmove/memset
c4e222334b Add HWCAP2_MOPS from Linux 6.5 to AArch64 bits/hwcap.h
b9e93c5ff7 AArch64: Improve SVE memcpy and memmove
115c2c7717 AArch64: Improve strrchr
06fad28274 AArch64: Optimize strnlen
3a1557efef AArch64: Optimize strlen
6f2ca6aab9 AArch64: Optimize strcpy
249fff42a8 AArch64: Improve strchrnul
1c1313dbdd AArch64: Optimize strchr
80ad6cd302 AArch64: Improve strlen_asimd
65c4bb41b6 AArch64: Optimize memrchr
23be6f897e AArch64: Optimize memchr
28e40b3909 aarch64: Use memcpy_simd as the default memcpy
c503e2206e aarch64: Cleanup memset ifunc
577bd1e049 AArch64: Fix typo in sve configure check (BZ# 29394)
ea25fe5599 aarch64: Optimize string functions with shrn instruction
2c4ae9faa5 AArch64: Sort makefile entries
2c92d94407 AArch64: Add SVE memcpy
d6d295a95b linux: Use rseq area unconditionally in sched_getcpu (bug 31479)
dda5faa65e Include sys/rseq.h in tst-rseq-disable.c
c9ee9cc8b8 nptl: Unconditionally use a 32-byte rseq area
3cd02612e8 make ‘struct pthread’ a complete type
a24adf3572 support: use 64-bit time_t (bug 30111)
d47c5e4db7 malloc: Use __get_nprocs on arena_get2 (BZ 30945)
1a3326df93 x86_64: Optimize ffsll function code size.
914af4fcca NEWS: Mention bug fixes for 29039/30745/30843
5d1fe26b49 x86-64: Fix the tcb field load for x32 [BZ #31185]
2d87262c1c x86-64: Fix the dtv field load for x32 [BZ #31184]
5f08ec08d0 elf: Fix TLS modid reuse generation assignment (BZ 29039)
01ea8d9dde Revert "elf: Move l_init_called_next to old place of l_text_end in link map"
0222f2392d Revert "elf: Always call destructors in reverse constructor order (bug 30785)"
6aa8380cf5 Revert "elf: Remove unused l_text_end field from struct link_map"

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.35.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index e0d47f283b..cd8c7ecf94 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "c84018a05aec80f5ee6f682db0da1130b0196aef"
+SRCREV_glibc ?= "36280d1ce5e245aabefb877fe4d3c6cff95dabfa"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 751427517f..74d7f753d8 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -24,7 +24,7 @@ CVE_CHECK_IGNORE += "CVE-2019-1010025"
 CVE_CHECK_IGNORE += "CVE-2023-4527"
 
 # To avoid these in cve-check reports since the recipe version did not change
-CVE_CHECK_IGNORE += "CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156"
+CVE_CHECK_IGNORE += "CVE-2023-0687 CVE-2023-4813 CVE-2023-4806 CVE-2023-4911 CVE-2023-5156 CVE-2024-2961"
 
 DEPENDS += "gperf-native bison-native"
 
-- 
2.30.2


