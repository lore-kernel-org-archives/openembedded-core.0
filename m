Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF0AC44500
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 11:58:41 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43269.1782907116316923541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 04:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hBqkVB+l;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47488efcf30so331008f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782907114; x=1783511914; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7p++h3rn4T9nvJeBbOhAzjQ9diZgI8NQvVRm90e/28=;
        b=hBqkVB+lkdi6YiKZlWOTbe5aKvo/FpsGffjzO2pFLyg2PgUqJ07YbAI+h2ayGG22hH
         4rrR2EC9SGEniYWSdY2zniMmLRk0JslI9M9w6bRjfO5Mc9V2WhMb7vlMAjahvxk05p3D
         V+B0Z3tr7JgHOgnzZ4sGPutV5usu0W0OSbikdBlPeOXntUZeZmLnBNvQa8xyqqr+l+vl
         Ntkgs+wuHKQewgk4NMqCUc6raoy8msRLi207ZVYyihASiNaBpJllCaLYZcUla+ehcPhX
         1iiS6O8/ZeOSkILAH9I1Eet0eWuUff4ftcO7StvpBCuSCLJFRz9wzMqaMVdAZvNYARbU
         Uv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907114; x=1783511914;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7p++h3rn4T9nvJeBbOhAzjQ9diZgI8NQvVRm90e/28=;
        b=lTJMCH5+q9Ic4vqgub0ygofXedzsfAqLjgAulj0/goNmFTjrf2LHZbJfHh8d128wc9
         XNBOxvxMUqD+gvX9hKPrHtX8pfANRqwUXz/BDjAuPMGmQTYgWUz5tQyEqDpjJma2ouzT
         a/g1fXLscDTGEsfFISCUf/q17CCwa2UYU+BpgrwhSapC8x/GbfDRSuxgF/Lp+4i2P5LX
         ej5EROHlEF/K+MkkrW8yEGofHY/UGjOIlL5nNgHFq0JkByw+NfEy1zLRukN5763pkXU8
         kZaw8T5XKTP1Gp8x7vhVvC+diya3H+hDxMTy7I4fD/oA9Gl2ozqJEVmcnhKZI+MHgFCM
         zO8A==
X-Gm-Message-State: AOJu0YwyKAa2OTx4zfDXotwtHYef+9IxQs6PPC7v/EOayDWgLBDw6hj5
	hBjovYrEBiWUNVm13JPeLeyh5YcwT/7iwKtc+Ww9w70Fbk/VjFoJdKEiuwl2Gg==
X-Gm-Gg: AfdE7cn00d9n7KG0qlsrm9xg13HYPQuV+oonpAs8BmlKqcJw+xwPvikm/9f+jxuFejL
	hF9SpyLqBGt5+8OgkONr1e9MCStpnLUttUYPpJFoiIaS0TZvvsFDoeSDjEerw0tNiTjU1ipXjZj
	/AHmlkvxjf51/NhjuxkjlmcmPHBYXUEG1hMTe79q3XPiEIg/y5iWneeEHjkWSZvI5cR9S5IAOUa
	Tz1Qxi7OE1VfCqkG/V5RW7fMB+ekTfeD7jpuqeLaY0FF8S+QY7rxup6HyI2ArteBP0CECxJxIZ2
	PO02vTnJqtPK+/Tt7Wy8mqmGohUM/+VyMXxOhh2UfszlQsKjJM7cqG3Y+LnbKOSA7E2mgXo4M3M
	aPi8vhxWOzksqSvDOsu669RDeoXFSrpt2LMGcIF4dfVn1JjjXpn4ThrBO8NiY9fCrWMn3D37mWr
	Ab8IkQZqs+WHoyK13t8LYpNf1N0j50nSLHcr6JF3Aqyl68CNLHt+9R1LkY8J72mzU=
X-Received: by 2002:a05:6000:27cb:10b0:460:71e6:e3b with SMTP id ffacd0b85a97d-47758db5955mr1675291f8f.27.1782907114030;
        Wed, 01 Jul 2026 04:58:34 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf98sm12680161f8f.22.2026.07.01.04.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:58:33 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH 0/3] tune-cortexa32: AArch32 Thumb-2/crypto fixes, plus a
 QEMU machine
Date: Wed, 01 Jul 2026 12:58:10 +0100
Message-Id: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIARWoC/yXMyw5AMBCF4VeRWWvSDnF7FbGgpoxFSYtIGu+uW
 H7Jf04AT47JQ5MEcHSy59VGqDQBPfd2IsFjNKDEQpZSif2wJPoMRVkZiQrzKtc1xHxzZPj6rtr
 utz+GhfT+7uG+H+cDZkhsAAAA
X-Change-ID: 20260701-tune-a32-78f0212484c9
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
 Alex Kiernan <alexk@a-squared-projects.uk>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 11:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239977

Cortex-A32 is an AArch32-only ARMv8-A core - it has no AArch64 mode at
all. The current tune-cortexa32.inc lacks the thumb feature, and its
AArch32 crypto FPU selection and PACKAGE_EXTRA_ARCHS names are wrong for
a Thumb-2 build.

Patch 1 fixes the equivalent problem on the Rust side: rust-common's
target_is_armv7() doesn't recognise armv8a, so an AArch32 Thumb build
is missing both the +v8 and +thumb2 LLVM features, and the "arm-..."
RUST_TARGET_SYS triple doesn't parse as ARMv8 for inline-asm purposes
either. This has to land before patch 2, because once tune-cortexa32
enables the thumb feature, building rust for it fails without this fix.

Patch 2 is the tune-cortexa32.inc fix itself: add arm and thumb to
TUNE_FEATURES, fix PACKAGE_EXTRA_ARCHS to use the t2hf naming, and
append crypto-neon-fp-armv8 to TUNE_CCARGS_MFPU when both crypto and
neon are active, since on AArch32 the ARMv8 crypto extensions live in
the FPU rather than -march alone. Without this, GCC rejects the AES
intrinsics used by e.g. mbedtls' aesce.c with "target specific option
mismatch".

Patch 3 adds a qemuarmv8a32 machine so the above is actually
exercisable: QEMU has no Cortex-A32 model, so it boots the virt machine
with qemu-system-arm -cpu max instead, reusing the qemuarma15
linux-yocto BSP via KMACHINE. I'm really not sure if this is appropriate
for OE-Core - it's useful, but I suspect it really wants a proper U-Boot
and kernel config.

The real breakage I'm attempting to fix is mbedtls, which I need
(covered by #2), which then exposes the problems in libstd-rs (covered
by #1). #3 is really here so there's a way to show it which isn't the
board I'm building for.

AI-Generated: Claude Code (Claude Opus 4.8)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
---
Alex Kiernan (3):
      rust-target-config: armv8a AArch32 Thumb build fixes
      tune-cortexa32: enable Thumb-2 and fix AArch32 crypto FPU selection
      qemuarmv8a32: add QEMU machine for AArch32 ARMv8-A

 meta/classes-recipe/rust-target-config.bbclass     | 21 +++++++++++--
 .../machine/include/arm/armv8a/tune-cortexa32.inc  | 14 +++++++--
 meta/conf/machine/qemuarmv8a32.conf                | 36 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |  2 +-
 4 files changed, 66 insertions(+), 7 deletions(-)
---
base-commit: 9780e392300549f69e11e2f3bcb9bff77b21d572
change-id: 20260701-tune-a32-78f0212484c9

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>


