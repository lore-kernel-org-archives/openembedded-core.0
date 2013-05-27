Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 90FFF6A40C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 14:49:53 +0000 (UTC)
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 46ED5D22B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 16:49:26 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2013 16:49:50 +0200
Message-Id: <1369666190-11289-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] binutils: add two AArch64 related backports to 2.23.2
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
X-List-Received-Date: Mon, 27 May 2013 14:49:54 -0000

Update required to pass "movi" related build errors when gcc-4.8 is
used.

libgcrypt, slang, mysql5 were failing like this:

| {standard input}: Assembler messages:
| {standard input}:316: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v3.8b,-106'
| {standard input}:348: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v3.8b,-8'
| {standard input}:352: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v3.8b,-27'

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/binutils/binutils-2.23.2.inc |   2 +
 .../binutils-2.23.2/backport/aarch64-crn.patch     | 117 +++++++++++++++++
 .../binutils-2.23.2/backport/aarch64-movi.patch    | 144 +++++++++++++++++++++
 3 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2.inc b/meta/recipes-devtools/binutils/binutils-2.23.2.inc
index 07bc7e0..abec597 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.2.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.23.2.inc
@@ -39,6 +39,8 @@ BACKPORT = "\
      file://backport/binutils-replace-strncat-with-strcat.patch  \
      file://backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch  \
      file://backport/binutils-fix-skip-whitespace-pr14887.patch \
+     file://backport/aarch64-crn.patch \
+     file://backport/aarch64-movi.patch \
 "
 SRC_URI[md5sum] = "4f8fa651e35ef262edc01d60fb45702e"
 SRC_URI[sha256sum] = "fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097"
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch
new file mode 100644
index 0000000..3f0338c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch
@@ -0,0 +1,117 @@
+From: Yufeng Zhang <yufeng.zhang@arm.com>
+Date: Mon, 13 May 2013 22:50:00 +0000 (+0000)
+Subject: gas/
+X-Git-Url: http://sourceware.org/git/?p=binutils.git;a=commitdiff_plain;h=1796bf893c4729d5c523502318d72cae78495d6c
+
+Upstream-status: backport
+
+gas/
+
+	Backport from mainline:
+
+	2013-02-27 Yufeng Zhang <yufeng.zhang@arm.com>
+	* config/tc-aarch64.c (parse_sys_reg): Allow the full range of CRn
+	for system registers.
+
+gas/testsuite/
+
+	Backport from mainline:
+
+	2013-02-27 Yufeng Zhang <yufeng.zhang@arm.com>
+	* gas/aarch64/illegal.l: Delete the error message for
+	msr S3_1_C13_C15_1,x7.
+	* gas/aarch64/sysreg.s: Add new tests.
+	* gas/aarch64/sysreg.d: Update.
+---
+
+diff --git a/gas/ChangeLog b/gas/ChangeLog
+index 821acc9..3d09792 100644
+--- a/gas/ChangeLog
++++ b/gas/ChangeLog
+@@ -1,3 +1,11 @@
++2013-05-13 Yufeng Zhang <yufeng.zhang@arm.com>
++
++	Backport from mainline:
++
++	2013-02-27 Yufeng Zhang <yufeng.zhang@arm.com>
++	* config/tc-aarch64.c (parse_sys_reg): Allow the full range of CRn
++	for system registers.
++
+ 2013-03-05  Yufeng Zhang  <yufeng.zhang@arm.com>
+ 
+ 	* config/tc-aarch64.c (aarch64_imm_float_p): Rename 'e' to 'pattern';
+diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
+index 162c865..db28c71 100644
+--- a/gas/config/tc-aarch64.c
++++ b/gas/config/tc-aarch64.c
+@@ -3243,10 +3243,14 @@ parse_sys_reg (char **str, struct hash_control *sys_regs, int imple_defined_p)
+ 	  unsigned int op0, op1, cn, cm, op2;
+ 	  if (sscanf (buf, "s%u_%u_c%u_c%u_%u", &op0, &op1, &cn, &cm, &op2) != 5)
+ 	    return PARSE_FAIL;
+-	  /* Register access is encoded as follows:
++	  /* The architecture specifies the encoding space for implementation
++	     defined registers as:
+ 	     op0  op1  CRn   CRm   op2
+-	     11   xxx  1x11  xxxx  xxx.  */
+-	  if (op0 != 3 || op1 > 7 || (cn | 0x4) != 0xf || cm > 15 || op2 > 7)
++	     11   xxx  1x11  xxxx  xxx
++	     For convenience GAS accepts a wider encoding space, as follows:
++	     op0  op1  CRn   CRm   op2
++	     11   xxx  xxxx  xxxx  xxx  */
++	  if (op0 != 3 || op1 > 7 || cn > 15 || cm > 15 || op2 > 7)
+ 	    return PARSE_FAIL;
+ 	  value = (op0 << 14) | (op1 << 11) | (cn << 7) | (cm << 3) | op2;
+ 	}
+diff --git a/gas/testsuite/ChangeLog b/gas/testsuite/ChangeLog
+index d1ebc3b..8ee06c8 100644
+--- a/gas/testsuite/ChangeLog
++++ b/gas/testsuite/ChangeLog
+@@ -1,3 +1,13 @@
++2013-05-13 Yufeng Zhang <yufeng.zhang@arm.com>
++
++	Backport from mainline:
++
++	2013-02-27 Yufeng Zhang <yufeng.zhang@arm.com>
++	* gas/aarch64/illegal.l: Delete the error message for
++	msr S3_1_C13_C15_1,x7.
++	* gas/aarch64/sysreg.s: Add new tests.
++	* gas/aarch64/sysreg.d: Update.
++
+ 2013-03-08  Christian Groessler  <chris@groessler.org>
+ 
+ 	Backport from mainline:
+diff --git a/gas/testsuite/gas/aarch64/illegal.l b/gas/testsuite/gas/aarch64/illegal.l
+index e17a1de..f7e4074 100644
+--- a/gas/testsuite/gas/aarch64/illegal.l
++++ b/gas/testsuite/gas/aarch64/illegal.l
+@@ -520,7 +520,6 @@
+ [^:]*:496: Error: .*`str x1,page_table_count'
+ [^:]*:498: Error: .*`prfm PLDL3KEEP,\[x9,x15,sxtx#2\]'
+ [^:]*:500: Error: .*`mrs x5,S1_0_C13_C8_0'
+-[^:]*:501: Error: .*`msr S3_1_C13_C15_1,x7'
+ [^:]*:502: Error: .*`msr S3_1_C11_C15_-1,x7'
+ [^:]*:503: Error: .*`msr S3_1_11_15_1,x7'
+ [^:]*:506: Error: .*`movi w1,#15'
+diff --git a/gas/testsuite/gas/aarch64/sysreg.d b/gas/testsuite/gas/aarch64/sysreg.d
+index b83b270..c7cf00e 100644
+--- a/gas/testsuite/gas/aarch64/sysreg.d
++++ b/gas/testsuite/gas/aarch64/sysreg.d
+@@ -23,3 +23,6 @@ Disassembly of section \.text:
+   3c:	d5380260 	mrs	x0, id_isar3_el1
+   40:	d5380280 	mrs	x0, id_isar4_el1
+   44:	d53802a0 	mrs	x0, id_isar5_el1
++  48:	d538cc00 	mrs	x0, s3_0_c12_c12_0
++  4c:	d5384600 	mrs	x0, s3_0_c4_c6_0
++  50:	d5184600 	msr	s3_0_c4_c6_0, x0
+diff --git a/gas/testsuite/gas/aarch64/sysreg.s b/gas/testsuite/gas/aarch64/sysreg.s
+index e6f770e..3287594 100644
+--- a/gas/testsuite/gas/aarch64/sysreg.s
++++ b/gas/testsuite/gas/aarch64/sysreg.s
+@@ -22,3 +22,7 @@
+ 	mrs x0, id_isar3_el1
+ 	mrs x0, id_isar4_el1
+ 	mrs x0, id_isar5_el1
++
++	mrs x0, s3_0_c12_c12_0
++	mrs x0, s3_0_c4_c6_0
++	msr s3_0_c4_c6_0, x0
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch
new file mode 100644
index 0000000..5c7076d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch
@@ -0,0 +1,144 @@
+From: Yufeng Zhang <yufeng.zhang@arm.com>
+Date: Mon, 13 May 2013 23:09:51 +0000 (+0000)
+Subject: gas/testsuite/
+X-Git-Url: http://sourceware.org/git/?p=binutils.git;a=commitdiff_plain;h=f426901e1be0f58fe4e9386cada50ca57d0a4f36
+
+Upstream-status: backport
+
+gas/testsuite/
+
+	Backport from mainline:
+
+	2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
+	* gas/aarch64/diagnostic.s: Update.
+	* gas/aarch64/diagnostic.l: Ditto.
+	* gas/aarch64/movi.s: Add new tests.
+	* gas/aarch64/movi.d: Update.
+
+opcodes/
+
+	Backport from mainline:
+
+	2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
+	* aarch64-asm.c (aarch64_ins_advsimd_imm_modified): Remove assertion.
+	* aarch64-opc.c (operand_general_constraint_met_p): Relax the range
+	check from [0, 255] to [-128, 255].
+---
+
+diff --git a/gas/testsuite/ChangeLog b/gas/testsuite/ChangeLog
+index 8ee06c8..475c93a 100644
+--- a/gas/testsuite/ChangeLog
++++ b/gas/testsuite/ChangeLog
+@@ -1,3 +1,13 @@
++2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
++
++	Backport from mainline:
++
++	2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
++	* gas/aarch64/diagnostic.s: Update.
++	* gas/aarch64/diagnostic.l: Ditto.
++	* gas/aarch64/movi.s: Add new tests.
++	* gas/aarch64/movi.d: Update.
++
+ 2013-05-13 Yufeng Zhang <yufeng.zhang@arm.com>
+ 
+ 	Backport from mainline:
+diff --git a/gas/testsuite/gas/aarch64/diagnostic.l b/gas/testsuite/gas/aarch64/diagnostic.l
+index f37f11c..d7a1347 100644
+--- a/gas/testsuite/gas/aarch64/diagnostic.l
++++ b/gas/testsuite/gas/aarch64/diagnostic.l
+@@ -38,8 +38,8 @@
+ [^:]*:40: Error: invalid shift amount at operand 3 -- `shll v1.4s,v2.4h,#32'
+ [^:]*:41: Error: immediate value out of range 0 to 31 at operand 3 -- `shl v1.2s,v2.2s,32'
+ [^:]*:42: Error: immediate value out of range 1 to 8 at operand 3 -- `sqshrn2 v2.16b,v3.8h,#17'
+-[^:]*:43: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v1.4h,256'
+-[^:]*:44: Error: immediate value out of range 0 to 255 at operand 2 -- `movi v1.4h,-1'
++[^:]*:43: Error: immediate value out of range -128 to 255 at operand 2 -- `movi v1.4h,256'
++[^:]*:44: Error: immediate value out of range -128 to 255 at operand 2 -- `movi v1.4h,-129'
+ [^:]*:45: Error: invalid shift operator at operand 2 -- `movi v1.4h,255,msl#8'
+ [^:]*:46: Error: invalid value for immediate at operand 2 -- `movi d0,256'
+ [^:]*:47: Error: immediate value should be a multiple of 8 at operand 2 -- `movi v1.4h,255,lsl#7'
+diff --git a/gas/testsuite/gas/aarch64/diagnostic.s b/gas/testsuite/gas/aarch64/diagnostic.s
+index 99ebf8f..e5443ab 100644
+--- a/gas/testsuite/gas/aarch64/diagnostic.s
++++ b/gas/testsuite/gas/aarch64/diagnostic.s
+@@ -41,7 +41,7 @@
+ 	shl	v1.2s, v2.2s, 32
+ 	sqshrn2	v2.16b, v3.8h, #17
+ 	movi	v1.4h, 256
+-	movi	v1.4h, -1
++	movi	v1.4h, -129
+ 	movi	v1.4h, 255, msl #8
+ 	movi	d0, 256
+ 	movi	v1.4h, 255, lsl #7
+diff --git a/gas/testsuite/gas/aarch64/movi.d b/gas/testsuite/gas/aarch64/movi.d
+index 2c73cc4..c225b21 100644
+--- a/gas/testsuite/gas/aarch64/movi.d
++++ b/gas/testsuite/gas/aarch64/movi.d
+@@ -8201,3 +8201,6 @@ Disassembly of section \.text:
+     8004:	6f07e7e0 	movi	v0.2d, #0xffffffffffffffff
+     8008:	6f07e7e0 	movi	v0.2d, #0xffffffffffffffff
+     800c:	2f07e7ff 	movi	d31, #0xffffffffffffffff
++    8010:	0f04e403 	movi	v3.8b, #0x80
++    8014:	0f04e423 	movi	v3.8b, #0x81
++    8018:	0f07e7e3 	movi	v3.8b, #0xff
+diff --git a/gas/testsuite/gas/aarch64/movi.s b/gas/testsuite/gas/aarch64/movi.s
+index 99ca34a..76f2d47 100644
+--- a/gas/testsuite/gas/aarch64/movi.s
++++ b/gas/testsuite/gas/aarch64/movi.s
+@@ -102,3 +102,8 @@
+ 	movi	v0.2d, bignum
+ 	movi	d31, 18446744073709551615
+ .set    bignum, 0xffffffffffffffff
++
++	// Allow -128 to 255 in #<imm8>
++	movi	v3.8b, -128
++	movi	v3.8b, -127
++	movi	v3.8b, -1
+diff --git a/opcodes/ChangeLog b/opcodes/ChangeLog
+index 96dfaeb..4adbc86 100644
+--- a/opcodes/ChangeLog
++++ b/opcodes/ChangeLog
+@@ -1,3 +1,12 @@
++2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
++
++	Backport from mainline:
++
++	2013-05-13  Yufeng Zhang  <yufeng.zhang@arm.com>
++	* aarch64-asm.c (aarch64_ins_advsimd_imm_modified): Remove assertion.
++	* aarch64-opc.c (operand_general_constraint_met_p): Relax the range
++	check from [0, 255] to [-128, 255].
++
+ 2013-03-25  Tristan Gingold  <gingold@adacore.com>
+ 	Backport of: 2013-03-08  Yann Sionneau  <yann.sionneau@gmail.com>
+ 
+diff --git a/opcodes/aarch64-asm.c b/opcodes/aarch64-asm.c
+index 16cdaa9..ba463d9 100644
+--- a/opcodes/aarch64-asm.c
++++ b/opcodes/aarch64-asm.c
+@@ -369,7 +369,6 @@ aarch64_ins_advsimd_imm_modified (const aarch64_operand *self ATTRIBUTE_UNUSED,
+       imm = aarch64_shrink_expanded_imm8 (imm);
+       assert ((int)imm >= 0);
+     }
+-  assert (imm <= 255);
+   insert_fields (code, imm, 0, 2, FLD_defgh, FLD_abc);
+ 
+   if (kind == AARCH64_MOD_NONE)
+diff --git a/opcodes/aarch64-opc.c b/opcodes/aarch64-opc.c
+index 73a760a..32f34c6 100644
+--- a/opcodes/aarch64-opc.c
++++ b/opcodes/aarch64-opc.c
+@@ -1724,10 +1724,10 @@ operand_general_constraint_met_p (const aarch64_opnd_info *opnds, int idx,
+ 	  assert (idx == 1);
+ 	  if (aarch64_get_qualifier_esize (opnds[0].qualifier) != 8)
+ 	    {
+-	      /* uimm8 */
+-	      if (!value_in_range_p (opnd->imm.value, 0, 255))
++	      /* uimm8 or simm8 */
++	      if (!value_in_range_p (opnd->imm.value, -128, 255))
+ 		{
+-		  set_imm_out_of_range_error (mismatch_detail, idx, 0, 255);
++		  set_imm_out_of_range_error (mismatch_detail, idx, -128, 255);
+ 		  return 0;
+ 		}
+ 	    }
-- 
1.8.1.2


