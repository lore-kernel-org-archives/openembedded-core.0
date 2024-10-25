Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AAED149EF
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 20:18:53 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.4833.1729887522890769035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 13:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XDysot4s;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2024102520183980fa6ebfb53f71c39c-p8ayhb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024102520183980fa6ebfb53f71c39c
        for <openembedded-core@lists.openembedded.org>;
        Fri, 25 Oct 2024 22:18:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1vzApMww26d4tlzoHZcM7rUxuOTQhLeyn+J2kJkQinE=;
 b=XDysot4s8BQEzsvy9eMtrLSWyXOfDdkKo0vPkCr9UnJ9lWe3oxCBGSZ34kIhAoPt9wlpdu
 pC+B7piV2rNXnM6CyNP7QCEynvYECS1uqgP4cntlw/p8xmXEfkYG914Bd6PVB6AEpvZjaKSk
 gO9I/UHithVsPbczBdOymgaAf8HenYA6lCRdsBysZq6i8pOb1h75OWoIlW/JIKVsSCokf7a5
 4YFah+ZDj5JE/Dh2uXzNYNexJ3bWoomvWYmCmIYJht4l4pMAlveP/mKuji8yZWHQaXb7srNn
 dmWUpYWKbkh6tetVZAIPmMRZfUlArftBt9/iylSnke4VDSeCa5ETWBhw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH] cve-check: add support for cvss v4.0
Date: Fri, 25 Oct 2024 22:17:42 +0200
Message-Id: <20241025201742.7955-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 20:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206374

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

(From OE-Core rev: 358dbfcd80ae1fa414d294c865dd293670c287f0)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass                   | 11 +++++++----
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 93a2a1413d..d287cf1457 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,7 +32,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-1.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-2.db"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -447,9 +447,10 @@ def get_cve_info(d, cves):
             cve_data[row[0]]["summary"] = row[1]
             cve_data[row[0]]["scorev2"] = row[2]
             cve_data[row[0]]["scorev3"] = row[3]
-            cve_data[row[0]]["modified"] = row[4]
-            cve_data[row[0]]["vector"] = row[5]
-            cve_data[row[0]]["vectorString"] = row[6]
+            cve_data[row[0]]["scorev4"] = row[4]
+            cve_data[row[0]]["modified"] = row[5]
+            cve_data[row[0]]["vector"] = row[6]
+            cve_data[row[0]]["vectorString"] = row[7]
         cursor.close()
     conn.close()
     return cve_data
@@ -514,6 +515,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
         write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
+        write_string += "CVSS v4 BASE SCORE: %s\n" % cve_data[cve]["scorev4"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "VECTORSTRING: %s\n" % cve_data[cve]["vectorString"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
@@ -631,6 +633,7 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
             "summary" : cve_data[cve]["summary"],
             "scorev2" : cve_data[cve]["scorev2"],
             "scorev3" : cve_data[cve]["scorev3"],
+            "scorev4" : cve_data[cve]["scorev4"],
             "vector" : cve_data[cve]["vector"],
             "vectorString" : cve_data[cve]["vectorString"],
             "status" : status,
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1901641965..92177712dc 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -247,7 +247,7 @@ def initialize_db(conn):
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
+            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
@@ -353,12 +353,18 @@ def update_db(conn, elt):
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
-- 
2.30.2


