Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB8EC25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:16 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.36161.1717244709294744352
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vI/EHBSs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f62fae8c1aso16009005ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244708; x=1717849508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rx+mhfI8Wl0UYb5GaAOE3ydMnuuq3ZjrtQ9b+b3twnM=;
        b=vI/EHBSsLSUYOiJgHEB1/6MyuX+7kE8uffsT1PPFvoA24GyO0W2Q3UlWdUijFlykmT
         DqEJ4yykJO2ob6/YnW5PZrEHw6oYVaFHudktDjoPi9oDqJcYvmOoq5F8NlMG4bCj8l+L
         YajbfTymyMPTcqLJBAjCdUeeCS9JIkt85IeWgQcRibi2jCmamUntOdHASoQPW60MtWyr
         1BBmbrXBZErWoAONP/yVPwI+JZ35AbsnTTNAAMJLYa79qgqjrPOlI1P5bKc8JkmYXut1
         MAV9uWUE8y4FFv+V3vf8PZZD5bZ+2K9qmzI9tueVMfYK0LMXahkztylX4ORhmdRkF+HD
         XvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244708; x=1717849508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rx+mhfI8Wl0UYb5GaAOE3ydMnuuq3ZjrtQ9b+b3twnM=;
        b=St21bAlk2cIRRtW4aBSJKnDW1Z5PmuT2hnbOyc2xteu6Zfc1d2Gu/dPr4aGfYpWD8f
         zVi4Fabp7evQdNtSSUyCFP0Z3RqOXkKuWXaLfG957PjGfIQb2mbUplUrh4eMJlE2VG6s
         xxCn8gY4a3LYkq98gtObEsdfEoG7hnqSBQ6B6Vq99WDdIMfC04ECz5jDcuEGP1Q4fg7v
         XfhNPurXKRH0dUiw8/OqrEZRk3pB9qi5s/uZdvMJ7hPVlWZno84otbDxBXewo/CmcIDQ
         tpCFXwR+BhICh9/1VCZMPPYWLSELTctky9+y+hbn0K1gNovz9+O1KZWRVcn0eoi3Ino8
         exQQ==
X-Gm-Message-State: AOJu0YweortnuHHPFQapp1S1w3M6PcCenPoynH4wvfUIJyKzqaKrBufy
	jjHIPs5XZ7PcDb/Moj19GxFein4KMYX6swz3JCDZt1HLDrmF+UPhRlzm65Ha4J0YKpsWGWoaQnQ
	K
X-Google-Smtp-Source: AGHT+IENyT3iBwNfqzbIRhFP6XDdq1XBAiZnkYo9k4NwX8Wt8tRYkwjC88cwKlVem2ZZ+6YkoUtZzw==
X-Received: by 2002:a17:902:ea02:b0:1f4:5da0:815e with SMTP id d9443c01a7336-1f6370ba6bfmr53550845ad.54.1717244708319;
        Sat, 01 Jun 2024 05:25:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/21] llvm: Upgrade to 18.1.4
Date: Sat,  1 Jun 2024 05:24:36 -0700
Message-Id: <56ef42d454fb13a0eff0a7210a37ec4b54a2afc3.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200106

From: Khem Raj <raj.khem@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

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

(From OE-Core rev: adc2651a8e902af24fee6ff30a72f4b7c63bef6f)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index c4fd73f2d7..e7fa88b30e 100644
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
2.34.1


