Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CF2D262B2
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 07:35:39 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7130.1768980931862042289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 23:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=T8PoPZ/K;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4008; q=dns/txt;
  s=iport01; t=1768980931; x=1770190531;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DmWinzJJuWhaaB9UK0ITMWfjSdTah0iusSSM9NNzDVI=;
  b=T8PoPZ/KvTyNHo0eWtOiCBBLvl00MbE3yNi4kyRDaN6GWDzYr2KqbP9W
   UNpbmuBb4Es3WoMYJGeuAiQuCQ7subSixIB2x4p7PARG3aI+9wNVOiUw2
   sukZGsXS0EysQElXDyz0dtScZKXF8/6qXz/ToK2ghMf5NZeUGWkC4Ylo2
   MgBsRZVvzPwKVVOdOTiDJdhrGyNhvLpbi5aVbahJRYjNl31P2luq4OnDC
   4gUC10+vHdc/RL3BPDQzH4GtCCT6gsP0iynvLsatDNSFAFJuXlQKclSP5
   xeE0CWGms0V8/GtQzbbaGKX6LLbcH1dJLyGrGsxCLKseqGofzD+aK/abU
   Q==;
X-CSE-ConnectionGUID: EYD0dcE2RKmWD/iLtiMW0A==
X-CSE-MsgGUID: EljqARlfRTiCupBqUF0iuw==
X-IPAS-Result: =?us-ascii?q?A0AdCgDAgHBp/5T/Ja1aHQEBPAEFBQECAQkBgWUCgkYPc?=
 =?us-ascii?q?V9CSQOTVwGCcJ4dgX8PAQEBDxQCJxQEAQGFB40DAiY0CQ4BAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4YVCDINhl02AUYwXESDAgGCcwIBE?=
 =?us-ascii?q?a5BgiyBAYR82yUBCxQBgTgBhTqIF4VpJxsbgXKEDoNQBBiICgSCIoEOlAdIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFmAzUSKhUyPDIdgSM+F4EKGwcFgQkGiHsPiSd4gQADC?=
 =?us-ascii?q?xgNSBEsNxQbBD5uB48ARYIuAYENLHslpwChDgoog3SMHpU6GjOEBKZnmQaCW?=
 =?us-ascii?q?IsxllCEaIFoPEaBE3AVgyIJSRkPh36GYYIdhjjCeiI1AhEpAgcLAQEDCZNnA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:3DUiJKLOg4Lp1fAuFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS0D0Dm
 2BJWj2AMvyJN2Ske95yOou29khXv5/Vy4BlQQMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnU0
 T/Oi5eHYgH9gmQsajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1DPW1uMYY1oNxUBF5is
 v08NDEoUUiq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLo+kfuwj2XXeDxDo1XTrq0yi4TW5FAsiOW2YYeNJrRmQ+14mkSBj
 1jC8V7FAzoHLPaG9BTd82+z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:+Y3hw64NSY7cK2BeMAPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: 9a23:lG4FcW+pvKM5JcZt5aCVv2MlNpgpeVCH9lTVHGP/CEJ1SZiqEXbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AkDRzTA189Lnm943r+lQNoh6+RTUjzqCsEWk3lZs?=
 =?us-ascii?q?8h8ivKDRaIgqz1DWqXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,242,1763424000"; 
   d="scan'208";a="450539504"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Jan 2026 07:35:31 +0000
Received: from sjc-ads-1153.cisco.com (sjc-ads-1153.cisco.com [171.70.58.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id D643F18000149;
	Wed, 21 Jan 2026 07:35:30 +0000 (GMT)
Received: by sjc-ads-1153.cisco.com (Postfix, from userid 1847788)
	id 7E0F3C64E40; Tue, 20 Jan 2026 23:35:29 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core] [master] [PATCH] Fix CVE CVSS scoring to use maximum score from all sources
Date: Tue, 20 Jan 2026 23:35:28 -0800
Message-Id: <20260121073528.3679178-1-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.58.95, sjc-ads-1153.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 07:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229795

From: Het Patel <hetpat@cisco.com>

The CVE check system was incorrectly reporting lower CVSS scores when
multiple scoring sources were available in the NVD database. This
occurred because the code only extracted the first element from the
CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary
source with a lower score instead of the Primary source with the
actual severity score.

This fix takes maximum CVSS score.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15931

Signed-off-by: Het Patel <hetpat@cisco.com>
---
 .../meta/cve-update-nvd2-native.bb            | 55 +++++++++++++------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 8c8148dd92..41c34ba0d0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -350,32 +350,55 @@ def update_db(conn, elt):
         if desc['lang'] == 'en':
             cveDesc = desc['value']
     date = elt['cve']['lastModified']
+
+    # Extract maximum CVSS scores from all sources (Primary and Secondary)
+    cvssv2 = 0.0
     try:
-        accessVector = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['accessVector']
-        vectorString = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['vectorString']
-        cvssv2 = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV2 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV2']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv2:
+                cvssv2 = score
+                accessVector = metric['cvssData']['accessVector']
+                vectorString = metric['cvssData']['vectorString']
     except KeyError:
-        cvssv2 = 0.0
-    cvssv3 = None
+        pass
+
+    cvssv3 = 0.0
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
-        cvssv3 = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV30 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV30']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
         pass
+
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
-        cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV31 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV31']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv3:
+                cvssv3 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
         pass
-    cvssv3 = cvssv3 or 0.0
+
+    cvssv4 = 0.0
     try:
-        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
-        cvssv4 = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
+        # Iterate through all cvssMetricV40 entries and find the maximum score
+        for metric in elt['cve']['metrics']['cvssMetricV40']:
+            score = metric['cvssData']['baseScore']
+            if score > cvssv4:
+                cvssv4 = score
+                accessVector = accessVector or metric['cvssData']['attackVector']
+                vectorString = vectorString or metric['cvssData']['vectorString']
     except KeyError:
-        cvssv4 = 0.0
+        pass
+
     accessVector = accessVector or "UNKNOWN"
     vectorString = vectorString or "UNKNOWN"
 

