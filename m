Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A281DC4706C
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 18:09:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.24150.1705169377270958569
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jan 2024 10:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=j7xIJJs6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240113180935f1a6013912fa846496-hdekng@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240113180935f1a6013912fa846496
        for <openembedded-core@lists.openembedded.org>;
        Sat, 13 Jan 2024 19:09:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gac7BR0zEoPfw8GDEeXxchlfr3Rl/vfKL3ufIZouS4o=;
 b=j7xIJJs6WNRAJeUwmZWMUtor0J/pl8z0yIH2Ye7IB0zVIzYV88vUGY9XDEEtzuqfR2eUmG
 fEPxl2Ra1qmE8Ileno1MclVBgeXA0vyY4ID45f37Dai0ClcXlYNdJ7LiTPL4EziWQSciSi+U
 2qELpLYNrSOnHfJa4l6DPpce+bbx4=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] zlib: ignore CVE-2023-6992
Date: Sat, 13 Jan 2024 19:08:48 +0100
Message-Id: <20240113180848.813906-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 18:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193605

From: Peter Marko <peter.marko@siemens.com>

This CVE is for iCPE cloudflare:zlib.

Alternative to ignoring would be to limit CVE_PRODUCT, but
historic CVEs already have two - gnu:zlib and zlib:zlib.
So limiting it could miss future CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/zlib/zlib_1.2.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index 910fc2ec17..9355f0556e 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -53,3 +53,6 @@ do_install_append_class-target() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# this CVE is for cloudflare zlib
+CVE_CHECK_WHITELIST += "CVE-2023-6992"
-- 
2.30.2


