Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web11.715.1602103133405032609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 13:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=QAvVs5jA;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: kamensky@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=8359; q=dns/txt; s=iport;
  t=1602103133; x=1603312733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NshAqrdGlNZyW2KFDCKvD1VMoRG+DG68oaQ8c+vnPRs=;
  b=QAvVs5jAh/9W9hOh1wXiUUDse2rNfLFjXkh7zfiSCqmukqOBkgVjSbnV
   U5sXu6+o/QMKR6GOgjnMMW0LaVvf1InpKCogsqvqEB5Qhywp3mPyJJ9oZ
   jtkLSipChfa/WvFtZpur8KKHs6JPHXVupUR1iNJL1SzYk1N8JOoGZuqwH
   k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BeBACTJn5f/5hdJa1gHQEBAQEJARI?=
 =?us-ascii?q?BBQUBgg+BdTVwVQEyLJV7nCYLAQEBDQEBIwwEAQGESgKCBwIlOBMCAwEBCwE?=
 =?us-ascii?q?BBQEBAQIBBgRthVwMhXIBAwMyATkNEBwDAQIvTwgZgyYBgnwPp3kZNYIohVS?=
 =?us-ascii?q?FBwaBOIg0hH8bggCDbHOCXAQBFoc9BJMCh2cBgWybAoJygxSFbJFYDyKDE54?=
 =?us-ascii?q?alRSIdpUrAgQGBQIVgWsjgVdNIxWDJFAZDZckhWIhAzACNQIGCgEBAwmOSAE?=
 =?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.77,348,1596499200"; 
   d="scan'208";a="576519510"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 07 Oct 2020 20:38:52 +0000
Received: from kamensky-p53s.cisco.com ([10.24.45.79])
	(authenticated bits=0)
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPSA id 097Kceis028064
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 7 Oct 2020 20:38:52 GMT
From: "Victor Kamensky" <kamensky@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
Date: Wed,  7 Oct 2020 13:38:37 -0700
Message-Id: <20201007203838.19096-2-kamensky@cisco.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007203838.19096-1-kamensky@cisco.com>
References: <20201007203838.19096-1-kamensky@cisco.com>
MIME-Version: 1.0
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.45.79, [10.24.45.79]
X-Outbound-Node: rcdn-core-1.cisco.com
Content-Transfer-Encoding: 8bit

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
---
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 ...Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 +++++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bbb9038961..6c0edcb706 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://find_datadir.patch \
            file://usb-fix-setup_len-init.patch \
+           file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch \
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
2.14.5

