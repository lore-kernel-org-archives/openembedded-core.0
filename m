Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F16C27C44
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:16 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.36162.1717244710356359905
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EbNlEsO0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f60a502bb2so21477755ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244710; x=1717849510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF89pMRGFWkNX8dlUP/tx6Q6niwlRkzwOuE8PeeGKQw=;
        b=EbNlEsO0DTJnHv8yDVFksqkfHgd+7SawbyjKRovNzjEsep6J8+bS/iBI1Y8aOl7h6Z
         i5OOkIQXBGNLHo0B4YK7qYLiUDaR3Xk1Ell4iEnMEpXvt7gbqYb4dPDI6h6saQP+4WpT
         X2UVlcrzMR7Zz6GAnqyKqIUR2i7IuYEw+gbUN9qPgdeIHxbqlYIcTHup3cyhYnrHtE3N
         P4APO79b5vkVcPIUUN683SCLJdqfIv6Uur+bVh+TrnFH4ptU6UswB7HK0A/uZ/zXA5bS
         NjoMsV3TBIe8YXdLilMFKhn912qxyhV/OX1OcvzFB1y2HhCpX93zVJRY71XcCQtXAKgw
         hgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244710; x=1717849510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF89pMRGFWkNX8dlUP/tx6Q6niwlRkzwOuE8PeeGKQw=;
        b=eVIoAOWQNKQZJvWEmrE8mLXcA65RRMRV7t9sfaPqEzJfQ7+WnvqeEYIDCe5WsfVTl0
         LILb1h/2317olIUjOVmeKPC8T7NUL5b3U3EwxWf4kJBkviPV15CUWC9B1fng03X+8XBi
         Ri5MAFsoE9ZUyKYoAuuFCfQ4qYIWCVcqRlKrDpbcBq0kY8EJEw6WS4mwFBbFZoQTpQq8
         hJwpudDkKOlryi1I05xtcdAFMkGmlIZXATGK8h1bbbHt2fTxp5cm1qhXaInm5/2hjBa/
         IggHCkf+VcUjLUcy2dTqZVbRdYtKz0491WXwShpd4I4GCLex+b1CKBWiCC91y8DLgwDr
         b90Q==
X-Gm-Message-State: AOJu0YyGZAWCfdTXiMUiJMhHLncOshYFClgVvTYanug5dR0OlrYz9eC7
	zfJ25fnMZuizntxi5JhWGXbz2JlzcC7/0tvAbufpi3BWy8+ioe8cnAcRCcl84WOqybLMs/DrwJf
	n
X-Google-Smtp-Source: AGHT+IHkb05MTT6mTs80CCUbdzfQpjl9VyZp5i7veeg6pBvGtvoV7fAxbJOaA67Tz7e5t1u2q2awgg==
X-Received: by 2002:a17:903:11cd:b0:1f6:da3:9eae with SMTP id d9443c01a7336-1f636ffed3emr54665105ad.4.1717244709596;
        Sat, 01 Jun 2024 05:25:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/21] llvm: Upgrade to 18.1.5
Date: Sat,  1 Jun 2024 05:24:37 -0700
Message-Id: <b01e94690c3c29cd1e666e671c98e500c13e1942.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200107

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


