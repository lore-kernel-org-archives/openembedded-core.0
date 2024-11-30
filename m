Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19E1D7360C
	for <webhook@archiver.kernel.org>; Sat, 30 Nov 2024 17:50:53 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.137653.1732989044197546620
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Nov 2024 09:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OiMXmz/o;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-841a9366b5eso102149839f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 09:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732989042; x=1733593842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZmEtgmhtreXrUWrHDbf73aR/qbNcJ7qdNY6mqxH5E8=;
        b=OiMXmz/oDjl/O6iTEfy8Hn/JeaLptmxqvlgrYVhphxsssgQs2EMgxRVJ3ZhedioZT+
         nylow4hG0xAAr2uANRTWiSA6Htn4wtPS12eLM1qC/sMv6RU1pWuQ4KAbuoVH2c4OcfRE
         bwDeoPrGhJsFtJeu5jz3kw9WSOMuXXfW7QGYK0Li/2Auhb+Fge7Wz/ChBNdV6ah1Vilq
         1pJN4IXD4OY6S8VI4BhQmSDofyiCka+6WkSbJpki3Jhucskz6pcgUVuidywUlx/JL5BI
         TneDNQgxmw5TwO5j4r9AgpXbd2rq0uryJx8IURK7TH3mlKqUNsXlMM4bf7CULBVMWQLW
         2bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732989042; x=1733593842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZmEtgmhtreXrUWrHDbf73aR/qbNcJ7qdNY6mqxH5E8=;
        b=VCNE68flCTyKnRxqRs0FB0YNfHFHxl3KFJlOPgtYZRDh4RcR9n5hwoIyFh+S8tP9It
         b4CK6My+t9F3P3g+swxRFQPZOCeN4JfhmSI0Dxu2SzIXWstGw/t6b0+BBQvbp7ZE62PF
         0+BKlv+70jkWUiYgm6rA1HvhsEuoPF2+O90PPksrlfU1v31N9Kfy4d7HURGwmNnJ74u6
         oxwNK6xYKVE6eLIF74OGQF1Qxcx1lktBlvSoxxsbH+4q0g/F/vUaEZjt04R6bbpM9Q/X
         eQ9GVA9zJ2rKcWGEX2DE0+NqD0eUSMfXHcXG95SHSS/VeR2AN5PJqR2OUAncurKQ84xh
         Lehg==
X-Gm-Message-State: AOJu0YzEwbJL4GfSC4wAtzGuNWW/ISj9Xjw8HbnvUgAgj4ax1wQPfW5v
	yzsqTo6BdS7GegS4wDbKLCwOIdOxVT0N4g1z59Ou7kRbbTIaYsjSOyMJJg==
X-Gm-Gg: ASbGncukbV0LGDZlVsOlAyspSKh0YyyFqrcUzbvLZ5Fmh3bOpKZxaASBB8iRYDLXlja
	an0e3BbIqs7+wdZtYBwSktd6RP5l4sXfTWJHxphSoc/HD9Xn9Po9juwog0IOaAxnwzc4nBEoTw0
	+bwGVTpYaMHYOy4dfpLQA/JkL+CbAqWBfSwA2z2rWHMKvJ/sjTRoaa7ajJCmEJFqDOrDxOIpZaQ
	GdcjHXxblIp9jGwp7J74uLuTQbMOzHwc9I0xsdmOw8Pn/dDiYftTVTS+6be7Lkz
X-Google-Smtp-Source: AGHT+IHIoqoy8ZwlGNZZicgivqstkj4IlZPvVID1HGC8Dg4PxuxD8dbfpNh6tk0j16N45LYHU4AF9Q==
X-Received: by 2002:a05:6602:15cf:b0:83a:a82b:f856 with SMTP id ca18e2360f4ac-843ece81b4fmr1980891839f.3.1732989042587;
        Sat, 30 Nov 2024 09:50:42 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230dcaaddsm1255099173.41.2024.11.30.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 09:50:41 -0800 (PST)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
Subject: [PATCH] cve-check: Add versioned CVSS vector strings
Date: Sat, 30 Nov 2024 17:50:38 +0000
Message-Id: <20241130175038.870014-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Nov 2024 17:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208046

Currently, cve-check includes a vector string for each CVE included in
the issue list for each package. This vector string is the lowest
CVSS version that's available. For example, if a CVE has both a v2 and
v3.1 vector strint, the v2 vector string is only included.

