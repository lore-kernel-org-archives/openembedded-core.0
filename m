Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D598E82CDA
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 21:06:35 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.141.1695848789605517836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 14:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ToudF+xf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202309272106266549f42251030942af-3rv0qu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202309272106266549f42251030942af
        for <openembedded-core@lists.openembedded.org>;
        Wed, 27 Sep 2023 23:06:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NOzEXmInLMQXZ/MwxJeD9Dr6ZA9WwvYwPD3h7bLnrtY=;
 b=ToudF+xfSDRXedG5J8tEGMb/yz3145JRxcKWxbDWGkw2XeYHZIX+3ofb24s+mTUW62rTjK
 4mwmPeKKXxZK+QwVHJMcQzp39xipl9pRprk2dUluBkt8lE+3+nuHMTDft7ZD7Q1kLKP8gCtW
 VVJE9yqUAyMdgT8/aHLFJh+yb0HyU=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] json-c: define CVE_VERSION
Date: Wed, 27 Sep 2023 23:05:40 +0200
Message-Id: <20230927210540.15233-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 21:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188343

From: Peter Marko <peter.marko@siemens.com>

Recently NVD updated all CVEs for json-c and old fixed
CVE-2020-12762 is reported by cve_check now.
NVD match clause now includes full tag name including
date which is "greater" than tag without additional numbers.

Fix it by defining CVE_VERSION identical to full tag.
Put it close to hash so recipe update patch includes this line.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/json-c/json-c_0.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index 4da30bc50c..b3679e0135 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -12,6 +12,9 @@ SRC_URI = " \
 
 SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
 
+# NVD uses full tag name including date
+CVE_VERSION = "0.15-20200726"
+
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
-- 
2.30.2


