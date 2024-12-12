Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC56E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 06:55:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.14206.1733986500143957496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 22:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5bhZWdJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so118100f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 22:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733986498; x=1734591298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPUAHgbmxRJowWnByWQMHPf8LTBKwM52UjbDKXf9zKs=;
        b=Q5bhZWdJ3b11y1WvUPsHO14rLGn1KdgtfHEfPeJkC9dQOza45fCDy3hNuIXvNQQKZl
         CjwR4sD+N+xSuoK89EkqiTn268GcqbLas0JaJh+DOK9bNSKiejyZtBDfg/1/UVxxnIp0
         Qb0GRqzMFBczO8/3KSAUxgZdpkUHrTjtjmmlKiNQVCGmrEaKDHhzhvMFlIq+FYjpy0Q3
         7YnOXObQLEAEA5GWCfj+bL7pYBEKx3PjB8yoj+Z1C+ncoGIOMKFsntj73xOXxDNNHfv6
         0ZiSCi8JJsv4MR+hLBDjLwoPvRIv3EtSjfJy6f7Yc+/JZF8mYLBuhW3WNM165q/KbCUZ
         71sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986498; x=1734591298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPUAHgbmxRJowWnByWQMHPf8LTBKwM52UjbDKXf9zKs=;
        b=Wkdc1z0pZVuURrSR34nu4CYeselImYIzJmOxA09JNIz+0eKF7r9d90fsFx/Wh+cLk9
         kX4IbQlJCJrMb5PIV8GbY+HIQWCWxEsOr1VvwjQH+cYUKIjN0uvQb/BhgSdSt87CLRLv
         JLSwLgq6kBLG/17UrIVzqMmA9chxMs8r/oD5gvSCvSxN8Ouc0OycPTIxqL4XlbS1MhN7
         zdt6FJUl1yVHWSs5jtKn4dyDZGDo7UhSULqVo2qxWEQO0fsr80P8kOlAIk4tz5lf1WPY
         D5q3YKK98hVeIobNubi0yWEf0rDOR5A8Pu+iVsRDBphFJakJTU5IfeimoCisAAMNL/b5
         h5OA==
X-Gm-Message-State: AOJu0YykDl1k5f8San2IErch8VlcT/JI2Aksq+X5GBngm4Bu6CUI6v6T
	rb6KtVadfFaNoBMJzKX0y2/RCqe99ld4ICWhaq2rn2mwLOAplHJ28dGcKQ==
X-Gm-Gg: ASbGncvPchUV6fn2Sd3xGxvADKwTOsnJOQ4xnv0sVDf7d1aIVWE2ZfEMTaijPiKrrCn
	249tLOy/GKogcWrLrorA9NDClf262ozsugVwy4cU5wDjGD+C19+iaK5uBVkqII3P8l2Q7pSfYC4
	oorVYO7uC9ckPu/W8+j4rB/EaUjA5onQ52OAxeeVMUUF9vV60xshL2U9zKZw6hLsq6p4id9848q
	D6jz1F0sfjRWUZDq71qqAw3zIh74sS4McDCgZrah1Vipb0BkweKGhXzG1gUoWxcWs4B8w==
X-Google-Smtp-Source: AGHT+IFwg+vNULUEMJaovubvoFKZjxoigmeblUdhZ7+A36zZyVPyQpFSzQD6F0WRq2MaVUo1vyCIBg==
X-Received: by 2002:a05:6000:78a:b0:385:f72a:a3b0 with SMTP id ffacd0b85a97d-387877dc9eamr1562003f8f.55.1733986497734;
        Wed, 11 Dec 2024 22:54:57 -0800 (PST)
Received: from voyage.lan ([2a0d:3344:23bc:5a10:70e8:c835:72ed:f8f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm3154021f8f.74.2024.12.11.22.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:54:56 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [RFC v2 2/4] cve-update-db-native: update structure
Date: Thu, 12 Dec 2024 07:54:20 +0100
Message-ID: <20241212065435.15582-3-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
References: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:55:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208623

Update the database structure and tasks to fit the current YP master.
This means:
- add the unpack task
- update the database structure (CVSS, vector string)

However, the old feed does not include CVSS4

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e042e67b09..f16e79ff58 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
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
+            vectorString = vectorString or elt['impact']['baseMetricV3']['cvssV3']['vectorString']
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


