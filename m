Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC0AC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 15:35:26 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.22849.1716305718616773940
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 08:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fIwohCNw;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-656d8b346d2so1432752a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 08:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716305718; x=1716910518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBqV+/aiEQe6mGMt7+MzLW/bcWe9+w5zCbt8RO5SWTw=;
        b=fIwohCNwzKgefL9udTqMMfZUu+CrNgg4+poUUoAvyUa/obN7IhDeW8R31Ti1Jcxucu
         qKysdMbvMgqu43RAKymZtucJUuvkyXuO3aPL1KELRkTkGdV/98QK7/pYIfjoXrtBJ1Gr
         k0NDjVUC6u5s60BN2RgGEfJgTyHSUtO89uE9YLcBzwGWP/uHeDd66xBbyv0jX8idWcaK
         tk/mRwYP0w/dNnCocUmNqiYzcUyv9lNQRuZIWgqwB4YvLgkvwpwc7Ez4vZfUr3DNRMUg
         fXWMiI4YBeoa4rlPpvuUT0o9PJ0MrE3jMXaHysqTOCkO1AK4pWu6QOwXQyf4ahROG3Mp
         c+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716305718; x=1716910518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBqV+/aiEQe6mGMt7+MzLW/bcWe9+w5zCbt8RO5SWTw=;
        b=pFoMafygKvaYbPYs3/Z2mOxTDrfERDkvy293x21j4weJ9cNSEzGBPoPwFjvu1oSJc3
         x4H/ppPzENrAHDTFpiGnpRYnkZlQqgR5KcvRbETcIeGOpg5WgCh82pO8kiU9qCdk8Cbx
         Ta3vNakS3Iiu3e5twYXVDLFDkBgG0eZqtkTZzj4Q7Pcpqbjs5Oaha0KmKo79EGzHlFr1
         pO1c+FVVLP/CbkQbVRRlbgsv7dQ788VSML+DnSSP2ybftI/h5ShSns5fiTD7cm1Quj05
         At14gmp4lW2r8wPQeoRgpxMiMt4Up4iCdEw+i6azdoUtbk2D5Q13jtjBFRCBW2LlBf61
         yA9Q==
X-Gm-Message-State: AOJu0Yyex/FXoBE+u33Cl8jJ2pi+/sg7TvXz4ZmmtP1KsZGZPZl8r5lK
	pZ4Yo0q0m0Wh28IgCx9TNSBIT0f+mQ6zFBISgm1TRHWDX1q743zkdE6dID/Kdy4=
X-Google-Smtp-Source: AGHT+IEYmHQPdSa04snME6YE1veSPbr2CHuxmSC1WfpjyGh1WjhNY1GxGLOTpTdkC5ar1oDX49JpZg==
X-Received: by 2002:a17:90b:1e08:b0:2bd:8436:8bf1 with SMTP id 98e67ed59e1d1-2bd84368cf1mr4966543a91.32.1716305717472;
        Tue, 21 May 2024 08:35:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bd930a3bf0sm1481398a91.5.2024.05.21.08.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:35:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 18.1.6
Date: Tue, 21 May 2024 08:35:14 -0700
Message-ID: <20240521153514.271976-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 15:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199654

brings these fixes

