Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9509AEE57C1
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:55 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71922.1767125567688409158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JGmcxuhO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0a95200e8so88889405ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125567; x=1767730367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsGvwWqEifyGnuMqPEyNultCsyCZ6YaraLkuywwyDJg=;
        b=JGmcxuhOat5OI2S+HqO9DxPdh/1hdcTI+6qw8FaeQlbv8S5TwIkIyE9a0eCG1DHait
         2+pUEnyDqvQxKuIX35NMlVIy8f/b7C42AoVXfdfUPVbKcSnSK6zki+yvKpkPYBDSfidb
         ze5OfNMd/DFNMAdyDfA80XtWzwwQBD9wqBcxcvnUnziq0tQOUXFms2VWoLVzLdDJCy+4
         wk1RylNDwpCfV6W8FUlbOrIWyoIpsr2ukHMISSmUmcsKw4FSfCP3n0a/u+PdE7eZ7cCY
         mpjntsXD1kOeczREOLG9N9WSn5xDHbDfJntg7tVic3+6/GQmBYZp+IlnU5bIATb7UpVr
         YUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125567; x=1767730367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HsGvwWqEifyGnuMqPEyNultCsyCZ6YaraLkuywwyDJg=;
        b=qp0YakN56zBTB+4+jqrhvFds2gMNG9PVv8FIyLI6L/PskcNbmIGeqhSkj5n4WmGF+6
         RKPyZ6FBKqP4ObAscZdlgf89fd7UIFdb5lrKUxVlPoAGr/SGpLXVoJ7TZ+XGigbeRuIN
         Js/yA5RErFLmk6zyt8CQ6YVvipdJRPyl7L3kltzv5y0OoG0ST2AuAzzzJukridA0LLFN
         Xf1LcfWFm4G8uzR6MP6cv47cz2h/TZKufOxBzA0gAOYrXHxCefQeKhPvFL6K4mO4pRqu
         5Jo59dZ/43EKzOs91qDZ35lfAtg+qS+ET5OvVXkldSorb9vukoPhT8efqLWQi8bR5gK1
         wylA==
X-Gm-Message-State: AOJu0YwrFwmosDr6msZyoQ0pzuw2pD9DoPcAFvfMkjzNajXqvKvg08Hy
	u9Tlt3cpz9FS7IWwsggsYqN3s0asRBO36cDW0qsAnMB8N10Ot2urMD/PXOrIGUU24JL6o9FqIad
	d+/5C
X-Gm-Gg: AY/fxX6OigIk4YKLe5ALyBtqkcSNXKdZL0S/LlMLZllatAStFQpyhUCjFtgai6IVQa8
	4GLQK+b/fSGmFLhmgQwray9dvi2a1fAnubj3EFVy+bdMDR83p+YadIXOGEjJZT7qYXUKS4NHs78
	qk2ZJHSVjMxPIdBtcCdeIhiSK54k2c4762oPdWIIo1CjmxqcLhzdiX3mBGXsGqcI3GSXkwkfJhQ
	9cs8LlTy2hWJAnAADJ+ZSFmyU3hN7uzf77zOFfKVkJgGhVIo2SN9q/cY+lYllHyNQEGs4E+yuiX
	F3DxHEw5tjHWDAJEFvPRhLwwlaSCD4qWPPXwTZspYKftWdL5NXWYWqVv15rFtvhARWl7amEVMFs
	JmWhlaYyOx+s2q8kycGVkgvRPebB1ungOLMVGQYbKcioYTczn3hiJYZystvWrIzwda9nE2nbZNL
	bdfg==
X-Google-Smtp-Source: AGHT+IHHVH6Y7+r7b1de311VF7IJUY0tAcgNzsBKZp1XTE3niC1XRZXoZNOKIaq1hA2eS1RT/QdtfA==
X-Received: by 2002:a17:903:bd0:b0:2a1:3e15:380e with SMTP id d9443c01a7336-2a2f273261fmr213805125ad.34.1767125566934;
        Tue, 30 Dec 2025 12:12:46 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 24/29] llvm/clang: Upgrade to 21.1.7 release
Date: Tue, 30 Dec 2025 12:11:54 -0800
Message-ID: <385667774b3a174da2beb36c170f8a183d04ed40.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228716

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 21.1.6

292dc2b86f66 (HEAD, tag: llvmorg-21.1.7) [LLD][COFF] Align EC code ranges to page boundaries (#168222)
9ed1927442a4 [server-llvm-21][MC] Fixing vector overflow
922c9914e14b [clangd] Clangd running with `--experimental-modules-support` crashes when the compilation database is unavailable (#153802)
33e1a55a8bc7 Bump version to 21.1.7

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2351cc82dca18e159c9630266a81571a95394bfe)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 163d9808ad..efe8fb5f09 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.7 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 4051ce6085..ae0caa6f01 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "6"
+PATCH_VER = "7"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index f19599ae58..c960bf2d1d 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376eaf8a845b935762b"
+SRC_URI[sha256sum] = "e5b65fd79c95c343bb584127114cb2d252306c1ada1e057899b6aacdd445899e"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.43.0


