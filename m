Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA3EC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 12:20:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.146563.1723810843379026056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 05:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dk8NjBy8;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so14096765e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 05:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723810841; x=1724415641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjrzkL3huK8Ylj66wmPDYlm9b74/pGqgz77rPYERzxg=;
        b=dk8NjBy87xHDuSHi1J05bjGe6UEJwl1u+bFw4yL3tVsVmMYDp920ieHxnsY2B1B/Bf
         XTq09T464yG8Er6QrKpkKjyXvix10TVR3vFw1lfjUIhatpmFtbQmxIBHepcTZN00Qerk
         Nd1g14vH6bp3DPNL43fEleDJcyZOmmL5SfkTMSP41U7gA/tLnGnud2QFVdlhVAhMUdRY
         oS6gjGfmQVIdlief0we6qCNubFNnV3d4O2F+Yukqy8WEDxzqsg/WKulOJKDxWkUNNrZJ
         y8Nd91R7vSNy0LL+ucWPvYYSzbgmBBfCxVvQHZRGIS8n/6SN4j0cPSLJJxQ5RCTG9NZZ
         Yx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723810841; x=1724415641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjrzkL3huK8Ylj66wmPDYlm9b74/pGqgz77rPYERzxg=;
        b=PJCE8+nQgPCLjkeOHSbv/b/6+INimyoKQeS7Y1jOze9NZoqxyGyIzWjo9XbLSLd5Sa
         sr6ZUeMgr+iBm7TqrR5+KuHEQVeMOLNJNtU35KIYtNW+jRNWF5vSGWp/RxurZ0AAlRsk
         KEQe89MPhqvYWS1+2t5bwUJ/0HdH5/6KeYV0v/1jQnU9daRb1sc1YQV6Zz3w4rALprE3
         l/9ElkGXj/0DOj6Lv+6LNVINibeRPEGJJOkXpMdcvAodpeW9FujgENwVwTXrISpEMeO6
         nRvpOUcw/nXCCw/hjJsJtUqZUMOM7ux+vLg+6rdU/Hy1K7fMBbMUKCyFSsM737Oi6h6q
         1duA==
X-Gm-Message-State: AOJu0YzSUX/uZGzlIk3mw/O4+Ef6ZCviR3aSSSjpPLdWI1ccgU61TlKR
	OKVBDWzrGX1hRS0J1zq5AxIH8crQWp1hbJzwD9a5XStfYCm09PlID9/Nrg==
X-Google-Smtp-Source: AGHT+IFndcJv1MFLVZIOE554+wIdn/6NpgbCeQJ+JNwoh6pkVyA42NeVLjbluNYt1OINFiHEQ2ayaw==
X-Received: by 2002:a05:600c:444b:b0:426:6320:7ddf with SMTP id 5b1f17b1804b1-429ed7f944bmr15950295e9.35.1723810840536;
        Fri, 16 Aug 2024 05:20:40 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:2304:b910:f434:938e:c450:4361])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded19670sm75556755e9.9.2024.08.16.05.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:20:39 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH] cve-check: nvd2 download database variables update
Date: Fri, 16 Aug 2024 14:20:32 +0200
Message-ID: <20240816122032.974613-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 12:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203459

Update the recent code adding local/source database files. Add LOCAL and
SOURCE part to variable names, as none of them needs to be in DL_DIR.
Use old variable names for the source files, so that the change should be
invisible to users after backporting.

At the same time fix a bug: handle a situation when both point to the
same place (was: a deadlock).

Fixes: 03596904392d257572a905a182b92c780d636744 (cve_check: Use a local copy of the database during builds)

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/classes/cve-check.bbclass                | 14 ++++++------
 .../meta/cve-update-nvd2-native.bb            | 22 +++++++++++++------
 2 files changed, 22 insertions(+), 14 deletions(-)

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
index 2d23d28c3e..74f2ca05c1 100644
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
@@ -53,13 +56,14 @@ python do_fetch() {
 
     bb.utils.export_proxies(d)
 
-    db_file = d.getVar("CVE_CHECK_DB_DLDIR_FILE")
+    db_file = d.getVar("CVE_CHECK_DB_SOURCE_FILE")
     db_dir = os.path.dirname(db_file)
     db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
     cleanup_db_download(db_file, db_tmp_file)
     # By default let's update the whole database (since time 0)
     database_time = 0
+    bb.plain(db_dir)
 
     # The NVD database changes once a day, so no need to update more frequently
     # Allow the user to force-update
@@ -91,15 +95,19 @@ python do_fetch() {
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


