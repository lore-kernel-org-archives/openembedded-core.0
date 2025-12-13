Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B051FD5B149
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3023.1765620163566210864
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gw0qxw43;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso8310905ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620163; x=1766224963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4xDaOE8O5HJWkCTIKS5lPZfcvWwrFJ9NHRLasL1/6A=;
        b=Gw0qxw43yaP8Dscr+bwj9853JaWsHyS93CNbhzzIueJ13Ex9vlWcDJ4ONXjooHGuZi
         Gcaba0nyK4ZRPrVkjDrffyy1/t5WBL5IAbHxRZUuKkWoR0Pw2vMRp9PAvd8Gnq3zeRfy
         ZnkgH3+/6Jm724o16qcPhakAE6DMkdu7nK5nwkHSUzYXqjKYPYDQGNGeaGhY8+h5AHTM
         oB5Ldx3DYV+tP7hre+BuvX9fq4mB35QHx86w8xjMTZcOuYXzskvKxV4Lrsqgmvu7Oyji
         Hp9Iq97Y6C9doJLojApuJYeSsyafj7q//IqXKI97riEe1L42fBL0GcGu2zhngQBq1dA0
         i29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620163; x=1766224963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4xDaOE8O5HJWkCTIKS5lPZfcvWwrFJ9NHRLasL1/6A=;
        b=Q0dYq5yUsKjwiLU+HPcCM11AnbQUfv4HCUo2yRr3KLaLG2OqnNw8OaDIatM623LUkT
         Q/rjMHv0HJv8VYOjGtX+oUKFG/Xp/DHqqouaunflqjXdAVnK1p3XqHm3JQ5sgtQGI1Zp
         9C3R2+ubjXYjOVGyDu/Hfzs4iJxL52E7LEAGGoD1N7zbyfpl5+E+0gY4SgDRIfCmqIZE
         Ic2BChknNV/CsrxTLEvDAJpIlUAxvnvUqYd1gw1YnoWdwV//NhD0aln4W3roDs63Puzl
         ybnjAVIJ4fohfuWwf4O7avkwMcULVWLRLwsFhIfrz0fVwuL9h5lmcUMbbIivjmwg+FLb
         23/Q==
X-Gm-Message-State: AOJu0YyKYAkRTWpwEDSAHGjgUoQtoZQdXGP5+b0dtfTsPQSgtyBePJy1
	WPikRwuW5XK05VboqWAFBlqg7XhVNeimye2iDcwvE4YOar1sh7LESiN7EPtVQUoA
X-Gm-Gg: AY/fxX56v2XyBfro/oZYeqncCTSu14/WpG42BXgi5u+O/9heTOm1Aq/lzmWv0VtpbZJ
	Y2ZNWgsXmxD3wYmOe1w3asuwGvmT9cDM4GcprBS+d8lHd9Qgb3Wg8Adhy5ABp9quKrqin/G4j8B
	5arOro8g9hFp1K1CDBkyGFBxUCMDZYxbGpP9NLfouDNA3YCHzn4w2bry/k0yWoJkfpoEzT++GSu
	7wc/QwtQ27dgArDb0KZ9DZu1srYvMN+LnpPEuYiALADqi0jZHQt5p98kMzTqLQTB3wVGBFEpNZm
	efBknnVLp5mIFAAR62YdYlb7Xh8ChD0CrnkandbodHqC5+dPl/7G/CIlvE7sGJxZy/Az8G8ol3T
	fEJoAngf7sU/YmvgNmDeH3iGF0a+uBv0vjzjstAV6MO1Y7Z1xXkgiOiOySaCa2AdBfp8scv/Lmw
	9NmuO3UwcTD1vKpwE5ytLNm7Oo
X-Google-Smtp-Source: AGHT+IGrNfP1OfxR+UEMhxxgDg27A95P3l3FSFgNUC/DrvNC4iyFSMdNE7yOcQLbOd+Z2M1/mgNqOw==
X-Received: by 2002:a17:903:2cd:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-29f2404b62emr41623775ad.29.1765620162764;
        Sat, 13 Dec 2025 02:02:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 65/67] llvm/clang: Upgrade to 21.1.7 release
Date: Sat, 13 Dec 2025 15:29:29 +0530
Message-ID: <20251213095931.2571498-65-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227683

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
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f17a622c44..b6dc20e9de 100644
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
index 4ea22fe5fa..e852f03c1e 100644
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

