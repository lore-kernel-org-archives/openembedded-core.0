Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA2871FA7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:39:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA6FdNwC019054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 07:39:23 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 6 Nov 2014 07:39:22 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <fathi.boudra@linaro.org>, <joe.slater@windriver.com>,
	<mark.hatle@windriver.com>
Date: Thu, 6 Nov 2014 23:34:21 +0800
Message-ID: <3d098b59f0e39704ed8f58020e8aba82c0c58fc2.1415264549.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 18/25] qemu: add signle step support for aarch64
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
X-List-Received-Date: Thu, 06 Nov 2014 15:39:23 -0000
Content-Type: text/plain

Backport patches to enable signle-step support for aarch64.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...Collect-up-the-debug-cp-register-definiti.patch | 177 ++++++++++++
 ...Allow-STATE_BOTH-reginfo-descriptions-for.patch |  57 ++++
 ...Provide-both-32-and-64-bit-versions-of-de.patch |  89 ++++++
 ...get-arm-Adjust-debug-ID-registers-per-CPU.patch | 142 ++++++++++
 ...Don-t-allow-AArch32-to-access-RES0-CPSR-b.patch | 118 ++++++++
 ...Correctly-handle-PSTATE.SS-when-taking-ex.patch |  38 +++
 ...Set-PSTATE.SS-correctly-on-exception-retu.patch | 152 +++++++++++
 ...A64-Avoid-duplicate-exit_tb-0-in-non-link.patch |  47 ++++
 ...Implement-ARMv8-single-step-handling-for-.patch | 302 +++++++++++++++++++++
 ...Implement-ARMv8-single-stepping-for-AArch.patch | 212 +++++++++++++++
 ...t-arm-Implement-MDSCR_EL1-as-having-state.patch |  36 +++
 meta/recipes-devtools/qemu/qemu_2.1.2.bb           |  11 +
 12 files changed, 1381 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-arm-Collect-up-the-debug-cp-register-definiti.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-target-arm-Allow-STATE_BOTH-reginfo-descriptions-for.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-target-arm-Provide-both-32-and-64-bit-versions-of-de.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-target-arm-Adjust-debug-ID-registers-per-CPU.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-target-arm-Don-t-allow-AArch32-to-access-RES0-CPSR-b.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006-target-arm-Correctly-handle-PSTATE.SS-when-taking-ex.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007-target-arm-Set-PSTATE.SS-correctly-on-exception-retu.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0008-target-arm-A64-Avoid-duplicate-exit_tb-0-in-non-link.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0009-target-arm-Implement-ARMv8-single-step-handling-for-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-target-arm-Implement-ARMv8-single-stepping-for-AArch.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-target-arm-Implement-MDSCR_EL1-as-having-state.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-arm-Collect-up-the-debug-cp-register-definiti.patch b/meta/recipes-devtools/qemu/qemu/0001-target-arm-Collect-up-the-debug-cp-register-definiti.patch
