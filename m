Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2936C5AD48
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 18:35:09 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4439.1771612495640641738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 10:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=irlqu1Q2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026022018345239fe849ced00020712-dmzgzw@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026022018345239fe849ced00020712
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 19:34:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RP4f89r3eUhCSJ6H/Ji9/si7BuItxs81xLUDquGGDm4=;
 b=irlqu1Q2UulHSCcLokOLMCF+laWfOTDqLU9iRJtHrG3zQQrSU9f7ct6FrAZPem+2AmKYUE
 P38JlsWxwuLRCdPkUpqRtawRyaphHURNhosce4IkEwS0uXXOKB9j3mVmkm/DQ0M0lbocnz/O
 pMKiB+qOSgcVCsMYMi1Cu0uzYBMUsTnaTOHQAIB7oXXo3BoOYgEznG55K4vT52QiFyni7lc0
 BF18aRnz0UvI+9uNP6ONlCaTEhp9t3J8esnlsuvJmEXRoqhZ3culeuC08q3UURZfE7Bx9d32
 JT3mFj+4288ljNPG8q9792S/dO7+B9jIaHUJ+t66/yQFEV+dDpFlLL+w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] ffmpeg: set status of CVE-2025-25468
Date: Fri, 20 Feb 2026 19:34:46 +0100
Message-Id: <20260220183446.16294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 18:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231541

From: Peter Marko <peter.marko@siemens.com>

This vulnerability was introduced in v8.0.
This can be seen by blaming fix [1] (linked from NVD report [3]) is
showing that the return without freeing memory was introduced in [2].

[1] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d5873be583ada9e1fb887e2fe8dcfd4b12e0efcd
[2] https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/d38fc25519cf12a9212dadcba1258fc176ffbade
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-25468

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index 03ec637ddfa..eb64b5c8d59 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -51,6 +51,7 @@ CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
 CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
+CVE_STATUS[CVE-2025-25468] = "cpe-incorrect:vulnerability was introduced in v8.0"
 CVE_STATUS[CVE-2025-25469] = "cpe-incorrect: Current version (6.1.4) is not impacted."
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717

