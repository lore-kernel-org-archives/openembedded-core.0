Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81EE1C30653
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:08 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.4347.1719778080520831634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ljyFmtho;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d561d685e7so1767769b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778080; x=1720382880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HreNVsoZ5liMElat8Z5jVQxcWxU+Ft/kDYuxa44IeNI=;
        b=ljyFmthoTr4tQTO5qr1vZrmnBFCMZf0Qi+L0jtOyJbhFbPsbbGbFLY2s73bkkH20IX
         sj0RtIfGNr6OBkp4GEtbdjEL5U+3wyzVvWrbImLE8MrJQ6Oo+1T7FxNxI9DI9+drKDvD
         gDKiAUwH5ou8CcmPr8TmZMoSk7iu1jugGJKajZDbT8efgSufTp5VogS1Z+cOmIiuqCwD
         duU/wnOPQH1VeCzZwejKr/E3ikyZdaXRL9ujvE2n23me5LMgJT33gOWir0asv3yhKOx+
         lR5wQ+ZkHH0Dop8HQijqQ4w4Sk5XuEJt+DxdMQ4HnrjdDSQlhGbWzviZTaHQ2Pfqy4A1
         X40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778080; x=1720382880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HreNVsoZ5liMElat8Z5jVQxcWxU+Ft/kDYuxa44IeNI=;
        b=IU4xVb2HKTdFXW5EMkhQXZ6aGCkMzjBdH4vka/hOJRGpuAx/xECQrTUIYXG33HFXbO
         xYaZItop9Lyx1JdUJzFzBZYhzuUSXy9nhwzDDj1aHKouESJ6Hkz82c0Li83wIpPh4ITl
         Uweg1Z+sV48ykfPBJLdCk+qv74tiY+0FsD6KPtq0j+i2TlZJhzC/DXcTiX2aHXhsoLX3
         DoIkUEY79PsnqvFwLQ/5CHpRfNUIMSkvAmuaWicHL6OkAllYZxCFidozFXNhpBIAfAM4
         c1ZlhPoqtyY2J0jxOc0xuxsnh3oCeJrA0fqRu2Z66CfDYjqhbr2OFfloh7vlvUSLp737
         l3ZQ==
X-Gm-Message-State: AOJu0YwUHo3crQf2+2rOpQsgTjXiaBXMiU+HaYrvfD32BdDYFANzn/ms
	3X+Lhg+U0Rw6cfU59FOTSfC1olhzOC6tt+PXDX7R30ECtuPDByQVVSAfdjVFI+nTfPb21CAyBWS
	/3LY=
X-Google-Smtp-Source: AGHT+IEAiuJkbEeYM8l5cWVjfEOGPajzPPIB/wpfVy8cg/nud+pl3cVvEARJdj8XW5iahRkTXE3QIw==
X-Received: by 2002:a05:6808:1392:b0:3d2:2833:73e6 with SMTP id 5614622812f47-3d6b4de2024mr6362002b6e.46.1719778077936;
        Sun, 30 Jun 2024 13:07:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.07.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:07:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/35] binutils: stable 2.42 branch updates
Date: Sun, 30 Jun 2024 13:07:15 -0700
Message-Id: <b7a8c28b1de396f371c3bc6c624db6208e217149.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201241

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on binutils-2.42 stable branch are updated.

6c360d37662 PR31898 bug in processing DW_RLE_startx_endx
bfda03eed33 aarch64: Remove asserts from operand qualifier decoders
6224493e457 Re: PR26978, Inconsistency for strong foo@v1 and weak foo@@v1
d125f967537 hppa: Implement PA 2.0 symbolic relocations for long displacements
884fb5373a1 x86/APX: Remove KEYLOCKER and SHA promotions from EVEX MAP4
d816fda3cbd aarch64: Remove B16B16, SVE2p1 and SME2p1
cb11047e34a Re: Move bfd_init to bfd.c
818bcf40efb print cached error messages using _bfd_error_handler
831be495ef1 aarch64: Fix the 2nd operand in gcsstr and gcssttr instructions.

