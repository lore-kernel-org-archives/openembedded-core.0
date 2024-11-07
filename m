Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73983D5AE4C
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:11 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.64150.1730950686888890736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wg9pEVfz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ee4c57b037so441502a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950686; x=1731555486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZE5LPNkFa7jOA9GavpYpVu5zvwO7C4seyGRjyCimDw=;
        b=wg9pEVfz3fmH2SaOjWTJbURvchlxQbdJGGhD1MNSViddEnhXj4T1chyJ6ZNbuiZssL
         8Rnv2CZtGGjE44qe5a5HQKpl1IfXHsrNpVsiia06/IzMvw83QjCS6doxejkpC7kU7cQB
         bkUDvbJeLLLj2zE/QRtVEe2SuLb6IzgwA23+SUlUOVsxHSgXzvJZ7n9OvB8deh2Ng7tu
         BIGpP4LhqkMPxrcIwrZpYE72ppUsiCP5chcI2ZDyPEDZOTvABqZNQvV2NeuVJdhkJbe7
         Vl5v3AVTVAy455S9V/PwRWRcXwlNT7jltGRiu+vAfdPgddG5lPvoQg5Ocr+uAXzK5hTy
         ekQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950686; x=1731555486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZE5LPNkFa7jOA9GavpYpVu5zvwO7C4seyGRjyCimDw=;
        b=WflVUITe7e0VFQq9GncbzM5gVvdFkLJfxb+IQP3GD2q8RbVXfQ2/dPR2QNEXPJkcUI
         RJK81k9P0ZnDIP/TSM/SNf0pTPaO7v6Glzkrxw3/hYHQ3i5wXMca3gA/vwaTdA5Ij+s1
         dUr2kuzJLbdqOgwVE9Sf+LeyEyje9xr0k5kCVbizwLd0Sz1BIgRHeQmjzFFCyiexTweq
         4H77cquqHEaN00dwwF0YtQQTpLb7CSuPA8HC+Gz2TNxXYdmXUcEiN1IFX1VUz3Vj7r7L
         fOOI0jIEMsHnp7MwiRsQBzwX2A3EJn+NGs/kkQlU4x0nNx3GfwmMnRnXwYcjudKyqcDM
         PdHQ==
X-Gm-Message-State: AOJu0Ywekq0lqHt/HZYQhJtZJrwNFt1crntmQeOwAX/Xm0igj5InQzg5
	e9X1VU8SIvSvB93mfttQxFz81/3pOJeHna9FRgrpjhCf7t0o3JfhI/nmSQV6IFxsxDPMsxx+QvW
	Y
X-Google-Smtp-Source: AGHT+IGkjXxIQV6RSG4DWsoCNA3GmVfequlUaB6Z8bOZQwVhASfUmMRGN/FBM9/9zjf/OJuEwlDoqg==
X-Received: by 2002:a05:6a21:3943:b0:1d9:21a0:14e0 with SMTP id adf61e73a8af0-1dba52a4274mr27764281637.12.1730950685613;
        Wed, 06 Nov 2024 19:38:05 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/10] rust-llvm: Fix CVE-2024-0151
Date: Wed,  6 Nov 2024 19:37:43 -0800
Message-Id: <175e22f2df542b0e1eb638c43c11eeefe794b0b7.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206821

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0004-llvm-Fix-CVE-2024-0151.patch         | 1086 +++++++++++++++++
 .../recipes-devtools/rust/rust-llvm_1.75.0.bb |    3 +-
 2 files changed, 1088 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch b/meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch
