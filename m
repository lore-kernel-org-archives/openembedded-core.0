Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA801C5320D
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.70857.1723551414405829541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G1XCg/6K;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d37e5b7b02so1201181a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551414; x=1724156214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hs3pZUqg4XRYY9tEP7ECZQYP0WvnN9U+Ke9ljnALEdY=;
        b=G1XCg/6K/KtoSzcnY/fk2oMp8qIWXEq4NI8pS5MLQ5hrMEN0Yq2XklNtgEv/ZyhCzi
         oLVsdNSSkfFntVWmpui6280oYgsle4zbnjvpDj7hxP6G5+AXlC9UMlRUpiNcYPSWlizX
         bE1aBITHbzueV0L2MFQnbObkBro28YIonsTr585zvOD0SApIfsDJwPV1SSlTiJ8PFkd+
         Gn3yZITvMJBeHOJI//3xxzpuVVa2jYkYOsb+Yo5ZTeDRG9Vw2/1GC3x51cWWv5aFu9/b
         jaz7v90XdXg5BZtu6rbAqbkt9j5FRvd9cmVs5OpPE1NySjfaWhcYeb4Br4N+RVzMzStg
         UV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551414; x=1724156214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs3pZUqg4XRYY9tEP7ECZQYP0WvnN9U+Ke9ljnALEdY=;
        b=gwiZE1h2Cr/RcFx040JMKghUGFAxylPk6FQuGYTcV01gOe83awkbLASscZwwC669YD
         bIy4eyYgClqGDvo8YFw1UyleMh0mFtFvlVZv/eYIx9y82L2ni1dVhQSJrcs8hfc45eKs
         +OsYX8zO1tFS7NQM7T32J1cE2zuOUPcDp+zrFpKg2uW35zHbvhfokUR64HVx3UvaTUWr
         ks8LsmnFsheM21To5BlL3Ib+jJ7RRh7Eu34dQpTyZkxD2nA9ZdCDVBolRo3vbBZ2JGLL
         hGeXFsW3tu7qMZo36gGfwMtXSTedQBbuwqRgQJHwzB1Vo4DsLf25lf7epvZPEBgQpF3m
         hpZQ==
X-Gm-Message-State: AOJu0YznNfDP9bVHimJgccikqxe1szuIBX+LD0A3LLXXceMrm4hooe9U
	GyO1Et6tvao9SxU+69vBcsNGKctMJ2HA34QQPfcBtJAvPpGAcTg6iqe+7maZWTSg07R1rf19nVj
	XCbU=
X-Google-Smtp-Source: AGHT+IEj3KfZ4ck0wLTENcIaJPCL7Qb5whHOxwo0tGv1tCOUAvWTkniJwx1koeGYbiWCilge+L2/4w==
X-Received: by 2002:a17:90a:a014:b0:2c9:999d:a22d with SMTP id 98e67ed59e1d1-2d392622f5dmr3552635a91.30.1723551413578;
        Tue, 13 Aug 2024 05:16:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.16.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:16:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/11] cve_check: Use a local copy of the database during builds
Date: Tue, 13 Aug 2024 05:16:38 -0700
Message-Id: <6aeac3949a409156f03830afbf586d5cd43f2537.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203265

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rtaher than trying to use a sqlite database over NFS from DL_DIR, work from
a local copy in STAGING DIR after fetching.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03596904392d257572a905a182b92c780d636744)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass                 |  7 ++++---
 .../meta/cve-update-nvd2-native.bb             | 18 +++++++++++++-----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f554150d94..684e75914b 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -25,8 +25,9 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
+CVE_CHECK_DB_FILENAME ?= "nvdcve_2.db"
+CVE_CHECK_DB_DIR ?= "${STAGING_DIR}/CVE_CHECK"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_FILE_LOCK ?= "${CVE_CHECK_DB_FILE}.lock"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
@@ -157,7 +158,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-nvd2-native:do_fetch"
+do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1a3eeba6d0..4f96883beb 100644
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
+do_unpack[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_LOCK}"
+
 def cleanup_db_download(db_file, db_tmp_file):
     """
     Cleanup the download space from possible failed downloads
-- 
2.34.1


