Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33197D63943
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13829.1732111035916126553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rhogiC/8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20e576dbc42so58917845ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111035; x=1732715835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlLYLpdzGpl9yG9M/aQqTTpQdM2uEHM7JTTNx9AOiGc=;
        b=rhogiC/8AyjOPy8Bopcv4Egy/wDnbSqWcPNXun4L8L6LZkEqQ/jBrKzdNjz8cX9C2u
         RsMEefMLZVaBo/1bA54c4bpou4l/1fvqZpx4QTY9W8xV8ltPQmWaXeI8qAhw2uMmdMeF
         zxjB+eV8/EZJzpjZdPUbaXhKXYbk7ezQPMJlTchBSqs1U6kluYw0n4liESbVx+FYV5ek
         4TZCyf/JwYmx+fSZBtdOvZ5jkF4hbjpIAVR1i/XEK9cWSVtAgP18gKGWoCozzTYnEFdj
         Ke0EgP8lw5UslyRyy+Av+K0urEHbfCxtOIAxX0QU7/CTUOHPBUgYEFua5pJxhUGdmJu5
         H5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111035; x=1732715835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlLYLpdzGpl9yG9M/aQqTTpQdM2uEHM7JTTNx9AOiGc=;
        b=OLQF19rbf0MkmFHMltDTciUyd2B9SFlUbKO7dvCn80KrzVkimKM0XaPEPPLTG103BB
         L75OQzOe6iynzAnCTsQxFg//2rMhKZz5R+V+KtrRdHdChHEqUwQfNg3oexyOYmzWdgDf
         ihSvTwuMznP/5PFr2/8XabmmuTWIyXx7m7hT53pNLMUE4uLcG28j6mf97QUVzqmB+SXL
         O9M89foCBtuH2tGzdKd6vUz4ji7nS7r5jgtpBWlg1HIA1xwNBm2dj/zH5rICS8GBaYyw
         5ddYrpatE29ppbEraDr/DZALqJSoT/+Z/J8TWxAnV0wmKQXf/A3ame/7/x9YmJee0QTd
         kgCA==
X-Gm-Message-State: AOJu0YwMuwi90ruy4MYbGq0hn65ep5NiQ9l3zisQ6++YUKTES/vvTE5m
	VwcqrfBYIxRlP0JDX7v64ELD4IwLvBW5op8Ol1+fJCOxTVVscyWTTDvwI2CRQWKWaskqlyOPCPP
	H
X-Google-Smtp-Source: AGHT+IF90yZ/4mz/fk7qrVqhIVHYhKUYNKbb1dKQGWNQHk9l5BTf6D6p9D5nvfYtrKBJhk4f8CbE5A==
X-Received: by 2002:a17:903:2310:b0:20e:a2f7:8ab9 with SMTP id d9443c01a7336-2126aea848amr25394245ad.27.1732111035100;
        Wed, 20 Nov 2024 05:57:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 02/31] cve-check: add support for cvss v4.0
Date: Wed, 20 Nov 2024 05:56:34 -0800
Message-Id: <7ce34ce58f83bc02fa2c04bec54e358e8614157e.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207426

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 358dbfcd80ae1fa414d294c865dd293670c287f0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


