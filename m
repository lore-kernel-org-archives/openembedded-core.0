Return-Path: <markusv@linux4biz.eu>
X-Greylist: delayed 466 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Jul 2017 14:29:16 UTC
Received: from mail.linux4biz.eu (mx.linux4biz.eu [62.219.174.245])
	by mail.openembedded.org (Postfix) with ESMTP id B374C781F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 14:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.linux4biz.eu (Postfix) with ESMTP id C73C7BE5F3B;
	Fri, 14 Jul 2017 17:21:30 +0300 (IDT)
X-Virus-Scanned: by amavisd-new-2.10.1 (20141025) (Debian) at linux4biz.eu
Received: from mail.linux4biz.eu ([127.0.0.1])
	by localhost (mail.linux4biz.eu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBsEsT6qhAuB; Fri, 14 Jul 2017 17:21:23 +0300 (IDT)
Received: from lenovo_markus.muc.linux4biz.de (unknown [217.111.52.143])
	by mail.linux4biz.eu (Postfix) with ESMTPSA id 23041BE5EE3;
	Fri, 14 Jul 2017 17:21:22 +0300 (IDT)
From: Markus Valentin <markusv@linux4biz.eu>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 16:20:18 +0200
Message-Id: <20170714142018.25469-1-markusv@linux4biz.eu>
X-Mailer: git-send-email 2.13.2
MIME-Version: 1.0
Subject: [krogoth][PATCH] qemu: make UNDEF registers RAZ for ID_AA64*
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
X-List-Received-Date: Fri, 14 Jul 2017 14:29:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

when running qemu-system for aarch64 which does get built within the
sdk from the krogoth branch it does give the following error (when
run with -d unimp)

"read access to unsupported AArch64 system register op0:3 op1:0 crn:0
crm:7 op2:2"

This error results in an not bootable kernel on qemu

	https://lkml.org/lkml/2016/3/30/35

to fix this issue this patch applies the patch "Make reserved ranges
 in ID_AA64* spaces RAZ, not UNDEF"  by Ard Biesheuvel from the qemu-devel
mailinglist.

https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04574.html

Signed-off-by: Markus Valentin <markusv@linux4biz.eu>
---
 ...Make-reserved-ranges-in-ID_AA64-spaces-RA.patch | 243 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |   1 +
 2 files changed, 244 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/target-arm-Make-reserved-ranges-in-ID_AA64-spaces-RA.patch

diff --git a/meta/recipes-devtools/qemu/qemu/target-arm-Make-reserved-ranges-in-ID_AA64-spaces-RA.patch b/meta/recipes-devtools/qemu/qemu/target-arm-Make-reserved-ranges-in-ID_AA64-spaces-RA.patch
new file mode 100644
index 0000000000..22363b2665
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/target-arm-Make-reserved-ranges-in-ID_AA64-spaces-RA.patch
@@ -0,0 +1,243 @@
+From cab1cc724572a1e418249f827b5f958bd23b1004 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Fri, 19 Feb 2016 14:07:43 +0000
+Subject: [PATCH] target-arm: Make reserved ranges in ID_AA64* spaces RAZ, not
+ UNDEF
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The v8 ARM ARM defines that unused spaces in the ID_AA64* system
+register ranges are Reserved and must RAZ, rather than being UNDEF.
+Implement this.
+
+In particular, ARM v8.2 adds a new feature register ID_AA64MMFR2,
+and newer versions of the Linux kernel will attempt to read this,
+which causes them not to boot up on versions of QEMU missing this fix.
+
+Since the encoding .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6
+is actually defined in ARMv8 (as ID_MMFR4), we give it an entry in
+the ARMCPU struct so CPUs can override it, though since none do
+this too will just RAZ.
+
+Cc: qemu-stable@nongnu.org
+Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Message-id: 1455890863-11203-1-git-send-email-peter.maydell@linaro.org
+Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
+Tested-by: Alex Bennée <alex.bennee@linaro.org>
+(cherry picked from commit e20d84c1407d43d5a2e2ac95dbb46db3b0af8f9f)
+
+Conflicts:
+	target-arm/helper.c
+
+* remove context dep on 4054bfa9
+
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+---
+ target-arm/cpu-qom.h |   1 +
+ target-arm/helper.c  | 128 ++++++++++++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 122 insertions(+), 7 deletions(-)
+
+diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
+index 25fb1ce0f3..9376eafcbe 100644
+--- a/target-arm/cpu-qom.h
++++ b/target-arm/cpu-qom.h
+@@ -150,6 +150,7 @@ typedef struct ARMCPU {
+     uint32_t id_mmfr1;
+     uint32_t id_mmfr2;
+     uint32_t id_mmfr3;
++    uint32_t id_mmfr4;
+     uint32_t id_isar0;
+     uint32_t id_isar1;
+     uint32_t id_isar2;
+diff --git a/target-arm/helper.c b/target-arm/helper.c
+index afc4163342..1743e37ab4 100644
+--- a/target-arm/helper.c
++++ b/target-arm/helper.c
+@@ -4092,12 +4092,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 5,
+               .access = PL1_R, .type = ARM_CP_CONST,
+               .resetvalue = cpu->id_isar5 },
+-            /* 6..7 are as yet unallocated and must RAZ */
+-            { .name = "ID_ISAR6", .cp = 15, .crn = 0, .crm = 2,
+-              .opc1 = 0, .opc2 = 6, .access = PL1_R, .type = ARM_CP_CONST,
+-              .resetvalue = 0 },
+-            { .name = "ID_ISAR7", .cp = 15, .crn = 0, .crm = 2,
+-              .opc1 = 0, .opc2 = 7, .access = PL1_R, .type = ARM_CP_CONST,
++            { .name = "ID_MMFR4", .state = ARM_CP_STATE_BOTH,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = cpu->id_mmfr4 },
++            /* 7 is as yet unallocated and must RAZ */
++            { .name = "ID_ISAR7_RESERVED", .state = ARM_CP_STATE_BOTH,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 7,
++              .access = PL1_R, .type = ARM_CP_CONST,
+               .resetvalue = 0 },
+             REGINFO_SENTINEL
+         };
+@@ -4151,7 +4153,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
+     }
+     if (arm_feature(env, ARM_FEATURE_V8)) {
+-        /* AArch64 ID registers, which all have impdef reset values */
++        /* AArch64 ID registers, which all have impdef reset values.
++         * Note that within the ID register ranges the unused slots
++         * must all RAZ, not UNDEF; future architecture versions may
++         * define new registers here.
++         */
+         ARMCPRegInfo v8_idregs[] = {
+             { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
+@@ -4161,6 +4167,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
+               .access = PL1_R, .type = ARM_CP_CONST,
+               .resetvalue = cpu->id_aa64pfr1},
++            { .name = "ID_AA64PFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 2,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64PFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 3,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64PFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64PFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 6,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64PFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 7,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
+             { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
+               .access = PL1_R, .type = ARM_CP_CONST,
+@@ -4174,6 +4204,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
+               .access = PL1_R, .type = ARM_CP_CONST,
+               .resetvalue = cpu->id_aa64dfr1 },
++            { .name = "ID_AA64DFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 2,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64DFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 3,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
+             { .name = "ID_AA64AFR0_EL1", .state = ARM_CP_STATE_AA64,
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 4,
+               .access = PL1_R, .type = ARM_CP_CONST,
+@@ -4182,6 +4220,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 5,
+               .access = PL1_R, .type = ARM_CP_CONST,
+               .resetvalue = cpu->id_aa64afr1 },
++            { .name = "ID_AA64AFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 6,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64AFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 7,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
+             { .name = "ID_AA64ISAR0_EL1", .state = ARM_CP_STATE_AA64,
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 0,
+               .access = PL1_R, .type = ARM_CP_CONST,
+@@ -4190,6 +4236,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 1,
+               .access = PL1_R, .type = ARM_CP_CONST,
+               .resetvalue = cpu->id_aa64isar1 },
++            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64ISAR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 4,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64ISAR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 5,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64ISAR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 6,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64ISAR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 7,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
+             { .name = "ID_AA64MMFR0_EL1", .state = ARM_CP_STATE_AA64,
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
+               .access = PL1_R, .type = ARM_CP_CONST,
+@@ -4198,6 +4268,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 1,
+               .access = PL1_R, .type = ARM_CP_CONST,
+               .resetvalue = cpu->id_aa64mmfr1 },
++            { .name = "ID_AA64MMFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 2,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64MMFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 3,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64MMFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 4,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64MMFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 5,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64MMFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 6,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "ID_AA64MMFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 7,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
+             { .name = "MVFR0_EL1", .state = ARM_CP_STATE_AA64,
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 0,
+               .access = PL1_R, .type = ARM_CP_CONST,
+@@ -4210,6 +4304,26 @@ void register_cp_regs_for_features(ARMCPU *cpu)
+               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
+               .access = PL1_R, .type = ARM_CP_CONST,
+               .resetvalue = cpu->mvfr2 },
++            { .name = "MVFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 3,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "MVFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 4,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "MVFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
++            { .name = "MVFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
++              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
++              .access = PL1_R, .type = ARM_CP_CONST,
++              .resetvalue = 0 },
+             REGINFO_SENTINEL
+         };
+         /* RVBAR_EL1 is only implemented if EL1 is the highest EL */
+--
+2.13.2
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index b965f6916c..173a9add6e 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2016-5403.patch \
             file://CVE-2016-4441.patch \
             file://CVE-2016-4952.patch \
+            file://target-arm-Make-reserved-ranges-in-ID_AA64-spaces-RA.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
2.13.2


