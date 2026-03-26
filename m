Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A65010A88C8
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:16:54 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49985.1774538209339346340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RTfe/46p;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c1092cc08cso2855616eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538208; x=1775143008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuapuRbOhf/dWmcGQaP6q7kfiMuGIPpBLdL0jEtcOF0=;
        b=RTfe/46padSx8u6RBjAoysfNMtttU8smanl0WFf9rhQWpH0oL7qaPTN8hHohdeA5aB
         O4EAhTNQsPrz9kumn22nRRPGCj2XRpdij9ZxgeQXX+aQS4BCZhg8z4aptb+0ULIU4p/Z
         +f5+5hi0fziTdw6BsHLOsHpV44ztk1FEfnYeB7DG57iJZ7PkK3sloDJ0WHilbK9/inBA
         rz+iRHMgFNtyDAVhv/XK5oPxSmaNUwPXsUPis9UVyv/cQoSHdmLjon/cS5+Iz8v5wYNp
         EUr2QR4CSRsuOLRPDj/sOmNuPGvXq5ZnCBKuw9mLwBJkRh+eufn4nMYkW7yprtcsSsKZ
         05+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538208; x=1775143008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iuapuRbOhf/dWmcGQaP6q7kfiMuGIPpBLdL0jEtcOF0=;
        b=fXMqGU66A5Sad4/nfrUPnvF8UyUSrvhrawqpDL45oHOZIadtZ9oug3HpbyyZ/dWvMD
         pLTk/87FQsXEdF7nElwrT1F8S3Tj5Nw2+H0zDNe7XKsrToMSMmagpnO3ueA8cUKGMOSN
         ZBn/hhajTPoD4E0wZQYDmTa0FsHQLbQF8MkWU5U8HhGbgSTWa4TbwHPT1D4BJuxwBl5p
         N2kY3u0JH4kFHJk00rupv6bBmxt0wWUJPMoxH0yU2aDSQDZh60enV33btrCpVwSkWwYG
         mQe0+NjHPnX+LRB/wM5pQ9qGQ+42L9hq1uJ22lrqIU5/HvSF68WXuZjkGuEYYBb6MVR/
         bfcw==
X-Gm-Message-State: AOJu0Yytj6sv75Gp9cglk1EVBJJwbllm5VqIyuYuqNL6Ip3om1iTWpfU
	epZsTiCDQjTC5226sIr4Mrw5HECE1yyw8vB1VpAXhhz+xMS+WsBpdIOWEMfkDM3P1oI=
X-Gm-Gg: ATEYQzwHhNbdsLTuCODxh7bx7fDz30yEXTI2Q6tz7IiQy5yMihEd8O/aZV7ac0VbEDF
	0kbFD6qP6z8QKA0e7yJMogt9mVeSl+gf96uFj0Luk+FFfosrAcOkrSrp4HFPLvHDSygt4pggefu
	byBD8cAgKdzfDo6+eOQS99s+M45BoBKD2QtYZ0Gqpf8COu9YY97utT4bRMBW2ZkzKaYBcO9q5Et
	7Z4i9vjf4yOe6kaJx0XZHOvWxPkh33r0YBnMt2sNLvYKPEyi6zOsHhdpNFc2SbfoCuLdagvnSEX
	AgZDwsgIYx+QuOK0c02hqRPJelFUXIk6i3ZMT7goa+xdFonO99MJlLhPyfegAoZNAgdEyGcWt15
	wMrrhraRPEeitkUiwSWziFtRsUttORFIrD66g4yjzJkJqLKjjbaIo7GaqUuOK9xsyAAADgPE51U
	byWmTVikoicQADx+eSyzWED1n+3Im817pIArDH3oQqw8PPR1jL+n73et2BtOH0Sji5PvoLVDS/y
	MT1RBLl0TjtLKEERXRbRbHxedQDVF/H2XXC+jAJlfvTQIIlDLvkOFTw74Qb
X-Received: by 2002:a05:7300:ac90:b0:2be:7dc9:30ef with SMTP id 5a478bee46e88-2c15d43b52amr3774817eec.19.1774538208365;
        Thu, 26 Mar 2026 08:16:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ed9fac4sm2544221eec.17.2026.03.26.08.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:16:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/7] spirv-llvm-translation: Upgrade to 22.0
Date: Thu, 26 Mar 2026 08:16:37 -0700
Message-ID: <20260326151641.3974221-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234023

From: Khem Raj <raj.khem@gmail.com>

major version of spirv translator should match clang major version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...anslator_21.1.5.bb => spirv-llvm-translator_22.0.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.5.bb => spirv-llvm-translator_22.0.0.bb} (75%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
similarity index 75%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
index a727079a43..20f4ba8464 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
@@ -5,10 +5,10 @@ LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"

 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "a76fd0702de564476fb31e8a15f1415f05ad8951"
+SPIRV_BRANCH = "main"
+SRCREV = "f821423888319dd2f0c436fc9ab86c798ac48ba1"
 SRC_URI = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH} \
 "

 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -18,7 +18,7 @@ DEPENDS = "llvm spirv-tools spirv-headers"
 inherit cmake pkgconfig lib_package

 EXTRA_OECMAKE = "\
-    -DBASE_LLVM_VERSION='${@oe.utils.trim_version('${PV}', 3)}' \
+    -DBASE_LLVM_VERSION=22.1.0 \
     -DCMAKE_SKIP_BUILD_RPATH=ON \
     -DBUILD_SHARED_LIBS=ON \
     -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. \

