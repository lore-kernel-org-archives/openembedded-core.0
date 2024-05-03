Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5996C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 06:04:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.6358.1714716245541364745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 23:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWOWJ6ZJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f0aeee172dso1939932b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714716245; x=1715321045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdltBR+/KvDllN9odokr1KfSzKXKtbyHb/cZPIv6PF0=;
        b=hWOWJ6ZJwxBqo9ir0Ol1kHUNhVDUb8UxcdB9bEKmwxRnAnyyqRs3hYqg6Sq9yyAlMf
         myj5hlQBf3EVRpt9k/VQJFi9fnZVL0ifiXNa0k2RH6A2n6vNFRA5DsfHU9j62tM0cORd
         TkJ1okTXXHyDpoeGxk9BKNAUMpZOiawP1UgWOanogC72V8bQC2mafTPVQulVCYNjw+yq
         SHFQ6/97+Kzh0xMYAkSkl91pNVmHxKRs4axvAuSaDHcItRIfmCY3R6x4B88ZGQ+XWtIg
         93fyWYuldY7OCjvKl0Qix447wdKRzrP8Y1Pi+Ud7lG/R1R7me6yzQMRV/7e/gQBwS6aT
         K3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714716245; x=1715321045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdltBR+/KvDllN9odokr1KfSzKXKtbyHb/cZPIv6PF0=;
        b=b2F7N/oRmBHNZXFZIDQHxBflMppaW/3NpaTMG7M9Zvcsqxbx2/YLtVfTxYvAXbYza8
         6oI+n0kozwDGG5hISixhFDaDYlTVsG5auLt8id7G0ug9Thbqh51+FtgZD1xq9NVbJVp5
         yfs7+BubRa9YtbyHG1kXVI9UL8tarrp0wW0NBh3/DlsPI3wgC6koEn5B87NPGaxZiAaV
         56ptTsc+cWSZVi2KTe0+wRk6Q0T/7pGqmsB1tTwHF3mTwyys4/P12DI0oL5tqFqu72Pt
         6L5WlxDRCbxZENhkKfP1rHY6VMd4jn8pp8ZAz5TJvukGEBQSRu35yeeJ6Wt01X34RIli
         P+jg==
X-Gm-Message-State: AOJu0YzhMtyw+XUviJBO+J4zTyZTsyEssN/dzxiFVa4ncpcEBB8fsSIh
	cCIH90QZDIl7hMwuNIdZl76ggcPn++TGfdYzUEhaCKGH1aC6ohVF1A1NuNuB
X-Google-Smtp-Source: AGHT+IFRSEAKvPJwNpxvuwUPoUJ9X3mHoiIqtAMA6Eb9wGpYnV7GnMYj/Icz6UOJuDTB598lFJaHqA==
X-Received: by 2002:a05:6a00:3a28:b0:6f4:4b35:d7b5 with SMTP id fj40-20020a056a003a2800b006f44b35d7b5mr1652138pfb.1.1714716244501;
        Thu, 02 May 2024 23:04:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f530])
        by smtp.gmail.com with ESMTPSA id f29-20020a63511d000000b005d8b89bbf20sm2263051pgb.63.2024.05.02.23.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 23:04:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 18.1.5
Date: Thu,  2 May 2024 23:04:01 -0700
Message-ID: <20240503060401.1011461-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198967

Brings

617a15a9eac9 [clang codegen] Fix MS ABI detection of user-provided constructors. (#90151)
20b9ed64ea07 [RISCV][ISel] Fix types in tryFoldSelectIntoOp (#90659)
ece9d35f1a70 [GlobalISel] Fix store merging incorrectly classifying an unknown index expr as 0. (#90375)
a7b8b890600a [X86] Enable EVEX512 when host CPU has AVX512 (#90479)
4da5b1417493 [GlobalISel] Don't form anyextending atomic loads.
a96b04442c9f [AArch64] Remove invalid uabdl patterns. (#89272)
aea091b70eda [clang][CoverageMapping] do not emit a gap region when either end doesn't have valid source locations (#89564)
58648f334d62 [X86][EVEX512] Check hasEVEX512 for canExtendTo512DQ (#90390)
6350acdb134d [CGP] Drop poison-generating flags after hoisting (#90382)
f341c76b9461 [Clang] Handle structs with inner structs and no fields (#89126)
abf6b13085fb [IRCE] Skip icmp ptr in InductiveRangeCheck::parseRangeCheckICmp (#89967)
ee5bb0c95667 Fix Objective-C++ Sret of non-trivial data types on Windows ARM64 (#88671)
6dbaa89433f7 [clang-format] Fix a regression in ContinuationIndenter (#88414)
51ff7f38b633 [clang-format] Fix a regression in annotating TrailingReturnArrow (#86624)
b544217fb31f [AMDGPU] Fix setting nontemporal in memory legalizer (#83815)
78b99c73ee4b [DAGCombiner] Fix miscompile bug in combineShiftOfShiftedLogic (#89616)
1aa91720cc4f [DAGCombiner] Pre-commit test case for miscompile bug in combineShiftOfShiftedLogic
35fea1032741 release/18.x: [clang-format] Correctly annotate braces in macros (#87953)
b9b73814ad8a [libcxx] [modules] Add _LIBCPP_USING_IF_EXISTS on aligned_alloc (#89827)
c0b48372d82a release/18.x: [clang-format] Revert breaking stream operators to previous default (#89016)
3b4ba7277bd7 [analyzer] Fix performance of getTaintedSymbolsImpl() (#89606)
7699b341b763 release/18.x: [clang-format] Fix a regression in annotating BK_BracedInit (#87450)
fb865928c8e0 [GlobalISel] Fix fewerElementsVectorPhi to insert after G_PHIs (#87927)
111ae4509c96 [X86] Fix miscompile in combineShiftRightArithmetic
76cbd417af50 [X86] Pre-commit tests (NFC)
e7c816b3cd3e [InstCombine] Fix unexpected overwriting in foldSelectWithSRem (#89539)
3685a599c866 ReleaseNote: Mention SpecialCaseList change (#89141)
a981a4f7653c [X86] Always use 64-bit relocations in no-PIC large code model (#89101)
4ddac856c55f [analyzer] Fix a security.cert.env.InvalidPtr crash
c6d63d4fc555 Bump version to 18.1.5 (#89291)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 296180ea451..6413b041a8d 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -17,14 +17,14 @@ inherit cmake pkgconfig
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.4${VER_SUFFIX}"
+PV = "18.1.5${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "e6c3289804a67ea0bb6a86fadbe454dd93b8d855"
+SRCREV = "617a15a9eac96088ae5e9134248d8236e34b91b1"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.45.0


