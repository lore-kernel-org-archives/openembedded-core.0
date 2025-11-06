Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5ACCCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:20:31 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7426.1762460427815443875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KgO58xgf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251106202026ecaaf0d91300020775-nrc2px@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251106202026ecaaf0d91300020775
        for <openembedded-core@lists.openembedded.org>;
        Thu, 06 Nov 2025 21:20:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=O4tIZ7cg1UEIa1sm7KdN7wAYAoM1oCDnzx9Zli0ryAw=;
 b=KgO58xgfgjDwyT6/hTdT7zlaEYoZMU37ub8FiYiS/mYs/9gGvqo7Axg7TQaNhrURXVUUqM
 Lany+egM3e6e27M+cYCqOPWyS89C+XhXUbqLmYKBbAEHjfMpEEAFaZQcj1bOV8/KuKnYOOme
 /nk5UgLgwzc7JtvUB9mg6S7deUMkqdLabyLojc/1zpMgqCYwxFd3ajxeP97gWjCrvs1993aJ
 BA62KpekzlMc4OxBKk5S8sudB90RAw/OcxOkGJw7lA4uagA1GxAqrP3RyDb5+utq3kKE7KQy
 JyUnjoOyYvYnaP4fdKXWmcVbbNvPHkI4krENV515lziNJUC6/Ydqej1Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] curl: ignore CVE-2025-10966
Date: Thu,  6 Nov 2025 21:20:24 +0100
Message-Id: <20251106202024.3084674-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225993

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE applies only when wolfssl backed is used.
8.17.0 removed WolfSSL support completely.

[1] https://curl.se/docs/CVE-2025-10966.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 54362e6978..2326392a4f 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -79,6 +79,8 @@ CVE_CHECK_IGNORE += "CVE-2023-42915"
 CVE_CHECK_IGNORE += "CVE-2024-32928"
 # ignored: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older
 CVE_CHECK_IGNORE += "CVE-2025-0725"
+# not-applicable-config: applicable only with wolfssl
+CVE_CHECK_IGNORE += "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'CVE-2025-10966','',d)}"
 
 inherit autotools pkgconfig binconfig multilib_header
 

