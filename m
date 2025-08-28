Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA382CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 11:14:04 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.18261.1756379641012983019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 04:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=JMbSv5bw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1328017-2025082811135712d373708c00020726-lvbfps@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025082811135712d373708c00020726
        for <openembedded-core@lists.openembedded.org>;
        Thu, 28 Aug 2025 13:13:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mSTLliNm8xA/nLfVO3q0T/bdrvYjy9UsLmfObv7P39M=;
 b=JMbSv5bwteLRt1wwrnc+/zWyaSmB/E5zNvN+UP8tYT2YUC2Ndrh1JTh2u7nS3CzMZQotaz
 SKduvOWJEIWYTHtGvU/WPUkADaZ9ZfcOfD1w/cq5UURECCfZGVedwSXqTmrZJns4FKgM/vxD
 ohXCQSkkDa2WYuIQdecQfqIZMx5ty3BMBp2gj9/CEOgyfIDZf0uKK0L1iPiUMvioqdXxyix2
 52MYUDDI1L6bZFiYYn9sqzpSUu/XSAagNemTm4uPG8UIDugm4r0YQ88a201Kna5p6Z2U3UMH
 WmwIfD4ZG0EwBGb/BBP9NqG2LnrJ8xZCy5l05VfXNOgPAf6Olp2j5VAA==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] sdk: Remove go from SDK_TOOLCHAIN_LANGS for powerpc
Date: Thu, 28 Aug 2025 13:13:19 +0200
Message-ID: <20250828111355.31690-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222561

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

PowerPC 32bit port of go compiler does not exist, remove it from list
Fixes SDK builds for qemupowerpc and other powerpc machines

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass            | 1 +
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 12137cea39..0c2fd26e6f 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -66,6 +66,7 @@ SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
 SDK_TOOLCHAIN_LANGS:remove:linux-gnux32 = "go"
 SDK_TOOLCHAIN_LANGS:remove:riscv32 = "go"
 SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 = "go"
+SDK_TOOLCHAIN_LANGS:remove:powerpc = "go"
 
 TOOLCHAIN_HOST_TASK ?= " \
     nativesdk-packagegroup-sdk-host \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 3a41259769..e6d704b5ba 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -15,6 +15,7 @@ TARGET_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
 # libstd-rs doesn't build for mips n32 with compiler constraint errors
 TARGET_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
 TARGET_TOOLCHAIN_LANGS:remove:riscv32 = "go"
+TARGET_TOOLCHAIN_LANGS:remove:powerpc = "go"
 
 RDEPENDS:packagegroup-core-sdk = "\
     packagegroup-core-buildessential \
-- 
2.47.2


