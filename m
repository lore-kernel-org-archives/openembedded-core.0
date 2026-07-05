Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1B2C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140045.1783291398163322631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ypesbehm;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493d28b1930so15930535e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291396; x=1783896196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LXsg+PTM45i/iRf3uuss2hvfVlP6RadGfk5V65o6fBo=;
        b=ypesbehm2pNsah+k+WYNAZBDPAtRVQpCZe60CdFICQY11DN9Rz/MhzeF4AQgb0uQFi
         vHZCr0MjJRg4eePZWLbwXoX9qfcpSL1sU+q4kCJX5xzpMicEMiuDo+6K6tccYUcy7tix
         S7V2NcF3ourXdNIVXPyUl2RmeQnw8nOTGsDP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291396; x=1783896196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LXsg+PTM45i/iRf3uuss2hvfVlP6RadGfk5V65o6fBo=;
        b=nzfULqElxscLHO2MKKXcZFZXPLjQFcLJBw9XuQAIHktY/73dqdrnfvhhk4rgRa5Uup
         7hMizgukJ/K9Fe8JNspQRZM2K6kPQrZ8Jglx/i58nNy1/GL1AvrOjVV2owuHjsQROQSe
         YjoCEoVoIjJJG04S5KfHzto8MK4HgODpQJL2jXk/A54ITzpKz2i4B0CDid2PXJfawePd
         g7v61RLY6onHVeBKTL3jeRngixnZCI/AXLl8AegjGjp70lasy0MZBtZBv5av+Vjhj39+
         IefI2GRKZblwYapRprCK9n4flDtdBkcTK0/dZuzWeJIpEYabg6MxSXiorS0V6VczglXN
         7iqA==
X-Gm-Message-State: AOJu0YybUCVCi4So52yo0FQTb9DKokwfGrLI+3uyLLTGFPhtwtBGleft
	BTZ3WASa7ejCY7/y9Jmj6RQL7Z3WubYnec67M+Kp7UZHs6WFVtRN1NhNAAGECSuDHbCzjAV9tOa
	dW7rfmg4=
X-Gm-Gg: AfdE7cnVSioLiN7owOsFMrL4+Ng07KmaveK80GYk2BR+jNYiH/tBngXNvpsGuioZ0/i
	bTYeXZMOWxZ2C+uULZA8cxtx2wheqLkVvis7me+/s9JMiIN2tHOopaG5sFYLz0zh6dinspoGaYm
	vNbC5TXlZwCdVUshtJxMa1imyGL78h8UkXyidTXOKOgy3KFjcgVSBpkjGwPAHaajbEB8E42fvpE
	UWnrmRekI6YPpDvYc+ysM/dmx38JVgdTOAUYLojnKF23Bcg6TEti00iqgTz4jjoxGWO4XirIsPw
	IPnVD23Huwgs9ZHVqyl9f5q4o+r1Ct4xpjWlGdUYXymIYmxPe443ZLCSibi3Ehus8gmVQyJ/Zrx
	+BlRhtnSw1QxH5zhR5qssv9/Mw5CBp0OwJfml9hYKOxfm47GV5SOgr3dLZQ24fJNcpXcd/qbGc5
	G3mvpX+kU504eNmuq6GM2SOiqeCw==
X-Received: by 2002:a05:600c:64c7:b0:493:ba40:ef39 with SMTP id 5b1f17b1804b1-493d11d8083mr88637275e9.15.1783291396111;
        Sun, 05 Jul 2026 15:43:16 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 55/55] clang/llvm: Upgrade to 22.1.8 release
Date: Mon,  6 Jul 2026 00:41:45 +0200
Message-ID: <728e70d7c681402d8e797691825bfd9929aa79cb.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240209

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://discourse.llvm.org/t/llvm-22-1-8-released/91084

