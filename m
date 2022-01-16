Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88758C433F5
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 16:47:16 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.35352.1642351635119201924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 08:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20GGlDX1009805
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 16 Jan 2022 08:47:13 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20GGlCOj021417
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 16 Jan 2022 08:47:12 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 16 Jan 2022 08:47:12 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 16 Jan 2022 08:47:12 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 16 Jan 2022 08:47:11 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] tcmode-default.inc: clear PREFERRED_VERSION for llvm
Date: Mon, 17 Jan 2022 00:47:06 +0800
Message-ID: <20220116164706.4555-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 16:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160616

From: Kai Kang <kai.kang@windriver.com>

When include layer meta-clang which set LLVMVERSION in layer.conf, it
shows warnings:

| WARNING: preferred version 13.0.1 of llvm-native not available (for item llvm-native)
| WARNING: versions of llvm-native available: 12.0.1
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm)
| WARNING: versions of llvm available: 12.0.1
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm-dev)
| WARNING: versions of llvm available: 12.0.1
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm-bugpointpasses)
| WARNING: versions of llvm available: 12.0.1
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm-liboptremarks)
| WARNING: versions of llvm available: 12.0.1
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm-llvmhello)
| WARNING: versions of llvm available: 12.0.1

Because only one version llvm exists, remove the PREFERRED_VERSION
setting for llvm.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 49e99af8f2..2622b055a2 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -79,10 +79,6 @@ PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
 PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
 
-PREFERRED_VERSION_llvm = "${LLVMVERSION}"
-PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
-PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
-
 # Rust toolchain preferred versions:
 
 PREFERRED_VERSION_cargo ?= "${RUSTVERSION}"
-- 
2.17.1


