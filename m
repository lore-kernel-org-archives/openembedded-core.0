Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8334BEE49BB
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:55 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71745.1767125566226117680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CsL3Z0W4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0ac29fca1so86917185ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125565; x=1767730365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+BRoEEMZ/KQZo5NFOwjKpMqN76njgSIDeBqw4ovO1Q=;
        b=CsL3Z0W4QfNrghW+jxg+yXZYbqxyQ+zbXrq7QDm4Ii2/pheJiqQqJW3EZIv6FeAIMR
         1zKMGsnJkvdVXTrSQLlhf47kvrlh9qLsw08ptv8m2xLw/1YWeQ26vgZZ09TulNVPPnaY
         sxX7a1tbMJvAI8WaqIMUE8riRCdgB2MXzjbPxySJi4Fz35Ej9NynN1Cirj0UZRKiAQAH
         kzk60j8Tc5PjQF7BYqKujPTAzO/7JgOtRrFRfDDef2N+5kmH3PvyumDvEnhFghHg671N
         Uuzkzhl/639fMMGokVcHHtWeLqTdgYxP5VBQQhOh0s9u+kJC1DEAsojBKwzeEf/KpcyD
         NR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125565; x=1767730365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+BRoEEMZ/KQZo5NFOwjKpMqN76njgSIDeBqw4ovO1Q=;
        b=B8OWHrZd2XP/3TDMbOlkH0mgkwszAsWN9Gub69XZO+AB81WxZzWzgtrbiufehP6z7u
         m14g1hy+LltL+NyLwPOVcTOWkrX9dOL5DyEJfc0CxNb8OpeoWrBVz3LEm1wgvyvtZydx
         lYRrrJpE5lXXTcp9mIQcwd+LDyzAj12OAzWO43uLVWO8qNYGEbkMZ0es0weaP7eUJJ1o
         rd/v4sdNNiiC/+x5tneB5bxar+ZKqWk+duqk9HStYR9w2XWQJv/MEJjG+0iM8lezOIVx
         Rn/lBIhd44crv20Oj95jW/F502x35uMgBfUqrWaNByzIm5sozW2+uWyuKWaU7p2vOGv2
         0r/g==
X-Gm-Message-State: AOJu0YypU9M9SLS2czAxjhVJJKmobvdSWkiwVpRdsbtdgj0tkjcpmXWo
	YwZf82ISbaqnqjU5eyAQywDbne0QvlXHpx6UJZOoJC+b6j4V+DnqauSK3+IzxaN4ex/wSYdDuYW
	bLeaF
X-Gm-Gg: AY/fxX7zESGI2RYpgiuj/4avkHxHtUm5QnBlhyhMepzqrR27BTEvEUQjTe/4c969yHa
	6U2KEkwECf2muWnJa9gqVStTkifItPMvJkxKucDRCJ2xwueAqwdcsCx/SVQV0flEuNcefUJTYNK
	mXFkI3OEAMqJOquexEymaChA2R7p4EbJJthphBdHWywrhu7azQIDGxLVQspYU62NBtmHakVfxT4
	kwba0TRJ5MowWxtWeHX2+rtE1dLmQWJ5qRgDaXnpEQQIUDcszwYHMHmQgGQPwgqywjuczi1M7xp
	H/CdvZL1YZJ1/A6zUrzlA5LRGFBg+ZiWWgSgMxV8+0friJrlC2rQIo9iZw+UF5c50eyeVskdroM
	z/Q+RkZTk/gCi6fGeVoArRQCFvDuYkKol5REEWLhfz6pBh9R8PSToa5TfelFG7K33CDBqRYr0Vz
	/FIRFycTzIxT9H
X-Google-Smtp-Source: AGHT+IEdxHh1OxXRYV9Q36GYCOpQAnxzHNMjbR+gkJsqrZDYQdPfbkCHYZ3Bqal9h7HVd5PU9KDqpg==
X-Received: by 2002:a17:903:41c6:b0:2a1:360c:3659 with SMTP id d9443c01a7336-2a2f2a3d1f4mr290851505ad.58.1767125565447;
        Tue, 30 Dec 2025 12:12:45 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 23/29] llvm/clang: Upgrade to 21.1.6 release
Date: Tue, 30 Dec 2025 12:11:53 -0800
Message-ID: <d7405a7a390769bf55c7ebe8fbbcb58d56723cd4.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228715

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


