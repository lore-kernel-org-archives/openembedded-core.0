Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9B7FD8FF2
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:39:42 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75801.1772127574760200732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X9mubWG3;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7d4bd4db87aso491174a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772127574; x=1772732374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=X9mubWG3rCEeVbvdXi0G+z5QBPokRVYlaY6FGbcrh6+dAVz/WazVVANeuwSDbkET/z
         QU11a9pMUzyOks2uENguIrStv8O5J5bgTZdomTvKWF7phLZWSP6EHrC2v2p/ZkJ64WO+
         iFLB2rYnlyi2Fz2hr7YOuG5MMhNeT27kWDFrqrKydOT/CZ71HG6On+uMnjg6Cw4s5pgt
         hAYCAAFIdfN50o1KA8fEEhighpqRp0LGE9hBMyu/YmxCPlMlcY6AGTiS1bEQKh+5Dd/e
         Q/VmLWDRtuyqOPEhgXJ1h0++sjj4asGEpR9ocWxxqJ8yeB2gjbpe/5cAuWGTtBJ/2dbl
         dmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772127574; x=1772732374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=IlodVPB3bHebTYB12L3xjmktUj66uRf/go44rdevI9EIigSBJYzEP7okHAmiJi1rCB
         vwXNLd6tJcISDj5EAbIw1RvW8dVqg2fGCd4bd7i1zp1brVmzeGJLY3e6alQKIUje8Fy2
         uvhcMxpxf6KaN+Ui7OQElbeaFopRPgEfiOmNmM/90ykT42vOrjlW4wkzXm8M0lw/jWnL
         XSCGOrVz3RoumVKk6zC2YR7hWLr1vGG1j0x/UQLJB7u+QG7a2lIznJeKa5AhMInK7HTB
         keoKxU6uMNKZpo6aGCQRDY9WVeK20YKj9cLpd9VSwoD/OtgD739iv0/WJvLCWOykIocx
         hqcw==
X-Gm-Message-State: AOJu0YwXTztckaj0Wbf4Mmm8dtWQvEmvkYf/hIOV8+PDq71zG8s+TKsg
	sDSy4SUmNjfUQuqr6iyk9ZgUezkfWakZa4SIHwLZr0T01BYvaPrcCBsnmmyoKLWC
X-Gm-Gg: ATEYQzz56okiNL0pamcXlkBRPiell7jfMS2UWLqpFFSlbY4PJlyRh+Gt+H4XLANt0g+
	qE6ppFEt4LkE4uo8RJNTb9kO/3dGHLi+WabFilGWCf3n6JHI5LRHqhuim9wftXYnbOUTnK1+63M
	X1yPEgG1H5Nm+m/RVJtvcVrI02sYbUNPAaQ6ioBtCR1OgLs4Emd+Gyk1CIXYAeUnYJwllSyp911
	9BsMQ2evJgC7EPZlAKVlV9w7sYaELPb6t6G0sVxrw0aU56myFbSQ7Ro3WXgrN+vq+oVfYx1z35H
	Y9V8HPqIudKVAXItljQ5vjKvt/Vb2bTH43fLNWbbC4atu41QdwJDRkdlK3qz3Yip/aqUBqSzrsZ
	C6xfBQoxGq3/LLshNNNay8Zt37MAcdbyS6ibd31VrAQBpCtaDOV/acZsgXNZdCdHA8jgez3iMPq
	OYmLrCaywgObKq/Z1mzZf3
X-Received: by 2002:a05:6830:25d5:b0:7c7:6043:dd93 with SMTP id 46e09a7af769-7d591b2656amr4795a34.13.1772127573813;
        Thu, 26 Feb 2026 09:39:33 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::6492])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d586653f81sm2173027a34.23.2026.02.26.09.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 09:39:33 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 1/8] llvm-project-source: Use allarch.bbclass
Date: Thu, 26 Feb 2026 10:33:02 -0700
Message-ID: <20260226173930.2847872-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226173930.2847872-1-JPEWhacker@gmail.com>
References: <20260224230234.679049-1-JPEWhacker@gmail.com>
 <20260226173930.2847872-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232047

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


