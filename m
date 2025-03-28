Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE18DC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:51:57 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.14753.1743177116398356163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Pp9SUUGt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025032815515422de861bf463d0f7a0-_q1x3g@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025032815515422de861bf463d0f7a0
        for <openembedded-core@lists.openembedded.org>;
        Fri, 28 Mar 2025 16:51:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=92YLeZzAm7UZqm9wEwXHIz61x5FMIcC/WUUSupYDLcA=;
 b=Pp9SUUGt23U/etVSG/ThGc0s4rCUrg2j6oPFOdpNYRzvrSXGCqItDxESBT6W8Fc42EVhc5
 nvQjiPGh7uyvfOc1phuGX/Mj/r4JfDOsGFvUM+hCM6EX9T8bhv2nDdwHCMOqJcAjPPLm3L/C
 oouKgImJtpavT2LWib+v3JgxTBaRRGWHtO8UZ0huHd8wtQCGGICxawzqD8K6LtNfBCao5ZLz
 6EAwRkSwUBnB6tha0sU/ymQ42MZNyJP22neCQx+x7wEp0NLZDlvQVKt2v+2Rr1zJZ1Pwa1it
 +29Ktnero7zYauPWS+oL/Mk9q8SYUdWFFqmduDBC2usgjn/P4IDHC3ig==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] cve-update-nvd2-native: handle missing vulnStatus
Date: Fri, 28 Mar 2025 16:51:07 +0100
Message-Id: <20250328155107.9144-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213856

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
index 5d0a7564aa..b8faee68d6 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -333,7 +333,7 @@ def update_db(conn, elt):
     accessVector = None
     vectorString = None
     cveId = elt['cve']['id']
-    if elt['cve']['vulnStatus'] ==  "Rejected":
+    if elt['cve'].get('vulnStatus') ==  "Rejected":
         c = conn.cursor()
         c.execute("delete from PRODUCTS where ID = ?;", [cveId])
         c.execute("delete from NVD where ID = ?;", [cveId])

