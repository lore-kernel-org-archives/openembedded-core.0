Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D8FCCFA18
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:20:31 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7425.1762460426632328534
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XuKkIQSo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251106202023fd7b34a0a1000207fd-suukqc@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251106202023fd7b34a0a1000207fd
        for <openembedded-core@lists.openembedded.org>;
        Thu, 06 Nov 2025 21:20:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=F0YESeCF0s3a15IpIpyJ5JuzIp53ytbX2J34gWgeKJo=;
 b=XuKkIQSow96vlRPPst0TGDOOgleop/hsuw3esoev6ooNF0tjNyTArOx6QcJdyac8PDrlt7
 ySqq9PLf8rwAiC14dBjaRKB7M7A6CW6KyFIxAXCxrfyoI0Ta7LKSTUOS1ASMVFG/XuIFkJlS
 jyt2b7t3IEPALL2XwfshKJftrYOcd0+qPQ3kOBriU7Y8cLmFLBb6NCjhoAO9Z2di+UnrjwOp
 47aYfLCrYuTwrrm92jSKB1e9+Jyf8KZSZwJAeF6eLZCu/HFEE1eIwn4dPrkQXk0BkkP9tamn
 s/GkWONMs2CbotRpcXY6HqqBDS5v+qyMx+DXW0yvG9QR2BkcZ2lbmNtg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] curl: ignore CVE-2025-10966
Date: Thu,  6 Nov 2025 21:20:21 +0100
Message-Id: <20251106202021.3084656-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225992

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE applies only when wolfssl backed is used.
8.17.0 removed WolfSSL support completely.

[1] https://curl.se/docs/CVE-2025-10966.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 713d90a3787..6c027463949 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -39,6 +39,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
 CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
+CVE_STATUS[CVE-2025-10966] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: applicable only with wolfssl','unpatched',d)}"
 
 
 inherit autotools pkgconfig binconfig multilib_header ptest

