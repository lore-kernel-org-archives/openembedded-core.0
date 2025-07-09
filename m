Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5E2C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:53:26 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.4958.1752087204655563878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=d8804EUQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250709185322512021dc8c4273b601-xucu_y@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250709185322512021dc8c4273b601
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Jul 2025 20:53:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=kODPeuVsRi4sfDV3rzf8u5UzwCzrIuL0V5nDERwuO5A=;
 b=d8804EUQ0IUYTAbh8+vrscDYWz3pEd3vSuWs6Zp8/+0O5S3YbfPOUzQcMviguaYb8xFA11
 T6273eFvzKb48DvbCPBpI7FAEPNIUCJWsrHiBcYirt/7m2mjgyVT9UqxlTS2P7cWiirjo8Pj
 QGtsfxdp7m9JPDPrNhiM9q8i3ZWlm1HXrJoLo2b4m6o+QOKEN09eNmopnhvRPou9R1nyWOsb
 kM2UpduGr6kFjJdBGihDQnBo3td2oA3/dTaLtyjdcTeP7CSnWTDVRXrnEmt/INKQ963glfdW
 qQ6tlfpsUJYwWG7ygRF51UqoUg3LGxkpEtubB4c1oiaGmh2QS6YkuLvg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] python3: update CVE product
Date: Wed,  9 Jul 2025 20:52:31 +0200
Message-Id: <20250709185231.1990615-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 18:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220108

From: Peter Marko <peter.marko@siemens.com>

There are two "new" CVEs reported for python3, their CPEs are:
* CVE-2020-1171: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
* CVE-2020-1192: cpe:2.3:a:microsoft:python:*:*:*:*:*:visual_studio_code:*:* (< 2020.5.0)
These are for "Visual Studio Code Python extension".

Solve this by addding CVE vendor to python CVE product to avoid
confusion with Microsoft as vendor.

Examining CVE DB for historical python entries shows:
sqlite> select vendor, product, count(*) from products where product = 'python' or product = 'cpython'
   ...> or product like 'python%3' group by vendor, product;
microsoft|python|2
python|python|1054
python_software_foundation|python|2

Note that this already shows that cpython product is not used, so
CVE-2023-33595 mentioned in 62598e1138f21a16d8b1cdd1cfe902aeed854c5c
was updated.
But let's keep it for future in case new CVE starts with that again.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3_3.13.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.4.bb b/meta/recipes-devtools/python/python3_3.13.4.bb
index 5b49fee3bf..0a2c41cdce 100644
--- a/meta/recipes-devtools/python/python3_3.13.4.bb
+++ b/meta/recipes-devtools/python/python3_3.13.4.bb
@@ -41,7 +41,7 @@ SRC_URI[sha256sum] = "27b15a797562a2971dce3ffe31bb216042ce0b995b39d768cf15f784cc
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
-CVE_PRODUCT = "python cpython"
+CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
 CVE_STATUS[CVE-2007-4559] = "disputed: Upstream consider this expected behaviour"
 CVE_STATUS[CVE-2019-18348] = "not-applicable-config: This is not exploitable when glibc has CVE-2016-10739 fixed"

