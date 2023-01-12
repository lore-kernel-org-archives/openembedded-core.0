Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB60C54EBC
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 10:21:07 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.51429.1673518856824811051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 02:20:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ECHMv3Yd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202301121020527aa01cb72695845227-3kitkt@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202301121020527aa01cb72695845227
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Jan 2023 11:20:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=b/n4WUxbDLjEE2TTPwjtWizfrEDz+vY803ZNwbCI8Hk=;
 b=ECHMv3Yd36DxQFrEfK9GIhr/7yrzy7qA/7tg3XidmtBzhNFJ5HeoyHV5EQlKUgWJoA5zQB
 TI+wOF5f7GqzhaBXkGC8TuB6GYMusn2eQAVIm/4XSRnk2YbNcAa3kCBhr0z8dLbVk3RzhTQ4
 A+9f63J5S7Zs4J7Nr4dktc/V4XHJc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] iproute2: separate routel and add python dependency
Date: Thu, 12 Jan 2023 11:19:52 +0100
Message-Id: <20230112101952.78181-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 10:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175790

This script was migrated from shell to python3 in recent versions.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb
index 4c6dd1f7f4..7272e8f147 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.1.0.bb
@@ -64,6 +64,7 @@ IPROUTE2_PACKAGES =+ "\
     ${PN}-ip \
     ${PN}-lnstat \
     ${PN}-nstat \
+    ${PN}-routel \
     ${PN}-rtacct \
     ${PN}-ss \
     ${PN}-tc \
@@ -88,6 +89,9 @@ FILES:${PN}-ss = "${base_sbindir}/ss"
 FILES:${PN}-tipc = "${base_sbindir}/tipc"
 FILES:${PN}-devlink = "${base_sbindir}/devlink"
 FILES:${PN}-rdma = "${base_sbindir}/rdma"
+FILES:${PN}-routel = "${base_sbindir}/routel"
+
+RDEPENDS:${PN}-routel = "python3-core"
 
 ALTERNATIVE:${PN}-ip = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
-- 
2.30.2


