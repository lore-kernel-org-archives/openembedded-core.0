Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA34C5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 16:56:23 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.57900.1724691375875992617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 09:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=a1s/H8Mp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202408261656136955ae902083a93ad5-plxlhp@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202408261656136955ae902083a93ad5
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 Aug 2024 18:56:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bcwJGXeFpsRubPTSPV2Fv6AudwMB4xE2gmO2orPe8w0=;
 b=a1s/H8MpOxILPnYgj5CjAbTjxDS+EgHh+PssKo/ZqLwK8RJuGmcmmWRRfFwjlIbVOGPszM
 y+B3nz1qGNfvTWBCMhbbhEsZWqZDDYyTBeOjxwGPJ1/3XtUC5NfWKZWZYz11U4nCKSuBfeC9
 qtFjuMsfarCJxtp/3bKDCAEXKuMMJxSUK8/VTVlr5/FaJd/pTaw+3fBsLm+kJ7/HGTSupgDo
 7lpfVX9CflnaBTrjha5SB95AEVts5oFG5DUTqbGacZyLbA6L2rym7sRVCtaYxQ4Sz7JrG6Rm
 0bPNXUXbB52JMZOb3okHWzkn8ogsu5PgVTQ6NwASZrb0pp2az/MKmhQg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] curl: Ignore CVE-2024-32928
Date: Mon, 26 Aug 2024 18:55:35 +0200
Message-Id: <20240826165535.10274-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 16:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203760

From: Simone Weiß <simone.p.weiss@posteo.com>

This CVE affects google cloud services that utilize libcurl wrongly.

(From OE-Core rev: 27ac7879711e7119b4ec8b190b0a9da5b3ede269)

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6d2886f70c..32b79f35f0 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -21,6 +21,7 @@ SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c65
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
+CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.30.2


