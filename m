Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F94CC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:30:36 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.47776.1738863028995078585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 09:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AfsihdAW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202502061730248ecc111364c98eb4ba-wj85yl@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202502061730248ecc111364c98eb4ba
        for <openembedded-core@lists.openembedded.org>;
        Thu, 06 Feb 2025 18:30:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=P/d8ljxnSrOlR0RilmE/NWggfboU0WG4Bnd0lv4e72o=;
 b=AfsihdAWni4xKHu9/6BpoQUM/IuH2nv4FyGygPrEDW3+kmYbJT42WirkN5c0mVCczp/5Xf
 iITW5IrfM7FJlAdX+AHaDesEVxXQ8rjVhTGHlySYuf+aQ89cwxrugCa96TTi79c7wCdxx3NI
 6rB07fK/lGDvypW+Y996r1UXITZFquiT6EyHa2hFIKRXsSRX2YPvgj5yTcvluo6SaeFFzH51
 WAMtywS2dgZSfY9E/J58VsdSog4ZOB1HtmE6NnbW8Y1I9bT3kdEFJHIx1kqwEx/kEkIYnIMs
 4/tGj9RocKqdzH+bxVUG2/vxSC5VEbh2ahwPII7yYCpEyfBN0RvmldYQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] cmake: apply parallel build settings to ptest tasks
Date: Thu,  6 Feb 2025 18:29:36 +0100
Message-Id: <20250206172936.2306926-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 17:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210952

From: Peter Marko <peter.marko@siemens.com>

ptest compile and install tasks do not have parallel build settings for
cmake. On powerful build machines this can cause overload situations
and oomkills.
Observed when building qtgrpc with ptest generally enabled in distro.

Having this in ptest class is suboptimal, but creating ptest-cmake class
just for these two variables is probably overkill.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index e1c3d7ddb5..e79f8a7435 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -67,6 +67,8 @@ EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 export CMAKE_BUILD_PARALLEL_LEVEL
 CMAKE_BUILD_PARALLEL_LEVEL:task-compile = "${@oe.utils.parallel_make(d, False)}"
 CMAKE_BUILD_PARALLEL_LEVEL:task-install = "${@oe.utils.parallel_make(d, True)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-compile-ptest-base = "${@oe.utils.parallel_make(d, False)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-install-ptest-base = "${@oe.utils.parallel_make(d, True)}"
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"

