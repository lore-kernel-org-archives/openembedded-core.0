Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515C4C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 17:38:10 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.308.1743183486936978876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 10:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=a8Q7kXdU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250328173803aace6e67d3f2d6cda9-qok_9u@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250328173803aace6e67d3f2d6cda9
        for <openembedded-core@lists.openembedded.org>;
        Fri, 28 Mar 2025 18:38:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/ukc1fgcM3FHzau6fphrLDWOEanrzWnbnCjJ/R5P2ug=;
 b=a8Q7kXdUF5FNykPEASpeBdyWb5MSpQG2fwcF7ZjsGNG7gETX1vOSfiGO17bRNLrxnVBOHJ
 Bq/5pkHKqJs3eqvefkbI1U+Lnb+dOcgrPpBA8akRdN/U5Fx81+Cvlx88WcPXwBu9iGGa1v0E
 OzU5w7NpmBU++0vM9g/7jIjdas2OUjAn8vwjANkkoEMoi3dvAxxCR0E41L3VyKUUcWgLI7NW
 aish6Bh2ymNYV67IB3zT1RPic6SnkoxhafP1g0NBXYRV3oApxFOIL7jNI5747Sd47SehIGj9
 BXB3fwO4Ucj9aAW43ILDqlCUyft4s2YqT9Lc/zTXek+Oz0ma5EiwT43g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: ignore CVE-2025-1632
Date: Fri, 28 Mar 2025 18:37:16 +0100
Message-Id: <20250328173716.17787-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 17:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213858

From: Peter Marko <peter.marko@siemens.com>

As already mentioned in [1] when backporting commit including fix for
this CVE, this vulnerability applies only from libarchive 3.7.0 commit
[2] which introduced bsdunzip which contains this vulnerability.

[1] https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=ec837d3b21b4f8b98abac53e2833f1490ba6bf1e
[2] https://github.com/libarchive/libarchive/commit/c157e4ce8eb170a92945cc2d292fd7106bdfcce1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 4ceb0df2c0..f7e576b688 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -44,6 +44,8 @@ SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f
 CVE_CHECK_IGNORE += "CVE-2023-30571"
 # cpe-incorrect: this vulnerability was not in any release; introduced in v3.7.3-14-g91f27004; fixed in b6a97948
 CVE_CHECK_IGNORE += "CVE-2024-37407"
+# cpe-incorrect: bsdtar was introduced in v3.7.0, so 3.6.2 is not affected yet
+CVE_CHECK_IGNORE += "CVE-2025-1632"
 
 inherit autotools update-alternatives pkgconfig
 

