Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54194D149F0
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 20:21:53 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.5051.1729887712336056695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 13:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CavP34su;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024102520215035f97e5b92e5897d95-cy4d5n@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024102520215035f97e5b92e5897d95
        for <openembedded-core@lists.openembedded.org>;
        Fri, 25 Oct 2024 22:21:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+xxfs/4KcfkM16KRIP7XPIY1gtKjXT6WWuYo3dLSrWs=;
 b=CavP34suh4dDgFgJKGdYe9PH3J179FUDdIzKn7YhDPZQa3sBWVGr+VZxaNmlyeAol8Y90n
 FfV6KgMaYoCeM1oS2zVqLbONSaXZwya5xhvT3kibOx7yUH1ri8JI8egZM0TxidCuabwu2qy7
 IlHkDymKftKfQJxwOixxqhEnyArer5psyTVD4jDNqkuVXGP37du/y8turGukkGsuXRfSBt9z
 0J0VOGZnXN4TXZAJ0wr8UWaU+HnglgaVfgjcw+pTJykURBkuM06q/a9msVlUeKWaa9T/6aUj
 kAYO2S/Qi/3nQW4ijEqmuoIwE6O5agJ3qmv8Y7EVIFFiC+Msvw9QTs0A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Antoine Lubineau <antoine.lubineau@easymile.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] cve-check: add CVSS vector string to CVE database and reports
Date: Fri, 25 Oct 2024 22:21:00 +0200
Message-Id: <20241025202101.8360-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 20:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206375

From: Antoine Lubineau <antoine.lubineau@easymile.com>

This allows building detailed vulnerability analysis tools without
relying on external resources.

(From OE-Core rev: 048ff0ad927f4d37cc5547ebeba9e0c221687ea6)

Signed-off-by: Antoine Lubineau <antoine.lubineau@easymile.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass                   |  5 ++++-
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 11 ++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f554150d94..b47c61da63 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-1.db"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -399,6 +399,7 @@ def get_cve_info(d, cves):
             cve_data[row[0]]["scorev3"] = row[3]
             cve_data[row[0]]["modified"] = row[4]
             cve_data[row[0]]["vector"] = row[5]
+            cve_data[row[0]]["vectorString"] = row[6]
         cursor.close()
     conn.close()
     return cve_data
@@ -455,6 +456,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
         write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
+        write_string += "VECTORSTRING: %s\n" % cve_data[cve]["vectorString"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
     if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
@@ -569,6 +571,7 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
             "scorev2" : cve_data[cve]["scorev2"],
             "scorev3" : cve_data[cve]["scorev3"],
             "vector" : cve_data[cve]["vector"],
+            "vectorString" : cve_data[cve]["vectorString"],
             "status" : status,
             "link": issue_link
         }
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1a3eeba6d0..060545b1e3 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -247,7 +247,7 @@ def initialize_db(conn):
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
@@ -321,6 +321,7 @@ def update_db(conn, elt):
     """
 
     accessVector = None
+    vectorString = None
     cveId = elt['cve']['id']
     if elt['cve']['vulnStatus'] ==  "Rejected":
         c = conn.cursor()
@@ -335,25 +336,29 @@ def update_db(conn, elt):
     date = elt['cve']['lastModified']
     try:
         accessVector = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['accessVector']
+        vectorString = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['vectorString']
         cvssv2 = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
     except KeyError:
         cvssv2 = 0.0
     cvssv3 = None
     try:
         accessVector = accessVector or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
+        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
         cvssv3 = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
     except KeyError:
         pass
     try:
         accessVector = accessVector or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
+        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
         cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
     except KeyError:
         pass
     accessVector = accessVector or "UNKNOWN"
+    vectorString = vectorString or "UNKNOWN"
     cvssv3 = cvssv3 or 0.0
 
-    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
+    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector, vectorString]).close()
 
     try:
         # Remove any pre-existing CVE configuration. Even for partial database
-- 
2.30.2


