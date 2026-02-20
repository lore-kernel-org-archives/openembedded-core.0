Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196D1C5AD56
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 18:35:00 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4374.1771612499197600413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 10:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=N5V/LP6P;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260220183457ae3aecdafe000207ac-lkhnex@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260220183457ae3aecdafe000207ac
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 19:34:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nzyqHCTbL12y8ItXjjvlghCTh4tNQcXmlzXHx8AMdNY=;
 b=N5V/LP6PQdv24KCA/aZspqaZqehOlC1sMwp8vdH0EB1IoVbypC3C35pN+LncsQqyLBZ+eJ
 Ok8RUCPBg71t5QR4Kv5d5q7vIjbS5EUcCf3mkpq1J1HIZz/jp1WHnry1SPP8qxEhIUNNLUvk
 vlR+PhrDLfjs/xzhRvLn3zud61AJhsapUI8gRaYHag9k4LW6AU7bCLmU+v12yz4LI38E0my2
 AmZ42c5FI7Pm3bwP/Uhy2rYlPKzbVEyuW/6R9cUXopo5rjZBWxWw0fi+7ZbbuVYg+jhGcIwA
 CrUcNyVQZM+jurYh0wIecktM7VVIhcPq8iC6UhWCnPcXjixRiiNZeVtw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ffmpeg: set status of CVE-2025-25468 and CVE-2025-25469
Date: Fri, 20 Feb 2026 19:34:54 +0100
Message-Id: <20260220183454.16315-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 18:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231542

From: Peter Marko <peter.marko@siemens.com>

These CVEs have the same fix commit per NVD report [3].
Blaming the fix [1] is showing that the return without freeing memory
was introduced in [2].

[1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2fe8dcfd4b12e0efcd
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519cf12a9212dadcba1258fc176ffbade
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-25468

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index d64b97e7877..4793035eb72 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -105,6 +105,11 @@ CVE_CHECK_IGNORE += "CVE-2022-3341"
 # bugfix: https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476a74cc2841d3d1fa7f3
 CVE_CHECK_IGNORE += "CVE-2023-6603"
 
+# These vulnerabilities were introduced in v8.0
+# introduced: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519cf12a9212dadcba1258fc176ffbade
+# bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2fe8dcfd4b12e0efcd
+CVE_CHECK_IGNORE += "CVE-2025-25468 CVE-2025-25469"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"

