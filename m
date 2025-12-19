Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D43BD7494A
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9481.1766114590157287074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nD2hBj/I;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1149086b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114589; x=1766719389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgEnxiSd2Hnrxk3L5e6W6uydyCTXQIK8OGfgAifJjog=;
        b=nD2hBj/IWNktQ9WtVZ8WoO8YGe+JY+GcDkyGxf6SQkqVyuVRQxojMG2msBn6GHX0GA
         JtObuyyTUYwjLqb43Rb+2CshVy0zjuQTE1XamBg9bzoGdMN9z+Z/oY9ITFZ6Kzy91sw9
         MUxSWMZTOtazBamZHHquWCYnP8GBEGJ34V1+vhRbP8FBNkgrvRSVo7ON4eTKi2BPTP03
         jr9vnFuhL5NcOGmCvChgvk8RQTXRWa3TFyK3KgQef7lwcRo/PArR/Qupp1yj8587xIFu
         Stp8gveZEDDne6axdUew32B+eg65U+YelCXdD3kbJF0gt2UphR9YwF5aIO7gjtY3qZJV
         o+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114589; x=1766719389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vgEnxiSd2Hnrxk3L5e6W6uydyCTXQIK8OGfgAifJjog=;
        b=PlFmEqzOoPEyTy6rUOEc3wy0xaxJanCUaZTzaH/BUAQf//Ddic/++h2wKYV5Btuu7d
         3S3k+CAblpKA+puQ6OYU/zuh2sS2M6nZbAreAR9t1g/Hfrbtd62tluULbHw6mbFq0BhX
         Sq+f3z2cdiQ2pFBNL/oDMGDgcC/UmqhsD12lvAS8SCgPjWJW//VucI/ySmGJSS5PWa2d
         9DkAmcRnNbA9QnSaZH2D6zlLooZtu4q25nnJf3FvEbq/FQ4mklgPDPbUL78qkr3GUE+q
         UM5gZWvexbkKb5dMQ5HCJbarrcW6FwVcnUJ4eVnUvs8/3ApYa/LT7aSC8CRyTO3IbjnY
         VyZQ==
X-Gm-Message-State: AOJu0Ywp5bF2UhJ9klgUC1+lPwlpBqBHmrpcpL5PgaF4OWD1qIEKDCli
	JOghQrTawQdZkn2qiTiYOJ0WBuOkNDNJcLMWFXyLr9/V4hWzOy9Z3egVK/xF4g==
X-Gm-Gg: AY/fxX666/T4o1thEAPqFit/d79ppBAAWr0MyLoqFNTSC3iNa4748exiIs02c3+otsX
	qR6JSiFUjCMh/WG+4VQbS/Azd3zflSSYzMyaGwQcWItNRXRakl4wHCmYC3fWFwgo7CVM0JoSlwW
	Aw7997Fj2hjCTIVW1j8YtMmpP+NkTQrX4+f+5XdNZ0f/IhCiKbVC3XJtj1rwi3zfz8zknMc+Myn
	BeSkyJb2ioBtBSNEHORwHsWFQseX0+BMIniC85TBHSxGefZSJilHd40/sP/RBAnjz44H27AywZ+
	8mkaHiUGpyI4PpiW+hAYPAbsNNyJidqCWI3n9RNmNuLX8hX4QHUmRNMMt5TSDFp/98jv/6qJVDo
	EwSjWw0zdvBkmnWrGUp6A/51U+un+N20Eqc+6F6U9/LTZT7R290X/IlswIQeRf5zkx1/roukS6U
	RJam5786/0Z59TiQq0+rPVoWyO
X-Google-Smtp-Source: AGHT+IGiwAt9jSkYkzxvLqmqXaMO4IxtqvfQ4UxQICe/c1zdwz31s3LnMW5owXzork6zx4ZgU8xuGg==
X-Received: by 2002:a05:6a00:a17:b0:7ff:ceb2:a03f with SMTP id d2e1a72fcca58-7ffceb2c37emr430806b3a.44.1766114589321;
        Thu, 18 Dec 2025 19:23:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 20/29] llvm/clang: Upgrade to 21.1.6 release
Date: Fri, 19 Dec 2025 08:51:59 +0530
Message-ID: <20251219032209.960840-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228188

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 21.1.5

a832a5222e48 (HEAD, tag: llvmorg-21.1.6) Reland "[LoongArch] Add `isSafeToMove` hook to prevent unsafe instruction motion" (#167465)
2d631cc168b2 [CMake][Release] Stop linking against stage1 runtimes (#164017)
6ca64545e1eb [MachineCopyPropagation] Remove logic to recognise and delete no-op moves produced after forwarded uses (#167336)
69586a904bb8 [RISCV] Correct the CFA offsets for stack probing. (#166616)
2fde0df91125 [clang][modules] Fix crash in enum visibility lookup for C++20 header units (#166272)
251d2d374e01 [Github] Backport ABI Workflow Changes to Release Branch
4b2ac3f7a210 [debugserver] Fix debugserver build on < macOS 10.15 (#166599)
4aaab27c2343 Bump version to 21.1.6

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit f5a44a698bb33615241b23333e6e402ea3af97ea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index cf36c519ce..163d9808ad 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.5 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index f5e3875d2c..4051ce6085 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "5"
+PATCH_VER = "6"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 6aec58d44d..f19599ae58 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "1794be4bf974e99a3fe1da4b2b9b1456c02ae9479c942f365441d8d207bd650c"
+SRC_URI[sha256sum] = "ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376eaf8a845b935762b"
 
 SRC_URI = "\
     ${BASEURI} \

