Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B82C4707B
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 18:07:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.24443.1705169263541208835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jan 2024 10:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jCIak47e;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240113180739b2beb4f6190d9152b2-tzhbgt@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240113180739b2beb4f6190d9152b2
        for <openembedded-core@lists.openembedded.org>;
        Sat, 13 Jan 2024 19:07:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=f6pT0YWhj4zUpyQxLr1JjlQrH/K6O937mTgg8SyuBjY=;
 b=jCIak47ejRhnTLnZdxOSlB+oHIDi1VmeJu2nH8pbz8ccquf49dsM4XYDN3xXaM49mJKjMC
 MlJm75UDw84e5xyVWYAZHn4wi/Pte87/mAWg0YN60SJFaEWpTsUnz+CJKxI3h0iW4iC5VSH0
 kNlRwLg/0hH2dGIm6t4mZ+PTUzcbI=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] zlib: ignore CVE-2023-6992
Date: Sat, 13 Jan 2024 19:04:04 +0100
Message-Id: <20240113180404.813379-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 18:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193603

From: Peter Marko <peter.marko@siemens.com>

This CVE is for iCPE cloudflare:zlib.

Alternative to ignoring would be to limit CVE_PRODUCT, but
historic CVEs already have two - gnu:zlib and zlib:zlib.
So limiting it could miss future CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/zlib/zlib_1.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.bb b/meta/recipes-core/zlib/zlib_1.3.bb
index 1ed18172fa..ede75f90bd 100644
--- a/meta/recipes-core/zlib/zlib_1.3.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.bb
@@ -47,3 +47,4 @@ do_install_ptest() {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-45853] = "not-applicable-config: we don't build minizip"
+CVE_STATUS[CVE-2023-6992] = "cpe-incorrect: this CVE is for cloudflare zlib"
-- 
2.30.2


