Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C057CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 03:58:37 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.20166.1697687913426064799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 20:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BiwSlfe7;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso4864406b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 20:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697687912; x=1698292712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mlX63xCQ5tT0YJhzhMicnNKT9rw2JJO2+PCGY1B5wwI=;
        b=BiwSlfe7eyg9uIKXCqwdJTF4VIF9GCqGLVfct8NJhJPYa29xqb3WFGZ+9rSRVaQ4eL
         JdhQnMy0vfDGK8BmoKhvonc5ycQ5IMTKOuvR5HwMDlipVAKbhta8HXtw+FfGCosGTQqQ
         yhtkJdrZ4rernDW8CMHTIAqnOEtw6PkPhrpIx3O2D3o3qPIcKoiry/zO+YbS5nu89XDG
         6UECD0PEgBsrG3d52hB5bJrSBR+U6yQLF3JvsUi1mDIv98ZYfSAjoX7PPLCcYdREm5yq
         q8UFnsE5dTl1ND0I+eEYQD56wtANwdzGDCn/I4VMDikSCwCw5P5BEtZ6IQu7ewTM2Mki
         1cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697687912; x=1698292712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlX63xCQ5tT0YJhzhMicnNKT9rw2JJO2+PCGY1B5wwI=;
        b=a3gtOQe8M4wAxzibyHvDgGgTDrBJXEH9hHHZoo+1oapiNYlggyqydjUVklVh/PPgbM
         ZiXYWeOPJDWEsPdJCLjtXrA0Z0YNFtqSiJvITQoZ9zb5IS1zjDDKFOE++4tqa0TeF5uy
         ivZ+N12qkeqf/ub372oPkXKOomyZBNrVSwv52GASicYYqQ0F+2L/kRyZv0CBJ3AkdHbZ
         GQI68vSbQF7rS5t+mAPTlB1AmfGa01j44gEHFnFcQKb2varpaUneeQhkGLyMs3Nt5N7n
         XFuQBVIrbgxqTp0swA3tZ0VMEdwBm9+FBUOWQSv46xuSnIX04baqSCL3R7ngPG3/1WmV
         5APA==
X-Gm-Message-State: AOJu0YzA/FAlZl0r30d7i+y5HUvyvIpFiFxnBEHJ5U3QRg+FhP0mLIMe
	YJQhpb1DaAnZ7fSowljqgvtRNKI1AlPtnw==
X-Google-Smtp-Source: AGHT+IEWC/hkl7y6beZHCRNsS7L4RBa97elGE3yynuUf5t80+UpsCXZzjkSGFZ/DNkfBcEaItehwkQ==
X-Received: by 2002:a05:6a00:811:b0:6b5:6c95:4671 with SMTP id m17-20020a056a00081100b006b56c954671mr1049747pfk.34.1697687912451;
        Wed, 18 Oct 2023 20:58:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id a5-20020aa79705000000b006b5922221f4sm4092046pfg.8.2023.10.18.20.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 20:58:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 17.0.3
Date: Wed, 18 Oct 2023 20:58:29 -0700
Message-ID: <20231019035829.2468073-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 03:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189423

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
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 934f842b908..bd2ef0ebec9 100644
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
2.42.0