new file mode 100644
index 0000000..84c9c86
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-arm-Collect-up-the-debug-cp-register-definiti.patch
@@ -0,0 +1,177 @@
+From 503006983a19be0b481946afac2cab0bdd21f124 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:25 +0100
+Subject: [PATCH 01/11] target-arm: Collect up the debug cp register
+ definitions
+
+At the moment we have a mixed set of mostly dummy register
+definitions for various debug related registers which have
+been added piecemeal in order to get Linux kernels to boot.
+In preparation for actually implementing debug support,
+bring them all together into one place.
+
+This commit doesn't change behaviour: we still expose
+exactly the same registers and behaviour to the guest
+in all configurations.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/helper.c | 85 +++++++++++++++++++++++++++++++++--------------------
+ 1 file changed, 53 insertions(+), 32 deletions(-)
+
+diff --git a/target-arm/helper.c b/target-arm/helper.c
+index f630d96..a9be7ba 100644
+--- a/target-arm/helper.c
++++ b/target-arm/helper.c
+@@ -389,12 +389,6 @@ static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
+ }
+ 
+ static const ARMCPRegInfo cp_reginfo[] = {
+-    /* DBGDIDR: just RAZ. In particular this means the "debug architecture
+-     * version" bits will read as a reserved value, which should cause
+-     * Linux to not try to use the debug hardware.
+-     */
+-    { .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
+-      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+     { .name = "FCSEIDR", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 0,
+       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.c13_fcse),
+       .resetvalue = 0, .writefn = fcse_write, .raw_writefn = raw_write, },
+@@ -471,6 +465,13 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
+     { .name = "DUMMY", .cp = 15, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = CP_ANY,
+       .access = PL1_R, .type = ARM_CP_CONST | ARM_CP_NO_MIGRATE,
+       .resetvalue = 0 },
++    /* We don't implement pre-v7 debug but most CPUs had at least a DBGDIDR;
++     * implementing it as RAZ means the "debug architecture version" bits
++     * will read as a reserved value, which should cause Linux to not try
++     * to use the debug hardware.
++     */
++    { .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
++      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+     REGINFO_SENTINEL
+ };
+ 
+@@ -712,13 +713,6 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+ }
+ 
+ static const ARMCPRegInfo v7_cp_reginfo[] = {
+-    /* DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
+-     * debug components
+-     */
+-    { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
+-      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+-    { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
+-      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+     /* the old v6 WFI, UNPREDICTABLE in v7 but we choose to NOP */
+     { .name = "NOP", .cp = 15, .crn = 7, .crm = 0, .opc1 = 0, .opc2 = 4,
+       .access = PL1_W, .type = ARM_CP_NOP },
+@@ -1734,11 +1728,6 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
+     { .name = "AMAIR1", .cp = 15, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 1,
+       .access = PL1_RW, .type = ARM_CP_CONST | ARM_CP_OVERRIDE,
+       .resetvalue = 0 },
+-    /* 64 bit access versions of the (dummy) debug registers */
+-    { .name = "DBGDRAR", .cp = 14, .crm = 1, .opc1 = 0,
+-      .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
+-    { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
+-      .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
+     { .name = "PAR", .cp = 15, .crm = 7, .opc1 = 0,
+       .access = PL1_RW, .type = ARM_CP_64BIT,
+       .fieldoffset = offsetof(CPUARMState, cp15.par_el1), .resetvalue = 0 },
+@@ -2083,16 +2072,6 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
+       .opc1 = 0, .crn = 3, .crm = 0, .opc2 = 0,
+       .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.c3),
+       .resetvalue = 0, .writefn = dacr_write, .raw_writefn = raw_write, },
+-    /* Dummy implementation of monitor debug system control register:
+-     * we don't support debug.
+-     */
+-    { .name = "MDSCR_EL1", .state = ARM_CP_STATE_AA64,
+-      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
+-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+-    /* We define a dummy WI OSLAR_EL1, because Linux writes to it. */
+-    { .name = "OSLAR_EL1", .state = ARM_CP_STATE_AA64,
+-      .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
+-      .access = PL1_W, .type = ARM_CP_NOP },
+     { .name = "ELR_EL1", .state = ARM_CP_STATE_AA64,
+       .type = ARM_CP_NO_MIGRATE,
+       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 0, .opc2 = 1,
+@@ -2206,13 +2185,55 @@ static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri)
+     return CP_ACCESS_OK;
+ }
+ 
+-static void define_aarch64_debug_regs(ARMCPU *cpu)
++static const ARMCPRegInfo debug_cp_reginfo[] = {
++    /* DBGDIDR: just RAZ. In particular this means the "debug architecture
++     * version" bits will read as a reserved value, which should cause
++     * Linux to not try to use the debug hardware.
++     */
++    { .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
++      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
++    /* DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
++     * debug components
++     */
++    { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
++      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
++    { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
++      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
++    /* Dummy implementation of monitor debug system control register:
++     * we don't support debug.
++     */
++    { .name = "MDSCR_EL1", .state = ARM_CP_STATE_AA64,
++      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
++      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
++    /* We define a dummy WI OSLAR_EL1, because Linux writes to it. */
++    { .name = "OSLAR_EL1", .state = ARM_CP_STATE_AA64,
++      .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
++      .access = PL1_W, .type = ARM_CP_NOP },
++    REGINFO_SENTINEL
++};
++
++static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
++    /* 64 bit access versions of the (dummy) debug registers */
++    { .name = "DBGDRAR", .cp = 14, .crm = 1, .opc1 = 0,
++      .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
++    { .name = "DBGDSAR", .cp = 14, .crm = 2, .opc1 = 0,
++      .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
++    REGINFO_SENTINEL
++};
++
++static void define_debug_regs(ARMCPU *cpu)
+ {
+-    /* Define breakpoint and watchpoint registers. These do nothing
+-     * but read as written, for now.
++    /* Define v7 and v8 architectural debug registers.
++     * These are just dummy implementations for now.
+      */
+     int i;
+ 
++    define_arm_cp_regs(cpu, debug_cp_reginfo);
++
++    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
++        define_arm_cp_regs(cpu, debug_lpae_cp_reginfo);
++    }
++
+     for (i = 0; i < 16; i++) {
+         ARMCPRegInfo dbgregs[] = {
+             { .name = "DBGBVR", .state = ARM_CP_STATE_AA64,
+@@ -2353,6 +2374,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+         };
+         define_one_arm_cp_reg(cpu, &clidr);
+         define_arm_cp_regs(cpu, v7_cp_reginfo);
++        define_debug_regs(cpu);
+     } else {
+         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
+     }
+@@ -2426,7 +2448,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+         define_one_arm_cp_reg(cpu, &rvbar);
+         define_arm_cp_regs(cpu, v8_idregs);
+         define_arm_cp_regs(cpu, v8_cp_reginfo);
+-        define_aarch64_debug_regs(cpu);
+     }
+     if (arm_feature(env, ARM_FEATURE_EL2)) {
+         define_arm_cp_regs(cpu, v8_el2_cp_reginfo);
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-target-arm-Allow-STATE_BOTH-reginfo-descriptions-for.patch b/meta/recipes-devtools/qemu/qemu/0002-target-arm-Allow-STATE_BOTH-reginfo-descriptions-for.patch
new file mode 100644
index 0000000..398276b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-target-arm-Allow-STATE_BOTH-reginfo-descriptions-for.patch
@@ -0,0 +1,57 @@
+From 58a1d8ceabbbf0ddaa8d6d81faa2f77816d35e18 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:25 +0100
+Subject: [PATCH 02/11] target-arm: Allow STATE_BOTH reginfo descriptions for
+ more than cp14
+
+Currently the STATE_BOTH shorthand for allowing a single reginfo struct
+to define handling for both AArch32 and AArch64 views of a register
+only permits this where the AArch32 view is in cp15. It turns out that
+the debug registers in cp14 also have neatly lined up encodings;
+allow these also to share reginfo structs by permitting a STATE_BOTH
+reginfo to specify the .cp field (and continue to default to 15 if
+it is not specified).
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/helper.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/target-arm/helper.c b/target-arm/helper.c
+index a9be7ba..8239aea 100644
+--- a/target-arm/helper.c
++++ b/target-arm/helper.c
+@@ -2800,9 +2800,11 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
+         /* The AArch32 view of a shared register sees the lower 32 bits
+          * of a 64 bit backing field. It is not migratable as the AArch64
+          * view handles that. AArch64 also handles reset.
+-         * We assume it is a cp15 register.
++         * We assume it is a cp15 register if the .cp field is left unset.
+          */
+-        r2->cp = 15;
++        if (r2->cp == 0) {
++            r2->cp = 15;
++        }
+         r2->type |= ARM_CP_NO_MIGRATE;
+         r2->resetfn = arm_cp_reset_ignore;
+ #ifdef HOST_WORDS_BIGENDIAN
+@@ -2815,8 +2817,11 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
+         /* To allow abbreviation of ARMCPRegInfo
+          * definitions, we treat cp == 0 as equivalent to
+          * the value for "standard guest-visible sysreg".
++         * STATE_BOTH definitions are also always "standard
++         * sysreg" in their AArch64 view (the .cp value may
++         * be non-zero for the benefit of the AArch32 view).
+          */
+-        if (r->cp == 0) {
++        if (r->cp == 0 || r->state == ARM_CP_STATE_BOTH) {
+             r2->cp = CP_REG_ARM64_SYSREG_CP;
+         }
+         *key = ENCODE_AA64_CP_REG(r2->cp, r2->crn, crm,
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-target-arm-Provide-both-32-and-64-bit-versions-of-de.patch b/meta/recipes-devtools/qemu/qemu/0003-target-arm-Provide-both-32-and-64-bit-versions-of-de.patch
new file mode 100644
index 0000000..849f20a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-target-arm-Provide-both-32-and-64-bit-versions-of-de.patch
@@ -0,0 +1,89 @@
+From 10aae1049fe90b84798af2751051ea896437a831 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:25 +0100
+Subject: [PATCH 03/11] target-arm: Provide both 32 and 64 bit versions of
+ debug registers
+
+Bring the 32 bit and 64 bit views of the debug registers into
+line by providing the same set of registers in both cases.
+(This still isn't a complete set, but it is consistent.)
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/helper.c | 34 ++++++++++++++++++++--------------
+ 1 file changed, 20 insertions(+), 14 deletions(-)
+
+diff --git a/target-arm/helper.c b/target-arm/helper.c
+index 8239aea..700057d 100644
+--- a/target-arm/helper.c
++++ b/target-arm/helper.c
+@@ -2193,21 +2193,27 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
+     { .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
+       .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+     /* DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
+-     * debug components
++     * debug components. The AArch64 version of DBGDRAR is named MDRAR_EL1;
++     * unlike DBGDRAR it is never accessible from EL0.
++     * DBGDSAR is deprecated and must RAZ from v8 anyway, so it has no AArch64
++     * accessor.
+      */
+     { .name = "DBGDRAR", .cp = 14, .crn = 1, .crm = 0, .opc1 = 0, .opc2 = 0,
+       .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
++    { .name = "MDRAR_EL1", .state = ARM_CP_STATE_AA64,
++      .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
++      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+     { .name = "DBGDSAR", .cp = 14, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 0,
+       .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+     /* Dummy implementation of monitor debug system control register:
+-     * we don't support debug.
++     * we don't support debug. (The 32-bit alias is DBGDSCRext.)
+      */
+-    { .name = "MDSCR_EL1", .state = ARM_CP_STATE_AA64,
+-      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
++    { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
++      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
+       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+     /* We define a dummy WI OSLAR_EL1, because Linux writes to it. */
+-    { .name = "OSLAR_EL1", .state = ARM_CP_STATE_AA64,
+-      .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
++    { .name = "OSLAR_EL1", .state = ARM_CP_STATE_BOTH,
++      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
+       .access = PL1_W, .type = ARM_CP_NOP },
+     REGINFO_SENTINEL
+ };
+@@ -2236,20 +2242,20 @@ static void define_debug_regs(ARMCPU *cpu)
+ 
+     for (i = 0; i < 16; i++) {
+         ARMCPRegInfo dbgregs[] = {
+-            { .name = "DBGBVR", .state = ARM_CP_STATE_AA64,
+-              .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
++            { .name = "DBGBVR", .state = ARM_CP_STATE_BOTH,
++              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
+               .access = PL1_RW,
+               .fieldoffset = offsetof(CPUARMState, cp15.dbgbvr[i]) },
+-            { .name = "DBGBCR", .state = ARM_CP_STATE_AA64,
+-              .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
++            { .name = "DBGBCR", .state = ARM_CP_STATE_BOTH,
++              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
+               .access = PL1_RW,
+               .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]) },
+-            { .name = "DBGWVR", .state = ARM_CP_STATE_AA64,
+-              .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
++            { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
++              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
+               .access = PL1_RW,
+               .fieldoffset = offsetof(CPUARMState, cp15.dbgwvr[i]) },
+-            { .name = "DBGWCR", .state = ARM_CP_STATE_AA64,
+-              .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
++            { .name = "DBGWCR", .state = ARM_CP_STATE_BOTH,
++              .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 7,
+               .access = PL1_RW,
+               .fieldoffset = offsetof(CPUARMState, cp15.dbgwcr[i]) },
+                REGINFO_SENTINEL
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0004-target-arm-Adjust-debug-ID-registers-per-CPU.patch b/meta/recipes-devtools/qemu/qemu/0004-target-arm-Adjust-debug-ID-registers-per-CPU.patch
new file mode 100644
index 0000000..cff6e8c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0004-target-arm-Adjust-debug-ID-registers-per-CPU.patch
@@ -0,0 +1,142 @@
+From 48eb3ae64b3e17151cf8f42af185e6f43baf707b Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:25 +0100
+Subject: [PATCH 04/11] target-arm: Adjust debug ID registers per-CPU
+
+Allow each CPU type to specify the value for the debug ID
+registers, by putting them in the ARMCPU struct, and use
+the resulting information to only expose the correct number
+of watchpoint and breakpoint registers for the CPU.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/cpu-qom.h |  1 +
+ target-arm/cpu.c     |  3 +++
+ target-arm/cpu64.c   |  1 +
+ target-arm/helper.c  | 33 ++++++++++++++++++++++++++-------
+ 4 files changed, 31 insertions(+), 7 deletions(-)
+
+diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
+index ee4fbb1..07f3c9e 100644
+--- a/target-arm/cpu-qom.h
++++ b/target-arm/cpu-qom.h
+@@ -148,6 +148,7 @@ typedef struct ARMCPU {
+     uint64_t id_aa64isar1;
+     uint64_t id_aa64mmfr0;
+     uint64_t id_aa64mmfr1;
++    uint32_t dbgdidr;
+     uint32_t clidr;
+     /* The elements of this array are the CCSIDR values for each cache,
+      * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
+diff --git a/target-arm/cpu.c b/target-arm/cpu.c
+index 7cebb76..e27cca2 100644
+--- a/target-arm/cpu.c
++++ b/target-arm/cpu.c
+@@ -640,6 +640,7 @@ static void cortex_a8_initfn(Object *obj)
+     cpu->id_isar2 = 0x21232031;
+     cpu->id_isar3 = 0x11112131;
+     cpu->id_isar4 = 0x00111142;
++    cpu->dbgdidr = 0x15141000;
+     cpu->clidr = (1 << 27) | (2 << 24) | 3;
+     cpu->ccsidr[0] = 0xe007e01a; /* 16k L1 dcache. */
+     cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
+@@ -712,6 +713,7 @@ static void cortex_a9_initfn(Object *obj)
+     cpu->id_isar2 = 0x21232041;
+     cpu->id_isar3 = 0x11112131;
+     cpu->id_isar4 = 0x00111142;
++    cpu->dbgdidr = 0x35141000;
+     cpu->clidr = (1 << 27) | (1 << 24) | 3;
+     cpu->ccsidr[0] = 0xe00fe015; /* 16k L1 dcache. */
+     cpu->ccsidr[1] = 0x200fe015; /* 16k L1 icache. */
+@@ -773,6 +775,7 @@ static void cortex_a15_initfn(Object *obj)
+     cpu->id_isar2 = 0x21232041;
+     cpu->id_isar3 = 0x11112131;
+     cpu->id_isar4 = 0x10011142;
++    cpu->dbgdidr = 0x3515f021;
+     cpu->clidr = 0x0a200023;
+     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
+index 8b2081c..38d2b84 100644
+--- a/target-arm/cpu64.c
++++ b/target-arm/cpu64.c
+@@ -127,6 +127,7 @@ static void aarch64_a57_initfn(Object *obj)
+     cpu->id_aa64dfr0 = 0x10305106;
+     cpu->id_aa64isar0 = 0x00010000;
+     cpu->id_aa64mmfr0 = 0x00001124;
++    cpu->dbgdidr = 0x3516d000;
+     cpu->clidr = 0x0a200023;
+     cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+diff --git a/target-arm/helper.c b/target-arm/helper.c
+index 700057d..22bf6d3 100644
+--- a/target-arm/helper.c
++++ b/target-arm/helper.c
+@@ -2186,12 +2186,6 @@ static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri)
+ }
+ 
+ static const ARMCPRegInfo debug_cp_reginfo[] = {
+-    /* DBGDIDR: just RAZ. In particular this means the "debug architecture
+-     * version" bits will read as a reserved value, which should cause
+-     * Linux to not try to use the debug hardware.
+-     */
+-    { .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
+-      .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = 0 },
+     /* DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
+      * debug components. The AArch64 version of DBGDRAR is named MDRAR_EL1;
+      * unlike DBGDRAR it is never accessible from EL0.
+@@ -2233,14 +2227,32 @@ static void define_debug_regs(ARMCPU *cpu)
+      * These are just dummy implementations for now.
+      */
+     int i;
++    int wrps, brps;
++    ARMCPRegInfo dbgdidr = {
++        .name = "DBGDIDR", .cp = 14, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 0,
++        .access = PL0_R, .type = ARM_CP_CONST, .resetvalue = cpu->dbgdidr,
++    };
++
++    brps = extract32(cpu->dbgdidr, 24, 4);
++    wrps = extract32(cpu->dbgdidr, 28, 4);
++
++    /* The DBGDIDR and ID_AA64DFR0_EL1 define various properties
++     * of the debug registers such as number of breakpoints;
++     * check that if they both exist then they agree.
++     */
++    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
++        assert(extract32(cpu->id_aa64dfr0, 12, 4) == brps);
++        assert(extract32(cpu->id_aa64dfr0, 20, 4) == wrps);
++    }
+ 
++    define_one_arm_cp_reg(cpu, &dbgdidr);
+     define_arm_cp_regs(cpu, debug_cp_reginfo);
+ 
+     if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
+         define_arm_cp_regs(cpu, debug_lpae_cp_reginfo);
+     }
+ 
+-    for (i = 0; i < 16; i++) {
++    for (i = 0; i < brps + 1; i++) {
+         ARMCPRegInfo dbgregs[] = {
+             { .name = "DBGBVR", .state = ARM_CP_STATE_BOTH,
+               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 4,
+@@ -2250,6 +2262,13 @@ static void define_debug_regs(ARMCPU *cpu)
+               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 5,
+               .access = PL1_RW,
+               .fieldoffset = offsetof(CPUARMState, cp15.dbgbcr[i]) },
++            REGINFO_SENTINEL
++        };
++        define_arm_cp_regs(cpu, dbgregs);
++    }
++
++    for (i = 0; i < wrps + 1; i++) {
++        ARMCPRegInfo dbgregs[] = {
+             { .name = "DBGWVR", .state = ARM_CP_STATE_BOTH,
+               .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = i, .opc2 = 6,
+               .access = PL1_RW,
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0005-target-arm-Don-t-allow-AArch32-to-access-RES0-CPSR-b.patch b/meta/recipes-devtools/qemu/qemu/0005-target-arm-Don-t-allow-AArch32-to-access-RES0-CPSR-b.patch
new file mode 100644
index 0000000..1e2211b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0005-target-arm-Don-t-allow-AArch32-to-access-RES0-CPSR-b.patch
@@ -0,0 +1,118 @@
+From 4051e12c5df1c46b542b28ed43f1614a42245ecf Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:26 +0100
+Subject: [PATCH 05/11] target-arm: Don't allow AArch32 to access RES0 CPSR
+ bits
+
+The CPSR has a new-in-v8 execution state bit (IL), and
+also some state which has effects in AArch32 but appears
+only in the SPSR format (SS) but is RES0 in the CPSR.
+
+Add the IL bit to CPSR_EXEC, and enforce that guest direct
+reads and writes to CPSR can't read or write the RES0
+bits, so the guest can't get at the SS bit which we store
+in uncached_cpsr. This includes not permitting exception
+returns to copy reserved bits from an SPSR into CPSR.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/cpu.h       | 12 ++++++++++--
+ target-arm/op_helper.c |  2 +-
+ target-arm/translate.c | 13 +++++++------
+ 3 files changed, 18 insertions(+), 9 deletions(-)
+
+diff --git a/target-arm/cpu.h b/target-arm/cpu.h
+index 79205ba..8380c13 100644
+--- a/target-arm/cpu.h
++++ b/target-arm/cpu.h
+@@ -411,7 +411,13 @@ int arm_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
+ #define CPSR_E (1U << 9)
+ #define CPSR_IT_2_7 (0xfc00U)
+ #define CPSR_GE (0xfU << 16)
+-#define CPSR_RESERVED (0xfU << 20)
++#define CPSR_IL (1U << 20)
++/* Note that the RESERVED bits include bit 21, which is PSTATE_SS in
++ * an AArch64 SPSR but RES0 in AArch32 SPSR and CPSR. In QEMU we use
++ * env->uncached_cpsr bit 21 to store PSTATE.SS when executing in AArch32,
++ * where it is live state but not accessible to the AArch32 code.
++ */
++#define CPSR_RESERVED (0x7U << 21)
+ #define CPSR_J (1U << 24)
+ #define CPSR_IT_0_1 (3U << 25)
+ #define CPSR_Q (1U << 27)
+@@ -428,7 +434,9 @@ int arm_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
+ /* Bits writable in user mode.  */
+ #define CPSR_USER (CPSR_NZCV | CPSR_Q | CPSR_GE)
+ /* Execution state bits.  MRS read as zero, MSR writes ignored.  */
+-#define CPSR_EXEC (CPSR_T | CPSR_IT | CPSR_J)
++#define CPSR_EXEC (CPSR_T | CPSR_IT | CPSR_J | CPSR_IL)
++/* Mask of bits which may be set by exception return copying them from SPSR */
++#define CPSR_ERET_MASK (~CPSR_RESERVED)
+ 
+ #define TTBCR_N      (7U << 0) /* TTBCR.EAE==0 */
+ #define TTBCR_T0SZ   (7U << 0) /* TTBCR.EAE==1 */
+diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
+index 25ad902..180a4a0 100644
+--- a/target-arm/op_helper.c
++++ b/target-arm/op_helper.c
+@@ -258,7 +258,7 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
+ 
+ uint32_t HELPER(cpsr_read)(CPUARMState *env)
+ {
+-    return cpsr_read(env) & ~CPSR_EXEC;
++    return cpsr_read(env) & ~(CPSR_EXEC | CPSR_RESERVED);
+ }
+ 
+ void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
+diff --git a/target-arm/translate.c b/target-arm/translate.c
+index 4012185..4cde309 100644
+--- a/target-arm/translate.c
++++ b/target-arm/translate.c
+@@ -3908,9 +3908,10 @@ static uint32_t msr_mask(CPUARMState *env, DisasContext *s, int flags, int spsr)
+         mask &= ~(CPSR_E | CPSR_GE);
+     if (!arm_feature(env, ARM_FEATURE_THUMB2))
+         mask &= ~CPSR_IT;
+-    /* Mask out execution state bits.  */
+-    if (!spsr)
+-        mask &= ~CPSR_EXEC;
++    /* Mask out execution state and reserved bits.  */
++    if (!spsr) {
++        mask &= ~(CPSR_EXEC | CPSR_RESERVED);
++    }
+     /* Mask out privileged bits.  */
+     if (IS_USER(s))
+         mask &= CPSR_USER;
+@@ -3954,7 +3955,7 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
+     TCGv_i32 tmp;
+     store_reg(s, 15, pc);
+     tmp = load_cpu_field(spsr);
+-    gen_set_cpsr(tmp, 0xffffffff);
++    gen_set_cpsr(tmp, CPSR_ERET_MASK);
+     tcg_temp_free_i32(tmp);
+     s->is_jmp = DISAS_UPDATE;
+ }
+@@ -3962,7 +3963,7 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
+ /* Generate a v6 exception return.  Marks both values as dead.  */
+ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
+ {
+-    gen_set_cpsr(cpsr, 0xffffffff);
++    gen_set_cpsr(cpsr, CPSR_ERET_MASK);
+     tcg_temp_free_i32(cpsr);
+     store_reg(s, 15, pc);
+     s->is_jmp = DISAS_UPDATE;
+@@ -8836,7 +8837,7 @@ static void disas_arm_insn(CPUARMState * env, DisasContext *s)
+                 if ((insn & (1 << 22)) && !user) {
+                     /* Restore CPSR from SPSR.  */
+                     tmp = load_cpu_field(spsr);
+-                    gen_set_cpsr(tmp, 0xffffffff);
++                    gen_set_cpsr(tmp, CPSR_ERET_MASK);
+                     tcg_temp_free_i32(tmp);
+                     s->is_jmp = DISAS_UPDATE;
+                 }
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0006-target-arm-Correctly-handle-PSTATE.SS-when-taking-ex.patch b/meta/recipes-devtools/qemu/qemu/0006-target-arm-Correctly-handle-PSTATE.SS-when-taking-ex.patch
new file mode 100644
index 0000000..2c824e0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0006-target-arm-Correctly-handle-PSTATE.SS-when-taking-ex.patch
@@ -0,0 +1,38 @@
+From 662cefb7753c1f04d960b443c60e7622c83144d3 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:26 +0100
+Subject: [PATCH 06/11] target-arm: Correctly handle PSTATE.SS when taking
+ exception to AArch32
+
+When an exception is taken to AArch32, we must clear the PSTATE.SS
+bit for the exception handler, and must also ensure that the SS bit
+is not set in the value saved to SPSR_<mode>. Achieve both of these
+aims by clearing the bit in uncached_cpsr before saving it to the SPSR.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/helper.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/target-arm/helper.c b/target-arm/helper.c
+index 22bf6d3..f981569 100644
+--- a/target-arm/helper.c
++++ b/target-arm/helper.c
+@@ -3550,6 +3550,10 @@ void arm_cpu_do_interrupt(CPUState *cs)
+         addr += env->cp15.vbar_el[1];
+     }
+     switch_mode (env, new_mode);
++    /* For exceptions taken to AArch32 we must clear the SS bit in both
++     * PSTATE and in the old-state value we save to SPSR_<mode>, so zero it now.
++     */
++    env->uncached_cpsr &= ~PSTATE_SS;
+     env->spsr = cpsr_read(env);
+     /* Clear IT bits.  */
+     env->condexec_bits = 0;
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0007-target-arm-Set-PSTATE.SS-correctly-on-exception-retu.patch b/meta/recipes-devtools/qemu/qemu/0007-target-arm-Set-PSTATE.SS-correctly-on-exception-retu.patch
new file mode 100644
index 0000000..ba9f4ad
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0007-target-arm-Set-PSTATE.SS-correctly-on-exception-retu.patch
@@ -0,0 +1,152 @@
+From 3a2982038afa0f04fc99b259e8ad8c18be0b04cb Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:26 +0100
+Subject: [PATCH 07/11] target-arm: Set PSTATE.SS correctly on exception return
+ from AArch64
+
+Set the PSTATE.SS bit correctly on exception returns from AArch64,
+as required by the debug single-step functionality.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/cpu.h       | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ target-arm/op_helper.c | 20 +++++++++++++++++
+ 2 files changed, 81 insertions(+)
+
+diff --git a/target-arm/cpu.h b/target-arm/cpu.h
+index 8380c13..74f7b15 100644
+--- a/target-arm/cpu.h
++++ b/target-arm/cpu.h
+@@ -220,6 +220,7 @@ typedef struct CPUARMState {
+         uint64_t dbgbcr[16]; /* breakpoint control registers */
+         uint64_t dbgwvr[16]; /* watchpoint value registers */
+         uint64_t dbgwcr[16]; /* watchpoint control registers */
++        uint64_t mdscr_el1;
+         /* If the counter is enabled, this stores the last time the counter
+          * was reset. Otherwise it stores the counter value
+          */
+@@ -1119,6 +1120,66 @@ static inline int cpu_mmu_index (CPUARMState *env)
+     return arm_current_pl(env);
+ }
+ 
++/* Return the Exception Level targeted by debug exceptions;
++ * currently always EL1 since we don't implement EL2 or EL3.
++ */
++static inline int arm_debug_target_el(CPUARMState *env)
++{
++    return 1;
++}
++
++static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
++{
++    if (arm_current_pl(env) == arm_debug_target_el(env)) {
++        if ((extract32(env->cp15.mdscr_el1, 13, 1) == 0)
++            || (env->daif & PSTATE_D)) {
++            return false;
++        }
++    }
++    return true;
++}
++
++static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
++{
++    if (arm_current_pl(env) == 0 && arm_el_is_aa64(env, 1)) {
++        return aa64_generate_debug_exceptions(env);
++    }
++    return arm_current_pl(env) != 2;
++}
++
++/* Return true if debugging exceptions are currently enabled.
++ * This corresponds to what in ARM ARM pseudocode would be
++ *    if UsingAArch32() then
++ *        return AArch32.GenerateDebugExceptions()
++ *    else
++ *        return AArch64.GenerateDebugExceptions()
++ * We choose to push the if() down into this function for clarity,
++ * since the pseudocode has it at all callsites except for the one in
++ * CheckSoftwareStep(), where it is elided because both branches would
++ * always return the same value.
++ *
++ * Parts of the pseudocode relating to EL2 and EL3 are omitted because we
++ * don't yet implement those exception levels or their associated trap bits.
++ */
++static inline bool arm_generate_debug_exceptions(CPUARMState *env)
++{
++    if (env->aarch64) {
++        return aa64_generate_debug_exceptions(env);
++    } else {
++        return aa32_generate_debug_exceptions(env);
++    }
++}
++
++/* Is single-stepping active? (Note that the "is EL_D AArch64?" check
++ * implicitly means this always returns false in pre-v8 CPUs.)
++ */
++static inline bool arm_singlestep_active(CPUARMState *env)
++{
++    return extract32(env->cp15.mdscr_el1, 0, 1)
++        && arm_el_is_aa64(env, arm_debug_target_el(env))
++        && arm_generate_debug_exceptions(env);
++}
++
+ #include "exec/cpu-all.h"
+ 
+ /* Bit usage in the TB flags field: bit 31 indicates whether we are
+diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
+index 180a4a0..62cc07d 100644
+--- a/target-arm/op_helper.c
++++ b/target-arm/op_helper.c
+@@ -380,12 +380,26 @@ void HELPER(exception_return)(CPUARMState *env)
+ 
+     env->exclusive_addr = -1;
+ 
++    /* We must squash the PSTATE.SS bit to zero unless both of the
++     * following hold:
++     *  1. debug exceptions are currently disabled
++     *  2. singlestep will be active in the EL we return to
++     * We check 1 here and 2 after we've done the pstate/cpsr write() to
++     * transition to the EL we're going to.
++     */
++    if (arm_generate_debug_exceptions(env)) {
++        spsr &= ~PSTATE_SS;
++    }
++
+     if (spsr & PSTATE_nRW) {
+         /* TODO: We currently assume EL1/2/3 are running in AArch64.  */
+         env->aarch64 = 0;
+         new_el = 0;
+         env->uncached_cpsr = 0x10;
+         cpsr_write(env, spsr, ~0);
++        if (!arm_singlestep_active(env)) {
++            env->uncached_cpsr &= ~PSTATE_SS;
++        }
+         for (i = 0; i < 15; i++) {
+             env->regs[i] = env->xregs[i];
+         }
+@@ -410,6 +424,9 @@ void HELPER(exception_return)(CPUARMState *env)
+         }
+         env->aarch64 = 1;
+         pstate_write(env, spsr);
++        if (!arm_singlestep_active(env)) {
++            env->pstate &= ~PSTATE_SS;
++        }
+         env->xregs[31] = env->sp_el[new_el];
+         env->pc = env->elr_el[cur_el];
+     }
+@@ -429,6 +446,9 @@ illegal_return:
+     spsr &= PSTATE_NZCV | PSTATE_DAIF;
+     spsr |= pstate_read(env) & ~(PSTATE_NZCV | PSTATE_DAIF);
+     pstate_write(env, spsr);
++    if (!arm_singlestep_active(env)) {
++        env->pstate &= ~PSTATE_SS;
++    }
+ }
+ 
+ /* ??? Flag setting arithmetic is awkward because we need to do comparisons.
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0008-target-arm-A64-Avoid-duplicate-exit_tb-0-in-non-link.patch b/meta/recipes-devtools/qemu/qemu/0008-target-arm-A64-Avoid-duplicate-exit_tb-0-in-non-link.patch
new file mode 100644
index 0000000..5eb6aec
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0008-target-arm-A64-Avoid-duplicate-exit_tb-0-in-non-link.patch
@@ -0,0 +1,47 @@
+From cc9c1ed14e876d724107fe72f74dcac71a003fbc Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:26 +0100
+Subject: [PATCH 08/11] target-arm: A64: Avoid duplicate exit_tb(0) in
+ non-linked goto_tb
+
+If gen_goto_tb() decides not to link the two TBs, then the
+fallback path generates unnecessary code:
+ * if singlestep is enabled then we generate unreachable code
+   after the gen_exception_internal(EXCP_DEBUG)
+ * if singlestep is disabled then we will generate exit_tb(0)
+   twice, once in gen_goto_tb() and once coming out of the
+   main loop with is_jmp set to DISAS_JUMP
+
+Correct these deficiencies by only emitting exit_tb() in the
+non-singlestep case, in which case we can use DISAS_TB_JUMP
+to suppress the main-loop exit_tb().
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/translate-a64.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
+index 2e21948..21a997f 100644
+--- a/target-arm/translate-a64.c
++++ b/target-arm/translate-a64.c
+@@ -234,9 +234,10 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
+         gen_a64_set_pc_im(dest);
+         if (s->singlestep_enabled) {
+             gen_exception_internal(EXCP_DEBUG);
++        } else {
++            tcg_gen_exit_tb(0);
++            s->is_jmp = DISAS_TB_JUMP;
+         }
+-        tcg_gen_exit_tb(0);
+-        s->is_jmp = DISAS_JUMP;
+     }
+ }
+ 
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0009-target-arm-Implement-ARMv8-single-step-handling-for-.patch b/meta/recipes-devtools/qemu/qemu/0009-target-arm-Implement-ARMv8-single-step-handling-for-.patch
new file mode 100644
index 0000000..c918521
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0009-target-arm-Implement-ARMv8-single-step-handling-for-.patch
@@ -0,0 +1,302 @@
+From 7ea47fe7be86faed4f38f0093ca1226b9b6043eb Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:26 +0100
+Subject: [PATCH 09/11] target-arm: Implement ARMv8 single-step handling for
+ A64 code
+
+Implement ARMv8 software single-step handling for A64 code:
+correctly update the single-step state machine and generate
+debug exceptions when stepping A64 code.
+
+This patch has no behavioural change since MDSCR_EL1.SS can't
+be set by the guest yet.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/cpu.h           | 21 +++++++++++
+ target-arm/helper.h        |  1 +
+ target-arm/internals.h     |  6 +++
+ target-arm/op_helper.c     |  5 +++
+ target-arm/translate-a64.c | 91 +++++++++++++++++++++++++++++++++++++++++++---
+ target-arm/translate.h     | 12 ++++++
+ 6 files changed, 131 insertions(+), 5 deletions(-)
+
+diff --git a/target-arm/cpu.h b/target-arm/cpu.h
+index 74f7b15..3d3e1d5 100644
+--- a/target-arm/cpu.h
++++ b/target-arm/cpu.h
+@@ -1211,6 +1211,10 @@ static inline bool arm_singlestep_active(CPUARMState *env)
+ #define ARM_TBFLAG_AA64_EL_MASK     (0x3 << ARM_TBFLAG_AA64_EL_SHIFT)
+ #define ARM_TBFLAG_AA64_FPEN_SHIFT  2
+ #define ARM_TBFLAG_AA64_FPEN_MASK   (1 << ARM_TBFLAG_AA64_FPEN_SHIFT)
++#define ARM_TBFLAG_AA64_SS_ACTIVE_SHIFT 3
++#define ARM_TBFLAG_AA64_SS_ACTIVE_MASK (1 << ARM_TBFLAG_AA64_SS_ACTIVE_SHIFT)
++#define ARM_TBFLAG_AA64_PSTATE_SS_SHIFT 4
++#define ARM_TBFLAG_AA64_PSTATE_SS_MASK (1 << ARM_TBFLAG_AA64_PSTATE_SS_SHIFT)
+ 
+ /* some convenience accessor macros */
+ #define ARM_TBFLAG_AARCH64_STATE(F) \
+@@ -1235,6 +1239,10 @@ static inline bool arm_singlestep_active(CPUARMState *env)
+     (((F) & ARM_TBFLAG_AA64_EL_MASK) >> ARM_TBFLAG_AA64_EL_SHIFT)
+ #define ARM_TBFLAG_AA64_FPEN(F) \
+     (((F) & ARM_TBFLAG_AA64_FPEN_MASK) >> ARM_TBFLAG_AA64_FPEN_SHIFT)
++#define ARM_TBFLAG_AA64_SS_ACTIVE(F) \
++    (((F) & ARM_TBFLAG_AA64_SS_ACTIVE_MASK) >> ARM_TBFLAG_AA64_SS_ACTIVE_SHIFT)
++#define ARM_TBFLAG_AA64_PSTATE_SS(F) \
++    (((F) & ARM_TBFLAG_AA64_PSTATE_SS_MASK) >> ARM_TBFLAG_AA64_PSTATE_SS_SHIFT)
+ 
+ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
+                                         target_ulong *cs_base, int *flags)
+@@ -1248,6 +1256,19 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
+         if (fpen == 3 || (fpen == 1 && arm_current_pl(env) != 0)) {
+             *flags |= ARM_TBFLAG_AA64_FPEN_MASK;
+         }
++        /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
++         * states defined in the ARM ARM for software singlestep:
++         *  SS_ACTIVE   PSTATE.SS   State
++         *     0            x       Inactive (the TB flag for SS is always 0)
++         *     1            0       Active-pending
++         *     1            1       Active-not-pending
++         */
++        if (arm_singlestep_active(env)) {
++            *flags |= ARM_TBFLAG_AA64_SS_ACTIVE_MASK;
++            if (env->pstate & PSTATE_SS) {
++                *flags |= ARM_TBFLAG_AA64_PSTATE_SS_MASK;
++            }
++        }
+     } else {
+         int privmode;
+         *pc = env->regs[15];
+diff --git a/target-arm/helper.h b/target-arm/helper.h
+index facfcd2..1d7003b 100644
+--- a/target-arm/helper.h
++++ b/target-arm/helper.h
+@@ -64,6 +64,7 @@ DEF_HELPER_3(set_cp_reg64, void, env, ptr, i64)
+ DEF_HELPER_2(get_cp_reg64, i64, env, ptr)
+ 
+ DEF_HELPER_3(msr_i_pstate, void, env, i32, i32)
++DEF_HELPER_1(clear_pstate_ss, void, env)
+ DEF_HELPER_1(exception_return, void, env)
+ 
+ DEF_HELPER_2(get_r13_banked, i32, env, i32)
+diff --git a/target-arm/internals.h b/target-arm/internals.h
+index 08fa697..53c2e3c 100644
+--- a/target-arm/internals.h
++++ b/target-arm/internals.h
+@@ -290,4 +290,10 @@ static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
+         | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
+ }
+ 
++static inline uint32_t syn_swstep(int same_el, int isv, int ex)
++{
++    return (EC_SOFTWARESTEP << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
++        | (isv << 24) | (ex << 6) | 0x22;
++}
++
+ #endif
+diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
+index 62cc07d..fe40358 100644
+--- a/target-arm/op_helper.c
++++ b/target-arm/op_helper.c
+@@ -369,6 +369,11 @@ void HELPER(msr_i_pstate)(CPUARMState *env, uint32_t op, uint32_t imm)
+     }
+ }
+ 
++void HELPER(clear_pstate_ss)(CPUARMState *env)
++{
++    env->pstate &= ~PSTATE_SS;
++}
++
+ void HELPER(exception_return)(CPUARMState *env)
+ {
+     int cur_el = arm_current_pl(env);
+diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
+index 21a997f..8e66b6c 100644
+--- a/target-arm/translate-a64.c
++++ b/target-arm/translate-a64.c
+@@ -205,10 +205,39 @@ static void gen_exception_insn(DisasContext *s, int offset, int excp,
+     s->is_jmp = DISAS_EXC;
+ }
+ 
++static void gen_ss_advance(DisasContext *s)
++{
++    /* If the singlestep state is Active-not-pending, advance to
++     * Active-pending.
++     */
++    if (s->ss_active) {
++        s->pstate_ss = 0;
++        gen_helper_clear_pstate_ss(cpu_env);
++    }
++}
++
++static void gen_step_complete_exception(DisasContext *s)
++{
++    /* We just completed step of an insn. Move from Active-not-pending
++     * to Active-pending, and then also take the swstep exception.
++     * This corresponds to making the (IMPDEF) choice to prioritize
++     * swstep exceptions over asynchronous exceptions taken to an exception
++     * level where debug is disabled. This choice has the advantage that
++     * we do not need to maintain internal state corresponding to the
++     * ISV/EX syndrome bits between completion of the step and generation
++     * of the exception, and our syndrome information is always correct.
++     */
++    gen_ss_advance(s);
++    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex));
++    s->is_jmp = DISAS_EXC;
++}
++
+ static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
+ {
+-    /* No direct tb linking with singlestep or deterministic io */
+-    if (s->singlestep_enabled || (s->tb->cflags & CF_LAST_IO)) {
++    /* No direct tb linking with singlestep (either QEMU's or the ARM
++     * debug architecture kind) or deterministic io
++     */
++    if (s->singlestep_enabled || s->ss_active || (s->tb->cflags & CF_LAST_IO)) {
+         return false;
+     }
+ 
+@@ -232,7 +261,9 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
+         s->is_jmp = DISAS_TB_JUMP;
+     } else {
+         gen_a64_set_pc_im(dest);
+-        if (s->singlestep_enabled) {
++        if (s->ss_active) {
++            gen_step_complete_exception(s);
++        } else if (s->singlestep_enabled) {
+             gen_exception_internal(EXCP_DEBUG);
+         } else {
+             tcg_gen_exit_tb(0);
+@@ -1449,6 +1480,12 @@ static void disas_exc(DisasContext *s, uint32_t insn)
+             unallocated_encoding(s);
+             break;
+         }
++        /* For SVC, HVC and SMC we advance the single-step state
++         * machine before taking the exception. This is architecturally
++         * mandated, to ensure that single-stepping a system call
++         * instruction works properly.
++         */
++        gen_ss_advance(s);
+         gen_exception_insn(s, 0, EXCP_SWI, syn_aa64_svc(imm16));
+         break;
+     case 1:
+@@ -1729,6 +1766,7 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
+ 
+     if (is_excl) {
+         if (!is_store) {
++            s->is_ldex = true;
+             gen_load_exclusive(s, rt, rt2, tcg_addr, size, is_pair);
+         } else {
+             gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, is_pair);
+@@ -10869,6 +10907,26 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
+     dc->current_pl = arm_current_pl(env);
+     dc->features = env->features;
+ 
++    /* Single step state. The code-generation logic here is:
++     *  SS_ACTIVE == 0:
++     *   generate code with no special handling for single-stepping (except
++     *   that anything that can make us go to SS_ACTIVE == 1 must end the TB;
++     *   this happens anyway because those changes are all system register or
++     *   PSTATE writes).
++     *  SS_ACTIVE == 1, PSTATE.SS == 1: (active-not-pending)
++     *   emit code for one insn
++     *   emit code to clear PSTATE.SS
++     *   emit code to generate software step exception for completed step
++     *   end TB (as usual for having generated an exception)
++     *  SS_ACTIVE == 1, PSTATE.SS == 0: (active-pending)
++     *   emit code to generate a software step exception
++     *   end the TB
++     */
++    dc->ss_active = ARM_TBFLAG_AA64_SS_ACTIVE(tb->flags);
++    dc->pstate_ss = ARM_TBFLAG_AA64_PSTATE_SS(tb->flags);
++    dc->is_ldex = false;
++    dc->ss_same_el = (arm_debug_target_el(env) == dc->current_pl);
++
+     init_tmp_a64_array(dc);
+ 
+     next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+@@ -10917,6 +10975,23 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
+             tcg_gen_debug_insn_start(dc->pc);
+         }
+ 
++        if (dc->ss_active && !dc->pstate_ss) {
++            /* Singlestep state is Active-pending.
++             * If we're in this state at the start of a TB then either
++             *  a) we just took an exception to an EL which is being debugged
++             *     and this is the first insn in the exception handler
++             *  b) debug exceptions were masked and we just unmasked them
++             *     without changing EL (eg by clearing PSTATE.D)
++             * In either case we're going to take a swstep exception in the
++             * "did not step an insn" case, and so the syndrome ISV and EX
++             * bits should be zero.
++             */
++            assert(num_insns == 0);
++            gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0));
++            dc->is_jmp = DISAS_EXC;
++            break;
++        }
++
+         disas_a64_insn(env, dc);
+ 
+         if (tcg_check_temp_count()) {
+@@ -10933,6 +11008,7 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
+     } while (!dc->is_jmp && tcg_ctx.gen_opc_ptr < gen_opc_end &&
+              !cs->singlestep_enabled &&
+              !singlestep &&
++             !dc->ss_active &&
+              dc->pc < next_page_start &&
+              num_insns < max_insns);
+ 
+@@ -10940,7 +11016,8 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
+         gen_io_end();
+     }
+ 
+-    if (unlikely(cs->singlestep_enabled) && dc->is_jmp != DISAS_EXC) {
++    if (unlikely(cs->singlestep_enabled || dc->ss_active)
++        && dc->is_jmp != DISAS_EXC) {
+         /* Note that this means single stepping WFI doesn't halt the CPU.
+          * For conditional branch insns this is harmless unreachable code as
+          * gen_goto_tb() has already handled emitting the debug exception
+@@ -10950,7 +11027,11 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
+         if (dc->is_jmp != DISAS_JUMP) {
+             gen_a64_set_pc_im(dc->pc);
+         }
+-        gen_exception_internal(EXCP_DEBUG);
++        if (cs->singlestep_enabled) {
++            gen_exception_internal(EXCP_DEBUG);
++        } else {
++            gen_step_complete_exception(dc);
++        }
+     } else {
+         switch (dc->is_jmp) {
+         case DISAS_NEXT:
+diff --git a/target-arm/translate.h b/target-arm/translate.h
+index 31a0104..b90d275 100644
+--- a/target-arm/translate.h
++++ b/target-arm/translate.h
+@@ -40,6 +40,18 @@ typedef struct DisasContext {
+      * that it is set at the point where we actually touch the FP regs.
+      */
+     bool fp_access_checked;
++    /* ARMv8 single-step state (this is distinct from the QEMU gdbstub
++     * single-step support).
++     */
++    bool ss_active;
++    bool pstate_ss;
++    /* True if the insn just emitted was a load-exclusive instruction
++     * (necessary for syndrome information for single step exceptions),
++     * ie A64 LDX*, LDAX*, A32/T32 LDREX*, LDAEX*.
++     */
++    bool is_ldex;
++    /* True if a single-step exception will be taken to the current EL */
++    bool ss_same_el;
+ #define TMP_A64_MAX 16
+     int tmp_a64_count;
+     TCGv_i64 tmp_a64[TMP_A64_MAX];
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0010-target-arm-Implement-ARMv8-single-stepping-for-AArch.patch b/meta/recipes-devtools/qemu/qemu/0010-target-arm-Implement-ARMv8-single-stepping-for-AArch.patch
new file mode 100644
index 0000000..22a90c4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0010-target-arm-Implement-ARMv8-single-stepping-for-AArch.patch
@@ -0,0 +1,212 @@
+From 50225ad0c185a16c472b3dce984c312e4399a3ef Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:27 +0100
+Subject: [PATCH 10/11] target-arm: Implement ARMv8 single-stepping for AArch32
+ code
+
+ARMv8 single-stepping requires the exception level that controls
+the single-stepping to be in AArch64 execution state, but the
+code being stepped may be in AArch64 or AArch32. Implement the
+necessary support code for single-stepping AArch32 code.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/cpu.h       | 21 ++++++++++++++
+ target-arm/translate.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++--
+ 2 files changed, 95 insertions(+), 2 deletions(-)
+
+diff --git a/target-arm/cpu.h b/target-arm/cpu.h
+index 3d3e1d5..8098b8d 100644
+--- a/target-arm/cpu.h
++++ b/target-arm/cpu.h
+@@ -1205,6 +1205,10 @@ static inline bool arm_singlestep_active(CPUARMState *env)
+ #define ARM_TBFLAG_BSWAP_CODE_MASK  (1 << ARM_TBFLAG_BSWAP_CODE_SHIFT)
+ #define ARM_TBFLAG_CPACR_FPEN_SHIFT 17
+ #define ARM_TBFLAG_CPACR_FPEN_MASK  (1 << ARM_TBFLAG_CPACR_FPEN_SHIFT)
++#define ARM_TBFLAG_SS_ACTIVE_SHIFT 18
++#define ARM_TBFLAG_SS_ACTIVE_MASK (1 << ARM_TBFLAG_SS_ACTIVE_SHIFT)
++#define ARM_TBFLAG_PSTATE_SS_SHIFT 19
++#define ARM_TBFLAG_PSTATE_SS_MASK (1 << ARM_TBFLAG_PSTATE_SS_SHIFT)
+ 
+ /* Bit usage when in AArch64 state */
+ #define ARM_TBFLAG_AA64_EL_SHIFT    0
+@@ -1235,6 +1239,10 @@ static inline bool arm_singlestep_active(CPUARMState *env)
+     (((F) & ARM_TBFLAG_BSWAP_CODE_MASK) >> ARM_TBFLAG_BSWAP_CODE_SHIFT)
+ #define ARM_TBFLAG_CPACR_FPEN(F) \
+     (((F) & ARM_TBFLAG_CPACR_FPEN_MASK) >> ARM_TBFLAG_CPACR_FPEN_SHIFT)
++#define ARM_TBFLAG_SS_ACTIVE(F) \
++    (((F) & ARM_TBFLAG_SS_ACTIVE_MASK) >> ARM_TBFLAG_SS_ACTIVE_SHIFT)
++#define ARM_TBFLAG_PSTATE_SS(F) \
++    (((F) & ARM_TBFLAG_PSTATE_SS_MASK) >> ARM_TBFLAG_PSTATE_SS_SHIFT)
+ #define ARM_TBFLAG_AA64_EL(F) \
+     (((F) & ARM_TBFLAG_AA64_EL_MASK) >> ARM_TBFLAG_AA64_EL_SHIFT)
+ #define ARM_TBFLAG_AA64_FPEN(F) \
+@@ -1292,6 +1300,19 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
+         if (fpen == 3 || (fpen == 1 && arm_current_pl(env) != 0)) {
+             *flags |= ARM_TBFLAG_CPACR_FPEN_MASK;
+         }
++        /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
++         * states defined in the ARM ARM for software singlestep:
++         *  SS_ACTIVE   PSTATE.SS   State
++         *     0            x       Inactive (the TB flag for SS is always 0)
++         *     1            0       Active-pending
++         *     1            1       Active-not-pending
++         */
++        if (arm_singlestep_active(env)) {
++            *flags |= ARM_TBFLAG_SS_ACTIVE_MASK;
++            if (env->uncached_cpsr & PSTATE_SS) {
++                *flags |= ARM_TBFLAG_PSTATE_SS_MASK;
++            }
++        }
+     }
+ 
+     *cs_base = 0;
+diff --git a/target-arm/translate.c b/target-arm/translate.c
+index 4cde309..2c0b1de 100644
+--- a/target-arm/translate.c
++++ b/target-arm/translate.c
+@@ -205,6 +205,33 @@ static void gen_exception(int excp, uint32_t syndrome)
+     tcg_temp_free_i32(tcg_excp);
+ }
+ 
++static void gen_ss_advance(DisasContext *s)
++{
++    /* If the singlestep state is Active-not-pending, advance to
++     * Active-pending.
++     */
++    if (s->ss_active) {
++        s->pstate_ss = 0;
++        gen_helper_clear_pstate_ss(cpu_env);
++    }
++}
++
++static void gen_step_complete_exception(DisasContext *s)
++{
++    /* We just completed step of an insn. Move from Active-not-pending
++     * to Active-pending, and then also take the swstep exception.
++     * This corresponds to making the (IMPDEF) choice to prioritize
++     * swstep exceptions over asynchronous exceptions taken to an exception
++     * level where debug is disabled. This choice has the advantage that
++     * we do not need to maintain internal state corresponding to the
++     * ISV/EX syndrome bits between completion of the step and generation
++     * of the exception, and our syndrome information is always correct.
++     */
++    gen_ss_advance(s);
++    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex));
++    s->is_jmp = DISAS_EXC;
++}
++
+ static void gen_smul_dual(TCGv_i32 a, TCGv_i32 b)
+ {
+     TCGv_i32 tmp1 = tcg_temp_new_i32();
+@@ -3860,7 +3887,7 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
+ 
+ static inline void gen_jmp (DisasContext *s, uint32_t dest)
+ {
+-    if (unlikely(s->singlestep_enabled)) {
++    if (unlikely(s->singlestep_enabled || s->ss_active)) {
+         /* An indirect jump so that we still trigger the debug exception.  */
+         if (s->thumb)
+             dest |= 1;
+@@ -7281,6 +7308,8 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
+ {
+     TCGv_i32 tmp = tcg_temp_new_i32();
+ 
++    s->is_ldex = true;
++
+     switch (size) {
+     case 0:
+         gen_aa32_ld8u(tmp, addr, get_mem_index(s));
+@@ -10917,6 +10946,26 @@ static inline void gen_intermediate_code_internal(ARMCPU *cpu,
+     dc->current_pl = arm_current_pl(env);
+     dc->features = env->features;
+ 
++    /* Single step state. The code-generation logic here is:
++     *  SS_ACTIVE == 0:
++     *   generate code with no special handling for single-stepping (except
++     *   that anything that can make us go to SS_ACTIVE == 1 must end the TB;
++     *   this happens anyway because those changes are all system register or
++     *   PSTATE writes).
++     *  SS_ACTIVE == 1, PSTATE.SS == 1: (active-not-pending)
++     *   emit code for one insn
++     *   emit code to clear PSTATE.SS
++     *   emit code to generate software step exception for completed step
++     *   end TB (as usual for having generated an exception)
++     *  SS_ACTIVE == 1, PSTATE.SS == 0: (active-pending)
++     *   emit code to generate a software step exception
++     *   end the TB
++     */
++    dc->ss_active = ARM_TBFLAG_SS_ACTIVE(tb->flags);
++    dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
++    dc->is_ldex = false;
++    dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
++
+     cpu_F0s = tcg_temp_new_i32();
+     cpu_F1s = tcg_temp_new_i32();
+     cpu_F0d = tcg_temp_new_i64();
+@@ -11026,6 +11075,22 @@ static inline void gen_intermediate_code_internal(ARMCPU *cpu,
+             tcg_gen_debug_insn_start(dc->pc);
+         }
+ 
++        if (dc->ss_active && !dc->pstate_ss) {
++            /* Singlestep state is Active-pending.
++             * If we're in this state at the start of a TB then either
++             *  a) we just took an exception to an EL which is being debugged
++             *     and this is the first insn in the exception handler
++             *  b) debug exceptions were masked and we just unmasked them
++             *     without changing EL (eg by clearing PSTATE.D)
++             * In either case we're going to take a swstep exception in the
++             * "did not step an insn" case, and so the syndrome ISV and EX
++             * bits should be zero.
++             */
++            assert(num_insns == 0);
++            gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0));
++            goto done_generating;
++        }
++
+         if (dc->thumb) {
+             disas_thumb_insn(env, dc);
+             if (dc->condexec_mask) {
+@@ -11058,6 +11123,7 @@ static inline void gen_intermediate_code_internal(ARMCPU *cpu,
+     } while (!dc->is_jmp && tcg_ctx.gen_opc_ptr < gen_opc_end &&
+              !cs->singlestep_enabled &&
+              !singlestep &&
++             !dc->ss_active &&
+              dc->pc < next_page_start &&
+              num_insns < max_insns);
+ 
+@@ -11073,12 +11139,15 @@ static inline void gen_intermediate_code_internal(ARMCPU *cpu,
+     /* At this stage dc->condjmp will only be set when the skipped
+        instruction was a conditional branch or trap, and the PC has
+        already been written.  */
+-    if (unlikely(cs->singlestep_enabled)) {
++    if (unlikely(cs->singlestep_enabled || dc->ss_active)) {
+         /* Make sure the pc is updated, and raise a debug exception.  */
+         if (dc->condjmp) {
+             gen_set_condexec(dc);
+             if (dc->is_jmp == DISAS_SWI) {
++                gen_ss_advance(dc);
+                 gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
++            } else if (dc->ss_active) {
++                gen_step_complete_exception(dc);
+             } else {
+                 gen_exception_internal(EXCP_DEBUG);
+             }
+@@ -11090,7 +11159,10 @@ static inline void gen_intermediate_code_internal(ARMCPU *cpu,
+         }
+         gen_set_condexec(dc);
+         if (dc->is_jmp == DISAS_SWI && !dc->condjmp) {
++            gen_ss_advance(dc);
+             gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
++        } else if (dc->ss_active) {
++            gen_step_complete_exception(dc);
+         } else {
+             /* FIXME: Single stepping a WFI insn will not halt
+                the CPU.  */
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu/0011-target-arm-Implement-MDSCR_EL1-as-having-state.patch b/meta/recipes-devtools/qemu/qemu/0011-target-arm-Implement-MDSCR_EL1-as-having-state.patch
new file mode 100644
index 0000000..28c76ad
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011-target-arm-Implement-MDSCR_EL1-as-having-state.patch
@@ -0,0 +1,36 @@
+From 0e5e8935bb93e80bb95dc79f51f5bf874ba2ab99 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Tue, 19 Aug 2014 18:56:27 +0100
+Subject: [PATCH 11/11] target-arm: Implement MDSCR_EL1 as having state
+
+Now that all the new code to support single-stepping is in
+place, wire up the guest-visible MDSCR_EL1, so the guest
+can enable single-stepping.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ target-arm/helper.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/target-arm/helper.c b/target-arm/helper.c
+index f981569..2a77c97 100644
+--- a/target-arm/helper.c
++++ b/target-arm/helper.c
+@@ -2204,7 +2204,9 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
+      */
+     { .name = "MDSCR_EL1", .state = ARM_CP_STATE_BOTH,
+       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 2,
+-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
++      .access = PL1_RW,
++      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1),
++      .resetvalue = 0 },
+     /* We define a dummy WI OSLAR_EL1, because Linux writes to it. */
+     { .name = "OSLAR_EL1", .state = ARM_CP_STATE_BOTH,
+       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 4,
+-- 
+2.1.1.273.g97b8860
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.2.bb b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
index b4e1cab..a2421c5 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
@@ -7,6 +7,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+            file://0001-target-arm-Collect-up-the-debug-cp-register-definiti.patch \
+            file://0002-target-arm-Allow-STATE_BOTH-reginfo-descriptions-for.patch \
+            file://0003-target-arm-Provide-both-32-and-64-bit-versions-of-de.patch \
+            file://0004-target-arm-Adjust-debug-ID-registers-per-CPU.patch \
+            file://0005-target-arm-Don-t-allow-AArch32-to-access-RES0-CPSR-b.patch \
+            file://0006-target-arm-Correctly-handle-PSTATE.SS-when-taking-ex.patch \
+            file://0007-target-arm-Set-PSTATE.SS-correctly-on-exception-retu.patch \
+            file://0008-target-arm-A64-Avoid-duplicate-exit_tb-0-in-non-link.patch \
+            file://0009-target-arm-Implement-ARMv8-single-step-handling-for-.patch \
+            file://0010-target-arm-Implement-ARMv8-single-stepping-for-AArch.patch \
+            file://0011-target-arm-Implement-MDSCR_EL1-as-having-state.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "0ff197c4ed4b695620bc4734e77c888f"
-- 
1.9.1


