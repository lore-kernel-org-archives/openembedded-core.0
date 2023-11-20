Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1805C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:12 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.604.1700498343783228922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pf3vAsIF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6cb55001124so1249904b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498343; x=1701103143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0WSjumbTbatOiabqm1oeVSAJ3xq68kR9ij0tead1ok=;
        b=pf3vAsIFColTtzglxuDBn0UYmuvOLD75WNFwW+rJLOLL1soyNbgfUCT3lAe5TiuGpY
         dAqbhV9DlBXU0fG470Dy6LGBmxDJhaNm6bORY94Q2DinX1xAQnbw/JhyEuATez2evVBL
         vTB6F2N5c4w8OPf0KnEuFJ/iMU85VgX2QFQr/kBSp1DkVr0zxwxNHH8kSemmc3H+sHtQ
         1Z3hsS+1gqe4t5T6tdaBppda8k3gZHPMCAoUdbuS/l1ydItGMNC7R2Y8tcfQ4k7aty6q
         5gLxtSmNeqwvRrHOqEsGHh1M9XaLjWq6VGT18H03PF+yiqjt9ALXQ48lZTdlnpNttyLO
         902Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498343; x=1701103143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0WSjumbTbatOiabqm1oeVSAJ3xq68kR9ij0tead1ok=;
        b=edVdM7ARVbX+BSFOfyevHLDul5NCCYPKOXYr1QmmJNfJaP/fbfOxshWsbKm39A8m+f
         vlgIGDN3eLPG2IIyndI3BUhS+SnePIuia6czmXOABO8XundNIum7CUuR1Va9YGaMCwi0
         7tGv26kGWkpWnysSkHpwYePt8jMn1ZTqMoNqhxMMfKuSctgUMBjoJMlWxOP7cZz4g+tt
         4rneCwqGbVLh3Urhh6i0VvPb2uysNbqy70/2caU7539OQ7VmBd4i4g/idJUL8I4lOh1e
         Bq+p3xS/21gEqN7lMAnCUp2yH9twjQGABXWuU7Uv0UL0zZUCYheymkxwY7aD3bZputP1
         yYpA==
X-Gm-Message-State: AOJu0Yz6W+nd/BkidlTNdzHi1pq+IoZl8D0E4A5EykjV4DvmDIgY+uJ8
	tsWbaKGvYJC11pA//NfZZH+0oKTLpiQfag8rWpTcKQ==
X-Google-Smtp-Source: AGHT+IHinn/uYK+r2ax1JKa2AYl7JJ7kf1qLW0p17bYacVj3XpKMlRl3F7GoF/KuHmt+OKRjnJiRwA==
X-Received: by 2002:a05:6a20:258d:b0:187:185f:1dbe with SMTP id k13-20020a056a20258d00b00187185f1dbemr8393pzd.11.1700498342708;
        Mon, 20 Nov 2023 08:39:02 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 04/33] llvm: Upgrade to 17.0.3
Date: Mon, 20 Nov 2023 06:38:18 -1000
Message-Id: <2c161d842af31b4194d54409bba46cdcc33c1e16.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190893

From: Khem Raj <raj.khem@gmail.com>

Brings following fixes

