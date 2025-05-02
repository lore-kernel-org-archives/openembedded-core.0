Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC091C3ABB0
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 16:55:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.24050.1746204925546022819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 09:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/MA8DOi;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so1708176a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204925; x=1746809725; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxfpOxLCKWFv4Zpm0TIyculPBMRFN9AuMxq+NtUsW4w=;
        b=Q/MA8DOiUq0pYM14ypEyuDmKqm7JAGbeMTF8VAgI80DT512nleI8RdWMHZLZo1/K80
         qcuPPa4IU1Pvq/ijq1bo9alUshDZRjZ/rZo0xal2hHFC3XnjWqlaaB0/hzvp/y9bHUDl
         w4gG+VsQLkvWfTeb3yN5RvqJ13Nx/NnWp/YOXPHOIyup5LLj1aMSTcaGLn3D74ORjc+W
         ALD06Mhy6FOo6zPzERI0p+BKvUXAp2VanXRBiW28Axgeqg6WcqLfKrM2ZZRiv6oojQv0
         7obccm1N2p2skCG9r+RGOFPoJs/yEAQkQN+lWE754mfRM+Td/vN+5HKY25iWtuW9GvKj
         Ew6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204925; x=1746809725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxfpOxLCKWFv4Zpm0TIyculPBMRFN9AuMxq+NtUsW4w=;
        b=F+zoKAIDn/zCGyJz1V4GvzVTF1Sh1WfA/hvaB3wlzt1g00TENrHYZPNTSiFWfQSFx6
         uUKJUFG9xHUO//Dh16M7TYQxxofe7sSz3b+PpdEby7nIx6vtlZpv+6moTrDrW1Z7bxpp
         ul3L+JoCSmphLL4hbMPcogN9IAQCJb+8MX8FQl0n3CQKKgMF+UluZiK5vJSW0mFrJimh
         Or8nE0orJj96KjW2hoiKj8EQiqwYcmyhdATd6+hQiG3E2TvlVOPhyv9iScC9J3OigV/7
         kqQkk69qbt3evpGecN3xT4EBATUNhmOUqxXPtHNE/EXgRiXEgmv6stb9gK+fFfkpwVmW
         lIBQ==
X-Gm-Message-State: AOJu0YwwwgIXu06j5IpmimxJLzbrubhJGM/HeDfQLhhFLWsEoT+7Lln7
	dJEdfNqupeLA6PCp6by6Ma1IBFilOLp39vgwUXY/7962cDbCc0tqc1W6/uY2
X-Gm-Gg: ASbGncvJAZe7IQV7/5nySg13w/2btRmuGUfiYUhGSZYiLF/evzl1vTrcMntD+aTb5SM
	hG4g2rs+w1gomziMLa44obQPKyqoF3nrT1bxnbKhA1D+3CJRoerjKcvVqMH1hkMM5GNm/XeqoTZ
	9gs+KuBrzVIP4F+koW2Xmz9YoYke6X6CIKXmTCLKeJ757W4ObbRCBaSJWXhH5Hm5Ur23vWgl4Ag
	3hKPyvy1YGh2YOSD2973mrspJ3zZ/EBKl1Xrcex2Lwzl8fEYmOYr4UKWDFk5cfd62OlZMM023c/
	JhWZ3huHOzopNjmlWRgMcJ9kcKhaVXfNvZN8IpDGVCI=
X-Google-Smtp-Source: AGHT+IHhL+zWYDJuL8o/MA8Og0ORJmAyimFtyaas3xnF1HYrSNsORTZdfxYaQyqSmXe/EVYPgG9klw==
X-Received: by 2002:a17:90b:2dca:b0:305:2d68:8d55 with SMTP id 98e67ed59e1d1-30a4e5ae177mr5894417a91.8.1746204924590;
        Fri, 02 May 2025 09:55:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625af9sm3253794a91.31.2025.05.02.09.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:55:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 02 May 2025 09:55:20 -0700
Subject: [PATCH v6 6/6] clang: Upgrade to 20.1.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-clang-merge-v6-6-00f2c2e9ff68@gmail.com>
References: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
In-Reply-To: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 16:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215917

Brings following fixes

