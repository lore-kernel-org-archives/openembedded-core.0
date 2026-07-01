Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEB1C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 11:58:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43028.1782907116596053364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 04:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qrZCt6Fl;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-470174001a0so494293f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782907115; x=1783511915; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BU9a+mRZ4RzNLE2hcFdmC28N4S3Ix69w0kjscWTVZto=;
        b=qrZCt6FlAcR26uPIPxPY0NCO9L4slSKf0sjJTkLpqJV3Y4bKRRRVAuy9USGrfPVXxv
         peNSkNHK+5rYS/4w+nsh7Y9KjzFeTT40ocqI8CHfEGYPcLYKcYuMPUFrayxvey8CGYQH
         yuDjwhH4R3zNuOw2QQe1l940wDIPc7l8Wg6PMn7dTSxTun3i52m1yieFVgt5kOL2UEbR
         JOqdWvHQLwmCla7pdsUpc3fg6fKFzJQOgQLgbGVpm5ytkt6C1MuBhobF43vAuXeUnYs9
         M6687gKjzxcoo0TYMdvodv3725N06SGbE8WXs8siVxN4WlDLzsyulE/W1t9wwG5Nq7pA
         Vyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907115; x=1783511915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BU9a+mRZ4RzNLE2hcFdmC28N4S3Ix69w0kjscWTVZto=;
        b=sXFxYxdS3JKKvv3oxnOgUqZC7OMcUxat+MN2JghGwVM5jUjwLHYrCLLl9XYF2qMav/
         nt6hchlQ9QZo5go7tCnEBjIdtbqv0NHUqpjzP/ezTQAf39p8lyjFghVTXuqDMTze2BEn
         K9GEhVX86FoohK+dCM9VWZML3YU/ynn0m3tGMMjKzip0SPq1v7h6gx5+PTnVldFU0D7W
         yMM+GQL5M76DJscRp4Y6ImOsE87r9Pkw+SOOjTr5D2PE+O12nkOi6uBFm2J2X1+7UZbf
         eWnqNf4sYHgSdRMnU6jZiHcY/5qMAlvoV4tt/5L2XHIC+xWdrXQeZ7DDeUDbzZ2HQt8q
         HD1w==
X-Gm-Message-State: AOJu0Yyc4S8WspHl+bgvQnhqE7frY3Uo0znK68tYqDsYKZHyTTALA88n
	mwO6qTBWATn+ZgcVk01fThIITmI+4VBlwJ14PMPAz/fi+HJPsw2TO6JQ2+dkTg==
X-Gm-Gg: AfdE7cmjlKc4IlwZBIasNSfpkyvHbpaty11j6Sw35UXW/duR5woeDcrsLjVBkqviyh4
	m65PxsW/V86CNcuFT2VjWtBO5WMWCPk9cvPog/4trj69uUOyuPjVjfz92aHNlTEenOAhn04vZnV
	gIcEM3WTOYcp4Z8r2aCzmcojG91OwMmpRJOkmJbWHp5NV2D1RAnJYkU3JwgaTwwx6qPEvqLOSVU
	9zBnU93mZZW0qrsAMVdIZTO+TlRskOeg2MGsN4010GFlMGMAe9V5xj+zL6Tg0c2y6bCF1rqIpKO
	Y/sFH6IXZIHddY85ePthJ9QErZkfmgiTFW2AuL7ae6H9UmBRfkgsb2tyTwS87IRpn3yJ7qrzTsq
	w1rrfZC16gwxsm8ScxknR++KE8vULf/MoH7XYoVea6TERrq1or1DoUxrNyFaM7zJ1tpXZdWZzuc
	Wf2oUWnwrT8C1CvgU3heZwi9DxLycLekSBzHEsQnIMmTJzlcqIICTn+9LpS6UhMTA=
X-Received: by 2002:adf:ee52:0:b0:45e:d6b2:e6a5 with SMTP id ffacd0b85a97d-477b4fb2bd3mr192923f8f.34.1782907114739;
        Wed, 01 Jul 2026 04:58:34 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf98sm12680161f8f.22.2026.07.01.04.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:58:34 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 01 Jul 2026 12:58:11 +0100
Subject: [PATCH 1/3] rust-target-config: armv8a AArch32 Thumb build fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-tune-a32-v1-1-a43f28b1d7a4@gmail.com>
References: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com>
In-Reply-To: <20260701-tune-a32-v1-0-a43f28b1d7a4@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
 Alex Kiernan <alexk@a-squared-projects.uk>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 11:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239978

From: Alex Kiernan <alexk@a-squared-projects.uk>

llvm_features_from_tune() calls target_is_armv7() to gate both the +v7
LLVM feature and the +thumb2 feature. target_is_armv7() (in
rust-common.bbclass) only recognises armv7a/armv7r/armv7m/armv7ve -- it
returns False for armv8a.  As a result an ARMv8-A AArch32 Thumb build
gets "+neon,+thumb-mode" in the target JSON but neither "+v8" nor
"+thumb2".

