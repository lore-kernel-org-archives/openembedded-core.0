Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9BAE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 10:26:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.31291.1735035984420554431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 02:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bXJR9xyy;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e87b25f0so3894426f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 02:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735035982; x=1735640782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPUAHgbmxRJowWnByWQMHPf8LTBKwM52UjbDKXf9zKs=;
        b=bXJR9xyyg968hlSIONt4fk8xDTXUFv+5msTrUyNncZcAEelRQijIZh8+2oxFT6Hy2T
         3YuMSANe/XEkBzaiIKKWPsxHNXXSCSuUfB0D3JXeeiIju0JbKqF1ENXTzQZ7pmwuYw74
         uz0adD4Hr5wF1paC9DlmiGd5zbWiN4XVpqQeknEDll868fGXxc3Cj51MTZpFIBs0yrw2
         NTmNV6iJHKliqtpAu0KO1Di8xhRkLmVJPEVzm3hsLjsouWzn+c7SXok+bconvC6nGGQK
         qgm5furBa5wgObKcyb482E6tchHLwtvwq71YXqFHL9RU4Tggv3OQAdywW5BRkHpNSemb
         oqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035982; x=1735640782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPUAHgbmxRJowWnByWQMHPf8LTBKwM52UjbDKXf9zKs=;
        b=PN1wnT6feKCRiT27ncIAf93Zrt5JXKHCtz9EXWnmFDRlzXGULUZ/2xmSqPs1oiq1oD
         wxhTG0fBYtzhXsbkTxym7h0/Mbakm/+M+P7zZWwrXCOXbcJUzZ5Wfww3F1Ir/PEIuht6
         aLskrTQkvo6uRJo2qWcsL3SFc68HHu7Z9e4petBcQPnn/71T73oVRpJaRdjhm9dA0WIk
         B2JncTt6Xrgdb8qfCqZcIfRq+m8MatdStaZvU0sr8AwQGDQSVh9rw/Sn0nyIhTrKedEn
         iu4vn0SVkib30cCYCHvn0s87xOsY2unvaxNSIy/TVjNAYx3bnwWGlmiHbxJUZDHQGyNj
         bMZg==
X-Gm-Message-State: AOJu0Yxzfad6cv/xrD7m0XbDHZnZnQ4waIyJ7XyvFkCK1Wh1opEQ0mVj
	r9YMJFR5kdxpVlAxqtj3LQMPwjjqHHpLGO20N13WPq4JHpnzpTL9QYZ40w==
X-Gm-Gg: ASbGncuqUExH/3lCvtLNDb9e1+txJTr6ctt0n8b3OnwcYqVi4g5xe0IBSPYI+WkD6PF
	jfD6YyEWjFqM+n+7hs8i6Vm0CRcn0jfUJIThnjMBK/0DpKhovGrHPS1DsdYy+0tgcmaVU4/q1sQ
	LZM4aDAUgJhvCebf+11ugNAZja1Y8lWpA2cXWwUzDBcAUxxzc5w1CmbS1YtSWJLtyk+JkERq5wK
	4C1yKNJlwfeADJ9MueL1n8bzMI1BboIFWnT2fiqkNwn4OP9PgQe9os+v+vD/wu6Fah3swAY54ye
	nII=
X-Google-Smtp-Source: AGHT+IFIgGDr8y6OXic4v2x6obsHWF65Dm36gW0itHC2rypTT4Av2z6cH2rro593qFKRACi78FvKVA==
X-Received: by 2002:a5d:6485:0:b0:386:3711:ffa9 with SMTP id ffacd0b85a97d-38a1a233376mr16080155f8f.16.1735035982354;
        Tue, 24 Dec 2024 02:26:22 -0800 (PST)
Received: from localhost.localdomain ([80.215.86.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm13788030f8f.41.2024.12.24.02.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:26:21 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v2][OE-core 2/4] cve-update-db-native: update structure
Date: Tue, 24 Dec 2024 11:25:37 +0100
Message-ID: <20241224102557.9300-3-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
References: <20241224102557.9300-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 10:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209063

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