new file mode 100644
index 0000000000..c05685e64d
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch
@@ -0,0 +1,1086 @@
+commit 78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
+Author: Lucas Duarte Prates <lucas.prates@arm.com>
+Date:   Thu Jun 20 10:22:01 2024 +0100
+
+    [ARM] CMSE security mitigation on function arguments and returned values (#89944)
+
+    The ABI mandates two things related to function calls:
+     - Function arguments must be sign- or zero-extended to the register
+       size by the caller.
+     - Return values must be sign- or zero-extended to the register size by
+       the callee.
+
+    As consequence, callees can assume that function arguments have been
+    extended and so can callers with regards to return values.
+
+    Here lies the problem: Nonsecure code might deliberately ignore this
+    mandate with the intent of attempting an exploit. It might try to pass
+    values that lie outside the expected type's value range in order to
+    trigger undefined behaviour, e.g. out of bounds access.
+
+    With the mitigation implemented, Secure code always performs extension
+    of values passed by Nonsecure code.
+
+    This addresses the vulnerability described in CVE-2024-0151.
+
+    Patches by Victor Campos.
+
+    ---------
+
+    Co-authored-by: Victor Campos <victor.campos@arm.com>
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/78ff617d3f573fb3a9b2fef180fa0fd43d5584ea]
+CVE: CVE-2024-0151
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+diff --git a/llvm/lib/Target/ARM/ARMISelLowering.cpp b/llvm/lib/Target/ARM/ARMISelLowering.cpp
+index bfe137b95602..5490c3c9df6c 100644
+--- a/llvm/lib/Target/ARM/ARMISelLowering.cpp
++++ b/llvm/lib/Target/ARM/ARMISelLowering.cpp
+@@ -156,6 +156,17 @@ static const MCPhysReg GPRArgRegs[] = {
+   ARM::R0, ARM::R1, ARM::R2, ARM::R3
+ };
+ 
++static SDValue handleCMSEValue(const SDValue &Value, const ISD::InputArg &Arg,
++                               SelectionDAG &DAG, const SDLoc &DL) {
++  assert(Arg.ArgVT.isScalarInteger());
++  assert(Arg.ArgVT.bitsLT(MVT::i32));
++  SDValue Trunc = DAG.getNode(ISD::TRUNCATE, DL, Arg.ArgVT, Value);
++  SDValue Ext =
++      DAG.getNode(Arg.Flags.isSExt() ? ISD::SIGN_EXTEND : ISD::ZERO_EXTEND, DL,
++                  MVT::i32, Trunc);
++  return Ext;
++}
++
+ void ARMTargetLowering::addTypeForNEON(MVT VT, MVT PromotedLdStVT) {
+   if (VT != PromotedLdStVT) {
+     setOperationAction(ISD::LOAD, VT, Promote);
+@@ -2196,7 +2207,7 @@ SDValue ARMTargetLowering::LowerCallResult(
+     SDValue Chain, SDValue InGlue, CallingConv::ID CallConv, bool isVarArg,
+     const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &dl,
+     SelectionDAG &DAG, SmallVectorImpl<SDValue> &InVals, bool isThisReturn,
+-    SDValue ThisVal) const {
++    SDValue ThisVal, bool isCmseNSCall) const {
+   // Assign locations to each value returned by this call.
+   SmallVector<CCValAssign, 16> RVLocs;
+   CCState CCInfo(CallConv, isVarArg, DAG.getMachineFunction(), RVLocs,
+@@ -2274,6 +2285,15 @@ SDValue ARMTargetLowering::LowerCallResult(
+         (VA.getValVT() == MVT::f16 || VA.getValVT() == MVT::bf16))
+       Val = MoveToHPR(dl, DAG, VA.getLocVT(), VA.getValVT(), Val);
+ 
++    // On CMSE Non-secure Calls, call results (returned values) whose bitwidth
++    // is less than 32 bits must be sign- or zero-extended after the call for
++    // security reasons. Although the ABI mandates an extension done by the
++    // callee, the latter cannot be trusted to follow the rules of the ABI.
++    const ISD::InputArg &Arg = Ins[VA.getValNo()];
++    if (isCmseNSCall && Arg.ArgVT.isScalarInteger() &&
++        VA.getLocVT().isScalarInteger() && Arg.ArgVT.bitsLT(MVT::i32))
++      Val = handleCMSEValue(Val, Arg, DAG, dl);
++
+     InVals.push_back(Val);
+   }
+ 
+@@ -2888,7 +2908,7 @@ ARMTargetLowering::LowerCall(TargetLowering::CallLoweringInfo &CLI,
+   // return.
+   return LowerCallResult(Chain, InGlue, CallConv, isVarArg, Ins, dl, DAG,
+                          InVals, isThisReturn,
+-                         isThisReturn ? OutVals[0] : SDValue());
++                         isThisReturn ? OutVals[0] : SDValue(), isCmseNSCall);
+ }
+ 
+ /// HandleByVal - Every parameter *after* a byval parameter is passed
+@@ -4485,8 +4505,6 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+                  *DAG.getContext());
+   CCInfo.AnalyzeFormalArguments(Ins, CCAssignFnForCall(CallConv, isVarArg));
+ 
+-  SmallVector<SDValue, 16> ArgValues;
+-  SDValue ArgValue;
+   Function::const_arg_iterator CurOrigArg = MF.getFunction().arg_begin();
+   unsigned CurArgIdx = 0;
+ 
+@@ -4541,6 +4559,7 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+     // Arguments stored in registers.
+     if (VA.isRegLoc()) {
+       EVT RegVT = VA.getLocVT();
++      SDValue ArgValue;
+ 
+       if (VA.needsCustom() && VA.getLocVT() == MVT::v2f64) {
+         // f64 and vector types are split up into multiple registers or
+@@ -4604,16 +4623,6 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+       case CCValAssign::BCvt:
+         ArgValue = DAG.getNode(ISD::BITCAST, dl, VA.getValVT(), ArgValue);
+         break;
+-      case CCValAssign::SExt:
+-        ArgValue = DAG.getNode(ISD::AssertSext, dl, RegVT, ArgValue,
+-                               DAG.getValueType(VA.getValVT()));
+-        ArgValue = DAG.getNode(ISD::TRUNCATE, dl, VA.getValVT(), ArgValue);
+-        break;
+-      case CCValAssign::ZExt:
+-        ArgValue = DAG.getNode(ISD::AssertZext, dl, RegVT, ArgValue,
+-                               DAG.getValueType(VA.getValVT()));
+-        ArgValue = DAG.getNode(ISD::TRUNCATE, dl, VA.getValVT(), ArgValue);
+-        break;
+       }
+ 
+       // f16 arguments have their size extended to 4 bytes and passed as if they
+@@ -4623,6 +4632,15 @@ SDValue ARMTargetLowering::LowerFormalArguments(
+           (VA.getValVT() == MVT::f16 || VA.getValVT() == MVT::bf16))
+         ArgValue = MoveToHPR(dl, DAG, VA.getLocVT(), VA.getValVT(), ArgValue);
+ 
++      // On CMSE Entry Functions, formal integer arguments whose bitwidth is
++      // less than 32 bits must be sign- or zero-extended in the callee for
++      // security reasons. Although the ABI mandates an extension done by the
++      // caller, the latter cannot be trusted to follow the rules of the ABI.
++      const ISD::InputArg &Arg = Ins[VA.getValNo()];
++      if (AFI->isCmseNSEntryFunction() && Arg.ArgVT.isScalarInteger() &&
++          RegVT.isScalarInteger() && Arg.ArgVT.bitsLT(MVT::i32))
++        ArgValue = handleCMSEValue(ArgValue, Arg, DAG, dl);
++
+       InVals.push_back(ArgValue);
+     } else { // VA.isRegLoc()
+       // Only arguments passed on the stack should make it here.
+diff --git a/llvm/lib/Target/ARM/ARMISelLowering.h b/llvm/lib/Target/ARM/ARMISelLowering.h
+index 62a52bdb03f7..a255e9b6fc36 100644
+--- a/llvm/lib/Target/ARM/ARMISelLowering.h
++++ b/llvm/lib/Target/ARM/ARMISelLowering.h
+@@ -891,7 +891,7 @@ class VectorType;
+                             const SmallVectorImpl<ISD::InputArg> &Ins,
+                             const SDLoc &dl, SelectionDAG &DAG,
+                             SmallVectorImpl<SDValue> &InVals, bool isThisReturn,
+-                            SDValue ThisVal) const;
++                            SDValue ThisVal, bool isCmseNSCall) const;
+ 
+     bool supportSplitCSR(MachineFunction *MF) const override {
+       return MF->getFunction().getCallingConv() == CallingConv::CXX_FAST_TLS &&
+diff --git a/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll b/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll
+new file mode 100644
+index 0000000000..58eef443c25e
+--- /dev/null
++++ b/llvm/test/CodeGen/ARM/cmse-harden-call-returned-values.ll
+@@ -0,0 +1,552 @@
++; RUN: llc %s -mtriple=thumbv8m.main     -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-LE
++; RUN: llc %s -mtriple=thumbebv8m.main   -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-BE
++; RUN: llc %s -mtriple=thumbv8.1m.main   -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-LE
++; RUN: llc %s -mtriple=thumbebv8.1m.main -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-BE
++
++@get_idx = hidden local_unnamed_addr global ptr null, align 4
++@arr = hidden local_unnamed_addr global [256 x i32] zeroinitializer, align 4
++
++define i32 @access_i16() {
++; V8M-COMMON-LABEL: access_i16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i16 %0() "cmse_nonsecure_call"
++  %idxprom = sext i16 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u16() {
++; V8M-COMMON-LABEL: access_u16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i16 %0() "cmse_nonsecure_call"
++  %idxprom = zext i16 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i8() {
++; V8M-COMMON-LABEL: access_i8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i8 %0() "cmse_nonsecure_call"
++  %idxprom = sext i8 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u8() {
++; V8M-COMMON-LABEL: access_u8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i8 %0() "cmse_nonsecure_call"
++  %idxprom = zext i8 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i1() {
++; V8M-COMMON-LABEL: access_i1:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i1:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i1 %0() "cmse_nonsecure_call"
++  %idxprom = zext i1 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i5() {
++; V8M-COMMON-LABEL: access_i5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call signext i5 %0() "cmse_nonsecure_call"
++  %idxprom = sext i5 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_u5() {
++; V8M-COMMON-LABEL: access_u5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V8M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V8M-COMMON-NEXT:    ldr r0, [r0]
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #31
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    movw r0, :lower16:get_idx
++; V81M-COMMON-NEXT:    movt r0, :upper16:get_idx
++; V81M-COMMON-NEXT:    ldr r0, [r0]
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #31
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %0 = load ptr, ptr @get_idx, align 4
++  %call = tail call zeroext i5 %0() "cmse_nonsecure_call"
++  %idxprom = zext i5 %call to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %1 = load i32, ptr %arrayidx, align 4
++  ret i32 %1
++}
++
++define i32 @access_i33(ptr %f) {
++; V8M-COMMON-LABEL: access_i33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    rsb.w r0, r0, #0
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_i33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    rsb.w r0, r0, #0
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %call = tail call i33 %f() "cmse_nonsecure_call"
++  %shr = ashr i33 %call, 32
++  %conv = trunc nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u33(ptr %f) {
++; V8M-COMMON-LABEL: access_u33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    push {r7, lr}
++; V8M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-COMMON-NEXT:    bic r0, r0, #1
++; V8M-COMMON-NEXT:    sub sp, #136
++; V8M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    mov r1, r0
++; V8M-COMMON-NEXT:    mov r2, r0
++; V8M-COMMON-NEXT:    mov r3, r0
++; V8M-COMMON-NEXT:    mov r4, r0
++; V8M-COMMON-NEXT:    mov r5, r0
++; V8M-COMMON-NEXT:    mov r6, r0
++; V8M-COMMON-NEXT:    mov r7, r0
++; V8M-COMMON-NEXT:    mov r8, r0
++; V8M-COMMON-NEXT:    mov r9, r0
++; V8M-COMMON-NEXT:    mov r10, r0
++; V8M-COMMON-NEXT:    mov r11, r0
++; V8M-COMMON-NEXT:    mov r12, r0
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, r0
++; V8M-COMMON-NEXT:    blxns r0
++; V8M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V8M-COMMON-NEXT:    add sp, #136
++; V8M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    pop {r7, pc}
++;
++; V81M-COMMON-LABEL: access_u33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    push {r7, lr}
++; V81M-COMMON-NEXT:    push.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-COMMON-NEXT:    bic r0, r0, #1
++; V81M-COMMON-NEXT:    sub sp, #136
++; V81M-COMMON-NEXT:    vlstm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, apsr}
++; V81M-COMMON-NEXT:    blxns r0
++; V81M-COMMON-NEXT:    vlldm sp, {d0 - d15}
++; V81M-COMMON-NEXT:    add sp, #136
++; V81M-COMMON-NEXT:    pop.w {r4, r5, r6, r7, r8, r9, r10, r11}
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    pop {r7, pc}
++entry:
++  %call = tail call i33 %f() "cmse_nonsecure_call"
++  %shr = lshr i33 %call, 32
++  %conv = trunc nuw nsw i33 %shr to i32
++  ret i32 %conv
++}
+diff --git a/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll b/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll
+new file mode 100644
+index 0000000000..c66ab00566dd
+--- /dev/null
++++ b/llvm/test/CodeGen/ARM/cmse-harden-entry-arguments.ll
+@@ -0,0 +1,368 @@
++; RUN: llc %s -mtriple=thumbv8m.main     -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-LE
++; RUN: llc %s -mtriple=thumbebv8m.main   -o - | FileCheck %s --check-prefixes V8M-COMMON,V8M-BE
++; RUN: llc %s -mtriple=thumbv8.1m.main   -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-LE
++; RUN: llc %s -mtriple=thumbebv8.1m.main -o - | FileCheck %s --check-prefixes V81M-COMMON,V81M-BE
++
++@arr = hidden local_unnamed_addr global [256 x i32] zeroinitializer, align 4
++
++define i32 @access_i16(i16 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i16 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u16(i16 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u16:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxth r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u16:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxth r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i16 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i8(i8 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i8 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u8(i8 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u8:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    uxtb r0, r0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u8:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    uxtb r0, r0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i8 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i1(i1 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i1:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    rsbs r0, r0, #0
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i1:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    rsbs r0, r0, #0
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #1
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i1 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i5(i5 signext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    sbfx r0, r0, #0, #5
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = sext i5 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_u5(i5 zeroext %idx) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u5:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    movw r1, :lower16:arr
++; V8M-COMMON-NEXT:    and r0, r0, #31
++; V8M-COMMON-NEXT:    movt r1, :upper16:arr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u5:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    movw r1, :lower16:arr
++; V81M-COMMON-NEXT:    and r0, r0, #31
++; V81M-COMMON-NEXT:    movt r1, :upper16:arr
++; V81M-COMMON-NEXT:    ldr.w r0, [r1, r0, lsl #2]
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %idxprom = zext i5 %idx to i32
++  %arrayidx = getelementptr inbounds [256 x i32], ptr @arr, i32 0, i32 %idxprom
++  %0 = load i32, ptr %arrayidx, align 4
++  ret i32 %0
++}
++
++define i32 @access_i33(i33 %arg) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    rsbs r0, r0, #0
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    rsbs r0, r0, #0
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %shr = ashr i33 %arg, 32
++  %conv = trunc nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u33(i33 %arg) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u33:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-LE-NEXT:        and r0, r1, #1
++; V8M-BE-NEXT:        and r0, r0, #1
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u33:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-LE-NEXT:        and r0, r1, #1
++; V81M-BE-NEXT:        and r0, r0, #1
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %shr = lshr i33 %arg, 32
++  %conv = trunc nuw nsw i33 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_i65(ptr byval(i65) %0) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_i65:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    sub sp, #16
++; V8M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V8M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V8M-LE-NEXT:        and r0, r0, #1
++; V8M-LE-NEXT:        rsbs r0, r0, #0
++; V8M-BE-NEXT:        movs r1, #0
++; V8M-BE-NEXT:        sub.w r0, r1, r0, lsr #24
++; V8M-COMMON-NEXT:    add sp, #16
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_i65:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    sub sp, #16
++; V81M-COMMON-NEXT:    add sp, #4
++; V81M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V81M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V81M-LE-NEXT:        and r0, r0, #1
++; V81M-LE-NEXT:        rsbs r0, r0, #0
++; V81M-BE-NEXT:        movs r1, #0
++; V81M-BE-NEXT:        sub.w r0, r1, r0, lsr #24
++; V81M-COMMON-NEXT:    sub sp, #4
++; V81M-COMMON-NEXT:    add sp, #16
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %arg = load i65, ptr %0, align 8
++  %shr = ashr i65 %arg, 64
++  %conv = trunc nsw i65 %shr to i32
++  ret i32 %conv
++}
++
++define i32 @access_u65(ptr byval(i65) %0) "cmse_nonsecure_entry" {
++; V8M-COMMON-LABEL: access_u65:
++; V8M-COMMON:       @ %bb.0: @ %entry
++; V8M-COMMON-NEXT:    sub sp, #16
++; V8M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V8M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V8M-BE-NEXT:        lsrs r0, r0, #24
++; V8M-COMMON-NEXT:    add sp, #16
++; V8M-COMMON-NEXT:    mov r1, lr
++; V8M-COMMON-NEXT:    mov r2, lr
++; V8M-COMMON-NEXT:    mov r3, lr
++; V8M-COMMON-NEXT:    mov r12, lr
++; V8M-COMMON-NEXT:    msr apsr_nzcvq, lr
++; V8M-COMMON-NEXT:    bxns lr
++;
++; V81M-COMMON-LABEL: access_u65:
++; V81M-COMMON:       @ %bb.0: @ %entry
++; V81M-COMMON-NEXT:    vstr fpcxtns, [sp, #-4]!
++; V81M-COMMON-NEXT:    sub sp, #16
++; V81M-COMMON-NEXT:    add sp, #4
++; V81M-COMMON-NEXT:    stm.w sp, {r0, r1, r2, r3}
++; V81M-LE-NEXT:        ldrb.w r0, [sp, #8]
++; V81M-BE-NEXT:        lsrs r0, r0, #24
++; V81M-COMMON-NEXT:    sub sp, #4
++; V81M-COMMON-NEXT:    add sp, #16
++; V81M-COMMON-NEXT:    vscclrm {s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, vpr}
++; V81M-COMMON-NEXT:    vldr fpcxtns, [sp], #4
++; V81M-COMMON-NEXT:    clrm {r1, r2, r3, r12, apsr}
++; V81M-COMMON-NEXT:    bxns lr
++entry:
++  %arg = load i65, ptr %0, align 8
++  %shr = lshr i65 %arg, 64
++  %conv = trunc nuw nsw i65 %shr to i32
++  ret i32 %conv
++}
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index 13bdadb5e7..292fc15c55 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -10,7 +10,8 @@ require rust-source.inc
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
+	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
+            file://0004-llvm-Fix-CVE-2024-0151.patch;striplevel=2"
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 
-- 
2.34.1


