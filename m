Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E96C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 22:51:14 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.9826.1706827868729415870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 14:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YXH3dvFU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202402012251055aacf72786be9ba3bf-d4hrdb@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202402012251055aacf72786be9ba3bf
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Feb 2024 23:51:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vou7s4hB1yj2erKs4L1C0Bf9WxhqG4k5VwZYfvsTB24=;
 b=YXH3dvFUyzM1TQKecBcvJXG8JbfPfkUCrJjFMRcrQL1UqZJEt0ynlbrd/iN2R2oNyNe+ML
 POfQFaoJVBTZ8TUG4lLHi2JLnbPr2H45WCZAY2YyMqpyMXe46MhdBEYGsR+osEhAjhmdDXjR
 fppXhccNz3NUzkv0EOmNPSDRZd0XE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] curl: ignore CVE-2023-42915
Date: Thu,  1 Feb 2024 23:50:17 +0100
Message-Id: <20240201225017.14667-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 22:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194760

From: Peter Marko <peter.marko@siemens.com>

This CVE reports that apple had to upgrade curl because of other
already reported CVEs:
* CVE-2023-38039: not affected, introduced in 7.84.0
* CVE-2023-38545: patch already backported
* CVE-2023-38546: patch already backported
* CVE-2023-42915: reference to itself

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 9e9ff00bf7..965f05bc98 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -60,6 +60,9 @@ SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce5
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 
+# This CVE reports that apple had to upgrade curl because of other already reported CVEs
+CVE_CHECK_IGNORE += "CVE-2023-42915"
+
 inherit autotools pkgconfig binconfig multilib_header
 
 # Entropy source for random PACKAGECONFIG option
-- 
2.30.2


