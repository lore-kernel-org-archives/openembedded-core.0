Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA46DC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:48:17 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.14656.1743176894220206278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SMoJqfNN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250328154810be4668329603f4a402-pvvjjx@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250328154810be4668329603f4a402
        for <openembedded-core@lists.openembedded.org>;
        Fri, 28 Mar 2025 16:48:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pY6ex43Ars/LWubEfcijnbUcy6kFF25spBcOZK2xN3U=;
 b=SMoJqfNN13FWVasMZLd6P46AqJtqxY+DK3GM0b9IXcZQRbd3fMOOrcgnDg9PlxqZUka03Q
 ejzYxQPl98sUh9lXPPRcq3V3FP7FEhIx7eajGyuJDaBP3nLSS/0tGIH55AlDTZX1aThsOuU/
 fzzWxmWISu05Fx3CJLpnHNI22hNwvKBocKhopxagzO0VXjgsB7LE3ztfhD1LGlHusq0Iih2C
 EPBvmEVPQcRrkJ0GTAJ8mxmVnntQwGH6EGqn8baWpZ54Ll0V/yOCw1yH57cjJjGHPW81gKAZ
 SP4VdH98JsUdHAmw5Tk9NY/lrQ3oACG1RPf/l947RBqA9MmKF0NzjPeQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] cve-update-nvd2-native: handle missing vulnStatus
Date: Fri, 28 Mar 2025 16:47:12 +0100
Message-Id: <20250328154712.8813-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213854

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
index a68a8bb89f..b9c18bf6b6 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -336,7 +336,7 @@ def update_db(conn, elt):
     accessVector = None
     vectorString = None
     cveId = elt['cve']['id']
-    if elt['cve']['vulnStatus'] ==  "Rejected":
+    if elt['cve'].get('vulnStatus') ==  "Rejected":
         c = conn.cursor()
         c.execute("delete from PRODUCTS where ID = ?;", [cveId])
         c.execute("delete from NVD where ID = ?;", [cveId])

