Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8608CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:10 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.12449.1758809163004068547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JFKBGTok;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202509251406010233ddcb870002073f-evfnmc@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202509251406010233ddcb870002073f
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kXzfy+TFA58IWfioFkB+fhFMLx7Z64ISx4E7THSorq0=;
 b=JFKBGTokgnkRbbqQyT2teyslZTxG0EAdD4X2OxpY21vBUlZ42WfqoogxgWaKdlteJemrz+
 sIfS4aZSuD8Kh13COXIrjNOdD93ob6tPX8H5sBLMm/Sbm7E7Sd5qiD/nvaIxFQafOf2iS/8A
 bUxQYxGo4Zk66ndNFNecZSpScKRKjxZvaDGaCXB64vo2izmxTlPdlskEvfYitZF55ZgCebHV
 cKhYCyMcqghsYGGTH3sc3ygV9XqoyiLcEfEkXIdEHHVUrAGntpnwIQCAWEd3nLJYdnGRipwr
 SzhnJSnn22alXKjqBwKp7synbsZaZ+bVnzd+szTHfAwvuc8b5trVEE8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 02/10] gstreamer1.0: ignore CVE-2025-2759
Date: Thu, 25 Sep 2025 16:05:06 +0200
Message-Id: <20250925140514.1103300-2-peter.marko@siemens.com>
In-Reply-To: <20250925140514.1103300-1-peter.marko@siemens.com>
References: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224031

From: Peter Marko <peter.marko@siemens.com>

Copy statement from [1] that it is problem of installers (non-Linux).
Also [2] linked in NVD says "Fixed in 1.25.1 Gstreamer Installer".
Since Yocto builds from sources into our own packages, ignore it.

[1] https://security-tracker.debian.org/tracker/CVE-2025-2759
[2] https://www.zerodayinitiative.com/advisories/ZDI-25-268/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
index db662dfec17..71a360ae7b3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.13.bb
@@ -75,4 +75,6 @@ CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORT"
 CVE_STATUS_STABLE_BACKPORT = "CVE-2025-47183 CVE-2025-47219 CVE-2025-47806 CVE-2025-47807 CVE-2025-47808"
 CVE_STATUS_STABLE_BACKPORT[status] = "cpe-stable-backport: these CVEs are patched in current version"
 
+CVE_STATUS[CVE-2025-2759] = "not-applicable-platform: affects installation packages for non Linux OSes"
+
 PTEST_BUILD_HOST_FILES = ""

