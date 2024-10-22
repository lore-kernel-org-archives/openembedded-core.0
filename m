Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88E4CDD0EA
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 21:28:52 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.5418.1729632522447925626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 14:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JalFVMHv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241022212839d27206fd7e68609674-knxf_y@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241022212839d27206fd7e68609674
        for <openembedded-core@lists.openembedded.org>;
        Tue, 22 Oct 2024 23:28:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=dzP9Kcj8mnkTK2HmX8fTYYXvVK3+h/Zz2rCoC4zN29I=;
 b=JalFVMHvIRyvEvAPxbEoBBqjj2EM2JxNBlGKijG+xD6Bx9UG+Rsj8m4wOQMHFO0uZDPrgO
 huNz9GX+woBs2QYDt+3nHKJ1EstDs4qtAQOnvaVbVLPS1aGtCtuAv4tBjCagF45HAIGxlk59
 JzmP0T9N9lZuwuMUSGL1U8W2Aj5r0tSdgT/pGkb1Gfd1w3BDd3XdjfBz9xiqQ8rP4aZZDnyk
 VVYAJdGlJkXUXYl9J711CL6WKjrufIR4VYOt7sERR/cOt2hi6rYcQN0hWF/NZkHlYYy0BiIx
 OnW4AJldKtZvyIToJdjrLBpwTk6XyjTutqXatEaPXGXw3LIfUts/RuRA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] cve-check: add support for cvss v4.0
Date: Tue, 22 Oct 2024 23:27:50 +0200
Message-Id: <20241022212750.25402-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 21:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206180

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
index a5104f210b..ea1d492d61 100644
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
             cve_item["vector"] = cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:
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
index 2d23d28c3e..5fbe9095cc 100644
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


