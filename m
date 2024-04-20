Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0910C4345F
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 16:25:28 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.15302.1713630322732144315
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Apr 2024 09:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WxdFIJRK;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2a528e7f2b6so2225424a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Apr 2024 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713630322; x=1714235122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gz3zhyuJ//CfGRT7zDci8k4ZzflEHwqr5TVm65b13BU=;
        b=WxdFIJRK3wQSplFRGVpFP52KjzDLH6g2x/6OI4tQd9A2QEipOq5DLw5EkvlvZ6Om6W
         Sc6lD7V1F2ADNHRs9dEk9OycAIrbpQzvZ4td6Hcn3f7clywJhP5K5aS/s0QVQhy3+8qg
         WuZ/MpWLDfZTR7xKjdlvG0Xrcg2qi77oIN+leop4HJcU8gp8vQ52LFIXjs6kbLpuirHA
         skSQbzfkXNJwMiCAqhtfYbizXGvV0eY15sDU2OVyOhxLEn0VGEF3VNs1G1Co2dAoS1nW
         sG/prF1VQCL51Mwo2cTIvj1yHUSVKEJtEmWIUjFFTBH1RtJtD4atXEK21AgVwdlps7HT
         tkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713630322; x=1714235122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz3zhyuJ//CfGRT7zDci8k4ZzflEHwqr5TVm65b13BU=;
        b=VgIE30Lh0qNCPPXul9CBA+HYz0AaTUzY8jzN6QhCzWnIFHaW99/Q6Fa4z8nhglBMDS
         jDHlOF3dG36nkSsBGgtg3LlaxYiXFcW21S/GYsl+QZQ4dYLVzT/8Sd6IldPIiZeLw8YK
         g6Tl+5kUDDM5btZpgDPzBmmFgP97Gz5k+WGj6HTXs2MJlTQ1m5szR+/yLJRNbIVLJ/Qv
         VO34txNyCcP3Rm/aI1cMQyXG6Gz13hP/pmweUaHgOhQ4XHysDHThztKWckLqIEUdJ1PL
         gkNmBd27F2AkJOmwBEoTd37zOfnCUYhrZQ6zEgVkUIizpFHyMuiUDvTaAKL45ctyYD3X
         Z+oQ==
X-Gm-Message-State: AOJu0Ywh29Sb+WriudoJ9x4OXx/eQi9KsHrB/UFlGrQEYXGiPM50KRbE
	QO0Bpw53a5ninTxy+YJ6I+FTvHIM2kjGqRHhYEam/obAawCQYUCr1NT6zLsQ
X-Google-Smtp-Source: AGHT+IFonMpcVJmY/2q57uDTPxqI/40ac0yfvZmY8jT2FqfTqBR3G3aZuWNuXMDLPs1fjsf9MiC4Bg==
X-Received: by 2002:a17:90a:f507:b0:2a6:16e0:a442 with SMTP id cs7-20020a17090af50700b002a616e0a442mr4779945pjb.2.1713630321680;
        Sat, 20 Apr 2024 09:25:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3c2])
        by smtp.gmail.com with ESMTPSA id i14-20020a17090a7e0e00b002a78cad14a8sm4902918pjl.30.2024.04.20.09.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 09:25:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 18.1.4
Date: Sat, 20 Apr 2024 09:25:19 -0700
Message-ID: <20240420162519.3699479-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Apr 2024 16:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198568

Brings following fixes

* e6c3289804a6 [CMake][Release] Disable PGO (#88465) (#89000)
* 028e425f86cc [MIPS] Fix the opcode of max.fmt and mina.fmt (#85609)
* e3c832b37b0a Fix override keyword being print to the left side
* 1deeee3f5da4 Revert "[Mips] Fix missing sign extension in expansion of sub-word atomic max (#77072)"
* 995539ce05ba [LLD] [COFF] Don't add pseudo relocs for dangling references (#88487)
* db67e6fb9ad1 [libc++] Fix -Wgnu-include-next in stddef.h (#88214)
* 647fbc710840 [SelectionDAG] Prevent combination on inconsistent type in `combineCarryDiamond` (#84888)
* eaae766a20fd [RISCV] Support rv{32, 64}e in the compiler builtins (#88252)
* c24b41d71f2e github-upload-release.py: Fix bug preventing release creation (#84571)
* c837970dd7e9 [Codegen][X86] Fix /HOTPATCH with clang-cl and inline asm (#87639)
* d0ddcce21d91 [InstSimplify] Make sure the simplified value doesn't generate poison in threadBinOpOverSelect (#87075)
* 4056cc29dfd3 Prepend all library intrinsics with `#` when building for Arm64EC (#87542)
* 6e071cf30599 [SLP]Fix a crash if the argument of call was affected by minbitwidth analysis.
* d89da2ac8839 [libcxx] coerce formatter precision to int (#87738)
* b6ebea7972cd [SPARC] Implement L and H inline asm argument modifiers (#87259)
* bffecba7ce4c [libc++] Simplify the implementation of <stddef.h> (#86843)
* 9899a2d76c8f [lit][ci] Publish lit wheels (#88072)
* 3ceccbdb1995 [clang-format] Correctly annotate braces of empty ctors/dtors (#82097)
* 429d62872525 [Headers] Don't declare unreachable() from stddef.h in C++ (#86748)
* feba8727f805 [ConstantRange] Fix off by 1 bugs in UIToFP and SIToFP handling. (#86041)
* e4259b583c92 [Float2Int] Pre-commit test for SIToFP/UIToFP ConstantRange bug. NFC
* daca56d8e162 Bump version to 18.1.4 (#87715)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index c4fd73f2d7a..e7fa88b30e6 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -17,14 +17,14 @@ inherit cmake pkgconfig
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.3${VER_SUFFIX}"
+PV = "18.1.4${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "c13b7485b87909fcf739f62cfa382b55407433c0"
+SRCREV = "e6c3289804a67ea0bb6a86fadbe454dd93b8d855"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.44.0


