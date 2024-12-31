Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67455E77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 21:26:11 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.3486.1735680370715465552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Dec 2024 13:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Smg4qR+T;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412312126094edd736c373991eaf7-up2pxl@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412312126094edd736c373991eaf7
        for <openembedded-core@lists.openembedded.org>;
        Tue, 31 Dec 2024 22:26:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=gqctmyFf/BM4QAQ4af9uHCsoDHtE/mSgMyjR2Zqyn9w=;
 b=Smg4qR+T08i9Z1HVomaLs7WyWoJM1Ib6Hu4CMaXC7YJI7xDflQ2clWyqN179QSV6VjPb1W
 3lvs91HtIZWxExfgjJ1PJtHwJG+4BFQiLlKJ6MTAmgOihgWIMb+71r+Zeg+EK/gAy7hTdo2Y
 nQGoxt4qAqq0A5RtA1vhqz8AM8e3GpupCaqbSKu7AMC8/vN82o9qnAASti+Kdguda3mPOt9v
 Lj5OVlpmNvR9JnIXoGHW6WXMQmPxMUiK8xE9/LUigD1jEfXScMvV9+nSEi1gIGSJjiRlhamF
 xmZynnTisR3pBQx9bcvQcvs00p8PmdWJauTaW7LJRzLTgRk7w1Q5qKFQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/5] ghostscript: ignore CVE-2024-46954
Date: Tue, 31 Dec 2024 22:25:07 +0100
Message-Id: <20241231212511.3649711-2-peter.marko@siemens.com>
In-Reply-To: <20241231212511.3649711-1-peter.marko@siemens.com>
References: <20241231212511.3649711-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 21:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209186

From: Peter Marko <peter.marko@siemens.com>

Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.

[1] points to [2] as patch, while file base/gp_utf8.c is not part of
ghostscript source tarball.

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-46954
[2] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=55f587dd039282316f512e1bea64218fd991f934

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index cd0a7de70e..6d425710b5 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 CVE_CHECK_IGNORE += "CVE-2013-6629"
 
 # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
-CVE_CHECK_IGNORE += "CVE-2023-38560"
+CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
 
 def gs_verdir(v):
     return "".join(v.split("."))
-- 
2.30.2


