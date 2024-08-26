Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E74C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 16:55:13 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.57879.1724691305964790143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 09:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=O8GPxWSB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202408261655020be68e36a8fd4fcb31-89yeep@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202408261655020be68e36a8fd4fcb31
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 Aug 2024 18:55:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=f8QVPnyKoEe9onLWCNR6qu1mmZI9au8VMY72f6cCuls=;
 b=O8GPxWSBTwYJdyFbBzlPLd6VOqdZohfGWrAmF9LNcoq8nx9IYGeREVcfFg/169bxlJbNUX
 1M/snHUEbMFY9s094jMzRhF016JwLYZJrAn9bxtQ6kcYXhg4CAuTf7Y4tbAsLvmLSUvcSXjm
 gWfoouVJuT25gQv6xv09GndG+RV0pbl9Ndq+SoICZjX/7/VgMPcnN6URl7DXeK+5yDh37k5o
 k79kHx/kmYHZBa7Q4sYJMwwUsOPF/7fzNwqqnf2p8ZgD0xLJZovVbSUyF1KigmzIRC3QmM+0
 qnGvXaV2LyCyPRZRZCIgxPjkuKvLXvxoCkjBsAyF5Lt8dVwjKcaf5IEQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] curl: Ignore CVE-2024-32928
Date: Mon, 26 Aug 2024 18:54:02 +0200
Message-Id: <20240826165402.10183-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203759

From: Peter Marko <peter.marko@siemens.com>

This CVE affects google cloud services that utilize libcurl wrongly.

(From OE-Core rev: 27ac7879711e7119b4ec8b190b0a9da5b3ede269)
Changed CVE ignore syntax

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 72d8544e08..1afdd8a94c 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -66,6 +66,8 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 
 # This CVE reports that apple had to upgrade curl because of other already reported CVEs
 CVE_CHECK_IGNORE += "CVE-2023-42915"
+# ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack
+CVE_CHECK_IGNORE += "CVE-2024-32928"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
2.30.2


