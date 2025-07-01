Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1F3C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 20:33:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.7355.1751402013748416145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 13:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PVEl0/Zz;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234fcadde3eso48393485ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751402013; x=1752006813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xf0djZ8fnws1tUh3WBBy2n58McpfWSVq5kH77dl5YxU=;
        b=PVEl0/ZzXdzJxnecKQugXcY1R/wGvc7fdN/hkOibU2wzTkHGzSQ+9csXYk5dt49Pfj
         mmpoZt+no6xsBVTxcALUA83Giqehdp4IswMLXleUABAOaHYIs2yWl9YgX8JhojBzqSTM
         W+h6r+gKfMRwgBJ3d8fvb6CjRyyojm1bsuxwo424+1eqB9xdgDVP9Q8BpaqHxH0dlsi6
         E+gQRTht7wOpar7OUuZcG+cdQt2d7bapd/kYtzu5/JBJIirTcGeuxAFP8djgWPvWx6Wn
         CcZxgddT8AXvaSHYcLnFCB/2hupmWRUc9RR3qDuh0Gsy5ECvyumITA0XttgBVztspVW8
         9EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751402013; x=1752006813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xf0djZ8fnws1tUh3WBBy2n58McpfWSVq5kH77dl5YxU=;
        b=Wyc6EVuurjW2pRQ7J2fWbYhLnzWoYDf/GKLKyqWsIdTiEPbJ08gFCvHlhDNseJGOeP
         Ro8IUW/w6+pKTNUXDa8NDtgPyy7+QenSwPWfNntf0a5y3bjRsu4gOAHSTvLiAymN38bA
         0fvR7NHMOvtRmT6bIFIoNxZbMIL55DXb8bu290KcgWw2e4QkDQrvF96QJ7Abt6C57a2A
         /xkPo/WtxJxqo62qEeOr45nOksXACllch/yhRY6MqNUeTymH1oXEn79TuPb6obtputUw
         kp7Wd9RpWsPxBcFoQUNGmfCpFobpbm657m2cf7l7A4fbd1EV5kRqSilm4Zodyupc/it7
         27vQ==
X-Gm-Message-State: AOJu0YxM/bHmJuP65i1UMqo9zL8IgGyf7hHZa481Q2z+Dc73yHAQCrlU
	exc0ziBz4/iWTwN0WeUjKSu4gffdHgWDCaDM4FhBjWPFTrKUou+7hxUpAj8PUemQ
X-Gm-Gg: ASbGncsIBfd9cL2Gjhl+pIR3ahHW9FOHrMCijtVbim8zREgikwhsKeCD/KfOZl8WcR+
	Zm1q8zyeSGknhVpt8iYWoac9Yj1IaFqt9vZPrFlMHS8VMIM5jPkU6NrHgcEq7wzaLusmsJjzr6J
	ko/5HFCdv4GnwEgLMDtXoicaGcDil0/ge+1OqzSebRElbxp0kRUu/olkW/98iK2yppx7DiC1Rux
	5Dtqp8gHJCMvR5oPXFosKjft3FUHrxvG/U+9V/MMpjh7mAS+rABwRwemciOiAcccv3EJCmXiwHA
	d1AyHdyQb11GOPY7gU1a1sPI1rIPguWpbq6Mhyp1aJZZZE+TU5vL9Q==
X-Google-Smtp-Source: AGHT+IFNnM+vYmLivqF52Tvpg5gC1pVCIE3kRmacbi54D+DAGzmdsSTTgqwd2CgAusIqcsb2np+RjA==
X-Received: by 2002:a17:902:e54b:b0:235:a9b:21e7 with SMTP id d9443c01a7336-23c6e5de61amr1116825ad.48.1751402012642;
        Tue, 01 Jul 2025 13:33:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b934sm111557255ad.92.2025.07.01.13.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 13:33:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang: Upgrade to 20.1.7
Date: Tue,  1 Jul 2025 13:33:29 -0700
Message-ID: <20250701203329.2906008-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219719

Brings following fixes

* 6146a88f6049 [LoongArch] Fix '-mno-lsx' option not disabling LASX feature (#143821)
* 9ba132be8eea [clan-reply] Backport PTU error recovery to 20.x
* 199e02a36433 Disable clangd/test/module_dependencies.test on Windows
* 02aec86e4d0d [clangd] [Modules] Fix to correctly handle module dependencies (#142828)
* c4f257cb74b5 [llvm-rc] Allow ALT on non-virtkey accelerators (#143374)
* 6fa0cdf3720b release/20.x: [clang] Don't evaluate the initializer of constexpr-unknown parameters. (#142498)
* 337beb73abfe [libc++] Add _LIBCPP_NO_UNIQUE_ADDRESS to flat_{,multi}map::value_compare (#137594)
* b8e10ca59b6a [libc++] Fix check for _LIBCPP_HAS_NO_WIDE_CHARACTERS in features.py (#131675)
* 2da24c36c7df [libcxx] Provide locale conversions to tests through lit substitution (#105651)
* 253e9321c8b6 [release/20.x] Update release notes for SystemZ changes (#140060)
* acf86c5c4dbe [CVP] Keep `ReachableCaseCount` in sync with range of condition (#142302)
* 2481e590eec7 [AArch64][SME] Fix accessing the emergency spill slot with hazard padding (#142190)
* 22a3e6b19409 release/20.x: [AArch64] Handle XAR with v1i64 operand types (#141754)
* e5dd4f129454 [clangd] Guard against trivial FunctionProtoTypeLoc when creating inlay hints (#143087)
* f6532710ace8 [clang-format] Correctly annotate token-pasted function decl names (#142337)
* e0586e278f96 [RelLookupTableConverter] Drop unnamed_addr to avoid generating GOTPCREL relocations (#142304)
* 7759bb57c243 (origin/users/mizvekov/GH139019) [clang] Serialization: support hashing null template arguments
* 7cf14539b644 Bump version to 20.1.7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4d51219c94a..60f04da6089 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -479,7 +479,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-20.1.6 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.7 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 15e6610b9b2..cbea6b4d75a 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "20"
 MINOR_VER = "1"
-PATCH_VER = "6"
+PATCH_VER = "7"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 0684e648ccc..37d37ec1975 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-proje
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}.src"
-SRC_URI[sha256sum] = "5c70549d524284c184fe9fbff862c3d2d7a61b787570611b5a30e5cc345f145e"
+SRC_URI[sha256sum] = "cd8fd55d97ad3e360b1d5aaf98388d1f70dfffb7df36beee478be3b839ff9008"
 
 SRC_URI = "\
     ${BASEURI} \

