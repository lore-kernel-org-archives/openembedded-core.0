Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C255C3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 13:09:50 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.26197.1722776980433993110
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 06:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FgBEr/Z+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3683329f787so5329310f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722776978; x=1723381778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vzealu24fMton5aGziyny70Sm1ErzTN8pk0ex9NwgM=;
        b=FgBEr/Z+dLayLDXE78rNv4WZY+JvPgmAlUzOkuoyoiDHQdFC/+kkLmk7B99a1MytWz
         U/qnZ/R0BH3K6AGtsZ5kvBInWD7XP9o3D1xJ3JYuocPN739lWdPFCWHEaJ/PzhSWnqwv
         p7YaCtieysri8eoZGGvRNh5Vzc+6fo8x1qV6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722776978; x=1723381778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vzealu24fMton5aGziyny70Sm1ErzTN8pk0ex9NwgM=;
        b=lqMp6ymx2rUgAi0vd8+6mZXlASjqB83r88Ktqgz7k2to+df+DfZciBMiLHCOepPf63
         X8plJJalXzKBRLBtMbyr/AussHCVOj6ljQ1iFLb69UeB/RK9etWeIYMYVnW2+J8pVwq6
         bj1+LnJ/HYfESbuZ1MXRNXJAHCWC+sEoYz0HckL5kYUMOR91fDJqIQU2WLVxaodd1Utj
         ku4QCAqPYT4HsGqIywGlNNLUqiXHsEcwTr6WW+KPTdZIIzs02mUHXOjuOBG+reJW9PiP
         ljRzyi6SrC5gGlgd89CF6XDl/m3W1kaqIyDio3KK77FTF89AAwitjMtW6UmJQn0iYVeV
         O8EA==
X-Gm-Message-State: AOJu0YzBxjgcX34KZo/DXG5WUlRhQe6DsF+z5ODAm7GTcYD59310NcEr
	BZflYN5qS4DZF1UEETI3OeZ2O9V3PYZN7SOyBvc0AdWPAb3hIlvluX/U/lenffz4hBPg/xunMd/
	svy4=
X-Google-Smtp-Source: AGHT+IE56NFtHObiQAvrfXZb9RvG6Pw6sOBWqXtKxjZKegk8R7XeMfVBL+MHaPZx/O60Bo4uHNzAlA==
X-Received: by 2002:adf:dd8d:0:b0:368:8015:8a96 with SMTP id ffacd0b85a97d-36bbc0e34d9mr4564478f8f.16.1722776978189;
        Sun, 04 Aug 2024 06:09:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c970:9bdb:c2fc:595d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd26fad7sm6792449f8f.114.2024.08.04.06.09.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 06:09:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] cve_check: Use a local copy of the database during builds
Date: Sun,  4 Aug 2024 14:09:35 +0100
Message-ID: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 13:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202946

Rtaher than trying to use a sqlite database over NFS from DL_DIR, work from
a local copy in STAGING DIR after fetching.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass                 |  7 ++++---
 .../meta/cve-update-nvd2-native.bb             | 18 +++++++++++++-----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 504310514e4..0d7c8a58354 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,8 +31,9 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-1.db"
+CVE_CHECK_DB_FILENAME ?= "nvdcve_2-1.db"
+CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -198,7 +199,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-nvd2-native:do_fetch"
+do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1901641965a..5063f1fc3fd 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -8,7 +8,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 inherit native
 
-deltask do_unpack
 deltask do_patch
 deltask do_configure
 deltask do_compile
@@ -35,7 +34,9 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
-CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
+CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
+CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
+CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -52,9 +53,9 @@ python do_fetch() {
 
     bb.utils.export_proxies(d)
 
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    db_file = d.getVar("CVE_CHECK_DB_DLDIR_FILE")
     db_dir = os.path.dirname(db_file)
-    db_tmp_file = d.getVar("CVE_DB_TEMP_FILE")
+    db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
     cleanup_db_download(db_file, db_tmp_file)
     # By default let's update the whole database (since time 0)
@@ -77,6 +78,7 @@ python do_fetch() {
         pass
 
     bb.utils.mkdirhier(db_dir)
+    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
     if os.path.exists(db_file):
         shutil.copy2(db_file, db_tmp_file)
 
@@ -89,10 +91,16 @@ python do_fetch() {
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
+do_unpack[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
+
 def cleanup_db_download(db_file, db_tmp_file):
     """
     Cleanup the download space from possible failed downloads