* 888437e1b600 [asan] Ensure __asan_register_elf_globals is called in COMDAT asan.module_ctor (#67745)
* 2e00f4ca4e91 [clang-format][doc] Update the Linux kernel coding style URL
* aeb83c3783a6 [clang-format] Fix a serious bug in git-clang-format (#65723)
* 268faa377aee [LSan] Mark create_thread_leak.cpp as UNSUPPORTED: darwin.
* 491a91e8eea2 [PowerPC] Use zext instead of anyext in custom and combine (#68784)
* 8ce6b65c89ad [PowerPC] Add test for #68783 (NFC)
* 7a23a5d43c67 [clang-format] Fix a bug in RemoveParentheses: ReturnStatement (#67911)
* be4016e52779 [X86] Fix logic for optimizing movmsk(bitcast(shuffle(x))); PR67287
* 496b174053bd [X86] Add tests for incorrectly optimizing out shuffle used in `movmsk`; PR67287
* f50c6382c716 [clang] [MinGW] Explicitly always pass the -fno-use-init-array (#68571)
* d10b731adcc8 [LVI][CVP] Treat undef like a full range (#68190)
* 37b79e779f44 [X86] combineConcatVectorOps - only concatenate single-use subops
* 5a13ce2d6020 Bump version to 17.0.3
* e7b3b94cf500 [clang] Correct behavior of `LLVM_UNREACHABLE_OPTIMIZE=OFF` for `Release` builds (#68284)
* f0a687d821c1 [LLD] [COFF] Fix handling of comdat .drectve sections (#68116)
* 8a8ade49ff49 workflows/release-binaries: Use more cores to avoid the 6 hour timeout (#67874)
* 1090b91a2840 [AArch64] Disable loop alignment for Windows targets (#67894)
* 69c8c96691c7 [Sema] Use underlying type of scoped enum for -Wformat diagnostics (#67378)
* b2417f51dbbd (tag: llvmorg-17.0.2) Fix release/export.sh to export runtimes tarball, too (#67404)
* 23988a1d82d5 [libc++] Fix `std::pair`'s  pair-like constructor's incorrect assumption (#66585)
* 33e14ecd6aac [CodeGen] Don't treat thread local globals as large data (#67764)
* 03f797b51df6 [workflow] Fix abi checker in llvm-tests. Same fix as in 99fb0af80d16b0ff886f032441392219e1cac452 (#67957)
* f6cf58eed973 [clang] [MinGW] Tolerate mingw specific linker options during compilation (#67891)
* b338a2830a2c [LLD] [COFF] Restore the current dir as the first entry in the search path (#67857)
* 6a5be8e95b43 [LLD] [COFF] Clarify -print-search-path for the empty string element (#67856)
* 71be0aafe357 [NFC] clang-format lld/COFF/Driver.cpp and lld/Common/Filesystem.cpp
* 0a2d7dae6ef2 [compiler-rt] Reinstate removal of CRT choice flags from CMAKE_*_FLAGS* (#67935)
* 098e653a5bed [MemCpyOpt] Merge alias metadatas when replacing arguments (#67539)
* 78d201ebc3e2 [MemCpyOpt] Add test for #67539 (NFC)
* e718f3240a57 [DependencyScanningFilesystem] Make sure the local/shared cache filename lookups use only absolute paths (#66122)
* 45066b9fbc7b [Sema] Fix fixit cast printing inside macros (#66853)
* 87ec1f460d0e Work around two more instances of __noinline__ conflicts. (#66138)
* 9da5b7a93bca [lldb] Fix building LLDB standlone without framework
* c056d720b534 [lldb][NFCI] Change logic to find clang resource dir in standalone builds
* cb23434f9e63 [XCOFF] Do not generate the special .ref for zero-length sections (#66805)
* 1b55dc9d94c3 Fix buildbot failure caused by D157623
* 28d81a2bfa0a [lld][COFF] Remove incorrect flag from EHcont table
* b7eba056b93c workflows/release-tasks: Setup FileCheck and not for release-lit (#66799)
* 9678f11b057c [StackColoring] Handle fixed object index
* 49e9ee190080 [StackColoring] Handle SEH catch object stack slots conservatively
* 17123a60b87c [X86] Add test for #66984 (NFC)
* 2839aa915066 [SimpleLoopUnswitch] Fix exponential unswitch
* 773f136d6faa [SimpleLoopUnswitch] Fix reversed branch during condition injection
* 4362f3e4cf48 [clang] Include `expected-no-diagnostics` in newly-added test (NFC)
* 5f1fcc43e592 [clang] Bail out when handling union access with virtual inheritance
* 178cf5bc8732 [clang][Diagnostics] Fix wrong line number display (#65238)
* 25a150b830f6 Revert "[InlineCost] Check for conflicting target attributes early"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8cfb833b66e514ea911aa4fbdc72592a06233f68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 934f842b90..bd2ef0ebec 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.2"
+PV = "17.0.3"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "481358974fb0f732e33d503c224492a543f4d7bd"
+SRCREV = "888437e1b60011b8a375dd30928ec925b448da57"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.34.1


