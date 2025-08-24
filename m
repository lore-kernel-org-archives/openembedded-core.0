Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC7ECA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:59:51 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.18231.1756047588303922273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=IliQf9Lp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202508241459461c6a3b011e14225d88-qkfhir@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202508241459461c6a3b011e14225d88
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=D1lCcwPX+E0QV/t/QtPiM4HpbTQ1oOCc4Iocf3sZrms=;
 b=IliQf9LptoQZqwT0nz1aK0ynjv4oDL8mRvx4TIVIVqutuGoGai50idvGOueD9V4l5NPthr
 caz0Nb/Z/M3MtfNMvOczhgWfEE0iN7VcwoMiGIe44fDsQmXODvR02VcwOuxYsKDBKd4TL7O7
 h/p5VcEjkRHPERZL2mu+0WzuQ+77FOEprWUTgCSiAPd6LKl2L8g3eC3fkmrA1+jpA1UW7KsJ
 owG7WWuCbA+0qzAVM3kwnFwqaw372UyyJu1vPliyqezSKPbEj0n4bglZLK1FScOwHNnzhRu5
 /oCtIc/CRWb+uuJ00ydXTZO8rTVmbam1AqafMbdRpOLmZvypy7biPlzQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Jonathan Schnitzler <jonathan.schnitzler@faro.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 6/7] cve-update-db-native: Fix FKIE CVE accessVector parsing
Date: Sun, 24 Aug 2025 16:57:44 +0200
Message-Id: <20250824145745.1099373-6-peter.marko@siemens.com>
In-Reply-To: <20250824145745.1099373-1-peter.marko@siemens.com>
References: <20250824145745.1099373-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222386

From: Jonathan Schnitzler <jonathan.schnitzler@faro.com>

Use "attackVector" for CVSS >= 3 as it only CVSS v2 uses "accessVector".

Signed-off-by: Jonathan Schnitzler <jonathan.schnitzler@faro.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 43cafb52b1..87e5a3edaa 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -352,7 +352,7 @@ def update_db_fkie(conn, jsondata):
         try:
             for m in elt['metrics']['cvssMetricV30']:
                 if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['accessVector']
+                    accessVector = m['cvssData']['attackVector']
                     vectorString = m['cvssData']['vectorString']
                     cvssv3 = m['cvssData']['baseScore']
         except KeyError:
@@ -361,7 +361,7 @@ def update_db_fkie(conn, jsondata):
         try:
             for m in elt['metrics']['cvssMetricV31']:
                 if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['accessVector']
+                    accessVector = m['cvssData']['attackVector']
                     vectorString = m['cvssData']['vectorString']
                     cvssv3 = m['cvssData']['baseScore']
         except KeyError:
@@ -370,7 +370,7 @@ def update_db_fkie(conn, jsondata):
         try:
             for m in elt['metrics']['cvssMetricV40']:
                 if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['accessVector']
+                    accessVector = m['cvssData']['attackVector']
                     vectorString = m['cvssData']['vectorString']
                     cvssv4 = m['cvssData']['baseScore']
         except KeyError:

