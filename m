Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB077C83F1D
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 21:20:18 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.45064.1752355213074663976
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 14:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hq22JBdK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250712212009c6c2a91d5d060c2501-e3r8wu@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250712212009c6c2a91d5d060c2501
        for <openembedded-core@lists.openembedded.org>;
        Sat, 12 Jul 2025 23:20:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=w2GvFL+ZJdPC+x8AfpNF5GC84D/krlnbT/AUQ5xRP64=;
 b=hq22JBdKCV+BcA/qDZYloV5uoMM+cDAZjPwE9eqb8f/bzvEab9LKf2uRT83OqISjZG52QG
 5D5lC2lp1fyQWGpMqonLgMwNXNHOCZpLZuHSSCR9KqEtvFJb7Om31K6QRNvra8XQfL42TsWw
 nX1WKyL6fnJ1CTFVKIkjnJnn1cLvZhD0RnYn/wInVRXGMmKDvI1o1Qe7A033SWQL23V9aksQ
 y7t6mzuuQrC4tNTAvAZVr5f5spdBP+JNK0GpGy2Yatqcn9qQ+Bf7LVLj/s98B6UIPh2BasOC
 RIaMu2XVXkMqGSH3sGHefeKF2K705Hpd1THeSceJVpQBB5o8nQJjBI6g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ghostscript: ignore CVE-2025-46646
Date: Sat, 12 Jul 2025 23:19:22 +0200
Message-Id: <20250712211922.2304626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 21:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220196

From: Peter Marko <peter.marko@siemens.com>

The code patched by [1] which fixes this CVE is not available in 9.55.0.
Also Debian says in [2] that even 10.0.0 is not yet affected.

[1] https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=f14ea81e6c3d2f51593f23cdf13c4679a18f1a3f
[2] https://security-tracker.debian.org/tracker/CVE-2025-46646

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 3b50ac14091..4d696159e07 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -28,6 +28,8 @@ CVE_CHECK_IGNORE += "CVE-2023-38560 CVE-2024-46954"
 CVE_CHECK_IGNORE += "CVE-2024-29507 CVE-2025-27833"
 # Only impacts codepaths relevant for Windows builds
 CVE_CHECK_IGNORE += "CVE-2025-27837"
+# Vulnerable code was introduced later, so 9.55.0 is not affected yet
+CVE_CHECK_IGNORE += "CVE-2025-46646"
 
 def gs_verdir(v):
     return "".join(v.split("."))

