Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6481C3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 13:39:00 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.17714.1722346734130603617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 06:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wsYVsfkz;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.170, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e087c7ef68bso2822157276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722346733; x=1722951533; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgAWWke4VpRRhnTwTzYLWnLVrU96SWPkjXqQTxGLlDk=;
        b=wsYVsfkz3TK4hAXJ73thDai8q7QYvyj2p8AHpC2VOsc2DXCSThlnRdPcKJ4tQVJWF5
         uQg9OfPLRnWwwa0C5kBrIx52kPm/jBlOAEeZmJJVVrsx6aBSfqbDgoyE7pJ7cp/bDhMw
         JiWNQFXXaByx8UrK2ApZxCCBGxQN17OFCHW8ITJgrw35lxZO3ZaGmghltpwIeuThVOX4
         knfi3RU8b2BtwcJPvkLvG1TsZnt+BoGrHT/+lz0UHZ67uQ4qww/SgRzEz5pDpwqyLBZY
         oS86WKJkwYVzhAC3v3QPCpHMy/t5DpCPbKDK9kUmlMV16SV1g96egcVWIUoOd6ynNHi+
         o+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722346733; x=1722951533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgAWWke4VpRRhnTwTzYLWnLVrU96SWPkjXqQTxGLlDk=;
        b=Il9pRQWnPyC0st+WUB2fWqGzydhmP36eQ/dKkLyRdrdlpEeFnT2vExcQR/xPX6iqQO
         X/b5pcptic+WZDnMTf37zSLJYugfAuAVvt4kXPQQHBRFg4vfW0uevHnQPSheXncBafSc
         E1E5qIeVnlyh9bpcrzP+u9fBlMe9vYy42lQRf4SRt5D6DeW+0bc/zAoFuHSRmSRzv05A
         WTvC21AsVLwMJ0uTSXOHawJ2BnTFxQ93nSbrUoDeS/Px8mjnEKqeJhlJ/M61/9YuWBQt
         ay8ToGKvsrxhhuE/q0Y2VO2N2/M8TmsyLsiai908xdJaUz+E1FHweCQX2ZXj3gcw9bhz
         0Atg==
X-Gm-Message-State: AOJu0YwMYmgs7BL+edt9l/EbYOCzN9Jwu+fevHRiLTxWNxVwH8NpJ1lh
	DnsvyDDRLvXAJvxNnn2QpavHSm9RyiTDD615to7vj9aljGlHfY+4FD1jxY+/x3yO7Y02uW5c0OP
	wJUkNaYgpKJi4+d7/mJ1/pF4dAhKjxJmKY7eULuwfOyTRu3LGX74cmw==
X-Google-Smtp-Source: AGHT+IHOgn7tYTp3W9w+ePQHH7KNhLK8OAKQDyShukKrxaBBpa0Pqy26Kn8c1Fy2bgi+1yZvtRQ5UjQqLDTl5t0Hrsg=
X-Received: by 2002:a05:6902:70a:b0:e08:726a:5a93 with SMTP id
 3f1490d57ef6-e0b5459b903mr14152795276.44.1722346733068; Tue, 30 Jul 2024
 06:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240730121513.1801546-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240730121513.1801546-1-Deepthi.Hemraj@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 30 Jul 2024 06:38:41 -0700
Message-ID: <CAOSpxdYKm08kRUCKhf=AEEQkL4CZQMV=j7CPbw71CFQiOqLD4Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] llvm: Fix CVE-2024-31852
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 13:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202676

On Tue, Jul 30, 2024 at 5:15=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  .../llvm/0008-llvm-Fix-CVE-2024-31852-1.patch |  85 +++++++++++++
>  .../llvm/0009-llvm-Fix-CVE-2024-31852-2.patch | 117 ++++++++++++++++++
>  meta/recipes-devtools/llvm/llvm_git.bb        |   2 +
>  3 files changed, 204 insertions(+)
>  create mode 100644 meta/recipes-devtools/llvm/llvm/0008-llvm-Fix-CVE-202=
4-31852-1.patch
>  create mode 100644 meta/recipes-devtools/llvm/llvm/0009-llvm-Fix-CVE-202=
4-31852-2.patch

Preferred filenames would be just CVE-2024-31852-1.patch and
CVE-2024-31852-2.patch

No need to send a V2 as I've fixed this on my end.

Thanks!

Steve

