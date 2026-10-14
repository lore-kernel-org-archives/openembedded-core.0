Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7490ECC6B2A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 22:24:37 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26703.1792016672385004534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 15:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JVZEm4v8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261014222428cff1ba836a00020761-xiley5@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261014222428cff1ba836a00020761
        for <openembedded-core@lists.openembedded.org>;
        Thu, 15 Oct 2026 00:24:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3TXu4Zg0KzjB/eZQaFTu3Wn7yWBMgQHy57M15oqFOeM=;
 b=JVZEm4v8prJWMtOBDg6+62N2Cq5TTZ65mRbLDrTaifgKUSaC6MYm6a8YXwcrtQbCV/ZkOz
 W3Gl+JXGDicT8ZHNlehHIcY1hyZCIXaH0mRhYB+8dBibfDoc6vK/prHRdG2oLW11gSy3rXUF
 PQuHQheSXkcJ14vvmX87YWQ/G0iCRZCqP8G7sciufhe00qpr/0HMVHdLscl6nqABISLc7JJj
 wPDIbmUBqi04fukQLsXMogRCCnLQcVzmBoXPyV2TYagQpUESzU+3VSPpnQimfHatGo5Gagq5
 LrpQEoCZ/X5Oqy2tMp6FEQ/kA3X2xBZJnIOgwPXXhM4w3pwVG9Tny1SQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] curl: upgrade 8.22.0 -> 8.23.0
Date: Thu, 15 Oct 2026 00:24:20 +0200
Message-ID: <20261014222420.1957292-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247794

From: Peter Marko <peter.marko@siemens.com>

Solves 21 CVEs:
  CVE-2026-107929 CVE-2026-107928 CVE-2026-94266 CVE-2026-94265
  CVE-2026-92386 CVE-2026-92387 CVE-2026-92388 CVE-2026-92389
  CVE-2026-92390 CVE-2026-92391 CVE-2026-92392 CVE-2026-86410
  CVE-2026-86412 CVE-2026-86413 CVE-2026-86414 CVE-2026-86415
  CVE-2026-87861 CVE-2026-87862 CVE-2026-87863 CVE-2026-87865
  CVE-2026-87866

Dropped smb package config as support for SMB was removed.

Release info [1] (changes only, bugfix list is too long):
* lib: CURL_GLOBAL_WIN32 -> CURL_GLOBAL_WINSOCK
* SMB: drop support
* tool_cb_wrt: inject the no-clobber number before the extension
* tool_cb_wrt: try up to .9999 when no-clobbering

[1] https://curl.se/ch/8.23.0.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/{curl_8.22.0.bb => curl_8.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.22.0.bb => curl_8.23.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-support/curl/curl_8.23.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.22.0.bb
rename to meta/recipes-support/curl/curl_8.23.0.bb
index 96f889165e..3b2cc2792a 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.23.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
     file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7"
+SRC_URI[sha256sum] = "8dadd7d2536a314f982ad05a651b713f426bf7d02cc2c76cffb9796f2218e6c5"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"

