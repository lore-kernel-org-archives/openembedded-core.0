Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FAAC52D7D
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 12:23:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.146600.1723811031027242946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 05:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iXTw4S3v;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-367963ea053so1339278f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 05:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723811029; x=1724415829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/qHjw8Gi9OM6CeHN38poLPJgFOqKUH00ob5NeihJiw=;
        b=iXTw4S3vP4mTMPt0A4dV1eJwUzwpR3UBfZvW13Wkl2x9Mj2OUFdAfC1A1LcHWGVVAY
         siCco/d31YSqI1U6xjHqEc5T5xchhSSbhVkImPnJCcQy/jL8UNbg+czgHApeezAC+y8D
         DqlheGw9HeA15iCt7HWnH45k0wImtngrWdXqPgD961ZkULrJlujCE/Q53AAUIQrYMOLk
         vQrf2Sge8D0ZwMBZG/HjSYqhx9F3LRnDVgPtwmD9FLzVhdCg/rNyQYRaoQfQjw5tgVa5
         lX/566S+hhiuF0c4awItSiiWL25G8fT10Sr5cRUKXkg/evxETPZDgkt7XYNYn6zLTlz3
         vMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811029; x=1724415829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/qHjw8Gi9OM6CeHN38poLPJgFOqKUH00ob5NeihJiw=;
        b=E9Y63SW7IYtp7UESOB2kEu4VvSOU6WMYDbbi+94pMrBTB/85kCe2zy/ILIzmSpZkGM
         evaQjFVmJoiyP/PQI34BJwD3t/PtxNXwZIgmH9op+cIWrFCOJEmF+cPZXF3trRq4L/bd
         Q7NUk0y6b4cPVnK4dvAfVnXY4c3JDvfXVJabenwVG7BW/l3wObZT6FcuQOXl1nRzwO+A
         /jk8OZhcaAt503Hccoc3mPHF4WYxLn3aDPfX01wUcbZLkFbinBcE9sloQqNunh4a4b35
         CzQlrm/7sOHuEvKe2a4n2oRsoK6RK/qjPE8QWIFzhknnrdkpTk9G4SMCJ0oWEyao+sET
         l80A==
X-Gm-Message-State: AOJu0YxN08aws1EcpftDvVH3+S2yTUY4oe6Sgc4xTtRPHUDajei4Mzx8
	0V4FDvW6OdVc2ssZ5ZQlEwAeCQztj98jc9xvHakDszZEkI1aevTnyCt/GA==
X-Google-Smtp-Source: AGHT+IHYDffHfaDWRSrvGm+qqJV6j7otw9p7yEvGoXRJbW0FudH5r4bBJQX+OKSfcceG2rWp4Znxiw==
X-Received: by 2002:adf:a1db:0:b0:367:9903:a91 with SMTP id ffacd0b85a97d-37194315c0fmr2148766f8f.11.1723811028608;
        Fri, 16 Aug 2024 05:23:48 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:2304:b910:f434:938e:c450:4361])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded298e6sm74375585e9.19.2024.08.16.05.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:23:48 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v2][OE-core] cve-check: nvd2 download database variables update
Date: Fri, 16 Aug 2024 14:23:42 +0200
Message-ID: <20240816122342.974794-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203460

Update the recent code adding local/source database files. Add LOCAL and
SOURCE part to variable names, as none of them needs to be in DL_DIR.
Use old variable names for the source files, so that the change should be
invisible to users after backporting.

At the same time fix a bug: handle a situation when both point to the
same place (was: a deadlock).

Fixes: 03596904392d257572a905a182b92c780d636744 (cve_check: Use a local copy of the database during builds)

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/classes/cve-check.bbclass                | 14 ++++++-------
 .../meta/cve-update-nvd2-native.bb            | 21 ++++++++++++-------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c946de29a4..e66dc43788 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,9 +32,9 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_FILENAME ?= "nvdcve_2-1.db"
-CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
-CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
+CVE_CHECK_DB_LOCAL_DIR ?= "${STAGING_DIR}/CVE_CHECK"
+CVE_CHECK_DB_LOCAL_FILE ?= "${CVE_CHECK_DB_LOCAL_DIR}/${CVE_CHECK_DB_FILENAME}"
+CVE_CHECK_DB_LOCAL_FILE_LOCK ?= "${CVE_CHECK_DB_LOCAL_FILE}.lcl.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
@@ -183,8 +183,8 @@ python do_cve_check () {
     """
     from oe.cve_check import get_patched_cves
 
-    with bb.utils.fileslocked([d.getVar("CVE_CHECK_DB_FILE_LOCK")], shared=True):
-        if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
+    with bb.utils.fileslocked([d.getVar("CVE_CHECK_DB_LOCAL_FILE_LOCK")], shared=True):
+        if os.path.exists(d.getVar("CVE_CHECK_DB_LOCAL_FILE")):
             try:
                 patched_cves = get_patched_cves(d)
             except FileNotFoundError:
@@ -329,7 +329,7 @@ def check_cves(d, patched_cves):
             cve_ignore.append(cve)
 
     import sqlite3
-    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
+    db_file = d.expand("file:${CVE_CHECK_DB_LOCAL_FILE}?mode=ro")
     conn = sqlite3.connect(db_file, uri=True)
 
     # For each of the known product names (e.g. curl has CPEs using curl and libcurl)...
@@ -438,7 +438,7 @@ def get_cve_info(d, cves):
     import sqlite3
 
     cve_data = {}
-    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
+    db_file = d.expand("file:${CVE_CHECK_DB_LOCAL_FILE}?mode=ro")
     conn = sqlite3.connect(db_file, uri=True)
 
     for cve in cves:
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 2d23d28c3e..4ce2933304 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -34,9 +34,12 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
-CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
-CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
-CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
+CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
+CVE_CHECK_DB_SOURCE_FILE ?= "${CVE_CHECK_DB_FILE}"
+CVE_CHECK_DB_SOURCE_LOCK ?= "${CVE_CHECK_DB_SOURCE_FILE}.src.lock"
+# Use a temporary file in the local directory, not next to the source DB
+CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_LOCAL_FILE}.tmp"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -53,7 +56,7 @@ python do_fetch() {
 
     bb.utils.export_proxies(d)
 
-    db_file = d.getVar("CVE_CHECK_DB_DLDIR_FILE")
+    db_file = d.getVar("CVE_CHECK_DB_SOURCE_FILE")
     db_dir = os.path.dirname(db_file)
     db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
@@ -91,15 +94,19 @@ python do_fetch() {
         os.remove(db_tmp_file)
 }
 
-do_fetch[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK}"
+do_fetch[lockfiles] += "${CVE_CHECK_DB_SOURCE_LOCK}"
 do_fetch[file-checksums] = ""
 do_fetch[vardeps] = ""
 
 python do_unpack() {
     import shutil
-    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_CHECK_DB_FILE"))
+    try:
+        shutil.copyfile(d.getVar("CVE_CHECK_DB_SOURCE_FILE"), d.getVar("CVE_CHECK_DB_LOCAL_FILE"))
+    except shutil.SameFileError:
+        bb.warn("CVE database source and local file are the same")
+        pass
 }
-do_unpack[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_LOCK}"
+do_unpack[lockfiles] += "${CVE_CHECK_DB_SOURCE_LOCK} ${CVE_CHECK_DB_LOCAL_FILE_LOCK}"
 
 def cleanup_db_download(db_file, db_tmp_file):
     """
-- 
2.43.0