>
> diff --git a/meta/recipes-devtools/llvm/llvm/0008-llvm-Fix-CVE-2024-31852=
-1.patch b/meta/recipes-devtools/llvm/llvm/0008-llvm-Fix-CVE-2024-31852-1.p=
atch
> new file mode 100644
> index 0000000000..7cf4a52715
> --- /dev/null
> +++ b/meta/recipes-devtools/llvm/llvm/0008-llvm-Fix-CVE-2024-31852-1.patc=
h
> @@ -0,0 +1,85 @@
> +commit b1a5ee1febd8a903cec3dfdad61d57900dc3823e
> +Author: Florian Hahn <flo@fhahn.com>
> +Date:   Wed Dec 20 16:56:15 2023 +0100
> +
> +    [ARM] Check all terms in emitPopInst when clearing Restored for LR. =
(#75527)
> +
> +    emitPopInst checks a single function exit MBB. If other paths also e=
xit
> +    the function and any of there terminators uses LR implicitly, it is =
not
> +    save to clear the Restored bit.
> +
> +    Check all terminators for the function before clearing Restored.
> +
> +    This fixes a mis-compile in outlined-fn-may-clobber-lr-in-caller.ll
> +    where the machine-outliner previously introduced BLs that clobbered =
LR
> +    which in turn is used by the tail call return.
> +
> +    Alternative to #73553
> +
> +Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/b=
1a5ee1febd8a903cec3dfdad61d57900dc3823e]
> +CVE: CVE-2024-31852
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +---
> +diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.cpp b/llvm/lib/Target/=
ARM/ARMFrameLowering.cpp
> +index 025e43444f9c..a9acf338ebf5 100644
> +--- a/llvm/lib/Target/ARM/ARMFrameLowering.cpp
> ++++ b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
> +@@ -1236,9 +1236,6 @@ void ARMFrameLowering::emitPopInst(MachineBasicBlo=
ck &MBB,
> +         // Fold the return instruction into the LDM.
> +         DeleteRet =3D true;
> +         LdmOpc =3D AFI->isThumbFunction() ? ARM::t2LDMIA_RET : ARM::LDM=
IA_RET;
> +-        // We 'restore' LR into PC so it is not live out of the return =
block:
> +-        // Clear Restored bit.
> +-        Info.setRestored(false);
> +       }
> +
> +       // If NoGap is true, pop consecutive registers and then leave the=
 rest
