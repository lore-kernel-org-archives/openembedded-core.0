Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA0AC61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:39:14 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29445.1787683148214507959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=G68ITMjS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260825183905fcab203b7900020720-sijkkd@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260825183905fcab203b7900020720
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 20:39:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VFXjJgANS5ZHJTeRXFLc3x1wNAKAQnXiL8Imp9P8W10=;
 b=G68ITMjSUzYWof72Ilp6kARdoVCRg/A9XD+odAoTigX9aucRwrV5vd/NHDNRu3FoZbEYNn
 JgCkYwzGRxq+8oXTFSyofYPCcvptdyAhxIE84dY2n/P4ju5NFpXqO204tv/6+BbpzO8B+K9Z
 uxudKIJ7wAg2IKpWdBnue7BEFMbk2PGkVxkQ3PU6vsrObiLcncpQOmTROF0Rj7FhxV++YQuA
 Y/ni1xYQaPF6uTeF+z4FA9JqU7pD7VW36ltnpiOhl7/IHBS/m7IXVgFOfdM4tA95HAdyWAdh
 CDqjDfrc0eek96uVK1mYRabpPc/NAI1pyF3y2uvPrv49k9ZjXEf4LoaQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/5] curl; patch CVE-2026-7009
Date: Tue, 25 Aug 2026 20:38:49 +0200
Message-ID: <20260825183853.1017950-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244256

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2026-7009.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-7009.patch             | 50 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7009.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-7009.patch b/meta/recipes-support/curl/curl/CVE-2026-7009.patch
new file mode 100644
index 0000000000..ec124378ec
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-7009.patch
@@ -0,0 +1,50 @@
+From 51905671e07f087e28e5741063646c379fe17d89 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Sat, 25 Apr 2026 10:34:06 +0200
+Subject: [PATCH] sectrust: fail on missing OCSP stapling
+
+When using Apple SecTrust, requiring the server to send
+an OCSP response and does not, fail correctly.
+
+Reported-by: Carlos Carrillo
+Closes #21444
+
+CVE: CVE-2026-7009
+Upstream-Status: Backport [https://github.com/curl/curl/commit/51905671e07f087e28e5741063646c379fe17d89]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/openssl.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index c84ef8bc65..4629ca4444 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -4744,16 +4744,26 @@ static CURLcode ossl_apple_verify(struct Curl_cfilter *cf,
+     unsigned char *ocsp_data = NULL;
+ #endif
+     long ocsp_len = 0;
++    bool ocsp_missing = FALSE;
+     if(conn_config->verifystatus && !octx->reused_session)
+       ocsp_len = (long)SSL_get_tlsext_status_ocsp_resp(octx->ssl, &ocsp_data);
+ 
+     /* SSL_get_tlsext_status_ocsp_resp() returns the length of the OCSP
+        response data or -1 if there is no OCSP response data. */
+-    if(ocsp_len < 0)
++    if(ocsp_len < 0) {
+       ocsp_len = 0; /* no data available */
++      ocsp_missing = TRUE;
++    }
+     result = Curl_vtls_apple_verify(cf, data, peer, chain.num_certs,
+                                     ossl_chain_get_der, &chain,
+                                     ocsp_data, ocsp_len);
++    if(!result && ocsp_missing && conn_config->verifystatus &&
++       !octx->reused_session) {
++      /* verified, but OCSP stapling is required and server sent none */
++      *pverified = TRUE;
++      failf(data, "No OCSP response received");
++      return CURLE_SSL_INVALIDCERTSTATUS;
++    }
+   }
+   *pverified = !result;
+   return result;
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index bca7f35d06..ca01e35dcd 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://CVE-2026-4873.patch \
     file://CVE-2026-11352.patch \
     file://CVE-2026-11586.patch \
+    file://CVE-2026-7009.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

