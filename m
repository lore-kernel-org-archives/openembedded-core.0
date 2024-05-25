Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1567DC41513
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 10:49:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.9000.1716634168843889417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 03:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BjMyCXh3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202405251049255f9e2209c21c912b87-tavfjf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202405251049255f9e2209c21c912b87
        for <openembedded-core@lists.openembedded.org>;
        Sat, 25 May 2024 12:49:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KAMmS6YLHhpB+g4HG2gxnhMeyXgz/7MFl9eeV7LSTW4=;
 b=BjMyCXh3bcsz1gmemxeUg5P9b5h06FCRKbAhx2idRDTPBwFtzONgYMIx8EVo4MaPxX91Vo
 kSQF8Oh+vTyLWLHFhizu7a3klDp+nXx/GzKo9QNTUsaTm//bgmZ3XYYuTZ5/hpdyBqM5+L4Y
 IZ6RXLnJUoNysk1jyIJTcxgCEaclE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/6] llvm: Upgrade to 18.1.5
Date: Sat, 25 May 2024 12:48:34 +0200
Message-Id: <20240525104838.619254-3-peter.marko@siemens.com>
In-Reply-To: <20240525104838.619254-1-peter.marko@siemens.com>
References: <20240525104838.619254-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199868

From: Khem Raj <raj.khem@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

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

(From OE-Core rev: 02df2fc6241ac8fb0e78f2fdff97a04e5c561d54)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index e7fa88b30e..dfaa031012 100644
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
2.30.2


