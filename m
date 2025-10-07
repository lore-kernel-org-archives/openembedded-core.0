Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D601CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 21:02:29 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.1027.1759870946254345660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 14:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=kK2y8lTZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025100721022017803eca4f00020743-ggrnab@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025100721022017803eca4f00020743
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Oct 2025 23:02:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=L9Ob8f5g9TIwImFXoei8ni/0BpNzRDAuuon1SeY86CM=;
 b=kK2y8lTZ0bXYeXzfHcnHnqD02Beac00gHewsxWT4W3ANnt1P1pb9R+8b6BiE/IkJPWwQsj
 MTkvuCGp9SaJoibHydd8Ubco3NvYuxonCgtUUa/dW4jchWZ3mM9bqYXT6JEeuUpDNy/DffWS
 YVKVuq2s8eQRmnF6YlyS6iyHmy+wyWQ6zaYOROBKRJmJyVBoCXZvTUm9kA2t1kacbcoToC+u
 9DyvQrzHjGGzfUvDEEJAtGsrxxmK9JriW7wsUWuxuSdLBYLCLcb3nwt8TcbmFbWTsHUXNcSf
 b7niqu+0UTYpn0YB4ycfhJxYwCvnDUEaTDWPxl8cTwbkOjHZF3IPMExQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [OE-core][scarthgap][PATCH 2/2] gstreamer1.0: ignore CVE-2025-2759
Date: Tue,  7 Oct 2025 23:02:13 +0200
Message-Id: <20251007210213.1569226-2-peter.marko@siemens.com>
In-Reply-To: <20251007210213.1569226-1-peter.marko@siemens.com>
References: <20251007210213.1569226-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 21:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224562

From: Peter Marko <peter.marko@siemens.com>

Copy statement from [1] that it is problem of installers (non-Linux).
Also [2] linked in NVD says "Fixed in 1.25.1 Gstreamer Installer".
Since Yocto builds from sources into our own packages, ignore it.

[1] https://security-tracker.debian.org/tracker/CVE-2025-2759
[2] https://www.zerodayinitiative.com/advisories/ZDI-25-268/

(From OE-Core rev: 99ee1df6bde2ffd4fa2ddea44c0a9b94d9d77bae)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index cfc66745e3b..5b0ba379774 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -96,4 +96,6 @@ CVE_STATUS_PLUGINS_GOOD = " \
 "
 CVE_STATUS_PLUGINS_GOOD[status] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-good"
 
+CVE_STATUS[CVE-2025-2759] = "not-applicable-platform: affects installation packages for non Linux OSes"
+
 PTEST_BUILD_HOST_FILES = ""

