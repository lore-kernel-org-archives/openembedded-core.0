Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF95C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 20:40:30 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.47302.1707079221533618046
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 12:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cKrEVad+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240204204017d701642d6fbe8d32a6-90yvd7@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240204204017d701642d6fbe8d32a6
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 Feb 2024 21:40:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OQqP7gvR6UKkAyfaor2GxN1ShkMxnm6oJDIAna3R808=;
 b=cKrEVad+Pt5iveqH7m3zbWfgszK1+vlENkEvsTAVKR3QzjCGuTnYz6uQ2Ddv5Tc6ldW5sj
 MQDqUdqo92Fem2PbvE8bFZRnX7uLIVLP2rD/laFbcYKyfbDU3IJoljX4PJBW6L6vFHrA6Vw1
 x9r/2d3bw3FJEN+SruVeWrGhDutI0=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] gcc-shared-source: ignore CVE-2023-4039
Date: Sun,  4 Feb 2024 21:39:29 +0100
Message-Id: <20240204203929.453301-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 20:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194913

From: Peter Marko <peter.marko@siemens.com>

Concept of gcc-source prevents cve-check to detect existing
CVE patch file.
So ignore this CVE in all recipes using gcc-source via this
include file.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index 03f520b093..7aa1c22bf0 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -19,3 +19,6 @@ do_deploy_source_date_epoch () {
 	cp -p $(dirname ${S})/$sde_file ${SDE_DEPLOYDIR}
 	cp -p $(dirname ${S})/$sde_file ${SDE_FILE}
 }
+
+# patch is available via gcc-source recipe
+CVE_CHECK_IGNORE += "CVE-2023-4039"
-- 
2.30.2


