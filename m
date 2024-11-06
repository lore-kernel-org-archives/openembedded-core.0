Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDD4D44D5C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:33:36 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.45793.1730900013393516862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=a4UvitF5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so5839856b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900013; x=1731504813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rr7tIhLiX/gO3UTwoxE/y9ZNlewEJUTjwaoRNEJpiUk=;
        b=a4UvitF59uAuexnhREG7lYua122JSmgKppzfOqyxY689zG1Df7+3pBzv06hDZj1cDm
         ICovsEz3EfUh7SerisL7FG2exu9AKo+9VpDSq2IaBqBDBAUSSLiC3B/UFU18UJrBguDU
         dfeFkqwQFE8ibsKkP/iWRplzbsaq8rI9/I45jQnVIStjG0Dbkm0oSd+dydS1hn7ezR62
         KGzX01mnNUeQFKU2spF6AjqSUarrX/qXKmeDDhbVacMFDW3e62l7KxNLqxjVMdqyMCzJ
         Ewr6NWalohXyDKTlMBtFDP6mNaGQxLXt5bzw576GGw5hZ48czvtdAeAMOwa+qy5XgsaJ
         Hv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900013; x=1731504813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rr7tIhLiX/gO3UTwoxE/y9ZNlewEJUTjwaoRNEJpiUk=;
        b=Zj8l0t4lw/dGzwvV/mGlvUSs00jBOpsY3QVinkC2HnM/QpqFkuQ3gBPu04yTZu+I/+
         QldJtmkwvJeAfbxuCah1ega/pVftuglqPjuNn2z9h19tZnEnNl7gKZePlA7byCodJBX0
         gMUqr+dVzWZNg8f/0H2Y+3Wftg6qU0ZY6GsTI/jI3ZOEDoGkCZpGuIGhLPs9HBPOGjQ0
         hV0Q+g2mPgflPMdRRSlAPVNpWjKYmEoP/aN9hFXZynyBKxJqHA9LQIjn+BtIv0KmcSif
         9DuB5PN6iOHPqfwkglBmqsTHh0Bqx3RdxJkKEoatz46IAQibPTHwOLKEVDvErAbGFW8w
         Zwuw==
X-Gm-Message-State: AOJu0YxQsqWp5D3As6WCMaNucFHXvTLLeHnTuvK5v6tSWMSb0NQwTN7a
	Mdhl0Ldcpml3VqCVcDddX5t5H+NhTXlTgWLayQtjffejh+7RLqs0LSQIn2WMGIdUDE+NwgVFZyw
	h
X-Google-Smtp-Source: AGHT+IGccxYKgnf3eM6bk7p9qhP2sEgyEKvPj3lQ1zylLWkMWCgv97B7iNgXEI0GmlQmDIlXL7JFVQ==
X-Received: by 2002:a05:6a20:4325:b0:1db:ff5a:23e5 with SMTP id adf61e73a8af0-1dbff5a23eamr4199930637.4.1730900012583;
        Wed, 06 Nov 2024 05:33:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5722sm11631717b3a.71.2024.11.06.05.33.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:33:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] cve_check: Use a local copy of the database during builds
Date: Wed,  6 Nov 2024 05:33:19 -0800
Message-Id: <9b6363994e5715f1d08b98956befd8915c128e85.1730899830.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730899830.git.steve@sakoman.com>
References: <cover.1730899830.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206769

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
index dd9847f366..ac13b0a863 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -25,8 +25,9 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-2.db"
+CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
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
index b4c46ef756..dc742df06d 100644
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