This patch adds each supported vector string (v2, v3, and v4). For v3,
v3.1 is preferred over v3. If a vector string is not available for a
given verison, the string will default to "UNKNOWN".

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
---
This is an alternative patch to "cve-update-nvd2-native: Update vector
logic" where each versioned vector string is attempted to be included.
This does introduce a breaking API change, where vectorString has been
removed and replaced with the versioned vectorString variables. I tried
to update all references to the current use of vector strings, but I
was a little confused looking at meta/lib/oe/spdx30.py. I'm not sure if
this change will affect that file. I did turn on SPDX generation and
ran another build. I looked at the outputs, but didn't see any vector
string output.

 meta/classes/cve-check.bbclass                | 20 +++++----
 meta/classes/vex.bbclass                      |  4 +-
 .../meta/cve-update-nvd2-native.bb            | 42 ++++++++++++++-----
 scripts/cve-json-to-text.py                   |  8 +++-
 4 files changed, 52 insertions(+), 22 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6e10dd915a..eacfa7b041 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,7 +31,7 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
+CVE_CHECK_DB_FILENAME ?= "nvdcve_2-3.db"
 CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
@@ -449,12 +449,14 @@ def get_cve_info(d, cve_data):
                 continue
             #cve_data[row[0]] = {}
             cve_data[row[0]]["NVD-summary"] = row[1]
-            cve_data[row[0]]["NVD-scorev2"] = row[2]
-            cve_data[row[0]]["NVD-scorev3"] = row[3]
-            cve_data[row[0]]["NVD-scorev4"] = row[4]
-            cve_data[row[0]]["NVD-modified"] = row[5]
-            cve_data[row[0]]["NVD-vector"] = row[6]
-            cve_data[row[0]]["NVD-vectorString"] = row[7]
+            cve_data[row[0]]["NVD-vectorStringV2"] = row[2]
+            cve_data[row[0]]["NVD-scorev2"] = row[3]
+            cve_data[row[0]]["NVD-vectorStringV3"] = row[4]
+            cve_data[row[0]]["NVD-scorev3"] = row[5]
+            cve_data[row[0]]["NVD-vectorStringV4"] = row[6]
+            cve_data[row[0]]["NVD-scorev4"] = row[7]
+            cve_data[row[0]]["NVD-modified"] = row[8]
+            cve_data[row[0]]["NVD-vector"] = row[9]
         cursor.close()
     conn.close()
 
@@ -539,12 +541,14 @@ def cve_write_data_json(d, cve_data, cve_status):
         }
         if 'NVD-summary' in cve_data[cve]:
             cve_item["summary"] = cve_data[cve]["NVD-summary"]
+            cve_item["vectorStringV2"] = cve_data[cve]["NVD-vectorStringV2"]
             cve_item["scorev2"] = cve_data[cve]["NVD-scorev2"]
+            cve_item["vectorStringV3"] = cve_data[cve]["NVD-vectorStringV3"]
             cve_item["scorev3"] = cve_data[cve]["NVD-scorev3"]
+            cve_item["vectorStringV4"] = cve_data[cve]["NVD-vectorStringV4"]
             cve_item["scorev4"] = cve_data[cve]["NVD-scorev4"]
             cve_item["modified"] = cve_data[cve]["NVD-modified"]
             cve_item["vector"] = cve_data[cve]["NVD-vector"]
-            cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:
             cve_item["detail"] = cve_data[cve]["status"]
         if 'justification' in cve_data[cve]:
diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 01d4e52051..5e0131788d 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -280,11 +280,13 @@ def cve_write_data_json(d, cve_data, cve_status):
         }
         if 'NVD-summary' in cve_data[cve]:
             cve_item["summary"] = cve_data[cve]["NVD-summary"]
+            cve_item["vectorStringV2"] = cve_data[cve]["NVD-vectorStringV2"]
             cve_item["scorev2"] = cve_data[cve]["NVD-scorev2"]
+            cve_item["vectorStringV3"] = cve_data[cve]["NVD-vectorStringV3"]
             cve_item["scorev3"] = cve_data[cve]["NVD-scorev3"]
