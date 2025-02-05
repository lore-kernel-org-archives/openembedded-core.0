Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559C8C02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 14:35:18 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.13318.1738766114083330267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 06:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emKGyNbW;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38db0c06e96so1053981f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 06:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738766112; x=1739370912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPUAHgbmxRJowWnByWQMHPf8LTBKwM52UjbDKXf9zKs=;
        b=emKGyNbWNl91Rf+UWzlQ8nMzaWztRnzmTncWz6A+oQ2rRDwYHxH32yvqNqUyrFjefi
         jz4BU5vunxQyWp9LKrVt2B24qKFQamdLcMLmD8YkiR98El9xyYex4zQyNllGleVC+c9D
         23lnpQQjTN1MUbWtdwnF+Qt42NfFvLNwfm13s/p2CZ565sJ2lm3rb+23mPwMtjsWpxDm
         HgetgRqtAdWoyU3S42qSu91g66WL+vtiVf0+CeYWTbIYd9nu6txTI6WjgtkUiC5GUvcx
         oxDD3k7xArd/e58hQ4gBlEH4tV3VeA1HfzhygfouTlYJwjgGHOkUCTmU+p3D/jffv+ht
         4ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766112; x=1739370912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPUAHgbmxRJowWnByWQMHPf8LTBKwM52UjbDKXf9zKs=;
        b=Be+MvVbygXYySgrMQYDnEED5vnkw4Mbph2G9ChWmN6ODAkxpIvf67D7H0roiTO0ggB
         5gfuoPoAsnpKDwLH/5yzgaOvgN8sIb6eJWCDqi0yBja6k24MnbS3yC3Dr4xrYcIJAIij
         SsAZuYbVZlX8NeUiALDskB0bdDpNS4U62b0/itoU2eZTJb0eyQhJO1iznblwHZS/eo+P
         NRUqzvhuy7+9OW3cxuOGA1Nvv2NOSG6eFXS8exAayCTSaB7Z3E2PvZXTypNiGEMh7qNg
         UxtMlC7rMRyIIlRqR0X9qUuyP6tPoFrAVJvBLDdYV8sGQ60LgSq5KAhvwu6Jym6rBajZ
         XNKg==
X-Gm-Message-State: AOJu0YwGbbtj/UdjMgnIep24YV2EOclNPubOaNmhfyJxcgvs7mNnPTzm
	x6xopJaHQS/IkDkmLgBesaQ5ryV10B97ACgLxGM/yXHn5O8HHEzQmbwU7S1s
X-Gm-Gg: ASbGncvhOGDd4Qn0hRNkOwN2YVqn5CBRvX62K7ZvR/VI0XZIOMfULJYsT1k1SPaQM/n
	T/CRbWaVxz7DOdL1CCCjTf4SsxPhiD0MEwh3/B1bczvx3sUoVzrQaLTkCdZsDA0nijabxp4JrOK
	MzjlXBKDLITXlgY8B4oLoh32eKVNnE8C7XuvGg0khMT/IWhew3LORpHiTKGL9B6DU0Qp2KsswsI
	pGr9mDzoONSjnywJpk62jWNwP5oqVay7Ov5J9HpehzDIoeJh/gPtdn0FOvx1qkuWI5FxpI6D5vP
	H3Ej3LAGwUkM/rjkE80ddKOG4p38pzv+pwXc8JT9xG0n
X-Google-Smtp-Source: AGHT+IHoJt882LFgbvsS4yLGKGsnAFGZMkJU+cz0JHQKNohbL8HFw8GIbPXd4WWB49a9Fvh8JmvfJA==
X-Received: by 2002:a5d:64af:0:b0:38d:adcd:a062 with SMTP id ffacd0b85a97d-38db48d5f84mr2076797f8f.39.1738766111763;
        Wed, 05 Feb 2025 06:35:11 -0800 (PST)
Received: from localhost.localdomain ([2a04:cec0:10ef:d61d:4bb8:b29b:dacd:c52b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bccsm18614600f8f.27.2025.02.05.06.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:35:11 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v3][OE-core 2/4] cve-update-db-native: update structure
Date: Wed,  5 Feb 2025 15:34:11 +0100
Message-ID: <20250205143439.38233-3-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205143439.38233-1-marta.rybczynska@ygreky.com>
References: <20250205143439.38233-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 14:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210851

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