* 923a5c4f83d2 Revert "[ARM][ConstantIslands] Correct MinNoSplitDisp calculation (#114590)"
* 86f5891c5986 [llvm][Hexagon] Promote operand v2i1 to v2i32 (#135409)
* d55c3c20520a [libc++] Fix misplaced _LIBCPP_POP_MACROS (#134874)
* 9420327ad768 [Clang] Fix a lambda pattern comparison mismatch after ecc7e6ce4 (#133863)
* 4da7285e636e Silence -Wcast-function-type warnings on idiomatic Windows code (#135660)
* c5109be53b7e [LV] Disable epilogue vectorization for FindLastIV if start is poison.
* 91a3f14d9497 [LV] Add tests with FindLastIV and epilogue vectorization.
* 2131242240f7 [LLVM][MemCpyOpt] Unify alias tags if we optimize allocas (#129537)
* 86c98536380b [libc++] Fix deployment targets that were incorrectly bumped (#134278)
* dfd6f123362a [libc++] Guard additional headers with _LIBCPP_HAS_LOCALIZATION (#131921)
* dc9d4f9a7008 [lldb] Respect LaunchInfo::SetExecutable in ProcessLauncherPosixFork (#133093)
* 9c7d72869876 [LoongArch] Move fix-tle-le-sym-type test to test/MC. NFC (#133839)
* 0c30835a63db [X86][AVX10] Remove VAES and VPCLMULQDQ feature from AVX10.1 (#135489)
* 2e0966408283 [X86] Backport saturate-convert intrinsics renaming & YMM rounding intrinsics removal in AVX10.2
* 0dd4235473d4 [SCEV] Use ashr to adjust constant multipliers (#135534)
* a141e58685fd [llvm][CodeGen] avoid repeated interval calculation in window scheduler (#132352)
* d88cd35023b4 [llvm][CodeGen] Fix the empty interval issue in Window Scheduler (#129204)
* 73d1e8598eda [CodeGen] Avoid repeated hash lookups (NFC) (#130237)
* 7034995f1029 [clang] Handle Binary StingLiteral kind in one more place (#132201)
* 2e7710eaffdd [clang] Introduce "binary" StringLiteral for #embed data (#127629)
* e0db588f3db4 [IR] Fix assertion error in User new/delete edge case (#129914)
* d5bb7b866e59 Avoid a race condition in opt-viewer/optrecord (#131214)
* d15fef4209f1 [IndVarSimplify] Handle the case where both operands are the same when widening IV (#135207)
* 91647ae0dffe [X86][SSE] Don't emit SSE2 load instructions in SSE1-only mode (#134547)
* d05543ed0796 [clang-format] Keep the space between `not` and a unary operator (#135035)
* 81220e68a496 [fatlto] Add coroutine passes when using FatLTO with ThinLTO (#134434)
* edb54a7821fe Release/20.x: [clang-format] Set C11 instead of C17 for LK_C
* 4181e829d1db [LLDB][LoongArch] Fix build errors about NT_LOONGARCH_HW_{BREAK,WATCH} (#126020)
* 7436329bfee9 Revert "[clang] [ARM] Explicitly enable NEON for Windows/Darwin targets (#122095)"
* a0c8959cc880 [X86] When expanding LCMPXCHG16B_SAVE_RBX, substitute RBX in base (#134109)
* a8b5fe017a5e [libc++] Add missing release note for LLVM 20 about zip_view (#134144)
* 41aefdbebe64 cuda clang: Fix argument order for __reduce_max_sync (#132881)
* 19c2e1c12d47 [clang-tidy] Fix broken HeaderFilterRegex when read from config file (#133582)
* ac31db0463c0 [Sanitizers][Darwin][Test] XFAIL malloc_zone.cpp
* 53141e4e3c65 [clang] Do not infer lifetimebound for functions with void return type (#131997)
* cf7bb13f0c7f [TailDuplicator] Determine if computed gotos using `blockaddress` (#132536)
* 656289ffa0a6 Bump version to 20.1.3 (#134187)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b3e3862df9e8ff0d040c804f80704b1a768bce37..b67433d4d2b643c12803da222affaf3d85dd069f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -478,7 +478,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-20.1.2 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.3 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index bb152d2c566a6c61b95be2e7922cfe9c64a27afa..41944265ba56713593a89ebe9db20ea66a64917a 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "20"
 MINOR_VER = "1"
-PATCH_VER = "2"
+PATCH_VER = "3"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 5a1fa0bacf7f8504f58b2866be8d42b3621787da..f733566bc88a6feb9bfdfa4b520579c12721f0d9 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -15,7 +15,7 @@ LICENSE = "Apache-2.0-with-LLVM-exception"
 RELEASE ?= "${PV}"
 BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
 SOURCEDIR ?= "llvm-project-${PV}.src"
-SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
+SRC_URI[sha256sum] = "b6183c41281ee3f23da7fda790c6d4f5877aed103d1e759763b1008bdd0e2c50"
 
 SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
 SRCREV_spirvheaders = "09913f088a1197aba4aefd300a876b2ebbaa3391"

-- 
2.49.0