> +@@ -2292,6 +2289,33 @@ void ARMFrameLowering::determineCalleeSaves(Machi=
neFunction &MF,
> +   AFI->setLRIsSpilled(SavedRegs.test(ARM::LR));
> + }
> +
> ++void ARMFrameLowering::processFunctionBeforeFrameFinalized(
> ++    MachineFunction &MF, RegScavenger *RS) const {
> ++  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
> ++
> ++  MachineFrameInfo &MFI =3D MF.getFrameInfo();
> ++  if (!MFI.isCalleeSavedInfoValid())
> ++    return;
> ++
> ++  // Check if all terminators do not implicitly use LR. Then we can 're=
store' LR
> ++  // into PC so it is not live out of the return block: Clear the Resto=
red bit
> ++  // in that case.
> ++  for (CalleeSavedInfo &Info : MFI.getCalleeSavedInfo()) {
> ++    if (Info.getReg() !=3D ARM::LR)
> ++      continue;
> ++    if (all_of(MF, [](const MachineBasicBlock &MBB) {
> ++          return all_of(MBB.terminators(), [](const MachineInstr &Term)=
 {
> ++            return !Term.isReturn() || Term.getOpcode() =3D=3D ARM::LDM=
IA_RET ||
> ++                   Term.getOpcode() =3D=3D ARM::t2LDMIA_RET ||
> ++                   Term.getOpcode() =3D=3D ARM::tPOP_RET;
> ++          });
> ++        })) {
> ++      Info.setRestored(false);
> ++      break;
> ++    }
> ++  }
> ++}
> ++
> + void ARMFrameLowering::getCalleeSaves(const MachineFunction &MF,
> +                                       BitVector &SavedRegs) const {
> +   TargetFrameLowering::getCalleeSaves(MF, SavedRegs);
> +diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.h b/llvm/lib/Target/AR=
M/ARMFrameLowering.h
> +index 9822e2321bb4..266d642bb97b 100644
> +--- a/llvm/lib/Target/ARM/ARMFrameLowering.h
> ++++ b/llvm/lib/Target/ARM/ARMFrameLowering.h
> +@@ -58,6 +58,9 @@ public:
> +   void determineCalleeSaves(MachineFunction &MF, BitVector &SavedRegs,
> +                             RegScavenger *RS) const override;
> +
> ++  void processFunctionBeforeFrameFinalized(
> ++                 MachineFunction &MF, RegScavenger *RS =3D nullptr) con=
st override;
> ++
> +   void adjustForSegmentedStacks(MachineFunction &MF,
> +                                 MachineBasicBlock &MBB) const override;
> +
> +
> diff --git a/meta/recipes-devtools/llvm/llvm/0009-llvm-Fix-CVE-2024-31852=
-2.patch b/meta/recipes-devtools/llvm/llvm/0009-llvm-Fix-CVE-2024-31852-2.p=
atch
> new file mode 100644
> index 0000000000..b6082b0ef3
> --- /dev/null
> +++ b/meta/recipes-devtools/llvm/llvm/0009-llvm-Fix-CVE-2024-31852-2.patc=
h
> @@ -0,0 +1,117 @@
> +commit 0e16af8e4cf3a66ad5d078d52744ae2776f9c4b2
> +Author: ostannard <oliver.stannard@arm.com>
> +Date:   Mon Feb 26 12:23:25 2024 +0000
> +
> +    [ARM] Update IsRestored for LR based on all returns (#82745)
> +
> +    PR #75527 fixed ARMFrameLowering to set the IsRestored flag for LR b=
ased
> +    on all of the return instructions in the function, not just one.
> +    However, there is also code in ARMLoadStoreOptimizer which changes
> +    return instructions, but it set IsRestored based on the one instruct=
ion
> +    it changed, not the whole function.
> +
> +    The fix is to factor out the code added in #75527, and also call it =
from
> +    ARMLoadStoreOptimizer if it made a change to return instructions.
> +
> +    Fixes #80287.
> +
> +    (cherry picked from commit 749384c08e042739342c88b521c8ba5dac1b9276)
> +
> +Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/0=
e16af8e4cf3a66ad5d078d52744ae2776f9c4b2]
> +CVE: CVE-2024-31852
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +---
> +diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.cpp b/llvm/lib/Target/=
ARM/ARMFrameLowering.cpp
> +index a9acf338ebf5..13d3cbf650ed 100644
> +--- a/llvm/lib/Target/ARM/ARMFrameLowering.cpp
> ++++ b/llvm/lib/Target/ARM/ARMFrameLowering.cpp
> +@@ -2289,10 +2289,7 @@ void ARMFrameLowering::determineCalleeSaves(Machi=
neFunction &MF,
> +   AFI->setLRIsSpilled(SavedRegs.test(ARM::LR));
> + }
> +
> +-void ARMFrameLowering::processFunctionBeforeFrameFinalized(
> +-    MachineFunction &MF, RegScavenger *RS) const {
> +-  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
> +-
> ++void ARMFrameLowering::updateLRRestored(MachineFunction &MF) {
> +   MachineFrameInfo &MFI =3D MF.getFrameInfo();
> +   if (!MFI.isCalleeSavedInfoValid())
> +     return;
> +@@ -2316,6 +2313,12 @@ void ARMFrameLowering::processFunctionBeforeFrame=
Finalized(
> +   }
> + }
> +
> ++void ARMFrameLowering::processFunctionBeforeFrameFinalized(
> ++    MachineFunction &MF, RegScavenger *RS) const {
> ++  TargetFrameLowering::processFunctionBeforeFrameFinalized(MF, RS);
> ++  updateLRRestored(MF);
> ++}
> ++
> + void ARMFrameLowering::getCalleeSaves(const MachineFunction &MF,
> +                                       BitVector &SavedRegs) const {
> +   TargetFrameLowering::getCalleeSaves(MF, SavedRegs);
> +diff --git a/llvm/lib/Target/ARM/ARMFrameLowering.h b/llvm/lib/Target/AR=
M/ARMFrameLowering.h
> +index 67505b61a5e1..b13b76d7086c 100644
> +--- a/llvm/lib/Target/ARM/ARMFrameLowering.h
> ++++ b/llvm/lib/Target/ARM/ARMFrameLowering.h
> +@@ -58,6 +58,10 @@ public:
> +   void determineCalleeSaves(MachineFunction &MF, BitVector &SavedRegs,
> +                             RegScavenger *RS) const override;
> +
> ++  /// Update the IsRestored flag on LR if it is spilled, based on the r=
eturn
> ++  /// instructions.
> ++  static void updateLRRestored(MachineFunction &MF);
> ++
> +   void processFunctionBeforeFrameFinalized(
> +                  MachineFunction &MF, RegScavenger *RS =3D nullptr) con=
st override;
> +
> +diff --git a/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp b/llvm/lib/Ta=
rget/ARM/ARMLoadStoreOptimizer.cpp
> +index fd06bfdf352c..561c1396190d 100644
> +--- a/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
> ++++ b/llvm/lib/Target/ARM/ARMLoadStoreOptimizer.cpp
> +@@ -2060,17 +2060,6 @@ bool ARMLoadStoreOpt::MergeReturnIntoLDM(MachineB=
asicBlock &MBB) {
> +       MO.setReg(ARM::PC);
> +       PrevMI.copyImplicitOps(*MBB.getParent(), *MBBI);
> +       MBB.erase(MBBI);
> +-      // We now restore LR into PC so it is not live-out of the return =
block
> +-      // anymore: Clear the CSI Restored bit.
> +-      MachineFrameInfo &MFI =3D MBB.getParent()->getFrameInfo();
> +-      // CSI should be fixed after PrologEpilog Insertion
> +-      assert(MFI.isCalleeSavedInfoValid() && "CSI should be valid");
> +-      for (CalleeSavedInfo &Info : MFI.getCalleeSavedInfo()) {
> +-        if (Info.getReg() =3D=3D ARM::LR) {
> +-          Info.setRestored(false);
> +-          break;
> +-        }
> +-      }
> +       return true;
> +     }
> +   }
> +@@ -2118,16 +2107,24 @@ bool ARMLoadStoreOpt::runOnMachineFunction(Machi=
neFunction &Fn) {
> +   isThumb2 =3D AFI->isThumb2Function();
> +   isThumb1 =3D AFI->isThumbFunction() && !isThumb2;
> +
> +-  bool Modified =3D false;
> ++  bool Modified =3D false, ModifiedLDMReturn =3D false;
> +   for (MachineFunction::iterator MFI =3D Fn.begin(), E =3D Fn.end(); MF=
I !=3D E;
> +        ++MFI) {
> +     MachineBasicBlock &MBB =3D *MFI;
> +     Modified |=3D LoadStoreMultipleOpti(MBB);
> +     if (STI->hasV5TOps())
> +-      Modified |=3D MergeReturnIntoLDM(MBB);
> ++      ModifiedLDMReturn |=3D MergeReturnIntoLDM(MBB);
> +     if (isThumb1)
> +       Modified |=3D CombineMovBx(MBB);
> +   }
> ++  Modified |=3D ModifiedLDMReturn;
> ++
> ++  // If we merged a BX instruction into an LDM, we need to re-calculate=
 whether
> ++  // LR is restored. This check needs to consider the whole function, n=
ot just
> ++  // the instruction(s) we changed, because there may be other BX retur=
ns which
> ++  // still need LR to be restored.
> ++  if (ModifiedLDMReturn)
> ++    ARMFrameLowering::updateLRRestored(Fn);
> +
> +   Allocator.DestroyAll();
> +   return Modified;
> +
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtoo=
ls/llvm/llvm_git.bb
> index cedbfb138e..d342da649a 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -33,6 +33,8 @@ SRC_URI =3D "git://github.com/llvm/llvm-project.git;bra=
nch=3D${BRANCH};protocol=3Dhttp
>             file://0007-llvm-allow-env-override-of-exe-path.patch;striple=
vel=3D2 \
>             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as=
-we.patch;striplevel=3D2 \
>             file://0001-Support-Add-missing-cstdint-header-to-Signals.h.p=
atch;striplevel=3D2 \
> +           file://0008-llvm-Fix-CVE-2024-31852-1.patch;striplevel=3D2 \
> +           file://0009-llvm-Fix-CVE-2024-31852-2.patch;striplevel=3D2 \
>             "
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "llvmorg-(?P<pver>\d+(\.\d+)+)"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202674): https://lists.openembedded.org/g/openembedde=
d-core/message/202674
> Mute This Topic: https://lists.openembedded.org/mt/107626200/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

