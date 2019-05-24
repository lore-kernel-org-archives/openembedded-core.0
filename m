Return-Path: <prvs=040baf4f1=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 5611E7E49D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558717812; x=1590253812;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=H6azo6Xi0lWFkyH6VZ3MwzRODNabQkzMy7SndcIceTA=;
	b=ZxXUtHRQBNv4LjXNu/V/LgzrZATZHjU/V/Sf01QAJK+zL/EqF87hLOKn
	k4iS12+0S+dICrbZQI0F1b7/H+1zdcO8XPGwi2dVm3q1VXoYowL3Q6Tm1
	y1C9qMoEwl5nWdk59Scn1lLi9ZXBJ6DsR6BlpMSjD0rpVyEPvSP8j522G
	1qh/HN1+yUS2BSnVw1x6TP9yJI6VJ2TVNwGrwPqdnaXGjH5x8LKego8aQ
	AXwHNQV/Ashn9TDCDfXJPu9OEUlxk47d3dqccnmgw/O8ecH2Lk65JnDtc
	aTCToTobIGGvrLwRfzj5YZEEAUbbwNtqeEKLrE6qOX4V0Iw9h4sjmz+WK Q==;
X-IronPort-AV: E=Sophos;i="5.60,507,1549900800"; d="scan'208";a="215246206"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2019 01:10:11 +0800
IronPort-SDR: /v5lIXIDsB+ZykXvm5QYSRh8rZge2oQtDsrtlfRht4+n/u7YaF+KGGE19FzwyX7piAOtHtBmRz
	TDv+rsJpRB8WQIBkHqRBow6LKFys6WPs9J1yBtvFvCwg5Bd42BtsK69HwOV6c1ckHKlaJZ7DDl
	Qp6pxJeh7X6GBCpvxrzYTB8/ATf9f1USlJpCXyWoRKfX6+feKeYKsj2LAaqANIeDMU3c401ZLC
	QjvMa1fIzkVSvxezUW8CJCfvA84lHtddtRz+d+bqG7d+GjrSo6CsLbdt0Ps687fc6PmXNrhWTQ
	j0INqEUOpCXEm3EDBD8tA09z
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 24 May 2019 09:45:30 -0700
IronPort-SDR: HVEG59yEnVFIVxFlpEUZoW8HZOzgfcOrbgJyvTFJlru2MRcsDusgKQsw93qiwqjA4qFSpACMzx
	hn2j+IH5jUbMLSFMtcrYS61ZO8oL8c6JuBajb3oKr2tJ9zLz3jqvpIg8t0EDIHPOhfhv4SBMFa
	WvFdtr3pSCPaqcvuWGwFbCmi+OMzagV9QjuoqfC1GoqpNHwI4AqCuxMwZQ0BhePQDaRIMJt3Me
	hgpGeLToTPvEKSOesnYrudu8Qj7e4bEcGThhbPJzUNVUPty3spygAog+WzIaAy2gO5g/P4Sj6C
	2hE=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 24 May 2019 10:10:12 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2019 10:08:17 -0700
Message-Id: <20190524170817.15129-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] qemu: Backport the arm segfault fix
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
X-List-Received-Date: Fri, 24 May 2019 17:10:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When we updated to QEMU 4.0 we saw a segfault when running tests on the
qemuarm machine. At the time we just reverted the offending patch from
QEMU. Now that the fix has been merged into upstream let's remove that
revert patch and replace it with the correct backport.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   2 +-
 ...m-Use-vector-operations-for-saturati.patch | 493 ------------------
 ...et-arm-Fix-vector-operation-segfault.patch |  66 +++
 3 files changed, 67 insertions(+), 494 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0013-Revert-target-arm-Use-vector-operations-for-saturati.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013-target-arm-Fix-vector-operation-segfault.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f7b41412ad..e44e351129 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-apic-fixup-fallthrough-to-PIC.patch \
            file://0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
