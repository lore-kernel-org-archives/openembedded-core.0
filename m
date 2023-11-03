Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21033C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 02:26:02 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.17600.1698978356263382066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 19:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUC8qjCH;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso938916a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698978355; x=1699583155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KaxKlKs1qhVkoj+jMQ5taqSswamBhJpW8sE/KHC3P04=;
        b=lUC8qjCH2D9Gf+wqg5uaMVkSFW1++ezWsMrFdlXcaID0/SqMc08oVYfABtKXM1IrbK
         +YvhpHIerpjzFyPhTGcgQWT5X/nep82TsuTMzLAlm7AjLbGj0g0VzCu8RBF4e09ugZAM
         nvVSPSQNTt72lA8Jei7nUCUGj1BvtR+L7MEUZfI/mG2qcsj5cs1Mwj7L7ID+K8MX2H75
         zRz4i7vMoUSDAL+QxzoyWeX3uXHg9bkn3jIVPc2IHHiizf5fCIa/6h0A0HTKfTC5STYA
         Prx/tGhc4p7qd4c+LPYtPmw38vPEemdeFqfL+aZlPdbLhAGLZLAb+clgvzileu+DG8Yb
         u5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698978355; x=1699583155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaxKlKs1qhVkoj+jMQ5taqSswamBhJpW8sE/KHC3P04=;
        b=K4nHApKijMrwxqLwE72TunGoKVN9Zf4zrNBpnaYuMdfaMsdaHVeL05fIUuoy5VNMt4
         B0F6N3lQNCwEa8ZBFc8G5VAolSQEKmlQR6SFc7z71FwNTZaGNVo74fIJ65gWkmiHWgxZ
         Zi5xPyy0n0JMvV3APpJqSUTPY6n8rJroeWllufRYmgFlB6mG5aPQXdBo8vclMgVCGZZL
         nYG8eVG4D/WiI39cyv+PgiWCwKTVWB7xQoDgzxxz767GCr9ZdQJKR/u2iOGCUBk2Md7r
         WV+W5a9xO7kukVxz/kber4nITP3cqVlNFOalUaEq3Fd/AoWzd5VAlVRUhOpwhPxruUeD
         UyXg==
X-Gm-Message-State: AOJu0Yxo98fXuNXSCbmvbnIrN6RPyYAOzkIxolrcFc1DsapPh9jTx/K/
	VKZn3uGuV3T3Q7UCvov1hD9QqFKQlCXyGA==
X-Google-Smtp-Source: AGHT+IEQbXfr3DhBGYC9xX150q4TWX/1UgzsQe8OZsafrV9PwQCA4UZJy4s8+AvKwghQnKFS913MQQ==
X-Received: by 2002:a9d:77d1:0:b0:6bc:fb5f:7b06 with SMTP id w17-20020a9d77d1000000b006bcfb5f7b06mr21367112otl.17.1698978355158;
        Thu, 02 Nov 2023 19:25:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id b21-20020a056a0002d500b00688965c5227sm369528pft.120.2023.11.02.19.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 19:25:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 17.0.4 release
Date: Thu,  2 Nov 2023 19:25:52 -0700
Message-ID: <20231103022552.979709-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 02:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190106

Brings following changes/fixes

* 309d55140c46 [AArch64][GlobalISel] Fix incorrect ABI when tail call not supported (#70215)
* 9477268e4247 [AArch64] Add test for #70207 (NFC)
* c2eab59e622c [GVN] Fix use-after-free in load PRE with select available value (#69314)
* 586481468a07 [clang-tidy] Fix crash in modernize-use-trailing-return-type (#70709)
* 9d0ca259eed6 [OpenMP] Fix building for 32-bit DragonFly, NetBSD, OpenBSD (#70527)
* a8046f72bfb3 [OpenMP] record-replay use static-cast  (#70516)
* 12bbcd627f60 [flang] Add comdats to functions with linkonce linkage (#66516)
* bdb1553c7639 [mlir] Add pass to add comdat to all linkonce functions (#65270)
* 3347c8441588 Update release note for the fix
* f6fb6a996c7f [clang][ExprConst] Fix crash on uninitialized array subobject (#67817)
* 8c8abe6b93c0 [RISCV] Correct copyPhysReg for GPRPF64. (#70419)
* 615beaec04f9 [SVE] Fix incorrect offset calculation when rewriting an instruction's frame index. (#70315)
* bb29e1ead22f [MemCpyOpt] Combine alias metadatas when replacing byval arguments (#70580)
* 2b82ec7947fe [OpenMP] Use the more appropriate function to retrieve the thread id on OpenBSD (#65553)
* 8909a24d0af1 [libc++] Encode additional ODR-affecting properties in the ABI tag (#69669)
* e9dcc15f514a [AArch64] Prevent argument promotion of vector with size > 128 bits (#70034)
* 4b7f4152a8d1 [LoongArch] Implement COPY instruction between CFRs (#69300)
* fb62a201a199 Revert "[clang-format] Fix align consecutive declarations over function pointers"
* 1f6d35b36681 Fix tests for c23 <-> c2x
* 030d68ef2cd7 Fix a c23 -> c2x think-o
* 2a41d978b4fa [C23] Use thread_local semantics (#70107)
* afbe3549af4d [clangd] Disable crashy unchecked-optional-access tidy check (#69427)
* 7f790f9a39e3 [ConstraintElim] Don't decompose values wider than 64 bits (#68803)
* a1c67ffd0a1f [ConstraintElim] Add test for #68751 (NFC)
* ef50a367e3d5 [mlir] Avoid including <alloca.h> on DragonFly
* a7101379d75e [LVI][CVP] Treat undef like a full range on abs(x, false) (#68711)
* aa03fba83b17 [libcxx] [test] Add a test parameter for disabling memory intensive tests (#68214)
* 71f408bc3623 workflows/release-tasks: Fix release note artifact upload (#69522)
* 9ab3ce1d7a06 Bump version to 17.0.4
* 880a282a40e3 workflows/release-lit: Pass correct build directory to pypa/gh-action-pypi-publish (#69438)
* 8719ee0cb39a workflows/release-lit: Fix dev suffix removal (#69397)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index bd2ef0ebec9..0f811624a46 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.3"
+PV = "17.0.4"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "888437e1b60011b8a375dd30928ec925b448da57"
+SRCREV = "309d55140c46384b6de7a7573206cbeba3f7077f"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.42.0


