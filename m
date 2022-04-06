Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CF6C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.9681.1649257214655427693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 08:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: skokkond@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 236F0Bkq013083
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 6 Apr 2022 08:00:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 236F0An7024372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Apr 2022 08:00:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Apr 2022 08:00:10 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 6 Apr 2022 08:00:10 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 22326)
	id 6988C900051; Wed,  6 Apr 2022 08:00:10 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: <openembedded-core@lists.openembedded.org>
CC: <pgowda.cve@gmail.com>, <rwmacleod@gmail.com>, <umesh.kalappa0@gmail.com>,
        Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: 
 =?UTF-8?q?=5B=E2=80=9Dmaster=5D=E2=80=9D=5D=20meta=3A=20rust=3A=20Bug=20fix=20for=20target=20definitions=20returning=20=27NoneType=27=20for=20arm?=
Date: Wed, 6 Apr 2022 07:59:59 -0700
Message-ID: <20220406145959.60251-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164084

The build shows below error while building for arm machines.
Exception: TypeError: int() argument must be a string, a bytes-like object or a number, not 'NoneType'
Detailed error info : https://lists.openembedded.org/g/openembedded-core/message/164004

All the target definitions within tspec dictionary are generted as
NoneType. The changes will fix this issue.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 310aecef22..230d78237f 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -119,13 +119,13 @@ def llvm_features(d):
 
 
 ## arm-unknown-linux-gnueabihf
-DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-LLVM_TARGET[arm-eabi] = "${RUST_TARGET_SYS}"
-TARGET_ENDIAN[arm-eabi] = "little"
-TARGET_POINTER_WIDTH[arm-eabi] = "32"
-TARGET_C_INT_WIDTH[arm-eabi] = "32"
-MAX_ATOMIC_WIDTH[arm-eabi] = "64"
-FEATURES[arm-eabi] = "+v6,+vfp2"
+DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
+TARGET_ENDIAN[arm] = "little"
+TARGET_POINTER_WIDTH[arm] = "32"
+TARGET_C_INT_WIDTH[arm] = "32"
+MAX_ATOMIC_WIDTH[arm] = "64"
+FEATURES[arm] = "+v6,+vfp2"
 
 ## armv7-unknown-linux-gnueabihf
 DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-- 
2.35.1


