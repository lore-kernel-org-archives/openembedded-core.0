Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39789D7494D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9482.1766114593041049828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4E7oLfd;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7baf61be569so1528300b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114592; x=1766719392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqtKljcQMCbzh0DKyFr2+bna80Tt/tbpsYA+Fzx9YkU=;
        b=B4E7oLfdM+16GrLX2FkWuqurTfY3mM5kn2A4JisPofmHQcyUqUTxkzlJWSv80Amq1b
         LYC16aAWljMNT7c5q6WmGPbfUAUNTLTG89sEaQNz21qIPe1Hq48TYQ6J55cEdHzWc0HN
         a3cxE7fNDnzxW3UJA3Nu3j124QKQRZlZztE3tsoCQBqAG639sJjrwVqTowVIPZO6+hc5
         Prgu0Fig3EQnMXpo5M6ipds2p+O8Gs20AH72MyFotd1XOrdpsQ3d5c6IqpczC6msgZsl
         3P/JTHtmkccQoK2hk56c15GwE67PFUZCwM5FbbSRZjGXF/7do3LED7oNeHh6IFC+Zw+L
         aNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114592; x=1766719392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nqtKljcQMCbzh0DKyFr2+bna80Tt/tbpsYA+Fzx9YkU=;
        b=Y7DCgMCxd2OGLWEDyJc4rIXeqLUPnx+caX7HWtJwRXPr4HjWbi5s+p3tirUtR2rlv1
         ILycgtdlugOsh/xYepRWgjyTt4yGZsAwoaWOd0qW8ro0iePC+3ifNXlWNZ28QhUs+osm
         Mw8bSPRw/V6Pxo56OKw9+WeES0FqCJmBU7k6SYjiYWkfwP7XX0FBmR4oV4ZAt/d+UzEf
         P/i7VDq83nW7zsSJq5uYrVhV7FKzj/Nnd5PQ9GqNWPIzUkjIxJQfvGrZ/8c5HeJ7J+kp
         Z3szMyofyrUtmxTmbcYWJepeF5H5yIQueJVOe5Ro0GPoEwO/bzNNgGxnuA2mM3Mntd/X
         GSQA==
X-Gm-Message-State: AOJu0YxxzXnfN23bUXwRAiEnyn2AruDPNFXfNiifDTiPtWwPH688v4qz
	7orwmOAOxgXt2FwsgljURBRJYvqMPcmunVs3NNKpA2utnPwdAdCVgTis94UEmQ==
X-Gm-Gg: AY/fxX4vfwduoZDGedJqmhtp5y0+HE/dsgEjmwX8NhX4yE4/yxCCgNpAkOqnYRUAwb7
	RCLBmzr/+nj+zfK7A50J0remJdCqfp+jxQ0LmrnLit4to22KxKnMLDTLH/pMvLyDwAurBdLa3bl
	6qZaohvuy5AYov5Yi2v9wBRsGKTYKgV83qCfFAtnovUPqmv7UXVtXwNCAYnVSl6Qi9CnQFdNOJV
	QO6nCovcrn6wnPUzZaL17kBSyZsPJUv1DUD+kn/o7L5oPz5L3mBMxTYR+uaBaqDGGvBtlK8PwRs
	7V8pMUXMxyf3+8uAMvpxKYT+2VdtueSzmXiIwtmY4j/VhtxQlpEbB9OnNWYC+jid5Snz1aipqUP
	CM29qqkHSPsD7hvcy/C9hswTfczToVRbL+b35iQC2UtB/JsQt5FVUSy7f0EHs9oUTe2uYVebzr8
	ttKLKAk+G7nxjA4oIOX1ITOaHV
X-Google-Smtp-Source: AGHT+IGvABGXPDud9RIMAwPVt/LPeg9sVfgTjIf0ly6xwAC1MNoOjOk+MRImUvdMHnOrIshdD/M6jQ==
X-Received: by 2002:a05:6a00:6704:b0:7ff:c265:32e7 with SMTP id d2e1a72fcca58-7ffc2653494mr369734b3a.30.1766114592304;
        Thu, 18 Dec 2025 19:23:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 21/29] llvm/clang: Upgrade to 21.1.7 release
Date: Fri, 19 Dec 2025 08:52:00 +0530
Message-ID: <20251219032209.960840-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228189

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

