Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12E5C021A9
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 05:58:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.4979.1739426322705982244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 21:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BaDJBvom;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so207207f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 21:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739426320; x=1740031120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcRIcyCk+vo/IMPLlKy7KfwP1ZM+IGvXXxVqSEGK18g=;
        b=BaDJBvomioZxuV038HPMz+EifOLgyxXEevWUxYX5UNbfhgluHnYgL3HRXu9GBhGw7D
         fRmbYceSdqMSGul5xr+EiEk++J9L/UjYupmEVtWOYdVI5boWchyt2ERKUITGbRPr0dia
         k99d6QYv2iJfiUoSzVdb2mq922od7PpWVDOG3GcXxarfOcv9Q33L08VkeqyoJ4oAZMnd
         0rv5ozJwyYqf69aXcAm6U/szLYK5JMRPf74PbuWwObeW9ITfZJPxfAhzbCTAb+eJ41Hz
         odpWKXjml4ioEg0kX9HXQ1DIfTGqZo3fKeaIsgMN9DkDPAU37oA2HtG8lBg+eAD6ZzOS
         ejFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739426320; x=1740031120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcRIcyCk+vo/IMPLlKy7KfwP1ZM+IGvXXxVqSEGK18g=;
        b=QzcajYx1K7zf8rrWVqf6WlhTKR4bjh7utLMn9Dpc/dRRqY4nKPQZztkFX3WiDy/1rm
         mOedE6011fXP/zDBoAmPATjUgyg/VsrkroVQwd80W7ZBD720cMRGGWLaImFs2KJKpDQj
         q195xkvliF9ioSBkoY0xwEcdF3O3wneXD0yLRB9GXT440FSBJ9Bw3Ax+xMLBo80aLfQY
         vUBti8nY+MOyxpLXFSMH0ICkItYqzgItLWTVznj7veirzOd1F18Ax4Qp5D04YbBE/Bjx
         Tkgdl3XtujaUl2ovL4+LwVQGQQ7QBIFMVRtrnrBiupkgjfEqEwN7BNiln1ZRK/KzqKGb
         RVGw==
X-Gm-Message-State: AOJu0YwQHUk4GLIEO19qMFngdot3x8W1A9cez/Qu/WqpjYGF5AZybSTD
	MNXjK/h7QOtRajI+FMp337rR7HRkQN9lUsOUC0yQIOY0I6eMmmm9gGOiuA==
X-Gm-Gg: ASbGnctUs+6yhcw1TS7XYJ/Z3xq8UoCA4GY8P3MsRk4EhM9U61RDfIQFIpq/lSnPBcV
	7cR9rRSkMOMbmusLzVLFQk5an7xmD4nIir+9WMioQGQWddUJnVF5383IN3nICkQ5UeFq0GiobN7
	4K64ug2h36sfKzdPPurf4qt3TQ95mk03Rm7Ofzo2s60RxyS5b+iZayWfcHHTHfuYepkpwSYdahE
	E9tp6q/ZJYVmXo8vJ2r4l5yLoAgWLjS/Ga/2Qqk4Ii1WycKuJZNtSSU5YaYXK4wcTK0GBbpzATl
	WrtxLRINNa2jy3e0xndZw9eIvh0=
X-Google-Smtp-Source: AGHT+IFzqeR/1CVF7embi4A6vNXAyprkZtifvDjVmG7Ys0jSeEa/KkJo9UZD8B7ZS2KGoXAwXluD1A==
X-Received: by 2002:adf:f38f:0:b0:38f:2407:103e with SMTP id ffacd0b85a97d-38f244fcb0amr1118731f8f.30.1739426320336;
        Wed, 12 Feb 2025 21:58:40 -0800 (PST)
Received: from voyage.lan ([2a0d:3341:cd51:2e10:d277:cf7f:82d1:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617fc885sm7466515e9.9.2025.02.12.21.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 21:58:38 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v4][OE-core 2/4] cve-update-db-native: update structure
Date: Thu, 13 Feb 2025 06:57:51 +0100
Message-ID: <20250213055811.6873-3-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
References: <20250213055811.6873-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211292

Update the database structure and tasks to fit the current YP master.
This means:
- add the unpack task
- update the database structure (CVSS, vector string)
- use the temporary database in the same directory as the download

However, the old feed does not include CVSS4

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 28 ++++++++++++++-----
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e042e67b09..3a9d43943c 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -5,7 +5,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 inherit native
 
-deltask do_unpack
 deltask do_patch
 deltask do_configure
 deltask do_compile
@@ -21,7 +20,10 @@ CVE_DB_UPDATE_INTERVAL ?= "86400"
 # Timeout for blocking socket operations, such as the connection attempt.
 CVE_SOCKET_TIMEOUT ?= "60"
 
-CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
+CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
+CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
+
+CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DLDIR_FILE}.tmp"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
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


