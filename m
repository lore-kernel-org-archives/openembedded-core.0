Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FBBC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:49:17 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.14602.1743176949830831774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=FB3Fhk3w;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202503281549070e7b53f69406417adf-qomdzz@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202503281549070e7b53f69406417adf
        for <openembedded-core@lists.openembedded.org>;
        Fri, 28 Mar 2025 16:49:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=FMRz7gTIHmkTudhFvVx0tKCIXLkUc2X/7phNUsOMb5I=;
 b=FB3Fhk3wHxSLDkhOf1JJ5k7adgho/pyuo1EXEwZEdbjApJtSBi06/uN8y/czKJVr3eDyzd
 FJD6Mp+2Dbr8oBiFN6FORXh4MGRP7az53ngQD9Tyl9LdTs18JYs66H721FK/n06Hz3zGjR2W
 2LRBHUjrIbWBByg3A8ydmq7OS0e9VuKJjSRHZYFT5RmDz7d4GEDVNIbjxnha8B2E7qojBUg9
 2h9vfAhyX++kmolmLA9YI3xF3Tqzyd0FZtPNHVy2uUxx5y7ENkc0HjQx0U7poN24ojZUP2ZP
 u6ZG882N6RkQEssrfLrrsFrszRyXnZGPlDhV8e1J4XShlmCGob6CJfzg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] cve-update-nvd2-native: handle missing vulnStatus
Date: Fri, 28 Mar 2025 16:48:20 +0100
Message-Id: <20250328154820.8872-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213855

From: Peter Marko <peter.marko@siemens.com>

There is a new CVE which is missing vulnStatus field:
https://services.nvd.nist.gov/rest/json/cves/2.0?cveId=CVE-2025-2682

This leads to:
File: '<snip>/poky/meta/recipes-core/meta/cve-update-nvd2-native.bb', lineno: 336, function: update_db
     0332:
     0333:    accessVector = None
     0334:    vectorString = None
     0335:    cveId = elt['cve']['id']
 *** 0336:    if elt['cve']['vulnStatus'] ==  "Rejected":
     0337:        c = conn.cursor()
     0338:        c.execute("delete from PRODUCTS where ID = ?;", [cveId])
     0339:        c.execute("delete from NVD where ID = ?;", [cveId])
     0340:        c.close()
Exception: KeyError: 'vulnStatus'

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 441559471f..99acead18d 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -338,7 +338,7 @@ def update_db(conn, elt):
     accessVector = None
     vectorString = None
     cveId = elt['cve']['id']
-    if elt['cve']['vulnStatus'] ==  "Rejected":
+    if elt['cve'].get('vulnStatus') ==  "Rejected":
         c = conn.cursor()
         c.execute("delete from PRODUCTS where ID = ?;", [cveId])
         c.execute("delete from NVD where ID = ?;", [cveId])

