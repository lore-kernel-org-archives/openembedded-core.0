Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD61C48286
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 22:52:04 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.9880.1706827922963142875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 14:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lDa5ehn+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202402012252008b928df3ee2e1e6625-cb85r7@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202402012252008b928df3ee2e1e6625
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Feb 2024 23:52:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7s4CUNuJmusCRJTqWcyNVnXbHgHH24+raX/teWtiF9Y=;
 b=lDa5ehn+/16HvwA+dbJr/Qqwv5Hlzvc+IIsyBInTir5ZEz0iy6OuJ1p5Nbx150inKDyEJO
 mfOeW2uKAhXfzx6TqEIzIy9rT++pf9O0Z8NpFe6i+Bxj7Pzi/ErplsAXrd+EikaK91zWLNWJ
 8OwRhyzMKgHZ0ETFbxXbzpHb/6SGQ=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] curl: ignore CVE-2023-42915
Date: Thu,  1 Feb 2024 23:51:13 +0100
Message-Id: <20240201225113.14727-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 22:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194761

From: Peter Marko <peter.marko@siemens.com>

This CVE reports that apple had to upgrade curl because of other
already reported CVEs:
* CVE-2023-38039: not affected, introduced in 7.84.0
* CVE-2023-38545: patch already backported
* CVE-2023-38546: patch already backported
* CVE-2023-42915: reference to itself

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index a8e6c4f3ee..980b4224a8 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -72,6 +72,9 @@ CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-2021-229
 # This CVE issue affects Windows only Hence whitelisting this CVE
 CVE_CHECK_WHITELIST += "CVE-2021-22897"
 
+# This CVE reports that apple had to upgrade curl because of other already reported CVEs
+CVE_CHECK_WHITELIST += "CVE-2023-42915"
+
 inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
-- 
2.30.2


