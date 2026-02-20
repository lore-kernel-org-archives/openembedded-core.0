Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37048C5AC9F
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 15:41:49 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.318.1771602099702799581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 07:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZQ1XozG6;
 spf=pass (domain: gmail.com, ip: 209.85.161.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f66.google.com with SMTP id 006d021491bc7-6775a46c6dfso720014eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 07:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771602099; x=1772206899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=ZQ1XozG6cqoiA5CbVVvvEjUbnftI6QkSYDV0Un/zOtYkRu1Y8a6cn8Byx0jF0Mshwa
         d5ASsrQXGEdwJZ5/f+Gq7651JaE7MdaP1Jtx7Jwk6/hh/tAJ/BI9bGNnddwUz34ekwen
         Gw2jU56Xv5bAPnexVomEAWqxWiIbFMW5pdnj6mhZgrIjdWSexaEevEsCraJAXhdTptv1
         ekBnMIWyb4ERCASbhD07fIFHd6b1/kiZ/4AZIMu6d3cZcXAWHuWq/bd6ywKFnZp0lOlA
         iCp0f1PgKi+2wJM6QLOKMNcWtHYXD/pvTr7ic/i02NTXHPmAZAjjqg/6KyO3B3Bs2m9a
         ceiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771602099; x=1772206899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=eDqSbw1AOt4T5Udi3djpan4B2LNfELn9h3R4bUded0Z2jx8hW1wJ9jN2/+ZM4vw4vc
         O0ZczYVP0fQNNzpPEtClnV7//MQJ38aVuJa0wi46eFU+RUFDxZ9CUY+yMdIpxFktic1l
         7j0A+Fhu0ZxcCCt9tTkIXvvhOkXSAYDqYzwoj9TwRamH6gJ7A9PNnPUE5G+qvPxZRL3s
         vvBy4nwhdoMXoNBveBRnvmwjg6upyNVhUTX5R6yvD6qerTqIvaQb6O2AhfGXGQhWuCeN
         nYoU+Fxi8EnY2h51Ka/OGEGzfHUkDMXR7lTg3DY/KX20jheSNlFf9S4wuTSxHBUJ46iw
         kzcQ==
X-Gm-Message-State: AOJu0Yz7OhNo+CVTeSvS9m0XwSiSbfWv3MVP85V5P0/bNCNJNI6r3RZy
	zfTYosm6ECnUgyczcLvIy4YpaLH5v8sXOShEiJGMa6Q+RAKVvwTJgeCFJKe4ho+m
X-Gm-Gg: AZuq6aK0OohKjYCG/vlxI3XyoGYoVuvwngTpPnc/VN6FBpam7nB0GHEpwF3VkZ1r6H6
	2bDKxU4cwqmWdG4VZNk8b15MjkY7sANqApVnuOh+n65UwSdngy58keWJrw3zQrKLnNwAYdNad7I
	Zx9xENSa5x+YtrKavpu7PQlLGxJsYEvcdNxjcV4RkcEUin0w7DDSexNFUIEyxAjd2ouHACcpPgp
	fyPLOc1vo0ZADQ2Pbyk5l6JsP4XcACvR3Tt9mkGIcDmUZcuJ+StA6d2fFRV2lyFFxeZAax3W/Nu
	Iqhq9CwxKRysGGGRhQY5BxFdu/EHVEbiVc/owXZMUM6X/dJviSbgC57WYhxXfM2CYzV0nxHVV/J
	F8AgnhAjRG1D9Q/p0Rd6baRL9y6L1KM4+ybeLa8KASRZFXdocALVdX71kfCV/NuAZCbLwimLEAc
	lJc6v8rLIWpdlW74wykZTK
X-Received: by 2002:a05:6820:1ca8:b0:677:ad96:1b44 with SMTP id 006d021491bc7-679c424cd55mr189769eaf.10.1771602098703;
        Fri, 20 Feb 2026 07:41:38 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6772583294bsm15127188eaf.14.2026.02.20.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:41:38 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/9] llvm-project-source: Use allarch.bbclass
Date: Fri, 20 Feb 2026 08:40:36 -0700
Message-ID: <20260220154123.376880-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220154123.376880-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 15:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231520

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
index 13e54efbc2..6bb595b7bc 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -5,7 +5,7 @@ deltask do_populate_sysroot
 deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "llvm-project-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:llvm-project-source::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


