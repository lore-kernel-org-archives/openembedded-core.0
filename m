Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E176DC369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 17:29:34 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.4464.1744306167316540536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 10:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WYvyDTV1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025041017292321736c6dafff2bc353-1izdkd@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025041017292321736c6dafff2bc353
        for <openembedded-core@lists.openembedded.org>;
        Thu, 10 Apr 2025 19:29:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RMGBM2P5nKUfruj1p7J7dxHxerVTNfNFslJNDr2X1y8=;
 b=WYvyDTV1SAuKyv8PUg0dFZLzOdw9WkbsOvwThOqnajt5SfyYsk0kQuKfRjaWOsTVHowoq/
 i0TTKBxA/ybPfywbmyUArRBBH7pf1+yzAasziOuX3vezts+vBhSC+H9ml/Z/SVOu1YUbOsEZ
 9zloPelyPLgBBDL8dxh8frGhF03XYnxxuwJsgNrqgYVBjtyso8yWchytA4sUyid/D5xBr7sR
 cYTgYmL9N9pX4BUHFjJc0RmZQQxSFjCwAyD3rfzFwJMaYHM0KFCvV8y5o/deOG2974MrPEkL
 CyEJkycMglbYzj1YfN+L+696TDmHIpRwAGkcsUACdKYQVPDrMCBanW+w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] systemd: ignore CVEs which reappeared after upgrade to 250.14
Date: Thu, 10 Apr 2025 19:28:34 +0200
Message-Id: <20250410172834.11584-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 17:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214688

From: Peter Marko <peter.marko@siemens.com>

Upgrade from 250.5 to 250.14 removed patches for these CVEs because they
were interated in the new version.
However NVD DB does not contain information about these backports to
v250 branch, so they need to be ignored.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/systemd/systemd.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 86ae4793c3..70ba1d1f77 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,3 +19,6 @@ SRCBRANCH = "v250-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
+
+# cpe-stable-backport: patches were backported to v250 stable branch
+CVE_CHECK_IGNORE += "CVE-2022-3821 CVE-2022-4415 CVE-2022-45873"

