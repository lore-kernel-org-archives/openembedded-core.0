Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.13231.1602771351323072215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sQKQsaIH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id d6so1676520plo.13
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fPiOvjBPjHU2ZukziVrYDwVrHSnr9hYLLSRaD+jSqM0=;
        b=sQKQsaIHIrFE4Y4nsqKq87SSORQdCkEBkDW9gvgr2HgvTo8YXqnJPl4nwibarFbFVC
         F8l2o9Z4HCd/7RfXeIIwzSxnqXVpWXYdRQlli2BeENGy8gkrqNQmU/gn+7JXinnBoQ5p
         eLVnVJLv6V0v4T4ZzhAmyPWvClQqPTVdtRIAcaODwyaWm8SCy293fg3go4AypuaoxzFZ
         Ltf5CYwKxfEubutl38Ds8d5gG0KEE4Nv4p+BE07/WnK7LvNxDkr6ujykoq/f90mThuy0
         M9kU23II658yKTS2AUeUyIZrL4x4CWtPKPComlt72QkQRAFL5i/M6/vGcSv8wGpfQ7vz
         YCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fPiOvjBPjHU2ZukziVrYDwVrHSnr9hYLLSRaD+jSqM0=;
        b=rDo2ubu820u75Mx8RWXo+bg6h9G3oaFny/hMbfy6enKrZRDzO4DVG+cneFyT3K38aE
         eWIqhyUA8Ou5Ix7b9JvtW44zbBhphETlLINoyPh0B4MT/3kWjvYBqDEIHJwkv5YapGrT
         AnQg4y58TFHcGN4InqGbmfLD2dhqx+8Hwzm7jtbEDio/DkTMGLxUMt0y834TdFxrjFw9
         TFo+G+RVV3FVE2lWTDUBqB8yybEqOnC1QayhKx/koZl6lhb+e9biboLuf5C1eSKOEN0X
         PvXZtN40KjbB5fynMrmEttNWy462Lb31jeQzxjM7w3YVKDJSnj29YNznhijzqjIhaYL6
         XsUQ==
X-Gm-Message-State: AOAM533wfK6JHdX5AornCmLT0pjB5xWJskMYj0GbC/WCwJ4jYH51qemk
	GEFWT+7wsw4t3DkMX7RZySAvoGmJLCB5Az3/
X-Google-Smtp-Source: ABdhPJxxZ1jhZSlkYqHpS4QUG/jh8qZO21klKwQDAjltBrNLm+jTLn60DVoekr507KdWpbYva4iMnw==
X-Received: by 2002:a17:90a:d146:: with SMTP id t6mr4586807pjw.76.1602771350177;
        Thu, 15 Oct 2020 07:15:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/8] qemu: add 34Kf-64tlb fictitious cpu type
Date: Thu, 15 Oct 2020 04:15:11 -1000
Message-Id: <464f9f50bce368fb5109a5d7cc06cc25b0bfbe6a.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>

From: Victor Kamensky <kamensky@cisco.com>

In Yocto Project PR 13992 it was reported that qemumips
in autobuilder runs almost twice slower then qemumips64 and
some times hit time out.

Upon investigations of qemu-system with perf, gdb, and
SystemTap and comparing qemumips and qemumips64 machines
behavior it was noticed that qemu soft mmu code behaves
quite different and in case if qemumips tlbwr instruction
called 16 times more oftern. It happens that in qemumips64
case qemu runs with cpu type that contains 64 TLB, but in case
of qemumips qemu runs with cpu type that contains only
16 TLBs.

The idea of proposed qemu patch is to introduce fictitious
34Kf-64tlb cpu type that defined exactly as 34Kf but has
64 TLBs, instead of original 16 TLBs.

Testing of core-image-full-cmdline:do_testimage with
34Kf-64tlb shows 40% or so test execution real time
improvement.

Note for future porters of the patch: easiest way to update
the patch and be in sync with 34Kf definition is to copy
34Kf machine definition and apply the following changes to
it (just change 15 to 63 of CP0C1_MMU bits value)

[kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c
2c2
<         .name = "34Kf",
>         .name = "34Kf-64tlb",
6c6
<         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
>         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992

Upstream Status: Inappropriate

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4470a04943352224955f17e004962f0f9e1c9b0c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7ce89c0023..7c21b66a0c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -48,6 +48,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2020-14364.patch \
 	   file://CVE-2020-14415.patch \
 	   file://CVE-2020-16092.patch \
+	   file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
new file mode 100644
index 0000000000..b6312e1543
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
@@ -0,0 +1,118 @@
+From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 2001
+From: Victor Kamensky <kamensky@cisco.com>
+Date: Wed, 7 Oct 2020 10:19:42 -0700
+Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf but with
+ 64 TLBs
+
+In Yocto Project CI runs it was observed that test run
+of 32 bit mips image takes almost twice longer than 64 bit
+mips image with the same logical load and CI execution
+hits timeout.
+
+See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
+
+Yocto project uses 34Kf cpu type to run 32 bit mips image,
+and MIPS64R2-generic cpu type to run 64 bit mips64 image.
+
+Upon qemu behavior differences investigation between mips
+and mips64 two prominent observations came up: under
+logically similar load (same definition and configuration
+of user-land image) in case of mips get_physical_address
+function is called almost twice more often, meaning
+twice more memory accesses involved in this case. Also
+number of tlbwr instruction executed (r4k_helper_tlbwr
+qemu function) almost 16 time bigger in mips case than in
+mips64.
+
+It turns out that 34Kf cpu has 16 TLBs, but in case of
+MIPS64R2-generic it is 64 TLBs. So that explains why
+some many more tlbwr had to be execute by kernel TLB refill
+handler in case of 32 bit misp.
+
+The idea of the fix is to come up with new 34Kf-64tlb fictitious
+cpu type, that would behave exactly as 34Kf but it would
+contain 64 TLBs to reduce TLB trashing. After all, adding
+more TLBs to soft mmu is easy.
+
+Experiment with some significant non-trvial load in Yocto
+environment by running do_testimage load shows that 34Kf-64tlb
+cpu performs 40% or so better than original 34Kf cpu wrt test
+execution real time.
+
+It is not ideal to have cpu type that does not exist in the
+wild but given performance gains it seems to be justified.
+
+Signed-off-by: Victor Kamensky <kamensky@cisco.com>
+---
+ target/mips/translate_init.inc.c | 55 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 55 insertions(+)
+
+diff --git a/target/mips/translate_init.inc.c b/target/mips/translate_init.inc.c
+index 637caccd89..b73ab48231 100644
+--- a/target/mips/translate_init.inc.c
++++ b/target/mips/translate_init.inc.c
+@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =
+         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
+         .mmu_type = MMU_TYPE_R4000,
+     },
++    /*
++     * Verbatim copy of "34Kf" cpu, only bumped up number of TLB entries
++     * from 16 to 64 (see CP0_Config0 value at CP0C1_MMU bits) to improve
++     * performance by reducing number of TLB refill exceptions and
++     * eliminating need to run all corresponding TLB refill handling
++     * instructions.
++     */
++    {
++        .name = "34Kf-64tlb",
++        .CP0_PRid = 0x00019500,
++        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
++                       (MMU_TYPE_R4000 << CP0C0_MT),
++        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
++                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
++                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
++                       (1 << CP0C1_CA),
++        .CP0_Config2 = MIPS_CONFIG2,
++        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 << CP0C3_MT) |
++                       (1 << CP0C3_DSPP),
++        .CP0_LLAddr_rw_bitmask = 0,
++        .CP0_LLAddr_shift = 0,
++        .SYNCI_Step = 32,
++        .CCRes = 2,
++        .CP0_Status_rw_bitmask = 0x3778FF1F,
++        .CP0_TCStatus_rw_bitmask = (0 << CP0TCSt_TCU3) | (0 << CP0TCSt_TCU2) |
++                    (1 << CP0TCSt_TCU1) | (1 << CP0TCSt_TCU0) |
++                    (0 << CP0TCSt_TMX) | (1 << CP0TCSt_DT) |
++                    (1 << CP0TCSt_DA) | (1 << CP0TCSt_A) |
++                    (0x3 << CP0TCSt_TKSU) | (1 << CP0TCSt_IXMT) |
++                    (0xff << CP0TCSt_TASID),
++        .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
++                    (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
++        .CP1_fcr31 = 0,
++        .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
++        .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
++        .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
++        .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
++                    (0x3fe << CP0SRSC0_SRS2) | (0x3fe << CP0SRSC0_SRS1),
++        .CP0_SRSConf1_rw_bitmask = 0x3fffffff,
++        .CP0_SRSConf1 = (1U << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SRS6) |
++                    (0x3fe << CP0SRSC1_SRS5) | (0x3fe << CP0SRSC1_SRS4),
++        .CP0_SRSConf2_rw_bitmask = 0x3fffffff,
++        .CP0_SRSConf2 = (1U << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SRS9) |
++                    (0x3fe << CP0SRSC2_SRS8) | (0x3fe << CP0SRSC2_SRS7),
++        .CP0_SRSConf3_rw_bitmask = 0x3fffffff,
++        .CP0_SRSConf3 = (1U << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SRS12) |
++                    (0x3fe << CP0SRSC3_SRS11) | (0x3fe << CP0SRSC3_SRS10),
++        .CP0_SRSConf4_rw_bitmask = 0x3fffffff,
++        .CP0_SRSConf4 = (0x3fe << CP0SRSC4_SRS15) |
++                    (0x3fe << CP0SRSC4_SRS14) | (0x3fe << CP0SRSC4_SRS13),
++        .SEGBITS = 32,
++        .PABITS = 32,
++        .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
++        .mmu_type = MMU_TYPE_R4000,
++    },
+     {
+         .name = "74Kf",
+         .CP0_PRid = 0x00019700,
+-- 
+2.14.5
+
-- 
2.17.1

