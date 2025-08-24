Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D38CA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:13:41 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.17574.1756044813137988499
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VXnnBHYp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250824141329072269aa1ce30bbf75-dsulr0@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250824141329072269aa1ce30bbf75
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:13:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=R/p783gm2B27Tcfs5D0sd3bXNenerJqaKKRWWzdiQDY=;
 b=VXnnBHYp8+XUZTDTwEtJLA/1ShEl/xVCKoAY3lreBnEtHyWlrGBusvIC6NdONJ+OXtepfO
 vjazcWrejwcYNOXeF3MwsrYZabNuJel+MoF34FdZfNryeGft0IJBm4ED7pzTQyHDLVSO7fZ1
 4BWQVVgEAgljUaqkekUW2KOrKw6LzBnn9vA4rs0xhG+8boSUVWGbxFdYIvtmUZgxS9NCOMmA
 Cikb4UiHZh7hBM3G+x3Jo3ONnjZes9SK1N42D+d2fr9heygylO/4wL2XvSrAVRypAejORoZ1
 aWoHK8DRzl3nMHgQ+dVgu+UxAFw3GKNPdmY0NiwbheiW7OqHjOLO3+vg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] cve-update-db-native: fix fetcher for CVEs missing nodes
Date: Sun, 24 Aug 2025 16:12:40 +0200
Message-Id: <20250824141240.1096413-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222380

From: Peter Marko <peter.marko@siemens.com>

As of now, update of CVE DB from FKIE source (which is the defailt)
fails with following error:

File: '<build>/poky/meta/recipes-core/meta/cve-update-db-native.bb', lineno: 393, function: update_db_fkie
     0389:                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
     0390:
     0391:        for config in elt['configurations']:
     0392:            # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
 *** 0393:            for node in config["nodes"]:
     0394:                parse_node_and_insert(conn, node, cveId, False)
     0395:
     0396:def update_db(d, conn, jsondata):
     0397:    if (d.getVar("NVD_DB_VERSION") == "FKIE"):
Exception: KeyError: 'nodes'

Entry for new CVE-2025-32915 is broken.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 792252f510..320bd452f1 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -390,7 +390,7 @@ def update_db_fkie(conn, jsondata):
 
         for config in elt['configurations']:
             # This is suboptimal as it doesn't handle AND/OR and negate, but is better than nothing
-            for node in config["nodes"]:
+            for node in config.get("nodes") or []:
                 parse_node_and_insert(conn, node, cveId, False)
 
 