Brings following fixes:
ca7933e47d3a [libc++] Disable mistakenly enabled `optional<T&>` constructors for `optional<T>` (#194446)
208ef916cf20 [WebAssembly] narrow instructions use signed saturation (#201798)
e80beda6e255 [VPlan] Account for any-of costs in legacy cost model
3397c37d5d31 Inline stack probes immediately after `allocateStack` in `eliminateCallFramePseudoInstr` (#195456)
1f5aee55a3fc [DAG] Narrow vselect mask to vXi1 in foldToMaskedStore (#201609)
070e505ce21d [LLD][ELF] Add missing initialization of Symbol `used` member.
761b9134dd9b [BPF] treat compiler fence as codegen no-op (#196734)
724301d98c6e Fix "Cannot select" crash on bitcast between f64 and int vector types (#201509)
60c18c6aeaed [CMake][Release] Use llvm-bitcode-strip on Darwin for build with -ffat-lto-objects (#200764)
b65aa9b5ea8d [Clang] Profile the NNS of UnresolvedUsingType and CXXThisType correctly in concept hashing (#199617)
b4fe3880d09b Bump version to 22.1.8
a255c1ed36a1 (tag: llvmorg-22.1.7) [WebAssembly] Avoid crash in LateEHPrepare with empty cleanup pads (#200322)
a2b779045093 [SystemZ] Fix off-by-one error in backend (#200141)
2615295c15ba [libc++] Fix multi{map,set}::extract not returning the first matching element (#199703)
a760d7c07024 [LLD] [COFF] Fix handling of immediates in ARM64_SECREL_HIGH12A (#200060)
294ae8d1e62a [PowerPC] Drop invalid range metadata when lowering i64 load to fp in INT_TO_FP (#198705)
6db0725886bb [X86] lowerV64I8Shuffle - avoid lowerShuffleAsRepeatedMaskAndLanePermute call on VBMI targets (#183109)
c43c9b426055 [X86] lowerV64I8Shuffle - prefer VPERMV3 byte shuffles to OR(PSHUFB,PSHUFB) on VBMI targets (#182852)
6ac68778a76e [X86] Add test coverage for #137422 (#182832)
ad9524f38657 [PowerPC] Fix i128 vcmpequb optimization for loads with range metadata and small constants (#196801)
48967cc1a0d4 build: adjust LLDB and clang library naming on Windows (#185084)
8798085803f1 [libc] Demote compiler check error to a warning (#198033)
6e5effc4990b [LoongArch] Revert "Add patterns to support vector type average instructions generation" (#198306)
4d5dffb59420 [ELF] Initialize Symbol fields in the constructor instead of via memset (#198129)
823afe046164 Reland [C++20] [Modules] Don't profiling the callee of CXXFoldExpr (#190732) (#195983)
e624f1204282 [CoroSplit] Never collect allocas used by catchpad into frame (#186728)
81c69e140401 Bump version to 22.1.7
fc4aad7b5db3 (tag: llvmorg-22.1.6) [Clang][Coroutines] Don't emit fake uses for coroutine parameters (#194690)
5fb52fc3fda6 [Coverage] Fix assertion failure when a -isystem header invokes a user macro (#195427)
fd10d8f31077 [DAGTypeLegalizer] Add missing BR_CC handler for soft-promoted half operands (#196214)
c0262e742787 [SystemZ] Fix internal error with single-element vector types (#196127)
cbb1eb533ded [lldb-dap] Fix crash in source request handler (#195847)
897d3e2b2a63 [lldb][windows] fix cross DLL file descriptor lookup crash (#195855)
60e3203b2e90 Bump version to 22.1.6
5ea218a153f4 (tag: llvmorg-22.1.5) [CMake] Add multi-target cross to ARM/AArch64 Linux toolchain CMake cache file. (#179598)
7237429c2edc [AArch64] Fix `shufflevector` miscompilation on `aarch64_be` (#193076)
5e29d8aa0481 Prevent undefined behavior caused by combination of branch and load delay slots on MIPS1 (#185427)
c61be37fe844 [clang][CodeView] Prevent the input name from appearing in LF_BUILDINFO (#194140)
a4aca5a91cc3 [libunwind] fix build errors on x32 and mips n32 (#194310)
57370e18b8a9 [Coverage] Fix quadratic propagation in RawCoverageMappingReader (#194996)
932756ad6c64 [X86][FastISel] Restore support for struct returns (#194586)
19f65f31105c [LLD][ELF] Fix performance regression when using linker scripts (#194668)
5c9647b8e680 release/22.x: [WebAssembly] Fix EHPadStack calculation in fixCallUnwindMismatches (#194184)
f3ce7a7db0dc [clang] fix crash with c-style casts involving dependent member-pointer types (#194696)
692d49bdb7ad [clang-tidy] Add note about removal of `hicpp` module
ca0698598261 [SystemZ] Enable -fpatchable-function-entry=M,N (#178191)
0d37e79da8db [X86] lowerV4F32Shuffle - don't use INSERTPS if SHUFPS will suffice (#186468)
9b722024f1be [compiler-rt][sanitizer] Remove linux/scc.h (#194116)
7bf7d99b794d [NFC][AArch64] Allocate AArch64Subtarget on the heap instead of stack (#176488)
98348c38cf17 [C++20] [Modules] Add VisiblePromoted module ownership kind (#189903)
a9fb4799dcad [clang] NFC: Add test case for #178324 and mark it as fixed (#190490)
f131d162201b [clang] fix error: cannot compile this l-value expression yet (#187755)
20fd94cf9314 [SLP] Fix a very long loads offset, being stored in DenseMap
267ce6017a57 [lldb] Add EXPORT to lldb-tblgen (#192610)
c4b74e87ca35 Bump version to 22.1.5
35990504507d (tag: llvmorg-22.1.4) [Hexagon] Add missing MIRParser link dependency (#191010)
22ad4d688a72 [Hexagon][MIR] Serialize HexagonMachineFunctionInfo::StackAlignBaseReg to MIR (#190003)
a1a9924414aa [Hexagon] Add AP register to liveins when used for frame index access (#188942)
7eb182991920 [Hexagon] Fix use-before-def of AP register in prologue CSR spills (#188504)
74049f6e3a70 [VectorCombine] Fix transitive Uses in foldShuffleToIdentity (#188989)
a01a45066dae [NFC][test] Precommit test for pr188989 (#188667)
9f29c1e3fd8a [X86] Fix missing ByValTemporaries update in CopyViaTemp path for musttail calls (#190540)
d46116b2e464 Suppress octal literal diagnostics from system macros (#192481)
a5564a033004 [OpenMP][OMPT] Revert `control_tool.c` changes from #191429 (#192069)
3f9b9936be95 [OpenMP][OMPT] Fix `omp_control_tool` before any directive (#191429)
d1c9116f8442 [clang-format] Correctly annotate binary stars in braced init lists (#186732)
99031a474bb1 release/22.x: [Clang] Track constraint's SubstIndex only if it contains outer parameter packs
5a1590c14433 [ClangLinkerWrapper] Fix `-v` for newer CMake passing it directly (#188883)
c8e984d27b27 [X86] Fix VPMOVPattern folding for extended registers (#191760)
07c19c303387 [compiler-rt] [Darwin] Move macOS ASAN reservation above 512G (#191039)
fa56327584fe [22.x][LoongArch] Revert musttail/byval/sret Changes
10be0a255205 [clang] Allow -Wno-error=X to downgrade -pedantic-errors diagnostics to warnings (#184756)
c2aea991dba1 [Hexagon]  Fix O(N^2) compile-time regression in HexagonOptAddrMode (#189531)
f444cca96bd5 [AArch64][SME] Preserve ZA in agnostic ZA functions without +sme (#190141)
5d161731998c MIPS/expandAtomicBinOp: Remove tailing kill dead register operands (#186055)
def143a6c624 [clang] fix getReplacedTemplateParameter for function template specializations (#189559)
5b4dd04594bd [pdb] Fix public symbol hashing in GSIHashStreamBuilder::finalizeBuckets (#190133)
f42d371a5d72 [WebAssembly] Fix: fixCallUnwindMismatches after fixCatchUnwindMismatches (#187484)
e9a36c0cca40 [CodeGen] Preserve big-endian trunc in concat_vectors (#190701)
53c41b3a599f [PowerPC] Optimize bitcast(truncate) patterns using vbpermq (#181233)
ab2f55b13bcb [LLD] [COFF] Fix crashes for conflicting exports with -export-all-symbols (#190492)
f0593ab291c7 Bump version to 22.1.4

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 99242af484a..7499f7ab95a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -483,7 +483,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.3 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.8 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 1b8909eeb58..ed628008e06 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "3"
+PATCH_VER = "8"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 9d45898c685..441ea099a9e 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd"
+SRC_URI[sha256sum] = "922f1817a0df7b1489272d18134ee0087a8b068828f87ac63b9861b1a9965888"
 
 SRC_URI = "\
     ${BASEURI} \

