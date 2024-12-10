Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2C1E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 11:49:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.8393.1733831359390686829
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 03:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgqcS+dW;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a742481aso49446085e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 03:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733831357; x=1734436157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llgQvTX/hvDP/aOU1rLE47P2LtryoS5sr7Qe3U+5tTY=;
        b=PgqcS+dWDc0zEG9I28ZWxA2ZQDmfrHGPG1AwgkgnctoP1xiywSjPpF5jWMJhfPzXYj
         HLtZtih/1BuofFcIcFAlIP2CaM4SvHf4PEiI+Cr5YJemT/se8BBHE/QJhyGpqY7fV8Wn
         5R9D1d10CeE1O7NpYKoay7mJRIExk/cxsxc8e3qtu2WwzLkntJ99ypQtFQ896C2zNwgo
         +AKYO2aE5MjJpYHNTvCiYWCpA+nuN7ArBpL3dzDjF6FkXnvXE4GO606mSpXCxUCzFgxA
         iE9f+alqMVDaqwSvacOOd0w6gbGB0Zkeaws5LuhH0T+s94aC1UxOJKDpcNKShZb7Ca/O
         +Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733831357; x=1734436157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llgQvTX/hvDP/aOU1rLE47P2LtryoS5sr7Qe3U+5tTY=;
        b=qX6cerKZmF8cIAB5C9+j/4DE8dcKoK6qOPU7o93oPLMAdG2iUj+vyWhVOr0rmLsfAS
         2fL9PnVYwU0a4WApakj6RrnLicmOo0knRXlccmnLgjZMmaLV9L0VW86oxUS+p1G9w93b
         1rqw0WeqNkVDGRbaoB1g5TWc8yNpfblaO7FZ0xkZTkY0+FMqOVyMJM/K2ay/AVOHkFia
         vKfb+8SnM6snQabDcl4ykGmP8ipoL8SQHIMrd1RseOB7M0AjqWfpSVUOgjJn46vrkHsa
         WAfUsMQloMimiVEqlteHRN5t1psH2R1u45CLqXfmc3M0JPuemWoktmMHJQ34scQKZ/GL
         nSmw==
X-Gm-Message-State: AOJu0Yxked48VvVlJIOGDim96OJ68uUv+JYgVUPJsisLWKZrkZrgKB9G
	STZg08ZZ6lGBIFAbo0vAAX7YYQ8NKB79f6Mh3v7YFktpMRdeDRRgF7K/NA==
X-Gm-Gg: ASbGncvPbr8ae9dvdVf4A+NFOOLcMPJgt4QE84Z/nUgPozpTAVLBMoyq/GCP50ycrlC
	xIJ/GgdUxduCK+bwKtMhKZwSYWicdO+SQJu7DAvTvV+cikgnlLfm59yIawQh7it+xoZH8AVWrFG
	ECfw1NN+bT2nmfJLM2wWz4O0t2m6ZDGpgqYkz68GijMHZl5vAGBpDLW8cHjzMLWtYFqiN6mkQ3e
	m4M7YCJgKEuh4E9cgmkZCfr8qe9YfX9uvoblToZK1g06MTg+GlVnC1ZSSgvjNevkQQ=
X-Google-Smtp-Source: AGHT+IF2slhZxizTZzZ6cSIx2ZMfF5y7SUcvIg+kdixx+Qbd5SeTVzvjJzZbgvQ3EYypskgSzrXkJA==
X-Received: by 2002:a05:600c:5492:b0:434:faa9:5266 with SMTP id 5b1f17b1804b1-434faa953d2mr56691955e9.13.1733831357130;
        Tue, 10 Dec 2024 03:49:17 -0800 (PST)
Received: from voyage.lan ([2a0d:3344:23bc:5a10:70e8:c835:72ed:f8f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf3efasm15569553f8f.17.2024.12.10.03.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 03:49:16 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [RFC 2/3] cve-update-db-native2: update structure
Date: Tue, 10 Dec 2024 12:48:06 +0100
Message-ID: <20241210114839.1579228-3-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210114839.1579228-1-marta.rybczynska@ygreky.com>
References: <20241210114839.1579228-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 11:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208525

Update the database structure and tasks to fit the current YP master.
This means:
- add the unpack task
- update the database structure (CVSS, vector string)

However, the old feed does not include CVSS4

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 .../meta/cve-update-db-native2.bb             | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native2.bb b/meta/recipes-core/meta/cve-update-db-native2.bb
index e042e67b09..9077e7686e 100644
--- a/meta/recipes-core/meta/cve-update-db-native2.bb
+++ b/meta/recipes-core/meta/cve-update-db-native2.bb
@@ -5,7 +5,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 inherit native
 
-deltask do_unpack
 deltask do_patch
 deltask do_configure
 deltask do_compile
@@ -21,6 +20,9 @@ CVE_DB_UPDATE_INTERVAL ?= "86400"
 # Timeout for blocking socket operations, such as the connection attempt.
 CVE_SOCKET_TIMEOUT ?= "60"
 
+CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
+CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
+
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
 
 python () {
@@ -38,7 +40,7 @@ python do_fetch() {
 
     bb.utils.export_proxies(d)
 
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    db_file = d.getVar("CVE_CHECK_DB_DLDIR_FILE")
     db_dir = os.path.dirname(db_file)
     db_tmp_file = d.getVar("CVE_DB_TEMP_FILE")
 
@@ -72,10 +74,16 @@ python do_fetch() {
         os.remove(db_tmp_file)
 }
 
-do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
+do_fetch[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK}"
 do_fetch[file-checksums] = ""
 do_fetch[vardeps] = ""
 
+python do_unpack() {
+    import shutil
+    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_CHECK_DB_FILE"))
+}
+do_unpack[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_LOCK}"
+
 def cleanup_db_download(db_file, db_tmp_file):
     """
     Cleanup the download space from possible failed downloads
@@ -183,7 +191,7 @@ def initialize_db(conn):
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, VECTOR TEXT, VECTORSTRING TEXT)")
 
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
@@ -263,23 +271,29 @@ def update_db(conn, jsondata):
             continue
 
         accessVector = None
+        vectorString = None
+        cvssv2 = 0.0
+        cvssv3 = 0.0
+        cvssv4 = 0.0
         cveId = elt['cve']['CVE_data_meta']['ID']
         cveDesc = elt['cve']['description']['description_data'][0]['value']
         date = elt['lastModifiedDate']
         try:
             accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
+            vectorString = elt['impact']['baseMetricV2']['cvssV2']['vectorString']
             cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
         except KeyError:
             cvssv2 = 0.0
         try:
             accessVector = accessVector or elt['impact']['baseMetricV3']['cvssV3']['attackVector']
+            vectorString = vectorString or elt['impact']['baseMetricV2']['cvssV3']['vectorString']
             cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
         except KeyError:
             accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
 
-        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).close()
+        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVector, vectorString]).close()
 
         configurations = elt['configurations']['nodes']
         for config in configurations:
-- 
2.45.2


