Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D24CD1284
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 17:10:59 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.37221.1712423451105156281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Apr 2024 10:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0H1ZxrO;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e74bd85f26so2804732b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712423450; x=1713028250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mUZOA/B4jElOVFeR3b3WYdmpwsuvJKW/VSc9DGfj/9Y=;
        b=I0H1ZxrO4hUof1hKB+eQGbBtzzVwbo9auasoawyVnc4SoGH5zWpNjIkaQn29oMKXHT
         p8SAnIQfQD0M/DceSyh3aZgwkyhXfwIYROn193IUxlUnFSpkO/xfXT2zvXrNry+5pIco
         4nXj14w1wyFApzSfNhuywO1vsLl6pFzfEM55YJrketzKfXdIxV5yg44xQK0k1F/h6iWE
         kwYBVYxTRBzbMYMWUl5EEyFFPA/OMUTsNKdqbunu94JTmoGOfPqTkx2DORsghpCnPDpd
         p39aapSkPabDT/sr3ASyM+7B+LG/4yk/zoUQCGTtnV7MNKrdQfp54MPuSijCqqbsBKTS
         n1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712423450; x=1713028250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUZOA/B4jElOVFeR3b3WYdmpwsuvJKW/VSc9DGfj/9Y=;
        b=qtMV4YXTWMfh1TkoDNMCCR4mkr3jBaF+MjUb+JSOyEfdFlQ5vq8DVU7ho3KM1pLNVq
         5VOwaWVGQc9ieslPgs2XrSQQ4SZOu1H4R7IVrad26oXzXiSot7IgpH7G2Ev/US1F54Xq
         X8LkwdhVTz1MqBes5AN5rTySlXqI15huiJq9/5rizVEe5y8pNuxk5naev1T84zebqRsw
         9wH9Kb5p5gfEgmems7ouBdfvv6pwKVtQnag6GMnrnrTRooyZuudW792A4llE9An4RuQO
         EoJgB9/ujRpVamfQZh2IaWteGHjJcltM1rg+gmn/RJZTwBX8UWsBMibw5ZzBlyxUkk1x
         qNmA==
X-Gm-Message-State: AOJu0YxSwYsSD0DKL7IRpY/9YPwFSihW41HzTDGyoWJfKg/Vwleatc7r
	XH9Q+x7zzeUMOo+ChcEJ6jxRBaoMfVuAJZlO8Xfho04eH9McBOVORoI77QYm
X-Google-Smtp-Source: AGHT+IFMMVVB1tiCkhDaBPYK5RicHVEtUSvy6+m0z9D3CLPDN3wAWvjG9DVRbFagLMHEtXOplzT0tw==
X-Received: by 2002:a05:6a00:4b55:b0:6ea:ca90:3459 with SMTP id kr21-20020a056a004b5500b006eaca903459mr4409891pfb.32.1712423450201;
        Sat, 06 Apr 2024 10:10:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::84f])
        by smtp.gmail.com with ESMTPSA id b187-20020a62cfc4000000b006e6b7124b33sm3533425pfg.209.2024.04.06.10.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 10:10:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] llvm: Upgrade to 18.1.3 bugfix release
Date: Sat,  6 Apr 2024 10:10:46 -0700
Message-ID: <20240406171047.1527823-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 17:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197994

Brings following changes
* c13b7485b879 [clang] Avoid -Wshadow warning when init-capture named same as class field (#74512)
* f249092ef26d [tsan] Refine fstat{,64} interceptors (#86625)
* 76c721994a11 [clang][Sema] Fix a CTAD regression after 42239d2e9 (#86914)
* e0f0c463b539 [mlir][transform] replace original op to loop ops (#83537)
* 47aac495c895 [OpenMP][AIX] Affinity implementation for AIX (#84984)
* a385a917da93 [Support] Fix color handling in formatted_raw_ostream (#86700)
* 0cd4babe0342 Reapply [libcxx] [modules] Fix relative paths with absolute LIBCXX_INSTALL_MODULES_DIR (#86020)
* cfaeee6a8994  release/18.x: [SystemZ] Fix overflow flag for i128 USUBO (#86491)
* 767b61c159b3 [lld/ELF][X86] Respect outSecOff when checking if GOTPCREL can be relaxed (#86334)
* 7c7c3d4a3a27 [ODS][NFC] Cast range.size() to int32_t in accumulation (#85629)
* 0e501dbd932e [Mips] Restore wrong deletion of instruction 'and' in unsigned min/max processing. (#85902)
* fbb27d16fa12 [Mips] Fix missing sign extension in expansion of sub-word atomic max (#77072)
* e74c1678231a [PowerPC] provide CFI for ELF32 to unwind cr2, cr3, cr4 (#83098)
* 1c7c16e58240 [NFC][PowerPC] use script to regenerate the CHECK lines
* c2a57034eff0 [msan] Re-exec with no ASLR if memory layout is incompatible on Linux (#85142)
* b74f6158460c [msan] Add 'MappingDesc::ALLOCATOR' type and check it is available (#85153)
* 98a15dd2d728 [clang][CodeGen] Allow `memcpy` replace with trivial auto var init
* 2498e3a07f3d [LoongArch] Assume no-op addrspacecasts by default (#82332)
* 368dc8553c5a [SROA]: Only defer trying partial sized ptr or ptr vector types
* 0e16af8e4cf3 [ARM] Update IsRestored for LR based on all returns (#82745)
* 6f8016fda7d5 Pre-commit test showing bug #80287
* ef6d1ec07c69 Bump version to 18.1.3 (#86168)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index e1d5fc47a1f..c4fd73f2d7a 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -17,14 +17,14 @@ inherit cmake pkgconfig
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.2${VER_SUFFIX}"
+PV = "18.1.3${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "26a1d6601d727a96f4301d0d8647b5a42760ae0c"
+SRCREV = "c13b7485b87909fcf739f62cfa382b55407433c0"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.44.0


