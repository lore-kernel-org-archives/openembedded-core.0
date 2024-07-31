Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F7FC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 12:02:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.41334.1722427337245047776
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 05:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Wz9ig5i2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc4fcbb131so50237825ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722427336; x=1723032136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVoUA9e7zgM4THRlTKl2cZ1n4XXkHadvSTzCDTpsYsY=;
        b=Wz9ig5i2vCN3WaoD1t1IZF1PaCINRgbQ0AoUSfGI+MUakSFt3PSKrwtDA1zvh3zsfr
         L0T58cATEjCKdacN8QLSsRLxihC6ulx7BA3m9WNSm+/y0CZF5VkDaFBY1WWptbklYYrQ
         +iq6tTIJ7gtlgPTxQvYtZAVxihz/8ZaJoqwF6CS6SPWkw4rGyll3+mQPxGsqhxaKo3pa
         dYpTEQzLlf9eRjAmV7Cg+NPM4JOt6f8okv0cuGMS+RTKZ5eXc0p20PUC7oTdktRN5nCt
         dyXwjrWFMCfeJ8xVGjic0d9mTvrUgtjSxlq6DBmCUP4yerNh5qWsbNqsH4W/SAcNhurp
         BypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427336; x=1723032136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVoUA9e7zgM4THRlTKl2cZ1n4XXkHadvSTzCDTpsYsY=;
        b=Sr0ItCPHqNEKSHe9AM0XHTKww9c1Snehiq819zrXHIMr++n+bd0dVuwmY+q6cd4ubh
         iVGbmnkchZWnJIo215jPMc0WfLPS870TPzmCeN8EhpNmWVKDPzyspmWrJN+/49ZhDQy/
         XO9Rh3wVtmifz9oSt69iFa6a6W+kplDEY5otoAT1i+myfqd9k8Ri60jNb7jrzO05GAia
         ruT0NrUeD6SXkRxAoeXm8IjNgkTLDFxqIxxoQOCBNuIE/SQJz69mkcQjsEjvJOcuoflS
         3ttXI5UtsTHQ7CJU8/yuM5MQe7fC0CXaBUWrCVV2GRPTp0eR4XwruoyZ+xhoOjiOUmz9
         dVMQ==
X-Gm-Message-State: AOJu0YxqHuAofw96UIBZJYCcNJHeSZcgR8NLYzDunSMxqw/1+CKCANtF
	h74IdYIkuz3xMdNWWxvJtDpCvwEoVKpmEtk/VnEdaG377+pibbG41cIgOpQx/ZcnxiL5N+ccljY
	3cQE=
X-Google-Smtp-Source: AGHT+IHu3suKLr4C2K/E7/mv9ABn/ZCs8YhTsA7bCDF6y4nb92BxCkGQFqQ65sfOuDkSbrRHbZVWuw==
X-Received: by 2002:a17:902:c40e:b0:1fd:69e0:a8e5 with SMTP id d9443c01a7336-1ff048d4cb2mr168836835ad.41.1722427336014;
        Wed, 31 Jul 2024 05:02:16 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d4129asm119048315ad.118.2024.07.31.05.02.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:02:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] llvm: Fix CVE-2024-31852
Date: Wed, 31 Jul 2024 05:02:03 -0700
Message-Id: <c001e2af10d8afa13c8f50632a074c5a9a00d7bb.1722427225.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722427225.git.steve@sakoman.com>
References: <cover.1722427225.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 12:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202706

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../llvm/llvm/CVE-2024-31852-1.patch          |  85 +++++++++++++
 .../llvm/llvm/CVE-2024-31852-2.patch          | 117 ++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |   2 +
 3 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/CVE-2024-31852-1.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/CVE-2024-31852-2.patch

