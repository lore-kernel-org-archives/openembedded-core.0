Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F58E10F9314
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 00:49:30 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2610.1775004566371990621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 17:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BUns62/d;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12776bebe9fso2398421c88.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 17:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775004565; x=1775609365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5UTQVpk+Si/dgF20qaqRWi5o3u3PZRqnqLVauI+SZsA=;
        b=BUns62/d5Ta0LqkqrzEznwKBjFlw4ee5rpiSSpBjIqCo5zpASvhAQruGQvVlMTxktr
         52U5oJ2QVyDe5FR82saAG38FUfYnIIR8eJ7HFxY1QbeoYEkaZbI9KTAFmoYX1ACjR6Y/
         aIR/oX+cg1k+tjyS0KEaWDeOIrt4n6GJPIkMb1ln6T5NLUHzeT1z5jyHqCpfmiz/R1wD
         n/JWaU9wZSSxehMaLlKvMzfQdamQX0EHL8WOgHNuVPRAiWVPSc5/p/WdoF7jclhFR4q0
         1CStSy2vj1Bl+PhO2Ahb9m7CwwiA0RIUarbpvu1lAWiGNT74Wc1YYzCtiBcKXKr5KWBI
         A7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775004565; x=1775609365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UTQVpk+Si/dgF20qaqRWi5o3u3PZRqnqLVauI+SZsA=;
        b=aom5bRTeqDiNJ0zCCbSTroO2Lv8o/Gzzl4YNHNLuqfi6GO38eBVp2QLqSTbzLoMHiK
         UJ9VdVpBO0QMifbFuAxGJ/EwEyeOuvj37zMZ9hfcms0D7irZErlxWNqy7o4t7bpaQ3It
         Rs2/iMsyAkwXeAaNjmroMrlS6emYEnspGlI/K8Zwy5Jgrka+MFasA4ruANnV1QXUVRUN
         PWQSMkyrJkjOzg9MKowB0K1FH1ykheTvcuWG1RmSG2T296Qn0492k6vEFYKoyJvRHNYo
         6dwkuQj3/P9BRTptZV/GhyHzaFGJzk9ZrKY9YjLJP6xLBZNdEEunANC7gAxq650DqSv8
         t0rQ==
X-Gm-Message-State: AOJu0Yw3znmDxcdOtVg3k4r4XrvHImpaReOy5tzE/7pmpwViF15F3SUc
	Eeq5xAnpPziZyQ/WqUZn6afhKQvW0g3VGPCSG3Cr9nzWAy1/V3idspxyA3zXExQV
X-Gm-Gg: ATEYQzwEqS7PiF6pUT42BHkkdMFCs8oU+QZwr4V11vR+hnTvR5moGYPZYTlCj5QLqne
	mdWDK11p48KwLMgXLvVAAAHOITGhPrHmTGFTR/TEMyZ0K7DDJdFsCaJLQUjMk8b8R1hkHAXEAep
	rP6f1QZ1UOMcocs1cSPwRF/u6auC6oVOFkQhcBT9BPdSIYuzVvcLWR8t6/hI0qEDb5WRkk46OfJ
	wCPPfhT0r5ssCiqChHGUyxnxFp+M4ugzWOL0YM/r+VfAZ1zfNu8/oK/mimK1SfgytiTNFjRHNhw
	LZ/k+WqUQlOO7nAFZgEnZ1RDLNKDIwlayYEh4HBazf+B3FL4qC1h6HrA8AnFR1tdkFLMaN/ufcK
	bq/rT/4r+jThfrmsgsf1VHidvB3mJD+FixQDnYdj7Fe/wtG2+01TDd124jXRmtL8zIyYRaz9EYa
	FPSeti/frHAaHmRWvjI5gMGUmu1HZMoezqLl3JFX3LvS9iUNxStxQ9IZBl5dufkA9EpT9xP+Jhb
	h3FJHKPu6BaNLZ8HGaz546J9+aGC6kujdVXEF+1Qpiq1um7AMyGOd+GMru7
X-Received: by 2002:a05:7022:2207:b0:128:d107:da0f with SMTP id a92af1059eb24-12be641b569mr1165886c88.10.1775004565182;
        Tue, 31 Mar 2026 17:49:25 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm12395500c88.12.2026.03.31.17.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:49:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] spirv-llvm-translator: Upgrade to 22.1.1
Date: Tue, 31 Mar 2026 17:49:21 -0700
Message-ID: <20260401004921.3269104-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 00:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234322

Switch to llvm 22 based release branch
Add tag parameter to SRC_URI
This is a bugfix release on 22.x

Changelog - https://github.com/KhronosGroup/SPIRV-LLVM-Translator/compare/v22.1.0...v22.1.1

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...translator_22.0.0.bb => spirv-llvm-translator_22.1.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.0.0.bb => spirv-llvm-translator_22.1.1.bb} (86%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
similarity index 86%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
index 20f4ba8464..b4ec006abc 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
@@ -5,10 +5,10 @@ LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "main"
-SRCREV = "f821423888319dd2f0c436fc9ab86c798ac48ba1"
+SPIRV_BRANCH = "llvm_release_220"
+SRCREV = "114f5ee1cec66fe2ca733c12770c1bc196675d32"
 SRC_URI = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH} \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

