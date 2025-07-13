Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAACC83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 13:31:33 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.56734.1752413489837574121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 06:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=nTnBwKft;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250713133123b37147f751cd867f7f-uve1vg@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250713133123b37147f751cd867f7f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Jul 2025 15:31:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6aVhI8Fz9IJXUlQu1OMDrLvvJqqIzh/lU7cNacqTjQU=;
 b=nTnBwKftlPltvppOINlPS3MLObyM84g3VTkxMyEWbVuNA/PUn6ZQxR8m8zYmGCS5sUtsRo
 tiNj30w9wQg7/Br4ET5nYAUHArxUuwHyOXp/BD35bke0HBFW0EH1svfCThfpYausXgSjTL5x
 W6aJaumLJran0ZhTj+n3UxozBfNiljQ6hG42cdxjJV4/IL9wQKYR9YsgozP2Lj7GzSHKLAVB
 Q1aX1iFJ2XNmGovFoiKOHXiCE6UHJqc9SWQTWAMUjYCYfRZr13PwW4fJk4HboUhd2G7rGUKl
 UbuCbGDMv0uRw6MHc2PxX+IfIDhyJwdD7aV8xTArbsooUN0X5sHEwBjg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] curl: ignore CVE-2025-4947 and CVE-2025-5025
Date: Sun, 13 Jul 2025 15:30:35 +0200
Message-Id: <20250713133035.505773-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 13:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220205

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for integration with WolfSSL which is not supported by
this recipe.
Ignore it if openssl packageconfig is enabled as it was done also in
scarthgap branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl_8.12.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.12.1.bb
index 4192693da8..9e279bbad1 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -25,6 +25,8 @@ SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c7
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2025-4947] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl', 'unpatched', d)}"
+CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl', 'unpatched', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