+            cve_item["vectorStringV4"] = cve_data[cve]["NVD-vectorStringV4"]
             cve_item["scorev4"] = cve_data[cve]["NVD-scorev4"]
             cve_item["vector"] = cve_data[cve]["NVD-vector"]
-            cve_item["vectorString"] = cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:
             cve_item["detail"] = cve_data[cve]["status"]
         if 'justification' in cve_data[cve]:
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index a68a8bb89f..69cd3ebb9a 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -259,8 +259,11 @@ def initialize_db(conn):
 
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
-        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
+        c.execute(
+            "CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
+            VECTORSTRINGV2 TEXT, SCOREV2 TEXT, VECTORSTRINGV3 TEXT, SCOREV3 TEXT, \
+            VECTORSTRINGV4 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VECTOR TEXT)"
+        )
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
@@ -334,7 +337,9 @@ def update_db(conn, elt):
     """
 
     accessVector = None
-    vectorString = None
+    vectorStringV2 = None
+    vectorStringV3 = None
+    vectorStringV4 = None
     cveId = elt['cve']['id']
     if elt['cve']['vulnStatus'] ==  "Rejected":
         c = conn.cursor()
@@ -349,35 +354,50 @@ def update_db(conn, elt):
     date = elt['cve']['lastModified']
     try:
         accessVector = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['accessVector']
-        vectorString = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['vectorString']
+        vectorStringV2 = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['vectorString']
         cvssv2 = elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
     except KeyError:
         cvssv2 = 0.0
     cvssv3 = None
     try:
         accessVector = accessVector or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
+        vectorStringV3 = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
         cvssv3 = elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
     except KeyError:
         pass
     try:
         accessVector = accessVector or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
+        vectorStringV3 = elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
         cvssv3 = cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
     except KeyError:
         pass
     cvssv3 = cvssv3 or 0.0
     try:
         accessVector = accessVector or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
-        vectorString = vectorString or elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
+        vectorStringV4 = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
         cvssv4 = elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
     except KeyError:
         cvssv4 = 0.0
     accessVector = accessVector or "UNKNOWN"
-    vectorString = vectorString or "UNKNOWN"
-
-    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
+    vectorStringV2 = vectorStringV2 or "UNKNOWN"
+    vectorStringV3 = vectorStringV3 or "UNKNOWN"
+    vectorStringV4 = vectorStringV4 or "UNKNOWN"
+
+    conn.execute(
+        "insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
+        [
+            cveId,
+            cveDesc,
+            vectorStringV2,
+            cvssv2,
+            vectorStringV3,
+            cvssv3,
+            vectorStringV4,
+            cvssv4,
+            date,
+            accessVector,
+        ],
+    ).close()
 
     try:
         # Remove any pre-existing CVE configuration. Even for partial database
diff --git a/scripts/cve-json-to-text.py b/scripts/cve-json-to-text.py
index 87a5669987..3bab2426d6 100755
--- a/scripts/cve-json-to-text.py
+++ b/scripts/cve-json-to-text.py
@@ -121,16 +121,20 @@ def process_data(filename, data):
                 lines += "CVE DESCRIPTION: %s\n" % issue["description"]
             if "summary" in issue:
                 lines += "CVE SUMMARY: %s\n" % issue["summary"]
+            if "vectorStringV2" in issue:
+                lines += "VECTORSTRING v2: %s\n" % issue["vectorStringV2"]
             if "scorev2" in issue:
                 lines += "CVSS v2 BASE SCORE: %s\n" % issue["scorev2"]
+            if "vectorStringV3" in issue:
+                lines += "VECTORSTRING v3: %s\n" % issue["vectorStringV3"]
             if "scorev3" in issue:
                 lines += "CVSS v3 BASE SCORE: %s\n" % issue["scorev3"]
+            if "vectorStringV4" in issue:
+                lines += "VECTORSTRING v4: %s\n" % issue["vectorStringV4"]
             if "scorev4" in issue:
                 lines += "CVSS v4 BASE SCORE: %s\n" % issue["scorev4"]
             if "vector" in issue:
                 lines += "VECTOR: %s\n" % issue["vector"]
-            if "vectorString" in issue:
-                lines += "VECTORSTRING: %s\n" % issue["vectorString"]
             lines += "MORE INFORMATION: https://nvd.nist.gov/vuln/detail/%s\n" % issue["id"]
             lines += "\n"
 
-- 
2.34.1