Dropped: 0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |   3 +-
 ...sserts-from-operand-qualifier-decode.patch | 382 ------------------
 2 files changed, 1 insertion(+), 384 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index d2f49560f3..c8f526b5c7 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "553c7f61b74badf91df484450944675efd9cd485"
+SRCREV ?= "cbec9028dd3fa9b49e0204f1a989cea67cae32c6"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -36,6 +36,5 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
-     file://0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch b/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
deleted file mode 100644
index 7b52425a38..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
+++ /dev/null
@@ -1,382 +0,0 @@
-From 5b1c70bfe0d8f84dc28237d6150b7b9d57c791a8 Mon Sep 17 00:00:00 2001
-From: Victor Do Nascimento <victor.donascimento@arm.com>
-Date: Tue, 16 Apr 2024 11:49:15 +0100
-Subject: [PATCH] aarch64: Remove asserts from operand qualifier decoders
- [PR31595]
-
-Given that the disassembler should never abort when decoding
-(potentially random) data, assertion statements in the
-`get_*reg_qualifier_from_value' function family prove problematic.
-
-Consider the random 32-bit word W, encoded in a data segment and
-encountered on execution of `objdump -D <obj_name>'.
-
-If:
-
-  (W & ~opcode_mask) == valid instruction
-
-Then before `print_insn_aarch64_word' has a chance to report the
-instruction as potentially undefined, an attempt will be made to have
-the qualifiers for the instruction's register operands (if any)
-decoded.  If the relevant bits do not map onto a valid qualifier for
-the matched instruction-like word, an abort will be triggered and the
-execution of objdump aborted.
-
-As this scenario is perfectly feasible and, in light of the fact that
-objdump must successfully decode all sections of a given object file,
-it is not appropriate to assert in this family of functions.
-
-Therefore, we add a new pseudo-qualifier `AARCH64_OPND_QLF_ERR' for
-handling invalid qualifier-associated values and re-purpose the
-assertion conditions in qualifier-retrieving functions to be the
-predicate guarding the returning of the calculated qualifier type.
-If the predicate fails, we return this new qualifier and allow the
-caller to handle the error as appropriate.
-
-As these functions are called either from within
-`aarch64_extract_operand' or `do_special_decoding', both of which are
-expected to return non-zero values, it suffices that callers return
-zero upon encountering `AARCH64_OPND_QLF_ERR'.
-
-Ar present the error presented in the hypothetical scenario has been
-encountered in `get_sreg_qualifier_from_value', but the change is made
-to the whole family to keep the interface consistent.
-
-Bug: https://sourceware.org/PR31595
-
-Upstream-Status: Backport [commit 2601b201e95ea0edab89342ee7137c74e88a8a79]
-
-Signed-off-by: Mark Hatle <mark.hatle@amd.com>
----
- .../testsuite/binutils-all/aarch64/illegal.d  |  1 +
- .../testsuite/binutils-all/aarch64/illegal.s  |  3 +
- include/opcode/aarch64.h                      |  3 +
- opcodes/aarch64-dis.c                         | 98 +++++++++++++++----
- 4 files changed, 87 insertions(+), 18 deletions(-)
-
-diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.d b/binutils/testsuite/binutils-all/aarch64/illegal.d
-index 4b90a1d9f39..b69318aec85 100644
---- a/binutils/testsuite/binutils-all/aarch64/illegal.d
-+++ b/binutils/testsuite/binutils-all/aarch64/illegal.d
-@@ -8,5 +8,6 @@ Disassembly of section \.text:
- 
- 0+000 <.*>:
- [ 	]+0:[ 	]+68ea18cc[ 	]+.inst[ 	]+0x68ea18cc ; undefined
-+[ 	]+4:[ 	]+9dc39839[ 	]+.inst[ 	]+0x9dc39839 ; undefined
- #pass
- 
-diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.s b/binutils/testsuite/binutils-all/aarch64/illegal.s
-index 216cbe6f265..43668c6db55 100644
---- a/binutils/testsuite/binutils-all/aarch64/illegal.s
-+++ b/binutils/testsuite/binutils-all/aarch64/illegal.s
-@@ -4,4 +4,7 @@
- 	# ldpsw   x12, x6, [x6],#-8 ; illegal because one of the dest regs is also the address reg
- 	.inst 0x68ea18cc
- 
-+	# illegal, resembles the opcode `ldapur' with invalid qualifier bits
-+	.inst 0x9dc39839
-+
- 	# FIXME: Add more illegal instructions here.
-diff --git a/include/opcode/aarch64.h b/include/opcode/aarch64.h
-index 2fca9528c20..e8fe93ef127 100644
---- a/include/opcode/aarch64.h
-+++ b/include/opcode/aarch64.h
-@@ -894,6 +894,9 @@ enum aarch64_opnd_qualifier
-   /* Special qualifier helping retrieve qualifier information during the
-      decoding time (currently not in use).  */
-   AARCH64_OPND_QLF_RETRIEVE,
-+
-+  /* Special qualifier used for indicating error in qualifier retrieval.  */
-+  AARCH64_OPND_QLF_ERR,
- };
- 
- /* Instruction class.  */
-diff --git a/opcodes/aarch64-dis.c b/opcodes/aarch64-dis.c
-index 96f42ae862a..b70e6da9eb7 100644
---- a/opcodes/aarch64-dis.c
-+++ b/opcodes/aarch64-dis.c
-@@ -219,9 +219,10 @@ static inline enum aarch64_opnd_qualifier
- get_greg_qualifier_from_value (aarch64_insn value)
- {
-   enum aarch64_opnd_qualifier qualifier = AARCH64_OPND_QLF_W + value;
--  assert (value <= 0x1
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x1
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given VALUE, return qualifier for a vector register.  This does not support
-@@ -237,9 +238,10 @@ get_vreg_qualifier_from_value (aarch64_insn value)
-   if (qualifier >= AARCH64_OPND_QLF_V_2H)
-     qualifier += 1;
- 
--  assert (value <= 0x8
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x8
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given VALUE, return qualifier for an FP or AdvSIMD scalar register.  */
-@@ -248,9 +250,10 @@ get_sreg_qualifier_from_value (aarch64_insn value)
- {
-   enum aarch64_opnd_qualifier qualifier = AARCH64_OPND_QLF_S_B + value;
- 
--  assert (value <= 0x4
--	  && aarch64_get_qualifier_standard_value (qualifier) == value);
--  return qualifier;
-+  if (value <= 0x4
-+      && aarch64_get_qualifier_standard_value (qualifier) == value)
-+    return qualifier;
-+  return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Given the instruction in *INST which is probably half way through the
-@@ -263,13 +266,17 @@ get_expected_qualifier (const aarch64_inst *inst, int i)
- {
-   aarch64_opnd_qualifier_seq_t qualifiers;
-   /* Should not be called if the qualifier is known.  */
--  assert (inst->operands[i].qualifier == AARCH64_OPND_QLF_NIL);
--  int invalid_count;
--  if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
--			       i, qualifiers, &invalid_count))
--    return qualifiers[i];
-+  if (inst->operands[i].qualifier == AARCH64_OPND_QLF_NIL)
-+    {
-+      int invalid_count;
-+      if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
-+				   i, qualifiers, &invalid_count))
-+	return qualifiers[i];
-+      else
-+	return AARCH64_OPND_QLF_NIL;
-+    }
-   else
--    return AARCH64_OPND_QLF_NIL;
-+    return AARCH64_OPND_QLF_ERR;
- }
- 
- /* Operand extractors.  */
-@@ -355,6 +362,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 	  aarch64_insn value = extract_field (FLD_imm4_11, code, 0);
- 	  /* Depend on AARCH64_OPND_Ed to determine the qualifier.  */
- 	  info->qualifier = get_expected_qualifier (inst, info->idx);
-+	  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
- 	  shift = get_logsz (aarch64_get_qualifier_esize (info->qualifier));
- 	  info->reglane.index = value >> shift;
- 	}
-@@ -374,6 +383,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 	  if (pos > 3)
- 	    return false;
- 	  info->qualifier = get_sreg_qualifier_from_value (pos);
-+	  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
- 	  info->reglane.index = (unsigned) (value >> 1);
- 	}
-     }
-@@ -381,6 +392,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
-     {
-       /* Need information in other operand(s) to help decoding.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       switch (info->qualifier)
- 	{
- 	case AARCH64_OPND_QLF_S_4B:
-@@ -405,6 +418,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarch64_opnd_info *info,
- 
-       /* Need information in other operand(s) to help decoding.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       switch (info->qualifier)
- 	{
- 	case AARCH64_OPND_QLF_S_H:
-@@ -644,9 +659,15 @@ aarch64_ext_advsimd_imm_shift (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 	 1xxx	1	2D  */
-       info->qualifier =
- 	get_vreg_qualifier_from_value ((pos << 1) | (int) Q);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return false;
-     }
-   else
--    info->qualifier = get_sreg_qualifier_from_value (pos);
-+    {
-+      info->qualifier = get_sreg_qualifier_from_value (pos);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-+    }
- 
-   if (info->type == AARCH64_OPND_IMM_VLSR)
-     /* immh	<shift>
-@@ -773,6 +794,8 @@ aarch64_ext_advsimd_imm_modified (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 
-   /* cmode */
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   switch (info->qualifier)
-     {
-     case AARCH64_OPND_QLF_NIL:
-@@ -1014,6 +1037,8 @@ aarch64_ext_ft (const aarch64_operand *self ATTRIBUTE_UNUSED,
-       if (value > 0x4)
- 	return false;
-       info->qualifier = get_sreg_qualifier_from_value (value);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   return true;
-@@ -1086,6 +1111,8 @@ aarch64_ext_rcpc3_addr_offset (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 			       aarch64_operand_error *errors ATTRIBUTE_UNUSED)
- {
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1105,6 +1132,8 @@ aarch64_ext_addr_offset (const aarch64_operand *self ATTRIBUTE_UNUSED,
- 			 aarch64_operand_error *errors ATTRIBUTE_UNUSED)
- {
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1154,6 +1183,8 @@ aarch64_ext_addr_regoff (const aarch64_operand *self ATTRIBUTE_UNUSED,
-       /* Need information in other operand(s) to help achieve the decoding
- 	 from 'S' field.  */
-       info->qualifier = get_expected_qualifier (inst, info->idx);
-+      if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       /* Get the size of the data element that is accessed, which may be
- 	 different from that of the source register size, e.g. in strb/ldrb.  */
-       size = aarch64_get_qualifier_esize (info->qualifier);
-@@ -1172,6 +1203,8 @@ aarch64_ext_addr_simm (const aarch64_operand *self, aarch64_opnd_info *info,
- {
-   aarch64_insn imm;
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
- 
-   /* Rn */
-   info->addr.base_regno = extract_field (FLD_Rn, code, 0);
-@@ -1210,6 +1243,8 @@ aarch64_ext_addr_uimm12 (const aarch64_operand *self, aarch64_opnd_info *info,
- {
-   int shift;
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   shift = get_logsz (aarch64_get_qualifier_esize (info->qualifier));
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-@@ -1228,6 +1263,8 @@ aarch64_ext_addr_simm10 (const aarch64_operand *self, aarch64_opnd_info *info,
-   aarch64_insn imm;
- 
-   info->qualifier = get_expected_qualifier (inst, info->idx);
-+  if (info->qualifier == AARCH64_OPND_QLF_ERR)
-+    return 0;
-   /* Rn */
-   info->addr.base_regno = extract_field (self->fields[0], code, 0);
-   /* simm10 */
-@@ -2467,6 +2504,8 @@ decode_sizeq (aarch64_inst *inst)
-   if (mask == 0x7)
-     {
-       inst->operands[idx].qualifier = get_vreg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       return 1;
-     }
- 
-@@ -2649,6 +2688,8 @@ do_special_decoding (aarch64_inst *inst)
-       idx = select_operand_for_sf_field_coding (inst->opcode);
-       value = extract_field (FLD_sf, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       if ((inst->opcode->flags & F_N)
- 	  && extract_field (FLD_N, inst->value, 0) != value)
- 	return 0;
-@@ -2659,6 +2700,8 @@ do_special_decoding (aarch64_inst *inst)
-       idx = select_operand_for_sf_field_coding (inst->opcode);
-       value = extract_field (FLD_lse_sz, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
-   /* rcpc3 'size' field.  */
-   if (inst->opcode->flags & F_RCPC3_SIZE)
-@@ -2670,12 +2713,18 @@ do_special_decoding (aarch64_inst *inst)
- 	{
- 	  if (aarch64_operands[inst->operands[i].type].op_class
- 	      == AARCH64_OPND_CLASS_INT_REG)
--	    inst->operands[i].qualifier = get_greg_qualifier_from_value (value & 1);
-+	    {
-+	      inst->operands[i].qualifier = get_greg_qualifier_from_value (value & 1);
-+	      if (inst->operands[i].qualifier == AARCH64_OPND_QLF_ERR)
-+		return 0;
-+	    }
- 	  else if (aarch64_operands[inst->operands[i].type].op_class
- 	      == AARCH64_OPND_CLASS_FP_REG)
- 	    {
- 	      value += (extract_field (FLD_opc1, inst->value, 0) << 2);
- 	      inst->operands[i].qualifier = get_sreg_qualifier_from_value (value);
-+	      if (inst->operands[i].qualifier == AARCH64_OPND_QLF_ERR)
-+		return 0;
- 	    }
- 	}
-     }
-@@ -2709,7 +2758,11 @@ do_special_decoding (aarch64_inst *inst)
-       /* For most related instruciton, the 'size' field is fully available for
- 	 operand encoding.  */
-       if (mask == 0x3)
--	inst->operands[idx].qualifier = get_sreg_qualifier_from_value (value);
-+	{
-+	  inst->operands[idx].qualifier = get_sreg_qualifier_from_value (value);
-+	  if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	    return 0;
-+	}
-       else
- 	{
- 	  get_operand_possible_qualifiers (idx, inst->opcode->qualifiers_list,
-@@ -2744,6 +2797,9 @@ do_special_decoding (aarch64_inst *inst)
-       Q = (unsigned) extract_field (FLD_Q, inst->value, inst->opcode->mask);
-       inst->operands[0].qualifier =
- 	get_vreg_qualifier_from_value ((num << 1) | Q);
-+      if (inst->operands[0].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-+
-     }
- 
-   if ((inst->opcode->flags & F_OPD_SIZE) && inst->opcode->iclass == sve2_urqvs)
-@@ -2753,7 +2809,11 @@ do_special_decoding (aarch64_inst *inst)
- 				       inst->opcode->mask);
-       inst->operands[0].qualifier
- 	= get_vreg_qualifier_from_value (1 + (size << 1));
-+      if (inst->operands[0].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-       inst->operands[2].qualifier = get_sreg_qualifier_from_value (size);
-+      if (inst->operands[2].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   if (inst->opcode->flags & F_GPRSIZE_IN_Q)
-@@ -2772,6 +2832,8 @@ do_special_decoding (aarch64_inst *inst)
-       assert (idx == 0 || idx == 1);
-       value = extract_field (FLD_Q, inst->value, 0);
-       inst->operands[idx].qualifier = get_greg_qualifier_from_value (value);
-+      if (inst->operands[idx].qualifier == AARCH64_OPND_QLF_ERR)
-+	return 0;
-     }
- 
-   if (inst->opcode->flags & F_LDS_SIZE)
--- 
-2.34.1
-
-- 
2.34.1


