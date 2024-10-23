Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A230FD2E03B
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:46:39 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.4983.1729676795074058653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZmcdetdR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202410230946310c912ed43cf684a2b2-v_t3sx@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202410230946310c912ed43cf684a2b2
        for <openembedded-core@lists.openembedded.org>;
        Wed, 23 Oct 2024 11:46:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eEBBg/KzqSRJjuw/cNv5VnmG12xaylWwebIK46gk6J0=;
 b=ZmcdetdRTVhVEcws4g9PkoYp+1WJ0JiauUprC+Oh25eSCK6IxO33xYqiTzWKKUKxjoLuw7
 pbc/OV3+Pdd/oJcZVVS8Cf0EkSRVpCg2soxHfbB1OReLLrm6pjAevqVJ88QP1WNV0gdgqeoe
 Ozv++RKXLvOaMSgP27DHqsde5XYoKefiP5pBRLTQIZnxxiiABFH6HQfPB1e087UzN+06fbbX
 FSTy9CwlIj13i9ygqflzhtZjzD1LiLZgtuCi56GBOMuaN75XZS9VJ1ELmG9pRSTO9Jc0+3Fg
 UuV5LVx0LbwUvLESmp+DGgat7mJmcqnma36iodrC7F0CqErYdZ2EKwKA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] cve-check: add support for cvss v4.0
Date: Wed, 23 Oct 2024 11:45:22 +0200
Message-Id: <20241023094522.8084-1-peter.marko@siemens.com>
In-Reply-To: <20241022212750.25402-1-peter.marko@siemens.com>
References: <20241022212750.25402-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 09:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206192

From: Peter Marko <peter.marko@siemens.com>

https://nvd.nist.gov/general/news/cvss-v4-0-official-support

CVSS v4.0 was released in November 2023
NVD announced support for it in June 2024

Current stats are:
* cvss v4 provided, but also v3, so cve-check showed a value
sqlite> select count(*) from nvd where scorev4 != 0.0 and scorev3 != 0.0;
2069
* only cvss v4 provided, so cve-check did not show any
sqlite> select count(*) from nvd where scorev4 != 0.0 and scorev3 = 0.0;
260

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass                   | 10 ++++++----
 meta/classes/vex.bbclass                         |  1 +
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++----
 scripts/cve-json-to-text.py                      |  2 ++
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6245594dd7..0c92b87f52 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,7 +31,7 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_FILENAME ?= "nvdcve_2-1.db"
+CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
 CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
@@ -445,9 +445,10 @@ def get_cve_info(d, cve_data):
             cve_data[row[0]]["NVD-summary"] = row[1]
             cve_data[row[0]]["NVD-scorev2"] = row[2]
             cve_data[row[0]]["NVD-scorev3"] = row[3]
-            cve_data[row[0]]["NVD-modified"] = row[4]
-            cve_data[row[0]]["NVD-vector"] = row[5]
-            cve_data[row[0]]["NVD-vectorString"] = row[6]
+            cve_data[row[0]]["NVD-scorev4"] = row[4]
+            cve_data[row[0]]["NVD-modified"] = row[5]
+            cve_data[row[0]]["NVD-vector"] = row[6]
+            cve_data[row[0]]["NVD-vectorString"] = row[7]
         cursor.close()
     conn.close()
 
@@ -534,6 +535,7 @@ def cve_write_data_json(d, cve_data, cve_status):
             cve_item["summary"] = cve_data[cve]["NVD-summary"]
             cve_item["scorev2"] = cve_data[cve]["NVD-scorev2"]
             cve_item["scorev3"] = cve_data[cve]["NVD-scorev3"]
+            cve_item["scorev4"] = cve_data[cve]["NVD-scorev4"]
             cve_item["modified"] = cve_data[cve]["NVD-modified"]
             cve_item["vector"] = cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index bb16e2a529..01d4e52051 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -282,6 +282,7 @@ def cve_write_data_json(d, cve_data, cve_status):
             cve_item["summary"] = cve_data[cve]["NVD-summary"]
             cve_item["scorev2"] = cve_data[cve]["NVD-scorev2"]
             cve_item["scorev3"] = cve_data[cve]["NVD-scorev3"]
+            cve_item["scorev4"] = cve_data[cve]["NVD-scorev4"]
             cve_item["vector"] = cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index a7e568e307..93d1fa1de6 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -255,7 +255,7 @@ def initialize_db(conn):
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
+            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
@@ -361,12 +361,18 @@ def update_db(conn, elt):
         cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
     except KeyError:
         pass
+    cvssv3 = cvssv3 or 0.0
+    try:
+        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
+        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
+        cvssv4 = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
+    except KeyError:
+        cvssv4 = 0.0
     accessVector = accessVector or "UNKNOWN"
     vectorString = vectorString or "UNKNOWN"
-    cvssv3 = cvssv3 or 0.0
 
-    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector, vectorString]).close()
+    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
 
     try:
         # Remove any pre-existing CVE configuration. Even for partial database
diff --git a/scripts/cve-json-to-text.py b/scripts/cve-json-to-text.py
index 5531ee5eb6..87a5669987 100755
--- a/scripts/cve-json-to-text.py
+++ b/scripts/cve-json-to-text.py
@@ -125,6 +125,8 @@ def process_data(filename, data):
                 lines += "CVSS v2 BASE SCORE: %s\n" % issue["scorev2"]
             if "scorev3" in issue:
                 lines += "CVSS v3 BASE SCORE: %s\n" % issue["scorev3"]
+            if "scorev4" in issue:
+                lines += "CVSS v4 BASE SCORE: %s\n" % issue["scorev4"]
             if "vector" in issue:
                 lines += "VECTOR: %s\n" % issue["vector"]
             if "vectorString" in issue:
-- 
2.30.2


