Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF16CC6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 21:54:52 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.51540.1681941290387510177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 14:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ckoyl9/d;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202304192154475c361fa311ecb7b535-47bw36@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202304192154475c361fa311ecb7b535
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Apr 2023 23:54:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Uz2tDwG3PpXGBqz5TT+3oYR5zKFgpwh6NypTCpGjCIQ=;
 b=Ckoyl9/dl2Jyq24jHMfk2x+I3bbYwl6GXqab+BP8a1AOez8eirsvnR718PYldaErWkIFOY
 vOHgCgXwKqUBiypwCZL7SPiOAtLscBnaExHyUDxYZ2wyCxt++DESnxxmpjRH3cX6c+rfmuiO
 GscuhhdS71J6zsyymN6GdOc7YLhrw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] go: ignore CVE-2022-41716
Date: Wed, 19 Apr 2023 23:54:08 +0200
Message-Id: <20230419215408.8314-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 21:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180228

This CVE is specific to Microsoft Windows, ignore it.

Patch fixing it (https://go-review.googlesource.com/c/go/+/446916)
also adds a redundant check to generic os/exec which
could be backported but it should not be necessary as
backport always takes a small risk to break old code.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index f2a5fc3f7c..5ecb10040d 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -80,3 +80,6 @@ CVE_CHECK_WHITELIST += "CVE-2021-41772"
 
 # Fixes code that was added in go1.16, does not exist in 1.14
 CVE_CHECK_WHITELIST += "CVE-2022-30630"
+
+# This is specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2022-41716"
-- 
2.30.2


