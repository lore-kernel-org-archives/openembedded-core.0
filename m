Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86C0D3A681
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:13 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1938.1730228411414553827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eQe1ZcIv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so4214352b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228410; x=1730833210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvyCG01TDWTyMCW5iCqgbWukzPVGYL/5ORCcUYzxxs4=;
        b=eQe1ZcIvS4kc9G/dicfeuJyB9CAZb6iZT0sMAawJyv8bU2vG7kPtMZp4wkNbbnAvnH
         isxoZZsSY8xnfKA7VyHT7KWwJcr9ovTnkD4WresoYJcK9NK7KN8X+uIjneMYSgQ9lOgg
         ou7odNG1qsrRHTqG2c8ijNKeS+efRdpEGtV4EA0OoH37N6zXWWifn+ot0dq9manGTzas
         CtQekiZAGGZpAx03EEphqDDTfRx0DyZmfoe3XMXUjRK9zKZsWyITpXPg23C/AGtHVT13
         ufVz1Lu0nRjvuPLBiQllF383KaXD0omF29f5/0ar32VEv2jJ/CuaRmc8rQuIrAYp3Ip8
         L0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228410; x=1730833210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvyCG01TDWTyMCW5iCqgbWukzPVGYL/5ORCcUYzxxs4=;
        b=pr4GFbiPrDfNaS+x3Mz9BkqayZ63cPAdwT8+sR45ZqCaOCYEfImY2lo7QWU/F7/lFX
         Eok/vFbqb2M9mzgb500SAqW+n3KlTCxZLQP7hKW9PaNvopunlJC9SwqsszCnw5czsfcJ
         DeNcKs1gZjlsQGRCyeWGEWb7iCDyE8784CRJX/Rqu9pYnKL5Vm4h+QKo7P2RdQJCKGfN
         re9d30VyuFiRJ30jo7F6AgGE3b51J/50GEnLL1737XTP77p913qqFAsdNuIDo0N0WHSL
         rFEBFTfsCsdBRTWM+OVDeDUhIH8xDfcZDJMi6ny0QM9Gm/bfR2a20bG2q42WH1F5CtZX
         1hJQ==
X-Gm-Message-State: AOJu0YyiRvY5iGtti2YIP6lJqcKarVsGzr2FNJ9yIVRt2j8y2cqb2+9Q
	9VL6MZoU/LkPZnAonNTl8UzRfAxv6QHfzMI4HQut/UQGk0aZEY5WgYliTf/jXGjW9b69K2NYWGf
	/
X-Google-Smtp-Source: AGHT+IHnrfCzbVv3wN4Ku5rRo9IpEiyBO9HjO+7C1OrFV0T0IIiqOntlDF+3BTsJ4+F8O+oopXDoGQ==
X-Received: by 2002:a05:6a00:2308:b0:71e:374c:b9aa with SMTP id d2e1a72fcca58-72063099337mr16464500b3a.27.1730228410377;
        Tue, 29 Oct 2024 12:00:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/19] cve-check: add support for cvss v4.0
Date: Tue, 29 Oct 2024 11:59:39 -0700
Message-Id: <8c20a7badb6e5d6c6c90176e45e90f776df25298.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206516

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass                   | 11 +++++++----
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 14 ++++++++++----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index b47c61da63..dd9847f366 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-1.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-2.db"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -397,9 +397,10 @@ def get_cve_info(d, cves):
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
@@ -455,6 +456,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
         write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
+        write_string += "CVSS v4 BASE SCORE: %s\n" % cve_data[cve]["scorev4"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "VECTORSTRING: %s\n" % cve_data[cve]["vectorString"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
@@ -570,6 +572,7 @@ def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_status):
             "summary" : cve_data[cve]["summary"],
             "scorev2" : cve_data[cve]["scorev2"],
             "scorev3" : cve_data[cve]["scorev3"],
+            "scorev4" : cve_data[cve]["scorev4"],
             "vector" : cve_data[cve]["vector"],
             "vectorString" : cve_data[cve]["vectorString"],
             "status" : status,
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 060545b1e3..b4c46ef756 100644
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
2.34.1