* 1118c2e05e67 [libcxx][libcxxabi] Fix build for OpenBSD (#92186)
* 48c1364200b5 [clang] Don't assume location of compiler-rt for OpenBSD (#92183)
* 3d0752b9492e [GlobalOpt] Don't replace aliasee with alias that has weak linkage (#91483)
* 92087868d5d2 [Arm64EC] Correctly handle sret in entry thunks. (#92326)
* bee6966d8efa [Arm64EC] Improve alignment mangling in arm64ec thunks. (#90115)
* 6456ebbc18a6 [workflows] Fix libclang-abi-tests to work with new version scheme (#91865)
* a7cd0c611238 [RISCV] Add a unaligned-scalar-mem feature like we had in clang 17.
* 2a4a0bf1db8b Update llvm/test/Transforms/InstCombine/bit_ceil.ll
* 26ccc6b5c1c7 [InstCombine] Drop nuw flag when CtlzOp is a sub nuw (#91776)
* aa2549e2bf12 Revert "[SLP]Fix a crash if the argument of call was affected by minbitwidth analysis."
* c6d554618931 [GlobalIsel][AArch64] fix out of range access in regbankselect (#92072)
* 9acb41b1e4bb [SystemZ] Handle address clobbering in splitMove(). (#92105)
* 1665723044ec release/18.x: [libclc] Fix linking against libIRReader
* 494847ba8fef [InstSimplify] Do not simplify freeze in `simplifyWithOpReplaced` (#91215)
* fac122ac4391 [X86][Driver] Do not add `-evex512` for `-march=native` when the target doesn't support AVX512 (#91694)
* 47b6dc45e39a [AArch64][SelectionDAG] Mask for SUBS with multiple users cannot be elided (#90911)
* dff717818356 [RISCV] Use 'riscv-isa' module flag to set ELF flags and attributes. (#85155)
* 3512b12a7981 [RISCV] Store RVC and TSO ELF flags explicitly in RISCVTargetStreamer. NFCI (#83344)
* be239653149f [RISCV] Add canonical ISA string as Module metadata in IR. (#80760)
* 6cfa40e450cf [RISCV][lld] Set the type of TLSDESC relocation's referenced local symbol to STT_NOTYPE
* 1184a9cb30e6 [PPCMergeStringPool] Avoid replacing constant with instruction (#88846)
* f1491c7460e7 [clang-format] Fix a crash with AlignArrayOfStructures option (#86420)
* 8d65f14cb6ff [Clang][Sema] Revise the transformation of CTAD parameters of nested class templates (#91628)
* be6c81751cc9 [lld][WebAssembly] Fix test on Windows, use llvm-ar instead of ar
* c5b3fa491f00 Reland "[clang-repl] Keep the first llvm::Module empty to avoid invalid memory access. (#89031)"
* a82ddb9d8122 [workflows] Add a job for requesting a release note on release branch PRs (#91826)
* 09615ce869b0 [OpenMP] Fix child processes to use affinity_none (#91391)
* 5c77c1d31d14 [llvm][lld] Pre-commit tests for RISCV TLSDESC symbols
* 7dbd266e89a7 [AArc64][GlobalISel] Fix legalizer assert for G_INSERT_VECTOR_ELT
* d9a7e5179a89 [InterleavedLoadCombine] Bail out on non-byte-sized vector element type (#90705)
* 0a045c9d83bb [AArch64][GISEL] Consider fcmp true and fcmp false in cond code selection (#86972) (#91580)
* 4a28f8e3c625 [FunctionAttrs] Fix incorrect nonnull inference for non-inbounds GEP (#91180)
* 0abb89a80f5c [clang-format] Don't remove parentheses of fold expressions (#91045)
* bce9393291a2 [AMDGPU] Fix GFX12 encoding of s_wait_event export_ready (#89622)
* f5f572f54b32 [SelectionDAG] Mark frame index as "aliased" at argument copy elison (#89712)
* dfc89f89ed14 [X86][FP16] Do not create VBROADCAST_LOAD for f16 without AVX2 (#91125)
* 047cd915b86a [X86][EVEX512] Add `HasEVEX512` when `NoVLX` used for 512-bit patterns (#91106)
* 58e44d3c6f67 [AMDGPU] Enhance s_waitcnt insertion before barrier for gfx12 (#90595)
* d1d7131906d9 [Workflows] Re-write release-binaries workflow (#89521)
* 211cdc65a1fb workflows: Fix incorrect input name in release-binaries.yml (#84604)
* 0ec1bc454456 workflows: Fixes for building the release binaries (#83694)
* d9661e11996d [Github] Add repository checks to release-binaries workflow (#84437)
* b7e2397c54b7 [CMake][Release] Enable CMAKE_POSITION_INDEPENDENT_CODE (#90139)
* ce88e86e428b [CMake][Release] Refactor cache file and use two stages for non-PGO builds (#89812)
* f2c5a10e1f27 [CMake][Release] Add stage2-package target (#89517)
* dd3aa6d0e9a8 Bump version to 18.1.6 (#91094)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/{llvm_18.1.5.bb => llvm_18.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_18.1.5.bb => llvm_18.1.6.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.5.bb b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_18.1.5.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.6.bb
index 9c80b46b607..189f5b1146c 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.5.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "3591a52761a7d390ede51af01ea73abfecc4b1d16445f9d019b67a57edd7de56"
+SRC_URI[sha256sum] = "bd4b4cb6374bcd5fc5a3ba60cb80425d29da34f316b8821abc12c0db225cf6b4"
 
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.45.1


