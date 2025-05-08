Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EE2C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 19:13:36 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.4364.1746731607428581418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 12:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bQl7Q2pa;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736c3e7b390so1398079b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731606; x=1747336406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5cZdyTSbcxifdgf4nL0geE5t+Jxy+yIk90sEjNKqjw=;
        b=bQl7Q2pa8houLSJX7YXKX/XvCVD67+wxSXR59FnsyyYVxpZ94CZLEUlAhfRKQRQ2g1
         jQ33eaPDDkR9MmiKax+tjSmRjlpWR8Eqrti4ztGWaqBOSA3dzGOuavSBAlggXCW+8GGV
         KXcjasOwYYExKxhXENsYnicsyDCArNcXwBZoPL+A506n+7YFvil415d3zJr5uezVOWUm
         uVzg2pQulQpBjCxNXQ5syIXqyB2gj9ZIVNen2fs8zYkWgNr0nhuiJZ3HrrkccJIXAFJH
         U8bmYizJZEgVi+aNDI0yWKAoUrzKg/rGGH0IGtBUKPspmCpVM4HHPoeLtPysiFYQNREi
         fDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731606; x=1747336406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5cZdyTSbcxifdgf4nL0geE5t+Jxy+yIk90sEjNKqjw=;
        b=UQj5kBYKyvEBq6Wtl2mtixvIrD8mOfCwvs7BsmBnlaqj2vglUqR07fRV86/0h1pxFE
         SjgRoZfrNbGK+xkFQ5Gm2bq9vTzSeVdxO7do05WCDKHPzcFs8if21kFVRDwrId9eHVTs
         MHmDUv9bjJldzA0U0k5ZQvbk55IVDvTJcQNALsDQHpU00jW+1MvLd9z+LO29v0reboKX
         jOOo/VfGqd9AJ8DApU30nOiqm9LHNVInBqeuXak4C6Ugt1xxVQ1Lc2hPrWP2mKTwXUuj
         pKJekCoDLGIThC+sOemGov8J1qq5/CwhrXVqoVFyiTVcUL2kOfaAIMppCiEdW93b0kgR
         0P2w==
X-Gm-Message-State: AOJu0Yy2dyl2kYcfuHaEbp0C6Gjts27gkg+pQOJ15bxIOlH+/gNPf8zV
	lLE0ptey/Z5UBLKwoTg8QEr6M4iB6s39/Hj9xz/yzwZnEtMOaMSbBztONSCp
X-Gm-Gg: ASbGncvA9Np64a3eSYNMU/Nj/TCrK8appDLlkkWYnyYCdB6vNoeOHB2g3L0eT5dARhb
	UxNUSol1mq3f5CSNj0wRGqj6lfO7ZDijtPtlgeUE7QCIP3cEh7xIdQ8lXG9S1rSrzZQlFOXQzj0
	InNnaZNTyC8fXDIe0ek1eYxex0KruP7BLpvCec8j3kcUI7s/ZJmBU05mI9/59tJt6b5sVhW0V0O
	uQxNMbTWreSFRIbnLBnXG7wvSLxVDaiT6Bnzustxi6YcruH3ZO23sRDYmLvcrjp+IBh/zzAXY9z
	GybIxbof6T65uhcMG/G5Cn1WBdYvhU5O
X-Google-Smtp-Source: AGHT+IEvYjNIRWt0M6BGCwBNaFBpBXsOLYxmja5J+9Ovbw2RxaT1W//yTHswqHtAIadL+hv7y5W3mw==
X-Received: by 2002:a05:6a00:4b01:b0:740:b5f9:90b4 with SMTP id d2e1a72fcca58-7423bfe3a32mr608717b3a.17.1746731606399;
        Thu, 08 May 2025 12:13:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f14csm376619b3a.107.2025.05.08.12.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:13:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] clang: Upgrade to 20.1.4
Date: Thu,  8 May 2025 12:13:19 -0700
Message-ID: <20250508191319.3743189-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508191319.3743189-1-raj.khem@gmail.com>
References: <20250508191319.3743189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 19:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216157

Brings following fixes

* ec28b8f9cc7f [libcxx] [test] Extend mingw workarounds for armv7/aarch64 too (#136419)
* 8c2dc1b5aa7f [clang-repl] Implement LoadDynamicLibrary for clang-repl wasm use cases (#133037)
* 02afcbf63fee [SystemZ] Fix compile time regression in adjustInliningThreshold(). (#137527)
* c877757659e8 [clang-repl] : Fix clang-repl crash with --cuda flag (#136404)
* f4779c389868 [InstCombine] Preserve signbit semantics of NaN with fold to fabs (#136648)
* 57a31e183dc8 [InstCombine] Do not fold logical is_finite test (#136851)
* 1cf8c7797d2b [GlobalOpt] Do not promote malloc if there are atomic loads/stores (#137158)
* 24805c2e0817 [lldb] Use correct path for lldb-server executable (#131519)
* 182e8b7f8a71 [clang-format] Correctly annotate kw_operator in using decls (#136545)
* 425d1aad294f [RISCV] Handle scalarized reductions in getArithmeticReductionCost
* 2d7ad98ec0a8 [clang][analyzer] Fix error path of builtin overflow (#136345)
* e7ae5532bc27 [clang-format] Fix mismatched break in BlockIndent (#124998)
* 8f288eb619db [lldb][test] Adjust TestTargetReadInstructionsFlavor skipIfs
* d76ec6a75d39 [lldb] Fix  SBTarget::ReadInstruction  with flavor (#134626)
* 62072e7f877e [clang][AST] Handle implicit first argument in CallExpr::getBeginLoc()
* 581772ed077e [LoongArch] Don't crash on instruction prefetch intrinsics (#135760)
* 89adc2d4f93b [HEXAGON] Fix corner cases for hwloops pass (#135439)
* 78f6719ca9b5 [GlobalMerge][PPC] Don't merge globals in llvm.metadata section (#131801)
* ab0074fe306f Bump version to 20.1.4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7d4a8e24174..69f6a2d2846 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -478,7 +478,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-20.1.3 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.4 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 41944265ba5..1099274d900 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "20"
 MINOR_VER = "1"
-PATCH_VER = "3"
+PATCH_VER = "4"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index a7b508039f7..f3b0ba7cbdf 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -15,7 +15,7 @@ LICENSE = "Apache-2.0-with-LLVM-exception"
 RELEASE ?= "${PV}"
 BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
 SOURCEDIR ?= "llvm-project-${PV}.src"
-SRC_URI[sha256sum] = "b6183c41281ee3f23da7fda790c6d4f5877aed103d1e759763b1008bdd0e2c50"
+SRC_URI[sha256sum] = "a95365b02536ed4aef29b325c205dd89c268cba41503ab2fc05f81418613ab63"
 
 SRC_URI = "\
     ${BASEURI} \