-           file://0013-Revert-target-arm-Use-vector-operations-for-saturati.patch \
+           file://0013-target-arm-Fix-vector-operation-segfault.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0013-Revert-target-arm-Use-vector-operations-for-saturati.patch b/meta/recipes-devtools/qemu/qemu/0013-Revert-target-arm-Use-vector-operations-for-saturati.patch
deleted file mode 100644
index 3d018a74d9..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0013-Revert-target-arm-Use-vector-operations-for-saturati.patch
+++ /dev/null
@@ -1,493 +0,0 @@
-From b46cdcdeb762c1f0eef68dc4a7d90f8176152e07 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 1 May 2019 19:51:27 -0700
-Subject: [PATCH] Revert "target/arm: Use vector operations for saturation"
-
-This reverts commit 89e68b575e138d0af1435f11a8ffcd8779c237bd.
-
-This fixes QEMU aborts when running the qemuarm machine.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Pending
----
- target/arm/helper.h        |  33 -------
- target/arm/translate-a64.c |  36 ++++----
- target/arm/translate.c     | 172 ++++++-------------------------------
- target/arm/translate.h     |   4 -
- target/arm/vec_helper.c    | 130 ----------------------------
- 5 files changed, 44 insertions(+), 331 deletions(-)
-
-diff --git a/target/arm/helper.h b/target/arm/helper.h
-index 50cb036378..b2669f140f 100644
---- a/target/arm/helper.h
-+++ b/target/arm/helper.h
-@@ -646,39 +646,6 @@ DEF_HELPER_FLAGS_6(gvec_fmla_idx_s, TCG_CALL_NO_RWG,
- DEF_HELPER_FLAGS_6(gvec_fmla_idx_d, TCG_CALL_NO_RWG,
-                    void, ptr, ptr, ptr, ptr, ptr, i32)
- 
--DEF_HELPER_FLAGS_5(gvec_uqadd_b, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_uqadd_h, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_uqadd_s, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_uqadd_d, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_sqadd_b, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_sqadd_h, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_sqadd_s, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_sqadd_d, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_uqsub_b, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_uqsub_h, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_uqsub_s, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_uqsub_d, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_sqsub_b, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_sqsub_h, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_sqsub_s, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--DEF_HELPER_FLAGS_5(gvec_sqsub_d, TCG_CALL_NO_RWG,
--                   void, ptr, ptr, ptr, ptr, i32)
--
- DEF_HELPER_FLAGS_5(gvec_fmlal_a32, TCG_CALL_NO_RWG,
-                    void, ptr, ptr, ptr, ptr, i32)
- DEF_HELPER_FLAGS_5(gvec_fmlal_a64, TCG_CALL_NO_RWG,
-diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
-index 9dcc5ff3a3..428211f92f 100644
---- a/target/arm/translate-a64.c
-+++ b/target/arm/translate-a64.c
-@@ -11230,22 +11230,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
-     }
- 
-     switch (opcode) {
--    case 0x01: /* SQADD, UQADD */
--        tcg_gen_gvec_4(vec_full_reg_offset(s, rd),
--                       offsetof(CPUARMState, vfp.qc),
--                       vec_full_reg_offset(s, rn),
--                       vec_full_reg_offset(s, rm),
--                       is_q ? 16 : 8, vec_full_reg_size(s),
--                       (u ? uqadd_op : sqadd_op) + size);
--        return;
--    case 0x05: /* SQSUB, UQSUB */
--        tcg_gen_gvec_4(vec_full_reg_offset(s, rd),
--                       offsetof(CPUARMState, vfp.qc),
--                       vec_full_reg_offset(s, rn),
--                       vec_full_reg_offset(s, rm),
--                       is_q ? 16 : 8, vec_full_reg_size(s),
--                       (u ? uqsub_op : sqsub_op) + size);
--        return;
-     case 0x0c: /* SMAX, UMAX */
-         if (u) {
-             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-@@ -11341,6 +11325,16 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
-                 genfn = fns[size][u];
-                 break;
-             }
-+            case 0x1: /* SQADD, UQADD */
-+            {
-+                static NeonGenTwoOpEnvFn * const fns[3][2] = {
-+                    { gen_helper_neon_qadd_s8, gen_helper_neon_qadd_u8 },
-+                    { gen_helper_neon_qadd_s16, gen_helper_neon_qadd_u16 },
-+                    { gen_helper_neon_qadd_s32, gen_helper_neon_qadd_u32 },
-+                };
-+                genenvfn = fns[size][u];
-+                break;
-+            }
-             case 0x2: /* SRHADD, URHADD */
-             {
-                 static NeonGenTwoOpFn * const fns[3][2] = {
-@@ -11361,6 +11355,16 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
-                 genfn = fns[size][u];
-                 break;
-             }
-+            case 0x5: /* SQSUB, UQSUB */
-+            {
-+                static NeonGenTwoOpEnvFn * const fns[3][2] = {
-+                    { gen_helper_neon_qsub_s8, gen_helper_neon_qsub_u8 },
-+                    { gen_helper_neon_qsub_s16, gen_helper_neon_qsub_u16 },
-+                    { gen_helper_neon_qsub_s32, gen_helper_neon_qsub_u32 },
-+                };
-+                genenvfn = fns[size][u];
-+                break;
-+            }
-             case 0x8: /* SSHL, USHL */
-             {
-                 static NeonGenTwoOpFn * const fns[3][2] = {
-diff --git a/target/arm/translate.c b/target/arm/translate.c
-index 10bc53f91c..cf675cef3f 100644
---- a/target/arm/translate.c
-+++ b/target/arm/translate.c
-@@ -6242,142 +6242,6 @@ const GVecGen3 cmtst_op[4] = {
-       .vece = MO_64 },
- };
- 
--static void gen_uqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
--                          TCGv_vec a, TCGv_vec b)
--{
--    TCGv_vec x = tcg_temp_new_vec_matching(t);
--    tcg_gen_add_vec(vece, x, a, b);
--    tcg_gen_usadd_vec(vece, t, a, b);
--    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
--    tcg_gen_or_vec(vece, sat, sat, x);
--    tcg_temp_free_vec(x);
--}
--
--const GVecGen4 uqadd_op[4] = {
--    { .fniv = gen_uqadd_vec,
--      .fno = gen_helper_gvec_uqadd_b,
--      .opc = INDEX_op_usadd_vec,
--      .write_aofs = true,
--      .vece = MO_8 },
--    { .fniv = gen_uqadd_vec,
--      .fno = gen_helper_gvec_uqadd_h,
--      .opc = INDEX_op_usadd_vec,
--      .write_aofs = true,
--      .vece = MO_16 },
--    { .fniv = gen_uqadd_vec,
--      .fno = gen_helper_gvec_uqadd_s,
--      .opc = INDEX_op_usadd_vec,
--      .write_aofs = true,
--      .vece = MO_32 },
--    { .fniv = gen_uqadd_vec,
--      .fno = gen_helper_gvec_uqadd_d,
--      .opc = INDEX_op_usadd_vec,
--      .write_aofs = true,
--      .vece = MO_64 },
--};
--
--static void gen_sqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
--                          TCGv_vec a, TCGv_vec b)
--{
--    TCGv_vec x = tcg_temp_new_vec_matching(t);
--    tcg_gen_add_vec(vece, x, a, b);
--    tcg_gen_ssadd_vec(vece, t, a, b);
--    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
--    tcg_gen_or_vec(vece, sat, sat, x);
--    tcg_temp_free_vec(x);
--}
--
--const GVecGen4 sqadd_op[4] = {
--    { .fniv = gen_sqadd_vec,
--      .fno = gen_helper_gvec_sqadd_b,
--      .opc = INDEX_op_ssadd_vec,
--      .write_aofs = true,
--      .vece = MO_8 },
--    { .fniv = gen_sqadd_vec,
--      .fno = gen_helper_gvec_sqadd_h,
--      .opc = INDEX_op_ssadd_vec,
--      .write_aofs = true,
--      .vece = MO_16 },
--    { .fniv = gen_sqadd_vec,
--      .fno = gen_helper_gvec_sqadd_s,
--      .opc = INDEX_op_ssadd_vec,
--      .write_aofs = true,
--      .vece = MO_32 },
--    { .fniv = gen_sqadd_vec,
--      .fno = gen_helper_gvec_sqadd_d,
--      .opc = INDEX_op_ssadd_vec,
--      .write_aofs = true,
--      .vece = MO_64 },
--};
--
--static void gen_uqsub_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
--                          TCGv_vec a, TCGv_vec b)
--{
--    TCGv_vec x = tcg_temp_new_vec_matching(t);
--    tcg_gen_sub_vec(vece, x, a, b);
--    tcg_gen_ussub_vec(vece, t, a, b);
--    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
--    tcg_gen_or_vec(vece, sat, sat, x);
--    tcg_temp_free_vec(x);
--}
--
--const GVecGen4 uqsub_op[4] = {
--    { .fniv = gen_uqsub_vec,
--      .fno = gen_helper_gvec_uqsub_b,
--      .opc = INDEX_op_ussub_vec,
--      .write_aofs = true,
--      .vece = MO_8 },
--    { .fniv = gen_uqsub_vec,
--      .fno = gen_helper_gvec_uqsub_h,
--      .opc = INDEX_op_ussub_vec,
--      .write_aofs = true,
--      .vece = MO_16 },
--    { .fniv = gen_uqsub_vec,
--      .fno = gen_helper_gvec_uqsub_s,
--      .opc = INDEX_op_ussub_vec,
--      .write_aofs = true,
--      .vece = MO_32 },
--    { .fniv = gen_uqsub_vec,
--      .fno = gen_helper_gvec_uqsub_d,
--      .opc = INDEX_op_ussub_vec,
--      .write_aofs = true,
--      .vece = MO_64 },
--};
--
--static void gen_sqsub_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
--                          TCGv_vec a, TCGv_vec b)
--{
--    TCGv_vec x = tcg_temp_new_vec_matching(t);
--    tcg_gen_sub_vec(vece, x, a, b);
--    tcg_gen_sssub_vec(vece, t, a, b);
--    tcg_gen_cmp_vec(TCG_COND_NE, vece, x, x, t);
--    tcg_gen_or_vec(vece, sat, sat, x);
--    tcg_temp_free_vec(x);
--}
--
--const GVecGen4 sqsub_op[4] = {
--    { .fniv = gen_sqsub_vec,
--      .fno = gen_helper_gvec_sqsub_b,
--      .opc = INDEX_op_sssub_vec,
--      .write_aofs = true,
--      .vece = MO_8 },
--    { .fniv = gen_sqsub_vec,
--      .fno = gen_helper_gvec_sqsub_h,
--      .opc = INDEX_op_sssub_vec,
--      .write_aofs = true,
--      .vece = MO_16 },
--    { .fniv = gen_sqsub_vec,
--      .fno = gen_helper_gvec_sqsub_s,
--      .opc = INDEX_op_sssub_vec,
--      .write_aofs = true,
--      .vece = MO_32 },
--    { .fniv = gen_sqsub_vec,
--      .fno = gen_helper_gvec_sqsub_d,
--      .opc = INDEX_op_sssub_vec,
--      .write_aofs = true,
--      .vece = MO_64 },
--};
--
- /* Translate a NEON data processing instruction.  Return nonzero if the
-    instruction is invalid.
-    We process data in a mixture of 32-bit and 64-bit chunks.
-@@ -6561,18 +6425,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
-             }
-             return 0;
- 
--        case NEON_3R_VQADD:
--            tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
--                           rn_ofs, rm_ofs, vec_size, vec_size,
--                           (u ? uqadd_op : sqadd_op) + size);
--            break;
--
--        case NEON_3R_VQSUB:
--            tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
--                           rn_ofs, rm_ofs, vec_size, vec_size,
--                           (u ? uqsub_op : sqsub_op) + size);
--            break;
--
-         case NEON_3R_VMUL: /* VMUL */
-             if (u) {
-                 /* Polynomial case allows only P8 and is handled below.  */
-@@ -6637,6 +6489,24 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
-                 neon_load_reg64(cpu_V0, rn + pass);
-                 neon_load_reg64(cpu_V1, rm + pass);
-                 switch (op) {
-+                case NEON_3R_VQADD:
-+                    if (u) {
-+                        gen_helper_neon_qadd_u64(cpu_V0, cpu_env,
-+                                                 cpu_V0, cpu_V1);
-+                    } else {
-+                        gen_helper_neon_qadd_s64(cpu_V0, cpu_env,
-+                                                 cpu_V0, cpu_V1);
-+                    }
-+                    break;
-+                case NEON_3R_VQSUB:
-+                    if (u) {
-+                        gen_helper_neon_qsub_u64(cpu_V0, cpu_env,
-+                                                 cpu_V0, cpu_V1);
-+                    } else {
-+                        gen_helper_neon_qsub_s64(cpu_V0, cpu_env,
-+                                                 cpu_V0, cpu_V1);
-+                    }
-+                    break;
-                 case NEON_3R_VSHL:
-                     if (u) {
-                         gen_helper_neon_shl_u64(cpu_V0, cpu_V1, cpu_V0);
-@@ -6752,12 +6622,18 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
-         case NEON_3R_VHADD:
-             GEN_NEON_INTEGER_OP(hadd);
-             break;
-+        case NEON_3R_VQADD:
-+            GEN_NEON_INTEGER_OP_ENV(qadd);
-+            break;
-         case NEON_3R_VRHADD:
-             GEN_NEON_INTEGER_OP(rhadd);
-             break;
-         case NEON_3R_VHSUB:
-             GEN_NEON_INTEGER_OP(hsub);
-             break;
-+        case NEON_3R_VQSUB:
-+            GEN_NEON_INTEGER_OP_ENV(qsub);
-+            break;
-         case NEON_3R_VSHL:
-             GEN_NEON_INTEGER_OP(shl);
-             break;
-diff --git a/target/arm/translate.h b/target/arm/translate.h
-index c2348def0d..07055c9449 100644
---- a/target/arm/translate.h
-+++ b/target/arm/translate.h
-@@ -248,10 +248,6 @@ extern const GVecGen2i ssra_op[4];
- extern const GVecGen2i usra_op[4];
- extern const GVecGen2i sri_op[4];
- extern const GVecGen2i sli_op[4];
--extern const GVecGen4 uqadd_op[4];
--extern const GVecGen4 sqadd_op[4];
--extern const GVecGen4 uqsub_op[4];
--extern const GVecGen4 sqsub_op[4];
- void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b);
- 
- /*
-diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
-index dedef62403..be3271659f 100644
---- a/target/arm/vec_helper.c
-+++ b/target/arm/vec_helper.c
-@@ -769,136 +769,6 @@ DO_FMLA_IDX(gvec_fmla_idx_d, float64, )
- 
- #undef DO_FMLA_IDX
- 
--#define DO_SAT(NAME, WTYPE, TYPEN, TYPEM, OP, MIN, MAX) \
--void HELPER(NAME)(void *vd, void *vq, void *vn, void *vm, uint32_t desc)   \
--{                                                                          \
--    intptr_t i, oprsz = simd_oprsz(desc);                                  \
--    TYPEN *d = vd, *n = vn; TYPEM *m = vm;                                 \
--    bool q = false;                                                        \
--    for (i = 0; i < oprsz / sizeof(TYPEN); i++) {                          \
--        WTYPE dd = (WTYPE)n[i] OP m[i];                                    \
--        if (dd < MIN) {                                                    \
--            dd = MIN;                                                      \
--            q = true;                                                      \
--        } else if (dd > MAX) {                                             \
--            dd = MAX;                                                      \
--            q = true;                                                      \
--        }                                                                  \
--        d[i] = dd;                                                         \
--    }                                                                      \
--    if (q) {                                                               \
--        uint32_t *qc = vq;                                                 \
--        qc[0] = 1;                                                         \
--    }                                                                      \
--    clear_tail(d, oprsz, simd_maxsz(desc));                                \
--}
--
--DO_SAT(gvec_uqadd_b, int, uint8_t, uint8_t, +, 0, UINT8_MAX)
--DO_SAT(gvec_uqadd_h, int, uint16_t, uint16_t, +, 0, UINT16_MAX)
--DO_SAT(gvec_uqadd_s, int64_t, uint32_t, uint32_t, +, 0, UINT32_MAX)
--
--DO_SAT(gvec_sqadd_b, int, int8_t, int8_t, +, INT8_MIN, INT8_MAX)
--DO_SAT(gvec_sqadd_h, int, int16_t, int16_t, +, INT16_MIN, INT16_MAX)
--DO_SAT(gvec_sqadd_s, int64_t, int32_t, int32_t, +, INT32_MIN, INT32_MAX)
--
--DO_SAT(gvec_uqsub_b, int, uint8_t, uint8_t, -, 0, UINT8_MAX)
--DO_SAT(gvec_uqsub_h, int, uint16_t, uint16_t, -, 0, UINT16_MAX)
--DO_SAT(gvec_uqsub_s, int64_t, uint32_t, uint32_t, -, 0, UINT32_MAX)
--
--DO_SAT(gvec_sqsub_b, int, int8_t, int8_t, -, INT8_MIN, INT8_MAX)
--DO_SAT(gvec_sqsub_h, int, int16_t, int16_t, -, INT16_MIN, INT16_MAX)
--DO_SAT(gvec_sqsub_s, int64_t, int32_t, int32_t, -, INT32_MIN, INT32_MAX)
--
--#undef DO_SAT
--
--void HELPER(gvec_uqadd_d)(void *vd, void *vq, void *vn,
--                          void *vm, uint32_t desc)
--{
--    intptr_t i, oprsz = simd_oprsz(desc);
--    uint64_t *d = vd, *n = vn, *m = vm;
--    bool q = false;
--
--    for (i = 0; i < oprsz / 8; i++) {
--        uint64_t nn = n[i], mm = m[i], dd = nn + mm;
--        if (dd < nn) {
--            dd = UINT64_MAX;
--            q = true;
--        }
--        d[i] = dd;
--    }
--    if (q) {
--        uint32_t *qc = vq;
--        qc[0] = 1;
--    }
--    clear_tail(d, oprsz, simd_maxsz(desc));
--}
--
--void HELPER(gvec_uqsub_d)(void *vd, void *vq, void *vn,
--                          void *vm, uint32_t desc)
--{
--    intptr_t i, oprsz = simd_oprsz(desc);
--    uint64_t *d = vd, *n = vn, *m = vm;
--    bool q = false;
--
--    for (i = 0; i < oprsz / 8; i++) {
--        uint64_t nn = n[i], mm = m[i], dd = nn - mm;
--        if (nn < mm) {
--            dd = 0;
--            q = true;
--        }
--        d[i] = dd;
--    }
--    if (q) {
--        uint32_t *qc = vq;
--        qc[0] = 1;
--    }
--    clear_tail(d, oprsz, simd_maxsz(desc));
--}
--
--void HELPER(gvec_sqadd_d)(void *vd, void *vq, void *vn,
--                          void *vm, uint32_t desc)
--{
--    intptr_t i, oprsz = simd_oprsz(desc);
--    int64_t *d = vd, *n = vn, *m = vm;
--    bool q = false;
--
--    for (i = 0; i < oprsz / 8; i++) {
--        int64_t nn = n[i], mm = m[i], dd = nn + mm;
--        if (((dd ^ nn) & ~(nn ^ mm)) & INT64_MIN) {
--            dd = (nn >> 63) ^ ~INT64_MIN;
--            q = true;
--        }
--        d[i] = dd;
--    }
--    if (q) {
--        uint32_t *qc = vq;
--        qc[0] = 1;
--    }
--    clear_tail(d, oprsz, simd_maxsz(desc));
--}
--
--void HELPER(gvec_sqsub_d)(void *vd, void *vq, void *vn,
--                          void *vm, uint32_t desc)
--{
--    intptr_t i, oprsz = simd_oprsz(desc);
--    int64_t *d = vd, *n = vn, *m = vm;
--    bool q = false;
--
--    for (i = 0; i < oprsz / 8; i++) {
--        int64_t nn = n[i], mm = m[i], dd = nn - mm;
--        if (((dd ^ nn) & (nn ^ mm)) & INT64_MIN) {
--            dd = (nn >> 63) ^ ~INT64_MIN;
--            q = true;
--        }
--        d[i] = dd;
--    }
--    if (q) {
--        uint32_t *qc = vq;
--        qc[0] = 1;
--    }
--    clear_tail(d, oprsz, simd_maxsz(desc));
--}
--
- /*
-  * Convert float16 to float32, raising no exceptions and
-  * preserving exceptional values, including SNaN.
--- 
-2.21.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0013-target-arm-Fix-vector-operation-segfault.patch b/meta/recipes-devtools/qemu/qemu/0013-target-arm-Fix-vector-operation-segfault.patch
new file mode 100644
index 0000000000..c1dd957dc9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0013-target-arm-Fix-vector-operation-segfault.patch
@@ -0,0 +1,66 @@
+From 2f143d3ad1c05e91cf2cdf5de06d59a80a95e6c8 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 23 May 2019 14:47:43 +0100
+Subject: [PATCH] target/arm: Fix vector operation segfault
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 89e68b575 "target/arm: Use vector operations for saturation"
+causes this abort() when booting QEMU ARM with a Cortex-A15:
+
+0  0x00007ffff4c2382f in raise () at /usr/lib/libc.so.6
+1  0x00007ffff4c0e672 in abort () at /usr/lib/libc.so.6
+2  0x00005555559c1839 in disas_neon_data_insn (insn=<optimized out>, s=<optimized out>) at ./target/arm/translate.c:6673
+3  0x00005555559c1839 in disas_neon_data_insn (s=<optimized out>, insn=<optimized out>) at ./target/arm/translate.c:6386
+4  0x00005555559cd8a4 in disas_arm_insn (insn=4081107068, s=0x7fffe59a9510) at ./target/arm/translate.c:9289
+5  0x00005555559cd8a4 in arm_tr_translate_insn (dcbase=0x7fffe59a9510, cpu=<optimized out>) at ./target/arm/translate.c:13612
+6  0x00005555558d1d39 in translator_loop (ops=0x5555561cc580 <arm_translator_ops>, db=0x7fffe59a9510, cpu=0x55555686a2f0, tb=<optimized out>, max_insns=<optimized out>) at ./accel/tcg/translator.c:96
+7  0x00005555559d10d4 in gen_intermediate_code (cpu=cpu@entry=0x55555686a2f0, tb=tb@entry=0x7fffd7840080 <code_gen_buffer+126091347>, max_insns=max_insns@entry=512) at ./target/arm/translate.c:13901
+8  0x00005555558d06b9 in tb_gen_code (cpu=cpu@entry=0x55555686a2f0, pc=3067096216, cs_base=0, flags=192, cflags=-16252928, cflags@entry=524288) at ./accel/tcg/translate-all.c:1736
+9  0x00005555558ce467 in tb_find (cf_mask=524288, tb_exit=1, last_tb=0x7fffd783e640 <code_gen_buffer+126084627>, cpu=0x1) at ./accel/tcg/cpu-exec.c:407
+10 0x00005555558ce467 in cpu_exec (cpu=cpu@entry=0x55555686a2f0) at ./accel/tcg/cpu-exec.c:728
+11 0x000055555588b0cf in tcg_cpu_exec (cpu=0x55555686a2f0) at ./cpus.c:1431
+12 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=0x55555686a2f0) at ./cpus.c:1735
+13 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=arg@entry=0x55555686a2f0) at ./cpus.c:1709
+14 0x0000555555d2629a in qemu_thread_start (args=<optimized out>) at ./util/qemu-thread-posix.c:502
+15 0x00007ffff4db8a92 in start_thread () at /usr/lib/libpthread.
+
+This patch ensures that we don't hit the abort() in the second switch
+case in disas_neon_data_insn() as we will return from the first case.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
+Tested-by: Alex Bennée <alex.bennee@linaro.org>
+Message-id: ad91b397f360b2fc7f4087e476f7df5b04d42ddb.1558021877.git.alistair.francis@wdc.com
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Upstream-Status: Backport [4.1.0]
+---
+ target/arm/translate.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/target/arm/translate.c b/target/arm/translate.c
+index dd053c80d6..298c262825 100644
+--- a/target/arm/translate.c
++++ b/target/arm/translate.c
+@@ -6598,13 +6598,13 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
+             tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
+                            rn_ofs, rm_ofs, vec_size, vec_size,
+                            (u ? uqadd_op : sqadd_op) + size);
+-            break;
++            return 0;
+ 
+         case NEON_3R_VQSUB:
+             tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
+                            rn_ofs, rm_ofs, vec_size, vec_size,
+                            (u ? uqsub_op : sqsub_op) + size);
+-            break;
++            return 0;
+ 
+         case NEON_3R_VMUL: /* VMUL */
+             if (u) {
+-- 
+2.21.0
+
-- 
2.21.0


