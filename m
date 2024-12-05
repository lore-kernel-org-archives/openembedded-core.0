Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F31BE77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:42:36 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.25877.1733442153718832826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GgLk8Ym2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2024120523423019713da2232c00fd3a-m2m0za@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024120523423019713da2232c00fd3a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 00:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ugMz8v+HaPbiDzeqMTSNFaXyIFfwoliQuV+y2mr8PAo=;
 b=GgLk8Ym2cBeeF1pX8gap6h47NM3Mc49oOu3v62Hoyn0xX6ACLC/EQAUzMzMNH/eiQ6kOVB
 w9AdnXYvVjxV+we/8UzpuUQeP4er466+w4idsbYUzeM/1pFQ0fZqdT601k4tk18wOjAERwF9
 lgeYg6yHIKptP4WZtbGR1J/Bv5tKVLLxF1brba8TManTfnNrwyoVOxNCMLbNMyQGe05tUzpv
 +jKCu5hOzUTj7wLqsLDHZ+PrsmwQXG4wTwoLzTPAxzPXDkjb1GCDj98/w3Vc7qiBMCHc0YrC
 TVny/ZODEogmep0Wnc542ZqRfvvt+wl11vMykmfiR61iuly3SPIc1JqQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][styhead][PATCH 2/7] builder: set CVE_PRODUCT
Date: Fri,  6 Dec 2024 00:41:39 +0100
Message-Id: <20241205234144.7933-3-peter.marko@siemens.com>
In-Reply-To: <20241205234144.7933-1-peter.marko@siemens.com>
References: <20241205234144.7933-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208396

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

(From OE-Core rev: fd4ec5a5318b36af0a9a0a097a5b1f1de44a8edf)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 7719b783c2..39abaf31ce 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,4 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-CVE_STATUS[CVE-2008-4178] = "cpe-incorrect: This CVE is for an unrelated builder"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yoctoproject:builder"
-- 
2.30.2


