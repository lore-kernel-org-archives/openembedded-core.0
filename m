Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B71CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 15:00:01 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.18233.1756047596243005388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=brpKmqB3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025082414595430534d23a4bbb54eb7-1ckjc7@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025082414595430534d23a4bbb54eb7
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:59:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=61zZV1ov0EfOSa7NcYfA8T4UHxjN/WEMsLO0cZtqbF4=;
 b=brpKmqB3IujdrDWdwfQrZ0HltGKsxEp1RHYwsU10Z3zzQ7F3Ly58IyUSEBnlogxghUeBF6
 adOZyQPkHjCrv/tJoRD4wlYyb7ZHAm2AXVDysHEiXhsixQdh5mhLzurFornl3EBBcsTWJIj+
 maR4A5+uaqMk7TpsRgnTQ5Z7cHLRW7R6Vj9HGKyntJHkuuVTIhei/LYMCWTF8U75OPFg5ve8
 CzvCJsgPqOLpFsfVGRqpOkG7KxE9kTx5ubxbEjqai7HigNKaTxOrBdjIyDvoCpFtLGkQsTeu
 rHF1M+pJAX6Jt7saM6md47vtYlO956mPryhKq9PmGtV26d7N9OJZ2yOw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Jonathan Schnitzler <jonathan.schnitzler@faro.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 7/7] cve-update-db-native: FKIE CVE parsing: Use Secondary metric
Date: Sun, 24 Aug 2025 16:57:45 +0200
Message-Id: <20250824145745.1099373-7-peter.marko@siemens.com>
In-Reply-To: <20250824145745.1099373-1-peter.marko@siemens.com>
References: <20250824145745.1099373-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 15:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222387

From: Jonathan Schnitzler <jonathan.schnitzler@faro.com>

If there is no primary metric use the Secondary one.

Signed-off-by: Jonathan Schnitzler <jonathan.schnitzler@faro.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 53 ++++++++++++-------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 87e5a3edaa..0c7bc5f415 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -322,6 +322,15 @@ def update_db_nvdjson(conn, jsondata):
         for config in configurations:
             parse_node_and_insert(conn, config, cveId, True)
 
+def get_metric_entry(metric):
+    primaries = [c for c in metric if c['type'] == "Primary"]
+    secondaries = [c for c in metric if c['type'] == "Secondary"]
+    if len(primaries) > 0:
+        return primaries[0]
+    elif len(secondaries)>0:
+        return secondaries[0]
+    return None
+
 def update_db_fkie(conn, jsondata):
     import json
     root = json.loads(jsondata)
@@ -342,37 +351,41 @@ def update_db_fkie(conn, jsondata):
         cveDesc = elt['descriptions'][0]['value']
         date = elt['lastModified']
         try:
-            for m in elt['metrics']['cvssMetricV2']:
-                if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['accessVector']
-                    vectorString = m['cvssData']['vectorString']
-                    cvssv2 = m['cvssData']['baseScore']
+            if 'cvssMetricV2' in elt['metrics']:
+                entry = get_metric_entry(elt['metrics']['cvssMetricV2'])
+                if entry:
+                    accessVector = entry['cvssData']['accessVector']
+                    vectorString = entry['cvssData']['vectorString']
+                    cvssv2 = entry['cvssData']['baseScore']
         except KeyError:
             cvssv2 = 0.0
         try:
-            for m in elt['metrics']['cvssMetricV30']:
-                if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['attackVector']
-                    vectorString = m['cvssData']['vectorString']
-                    cvssv3 = m['cvssData']['baseScore']
+            if 'cvssMetricV30' in elt['metrics']:
+                entry = get_metric_entry(elt['metrics']['cvssMetricV30'])
+                if entry:
+                    accessVector = entry['cvssData']['attackVector']
+                    vectorString = entry['cvssData']['vectorString']
+                    cvssv3 = entry['cvssData']['baseScore']
         except KeyError:
             accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
         try:
-            for m in elt['metrics']['cvssMetricV31']:
-                if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['attackVector']
-                    vectorString = m['cvssData']['vectorString']
-                    cvssv3 = m['cvssData']['baseScore']
+            if 'cvssMetricV31' in elt['metrics']:
+                entry = get_metric_entry(elt['metrics']['cvssMetricV31'])
+                if entry:
+                    accessVector = entry['cvssData']['attackVector']
+                    vectorString = entry['cvssData']['vectorString']
+                    cvssv3 = entry['cvssData']['baseScore']
         except KeyError:
             accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
         try:
-            for m in elt['metrics']['cvssMetricV40']:
-                if m['type'] == 'Primary':
-                    accessVector = m['cvssData']['attackVector']
-                    vectorString = m['cvssData']['vectorString']
-                    cvssv4 = m['cvssData']['baseScore']
+            if 'cvssMetricV40' in elt['metrics']:
+                entry = get_metric_entry(elt['metrics']['cvssMetricV40'])
+                if entry:
+                    accessVector = entry['cvssData']['attackVector']
+                    vectorString = entry['cvssData']['vectorString']
+                    cvssv4 = entry['cvssData']['baseScore']
         except KeyError:
             accessVector = accessVector or "UNKNOWN"
             cvssv4 = 0.0

