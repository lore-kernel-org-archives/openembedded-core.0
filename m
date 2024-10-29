Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E266CD3A683
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:13 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.1965.1730228409366399576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oMrYta6n;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so4636951a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228409; x=1730833209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOAOgGXG7NqPuQanQddpeTfdCnjGzhTmCAD1sMztCA4=;
        b=oMrYta6nERLWYWewaE63qsBdAPYPjxBCz5lLiWxLoHYMM3kJeRZyQyfrpl2FgGnqRK
         D2pLi+FGSdXUOZaHuzJ0TdspkEhOApvTM5Kfke/CtpEZQdJlpsto/lYgMSabSecQ+YSj
         QJwdD3z0/QBSRvxgqTiK+zJhirCzJHH56Fc2iNf4yC6hY0niWZTqVXF2VnLWLk5lofBD
         36kXgJBdBkb/nWZ+hGDb0dxBnm4pzUH/GlnF8kN/xTKXnR5vVy0cGk+cIJgoaMUEecdi
         RbokyICWAIaTfGaNbjcQyMY2LgEC1LFsZ8yA5Eyt48f1i0UU0XsDtJxHd99mRi2iMHC+
         lAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228409; x=1730833209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOAOgGXG7NqPuQanQddpeTfdCnjGzhTmCAD1sMztCA4=;
        b=b/EOWXoNFmd3+doWjri7lgj15vXPk+MaQAHr8dOPGUL5YzN/zpv6JlXjgf2sbF6mCa
         3AzmlTM9URqCEi25aIeopWWBln/Ccex7HgrwgSy624pc0wG2YIuDTolt+ZFvLkTNUxwO
         osiX+lXACGH7Mc6FAiPxseN4gEK6tnnw8TULvB7iulwWS1qHUzMq4xb0mdSU4qDGH7l/
         /lJIVpFTeO7GYNLsoQt8f78vhj5RDoss365BotWc0fCMjUnE0Sq8oc2ADgzNw2kRvGAM
         ZxJHUsAgxx6/IRzuIfckUkBMCfZXEMQySXRGht+3e3Xxabh634lAmFdkiY97i4vlYC2C
         kC7A==
X-Gm-Message-State: AOJu0YzajaWeG5K1uJ5JggSrNODGufEydhIuhFwrmReHCpeQc7j/E2oo
	Fl5z87W92xctvftEXxmeDNss3l/genQvl8DgKo8oti1FY+3gnwNmB/1qrrryb8IBRTwwFkz0hSa
	9
X-Google-Smtp-Source: AGHT+IHsCTDa/v68FlfVQ2E9A0TEK+fF9FBebAgtjCwKeA/dM13oUu/uVzUWcdJ7NaP1C9+mdxG0hg==
X-Received: by 2002:a05:6a20:e18a:b0:1d9:2bed:c7e7 with SMTP id adf61e73a8af0-1d9a84d785amr16288111637.39.1730228408524;
        Tue, 29 Oct 2024 12:00:08 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/19] cve-check: add CVSS vector string to CVE database and reports
Date: Tue, 29 Oct 2024 11:59:38 -0700
Message-Id: <3e47644d24d97c2541ccb70d91c144cf6530d5b0.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206515

From: Antoine Lubineau <antoine.lubineau@easymile.com>

This allows building detailed vulnerability analysis tools without
relying on external resources.

(From OE-Core rev: 048ff0ad927f4d37cc5547ebeba9e0c221687ea6)

Signed-off-by: Antoine Lubineau <antoine.lubineau@easymile.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