diff --git a/meta/recipes-devtools/llvm/llvm/CVE-2024-31852-1.patch b/meta/recipes-devtools/llvm/llvm/CVE-2024-31852-1.patch
new file mode 100644
index 0000000000..7cf4a52715
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/CVE-2024-31852-1.patch
@@ -0,0 +1,85 @@
+commit b1a5ee1febd8a903cec3dfdad61d57900dc3823e
+Author: Florian Hahn <flo@fhahn.com>
+Date:   Wed Dec 20 16:56:15 2023 +0100
+
+    [ARM] Check all terms in emitPopInst when clearing Restored for LR. (#75527)
+    
+    emitPopInst checks a single function exit MBB. If other paths also exit
+    the function and any of there terminators uses LR implicitly, it is not
+    save to clear the Restored bit.
+    
+    Check all terminators for the function before clearing Restored.
+    
+    This fixes a mis-compile in outlined-fn-may-clobber-lr-in-caller.ll
+    where the machine-outliner previously introduced BLs that clobbered LR
+    which in turn is used by the tail call return.
+    
+    Alternative to #73553
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/b1a5ee1febd8a903cec3dfdad61d57900dc3823e]
+CVE: CVE-2024-31852
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.cpp b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
+index 025e43444f9c..a9acf338ebf5 100644
+--- a/llvm/lib/Target/ARM/ARMFrameLowering.cpp
++++ b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
+@@ -1236,9 +1236,6 @@ void ARMFrameLowering::emitPopInst(MachineBasicBlock &MBB,
+         // Fold the return instruction into the LDM.
+         DeleteRet = true;
+         LdmOpc = AFI->isThumbFunction() ? ARM::t2LDMIA_RET : ARM::LDMIA_RET;
+-        // We 'restore' LR into PC so it is not live out of the return block:
+-        // Clear Restored bit.
+-        Info.setRestored(false);
+       }
+ 
+       // If NoGap is true, pop consecutive registers and then leave the rest
+@@ -2292,6 +2289,33 @@ void ARMFrameLowering::determineCalleeSaves(MachineFunction &MF,
+   AFI->setLRIsSpilled(SavedRegs.test(ARM::LR));
+ }
+ 
++void ARMFrameLowering::processFunctionBeforeFrameFinalized(
++    MachineFunction &MF, RegScavenger *RS) const {
++  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
++
++  MachineFrameInfo &MFI = MF.getFrameInfo();
++  if (!MFI.isCalleeSavedInfoValid())
++    return;
++
++  // Check if all terminators do not implicitly use LR. Then we can 'restore' LR
++  // into PC so it is not live out of the return block: Clear the Restored bit
++  // in that case.
++  for (CalleeSavedInfo &Info : MFI.getCalleeSavedInfo()) {
++    if (Info.getReg() != ARM::LR)
++      continue;
++    if (all_of(MF, [](const MachineBasicBlock &MBB) {
++          return all_of(MBB.terminators(), [](const MachineInstr &Term) {
++            return !Term.isReturn() || Term.getOpcode() == ARM::LDMIA_RET ||
++                   Term.getOpcode() == ARM::t2LDMIA_RET ||
++                   Term.getOpcode() == ARM::tPOP_RET;
++          });
++        })) {
++      Info.setRestored(false);
++      break;
++    }
++  }
++}
++
+ void ARMFrameLowering::getCalleeSaves(const MachineFunction &MF,
+                                       BitVector &SavedRegs) const {
+   TargetFrameLowering::getCalleeSaves(MF, SavedRegs);
+diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.h b/llvm/lib/Target/ARM/ARMFrameLowering.h
+index 9822e2321bb4..266d642bb97b 100644
+--- a/llvm/lib/Target/ARM/ARMFrameLowering.h
++++ b/llvm/lib/Target/ARM/ARMFrameLowering.h
+@@ -58,6 +58,9 @@ public:
+   void determineCalleeSaves(MachineFunction &MF, BitVector &SavedRegs,
+                             RegScavenger *RS) const override;
+
++  void processFunctionBeforeFrameFinalized(
++                 MachineFunction &MF, RegScavenger *RS = nullptr) const override;
++
+   void adjustForSegmentedStacks(MachineFunction &MF,
+                                 MachineBasicBlock &MBB) const override;
+
+
diff --git a/meta/recipes-devtools/llvm/llvm/CVE-2024-31852-2.patch b/meta/recipes-devtools/llvm/llvm/CVE-2024-31852-2.patch
new file mode 100644
index 0000000000..b6082b0ef3
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/CVE-2024-31852-2.patch
@@ -0,0 +1,117 @@
+commit 0e16af8e4cf3a66ad5d078d52744ae2776f9c4b2
+Author: ostannard <oliver.stannard@arm.com>
+Date:   Mon Feb 26 12:23:25 2024 +0000
+
+    [ARM] Update IsRestored for LR based on all returns (#82745)
+    
+    PR #75527 fixed ARMFrameLowering to set the IsRestored flag for LR based
+    on all of the return instructions in the function, not just one.
+    However, there is also code in ARMLoadStoreOptimizer which changes
+    return instructions, but it set IsRestored based on the one instruction
+    it changed, not the whole function.
+    
+    The fix is to factor out the code added in #75527, and also call it from
+    ARMLoadStoreOptimizer if it made a change to return instructions.
+    
+    Fixes #80287.
+    
+    (cherry picked from commit 749384c08e042739342c88b521c8ba5dac1b9276)
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/0e16af8e4cf3a66ad5d078d52744ae2776f9c4b2]
+CVE: CVE-2024-31852
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.cpp b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
+index a9acf338ebf5..13d3cbf650ed 100644
+--- a/llvm/lib/Target/ARM/ARMFrameLowering.cpp
++++ b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
+@@ -2289,10 +2289,7 @@ void ARMFrameLowering::determineCalleeSaves(MachineFunction &MF,
+   AFI->setLRIsSpilled(SavedRegs.test(ARM::LR));
+ }
+ 
+-void ARMFrameLowering::processFunctionBeforeFrameFinalized(
+-    MachineFunction &MF, RegScavenger *RS) const {
+-  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
+-
++void ARMFrameLowering::updateLRRestored(MachineFunction &MF) {
+   MachineFrameInfo &MFI = MF.getFrameInfo();
+   if (!MFI.isCalleeSavedInfoValid())
+     return;
+@@ -2316,6 +2313,12 @@ void ARMFrameLowering::processFunctionBeforeFrameFinalized(
+   }
+ }
+ 
++void ARMFrameLowering::processFunctionBeforeFrameFinalized(
++    MachineFunction &MF, RegScavenger *RS) const {
++  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
++  updateLRRestored(MF);
++}
++
+ void ARMFrameLowering::getCalleeSaves(const MachineFunction &MF,
+                                       BitVector &SavedRegs) const {
+   TargetFrameLowering::getCalleeSaves(MF, SavedRegs);
+diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.h b/llvm/lib/Target/ARM/ARMFrameLowering.h
+index 67505b61a5e1..b13b76d7086c 100644
+--- a/llvm/lib/Target/ARM/ARMFrameLowering.h
++++ b/llvm/lib/Target/ARM/ARMFrameLowering.h
+@@ -58,6 +58,10 @@ public:
+   void determineCalleeSaves(MachineFunction &MF, BitVector &SavedRegs,
+                             RegScavenger *RS) const override;
+
++  /// Update the IsRestored flag on LR if it is spilled, based on the return
++  /// instructions.
++  static void updateLRRestored(MachineFunction &MF);
++
+   void processFunctionBeforeFrameFinalized(
+                  MachineFunction &MF, RegScavenger *RS = nullptr) const override;
+
+diff --git a/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp b/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
+index fd06bfdf352c..561c1396190d 100644
+--- a/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
++++ b/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
+@@ -2060,17 +2060,6 @@ bool ARMLoadStoreOpt::MergeReturnIntoLDM(MachineBasicBlock &MBB) {
+       MO.setReg(ARM::PC);
+       PrevMI.copyImplicitOps(*MBB.getParent(), *MBBI);
+       MBB.erase(MBBI);
+-      // We now restore LR into PC so it is not live-out of the return block
+-      // anymore: Clear the CSI Restored bit.
+-      MachineFrameInfo &MFI = MBB.getParent()->getFrameInfo();
+-      // CSI should be fixed after PrologEpilog Insertion
+-      assert(MFI.isCalleeSavedInfoValid() && "CSI should be valid");
+-      for (CalleeSavedInfo &Info : MFI.getCalleeSavedInfo()) {
+-        if (Info.getReg() == ARM::LR) {
+-          Info.setRestored(false);
+-          break;
+-        }
+-      }
+       return true;
+     }
+   }
+@@ -2118,16 +2107,24 @@ bool ARMLoadStoreOpt::runOnMachineFunction(MachineFunction &Fn) {
+   isThumb2 = AFI->isThumb2Function();
+   isThumb1 = AFI->isThumbFunction() && !isThumb2;
+
+-  bool Modified = false;
++  bool Modified = false, ModifiedLDMReturn = false;
+   for (MachineFunction::iterator MFI = Fn.begin(), E = Fn.end(); MFI != E;
+        ++MFI) {
+     MachineBasicBlock &MBB = *MFI;
+     Modified |= LoadStoreMultipleOpti(MBB);
+     if (STI->hasV5TOps())
+-      Modified |= MergeReturnIntoLDM(MBB);
++      ModifiedLDMReturn |= MergeReturnIntoLDM(MBB);
+     if (isThumb1)
+       Modified |= CombineMovBx(MBB);
+   }
++  Modified |= ModifiedLDMReturn;
++
++  // If we merged a BX instruction into an LDM, we need to re-calculate whether
++  // LR is restored. This check needs to consider the whole function, not just
++  // the instruction(s) we changed, because there may be other BX returns which
++  // still need LR to be restored.
++  if (ModifiedLDMReturn)
++    ARMFrameLowering::updateLRRestored(Fn);
+
+   Allocator.DestroyAll();
+   return Modified;
+
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index dbf1ff45d4..6c2e8a5570 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -34,6 +34,8 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://0001-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
            file://CVE-2023-46049.patch;striplevel=2 \
+           file://CVE-2024-31852-1.patch;striplevel=2 \
+           file://CVE-2024-31852-2.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


