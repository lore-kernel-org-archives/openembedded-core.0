Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C086FC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 18:01:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.22896.1739383268647590470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 10:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=B9ZKCPa0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250212180105f890ceddd4208b011a-sp0rkv@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250212180105f890ceddd4208b011a
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Feb 2025 19:01:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pQaREEgwDZw80j+4XWV/Aq4T9Paev0+xp/FMtXzJkMw=;
 b=B9ZKCPa0pyUDK2ANHQ8i/sFZdilD5ZpC+AsS4jOs1RA9GXayu8Yi7IjT8dzNSMm+YDMRuw
 ZhE13+dBE9eZfs5TjPlk+SaBk9pUjf/A7g4rT/iFnDGKlYWg1jqCbbed757js3JBLRaTJhUh
 +yyL1xqZqDFE4a82awZLOh2Tb3oXe6qdxxVAFeMc5CMIu/8vSd6OSJLsSphBTHDo/rUUD9UW
 yuojHL2cMJDJIXTUyeztsEiqU7x5MEXtCBntRianMjO6USO3wepBJdEJU3Wekd774oZB/1Y5
 /Za/WhyZJrszZzlsDaymU3qJakA6ngAlGvMck3GsgpFFfMJRfk1Wovww==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libpcre2: ignore CVE-2022-1586
Date: Wed, 12 Feb 2025 19:00:19 +0100
Message-Id: <20250212180019.12297-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211270

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in 10.40
NVD wrongly changed <10.40 to =10.40 when adding debian_linux=10.0

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-1586#VulnChangeHistorySection

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libpcre/libpcre2_10.40.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index 74c12ecec2..ba5f8cff32 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c
 
 CVE_PRODUCT = "pcre2"
 
+# This CVE is fixed in 10.40
+# NVD wrongly changed <10.40 to =10.40 when adding debian_linux=10.0
+CVE_CHECK_IGNORE += "CVE-2022-1586"
+
 S = "${WORKDIR}/pcre2-${PV}"
 
 PROVIDES += "pcre2"

