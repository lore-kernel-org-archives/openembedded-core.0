Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4606A10A88C7
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:16:54 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50859.1774538210781144407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qyhFSuvl;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba895adfeaso1167857eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538210; x=1775143010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUuXS15PQxAFZC3U7Qg8CG9gYTQbsEtNqP22TD/89EQ=;
        b=qyhFSuvl9nIHVJJClAIsS5mVRXbQO0Co/SNN544olv9BA6x+XuHYDDbQdulhcGidW/
         164O8YYCAYza/JbQhxw/Pc3Nlj/Op7L52fxqp10mbwEmbtPi5890IwOIS3fS8v+vkScF
         DZ4Ey9XUK/9reMlxdNH4iTOFCtXe0STo3HQT6FIccNKVtzPEUrby7pYzu4oueVV3fo42
         m1Hmb1VWcRU8RCGCbj16GJA54i4JcBNa6TH7Q6wPG6FA1TD/1o28PA8GFr+TZF+qW1zN
         /1bpzh0Ur3MYShWc83oA06NywOEptm2AZDRiK8BHEDYvQOm0ZyY90VRMySfL63NstRcs
         5FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538210; x=1775143010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vUuXS15PQxAFZC3U7Qg8CG9gYTQbsEtNqP22TD/89EQ=;
        b=UR3VA7J4LsLPIomv0JumU3zj9ctwFmMmiGS4W9vCE0xg/rwKrz4Ch8kzWixrClb7eD
         eYBhT4kSieNx8IDuhpJGbNM7lsI7PJggRvfCk/vnbsLW70yEV5//Jj/du4/EnJM7LC+I
         VReCVsEoYmACfBhhzVuHfhbcdrQpCJCJEail2PJhKe21HNXQ9zKmlQVBydO3SRVVR/7D
         JU1k3PfdvYT6KiyEWGvHAs3Tq9tPgTeLnJpuFFLwElOFFpP+MV4mpksDIC9GHWrJSc4e
         NDuvHQY39AUp+79ZVpK7iXFnopLEc63zegWIh5aiiXZwvfpF9PSeecQc2//vnu2Bki/a
         H6XA==
X-Gm-Message-State: AOJu0YwnkKMeMcAkU/FuywLitQUNMrb3N8AsETYZsbj4YeWJvdTK6M4q
	+lotyCiL4SzCg5oU40UxKHeseJhQiv7+EjVibvUqHTWM+pl13vWh3dq3OJi+3vKSH+Q=
X-Gm-Gg: ATEYQzwbfUbP7NuTasKfUdnNvCM47L7EcYyTzjvleinGaZjyMb2MuZlBu5F/1zlRxvV
	Oaix+cduAKno/17EAmF3atBc0thh68WELDmUs3neUDxrW1ZwYqo2bJrWICvOglw18HoMQafzWTF
	1EPIQFXETMOEQaeGO/Y5q/6f/sKdY49pYVfaXu79SiztDtkLxEYKnGzLaCHWAPY+NZ9NmmW6bC2
	EPOqN3TWB96hikqqAUvCwiN6XPdxAq9mv8msOf62x6rEj6PGk7PZM0qQahnmxEJheI7RpLOgDcH
	OasBapI5Sts3l+ZD5xAZzOnu/yDgxptZX6q+DkaQfecOCvrHvIRRfw1qkjYIFUgG0+yWZK1VdWe
	XZtLJTqeutNXKhPgNw5FhzGCoHMahOmzKNaYVDCqFXqP3riFs/RlbTU7JUQXoGTsuypp5sktQKJ
	YdoTDKsJDlT/iGhjmQMYtqTIDI6IuLvTvFFA42w3RYLkYhFXJerA7sz864CcS/2UDekwupMH70a
	PJGIHbaIMTuUUTZ1H+lf9yeoaTMEi6jiMypl9jWtiv7pbTOvjWazFruHAFw
X-Received: by 2002:a05:7300:dc18:b0:2be:2043:614b with SMTP id 5a478bee46e88-2c15d433461mr4774278eec.18.1774538209611;
        Thu, 26 Mar 2026 08:16:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9fac4sm2544221eec.17.2026.03.26.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:16:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v3 4/7] llvm: Upgrade to 22.1.2 release
Date: Thu, 26 Mar 2026 08:16:38 -0700
Message-ID: <20260326151641.3974221-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234024

Brings following fixes

* 1ab49a973e21 [clang-format] Fix regression in annotating angles in static_assert (#187966)
* ed9551146fc6 [SLP]Improve reductions for copyables/split nodes
* 8f8b53a0ecb3 [LLD] [ELF] Make -z gcs=always implicitly warn on missing GCS, like force-bti (#186203)
* 8efb87ae5a53 [RISCV] Relax out of range Zibi conditional branches (#186965)
* 94411c9d5684 [SystemZ] Remove custom lowering of f16 IS_FPCLASS (#187532)
* 2e1aea64649d [LoongArch] Ensure .dwo sections do not contain relocations (#187429)
* bef8df8a6041 [clang][AST] Fix assertion in `getFullyQualifiedType` for AutoType (#186105)
* 9fdb8da1c50c [analyzer][docs] Mention that 'expand-macros' won't use clang-format in the future
* 80f11cb923ee release/22.x: Backport workarounds for certain addMatcher overloads ignoring traversal kind
* 8ac0a123a5e8 [PowerPC] Preserve load output chain in vcmpequb combine (#187010)
* 20795d7ebda8 [clang] Backport: use canonical arguments for checking function template constraints
* 160377d62836 [lld][ELF] Fix crash when relaxation pass encounters synthetic sections
* dc8750d91147 [libc++] Fix iostream size ABI break (#185839)
* 3611dc1bf0ac Fix comment in FPR128 test (NFC)
* 34bf276866f5 [AArch64] Ensure FPR128 callee-save stack offsets are aligned (#184314)
* c1c833734cf0 [clang][CUDA] Define _NV_RSQRT_SPECIFIER for glibc-2.42/cuda-13.2 compatibility (#185701)
* b73f72ec9a34 Update ptrtoaddr provenance reference in ReleaseNotes
* 6121df77a781 [clang-tidy] Correctly handle attributes in readability-inconsistent-ifelse-braces (#184095)
* 5315e0b2f0b5 [SystemZ] Limit depth of findCCUse() (#185922)
* 81cf937ba2ac [arm64ec] Fix missing sret return in Arm64EC entry thunks for large struct returns (#185452)
* 4dfb4b6017c4 [FastISel] Lower call instruction with illegal type returned (#180322)
* 92a6627fa8ef [SimplifyCFG] process prof data when remove case in umin (#182261)
* 318adced66e0 [AArch64][llvm] Update Armv9.7-A dependencies (#185034)
* 7a9fd4a550e5 [win][clang] Fix devirtualization of vector deleting destructor call (#183741)
* 7ad5ff138776 Bump version to 22.1.2

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ff67d8c886..3e3fd1f210 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -484,7 +484,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.1 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 83735e292e..013a7f059d 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"

 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "1"
+PATCH_VER = "2"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""

diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 00aeed3993..afb79129b3 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "9c6f37f6f5f68d38f435d25f770fc48c62d92b2412205767a16dac2c942f0c95"
+SRC_URI[sha256sum] = "62f2f13ff25b1bb28ea507888e858212d19aafb65e8e72b4a65ee0629ec4ae0c"

 SRC_URI = "\
     ${BASEURI} \

