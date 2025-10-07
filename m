Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E577CCD183
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 21:02:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.1088.1759870959798302080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 14:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=nAL4Ez4t;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251007210242d8b42af65b00020706-yz4vsy@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251007210242d8b42af65b00020706
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Oct 2025 23:02:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1F7qYEItijytqb/JisruewsBWrqwTqW3cd3msVUf4Oc=;
 b=nAL4Ez4tUUXzTPaaPwVPkTY3/P01k/kjYsru5BFZTt8pQXDh3xoPl4wngSmIA3/m5wm0N9
 2MiTRWx0hvZCs0NwXFnVctvPaY57HC4rXeKJ7UBjdt6SDozWHjLt3DQiQP4Vnh3oc/jLdVGH
 aTcu7fGV7aN4oLCDG2jKTgZZiR+GAyz+dWNC8yVkoRbBWHvNQGh+CQTlLKueCAtOAzzkKQMD
 fKbHSHvbdR/oYFYsiaAWg2qWD7ygqeqo7BGp5LBBdYibiya8Lgk7OIdsquHvzFfdzIWcxAtO
 rZeUjHDLIpBCtBIu9eJV/1sWMYTTC480xmD9QsPss+OtJa0Hzm89LfxQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [OE-core][kirkstone][PATCH 2/2] gstreamer1.0: ignore CVE-2025-2759
Date: Tue,  7 Oct 2025 23:02:33 +0200
Message-Id: <20251007210233.1569271-2-peter.marko@siemens.com>
In-Reply-To: <20251007210233.1569271-1-peter.marko@siemens.com>
References: <20251007210233.1569271-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 21:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224565

From: Peter Marko <peter.marko@siemens.com>

Copy statement from [1] that it is problem of installers (non-Linux).
Also [2] linked in NVD says "Fixed in 1.25.1 Gstreamer Installer".
Since Yocto builds from sources into our own packages, ignore it.

[1] https://security-tracker.debian.org/tracker/CVE-2025-2759
[2] https://www.zerodayinitiative.com/advisories/ZDI-25-268/

(From OE-Core rev: 99ee1df6bde2ffd4fa2ddea44c0a9b94d9d77bae)

Reworked to CVE_CHECK_IGNORE format.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index b9b9551bc3..3b37503608 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -88,4 +88,7 @@ CVE_CHECK_IGNORE += " \
     CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 CVE-2025-47183 CVE-2025-47219 \
 "
 
+# not-applicable-platform: affects installation packages for non Linux OSes
+CVE_CHECK_IGNORE += "CVE-2025-2759"
+
 PTEST_BUILD_HOST_FILES = ""