LLVM's ParseARMTriple() returns "" for "arm-..." triples
(ARM::parseArch("arm") = INVALID), leaving HasV4TOps unset in the
MCSubtargetInfo used for module-level inline asm parsing.  The ARM ASM
parser's hasThumb() then returns false and ".thumb" directives in
compiler_builtins naked-function trampolines (__aeabi_uldivmod etc.)
are rejected.

This produces two failures when building libstd-rs / compiler_builtins:

  1. core: "LLVM ERROR: Cannot select: br" in core::fmt::num -- LLVM ARM
     ISel patterns for Thumb-2 unconditional branches (t2B) are gated on
     HasV8Ops as well as IsThumb2; without +v8 the pattern never fires.

  2. compiler_builtins: "target does not support Thumb mode" on .thumb
     directives in naked-function trampolines (__aeabi_uldivmod etc.) --
     two separate paths both require +thumb2: HasV4TOps in the
     MCSubtargetInfo (set transitively via ParseARMTriple) and
     FeatureThumb2 in the code-gen ARMSubtarget.

The natural fix would be to change RUST_TARGET_SYS to "armv8a-...", but
"armv8a" is not a recognised Rust target architecture so the triple is
not valid there.  Instead rust_sys_to_llvm_target() rewrites only the
JSON llvm-target field, leaving RUST_TARGET_SYS and rust-common.bbclass
unchanged.

- Add +v8 to llvm_features_from_tune for armv8a AArch32.

- Add +thumb2 to llvm_features_from_tune for armv8a AArch32 Thumb.

- Extend rust_sys_to_llvm_target() to accept the datastore and rewrite
  the "arm-..." triple to "armv8a-..." for armv8a AArch32 targets, so
  the JSON llvm-target field uses "armv8a-..." while RUST_TARGET_SYS
  keeps "arm-...".  ParseARMTriple then adds "+armv8-a" to the
  MCSubtargetInfo, transitively setting HasV4TOps and making hasThumb()
  return true.

The TARGET_ARCH == 'arm' guard is required because AArch64 tunes also
carry armv8a in TUNE_FEATURES (via arch-armv8a.inc) but must not be
affected.

AI-Generated: Claude Code (Claude Opus 4.8)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
---
 meta/classes-recipe/rust-target-config.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 941fe1958361..6acbe5e68834 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -19,6 +19,8 @@ def llvm_features_from_tune(d):
     mach_overrides = d.getVar('MACHINEOVERRIDES')
     mach_overrides = frozenset(mach_overrides.split(':'))
 
+    target_arch = d.getVar('TARGET_ARCH')
+
     if 'vfpv4' in feat:
         f.append("+vfp4")
     elif 'vfpv4d16' in feat:
@@ -46,6 +48,9 @@ def llvm_features_from_tune(d):
     if target_is_armv7(d):
         f.append('+v7')
 
+    if 'armv8a' in feat and target_arch == 'arm':
+        f.append('+v8')
+
     if ('armv6' in mach_overrides) or ('armv6' in feat):
         f.append("+v6")
     if 'armv5te' in feat:
@@ -63,7 +68,8 @@ def llvm_features_from_tune(d):
 
     if 'thumb' in feat:
         if d.getVar('ARM_THUMB_OPT') == "thumb":
-            if target_is_armv7(d):
+            if target_is_armv7(d) or \
+                    ('armv8a' in feat and target_arch == 'arm'):
                 f.append('+thumb2')
             f.append("+thumb-mode")
 
@@ -302,7 +308,16 @@ def arch_to_rust_target_arch(arch):
         return arch
 
 # Convert a rust target string to a llvm-compatible triplet
-def rust_sys_to_llvm_target(sys):
+def rust_sys_to_llvm_target(sys, d):
+    # For AArch32 ARMv8-A, RUST_TARGET_SYS stays "arm-..." because "armv8a" is not a
+    # valid Rust target architecture. Rewrite llvm-target to "armv8a-..." here so
+    # ParseARMTriple adds "+armv8-a" and transitively sets HasV4TOps in the
+    # MCSubtargetInfo used for module-level inline asm parsing, making hasThumb()
+    # return true for .thumb directives.
+    if sys.startswith('arm-') and \
+            'armv8a' in (d.getVar('TUNE_FEATURES') or '').split() and \
+            d.getVar('TARGET_ARCH') == 'arm':
+        return 'armv8a-' + sys[4:]
     return sys
 
 # generates our target CPU value
@@ -382,7 +397,7 @@ def rust_gen_target(d, thing, wd, arch):
 
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = rust_sys_to_llvm_target(rustsys)
+    tspec['llvm-target'] = rust_sys_to_llvm_target(rustsys, d)
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     if tspec['data-layout'] is None:
         bb.fatal("No rust target defined for %s" % arch_abi)

-- 
2.43.0


