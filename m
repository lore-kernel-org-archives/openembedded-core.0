Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADF4D5AE54
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:11 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.64149.1730950684251188176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=brjuy0cV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-72041ff06a0so375970b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950683; x=1731555483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+t8DViFr4IeoGqc0lrxuLPsp2Yljz7Z2rZf1EPPIuag=;
        b=brjuy0cVY384MzpRajvwxSRoifiV3/KKmg1PR5PGewf1UuAdZA0mZwWUG1vlcMByv4
         rwITvdN1PCaJfHNnDTRsjbR8U8RCIq5Z3fudKAillBMmKG2quLgyGTaBGBXhJZZ7qUZG
         tj7h3wKIqOmT32p+3CRhMFBHRfLwTfZxuaHzm7C97q87+lV6XlBvEkRGaqQlJFuIXW1T
         1WFLScUsQdz7+SeQqeJKO6fr/U0+CfdzEmD8Kw3d1rmz1omOtOYFnuFBcq0jFzSGWErF
         xJLSwsqhtoCLPFrnfb5VTJtgnrJBzk8ku5wF7yui37TSn8oXeklkfpyF6MTcWGrafm7N
         E8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950683; x=1731555483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+t8DViFr4IeoGqc0lrxuLPsp2Yljz7Z2rZf1EPPIuag=;
        b=Jrs4K98xNUhpwmVevwLpe8VSB2om+9IMTyDi9U6BiXmKvvtBmsqw3og9BgTkbQ7Jmf
         6evk+OMhH1XYaHKB2/URFIy5gz32CwDRDBJAMDZW09Pc6uETvJrtEcVo2pArxDdpmiRJ
         u/FHAkNPLJX8iNiIpZOgiwK348CR2sySgNNYVU8ndzeuAThlu91E3KhqwSUzio0MBdMG
         OkOkhu9oiOwip30ToCs9srfKUXiDkOMHPiCAV0+lskl3b4frOHalAQPLvYYS7oAK3H3Q
         zzCr7FRegQbFFCqsWJLw81tvu7OhEUCtPdRLjU4T/I3DNpojH37OvS4SJGtMkPBVC9Ci
         uVBw==
X-Gm-Message-State: AOJu0Yw73PGQaRNXr0c2YyhdAhUQkF9vIf9bFxyC86WWkc50vfo9ARCP
	eXXZODQmldJW1S8uHwaQKbdSV6Nm31GYuxRM6PPx4Az1XjRMLDr6KVCs4fkc8miSv5erronqDhd
	b
X-Google-Smtp-Source: AGHT+IFQX5yxV9tGVT4lB6hnDR4pUZpejQrkhJ9B2tI8+dct6usAu9SxDGsM5WKj89u0tJiRJGywtw==
X-Received: by 2002:a05:6a00:218a:b0:71d:f15e:d026 with SMTP id d2e1a72fcca58-720c988341dmr31619021b3a.3.1730950683454;
        Wed, 06 Nov 2024 19:38:03 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/10] cve_check: Use a local copy of the database during builds
Date: Wed,  6 Nov 2024 19:37:42 -0800
Message-Id: <57de6545695ac11816d670959d9e63666de08e3d.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206820

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
index d287cf1457..ed219bf472 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -31,8 +31,9 @@
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2-2.db"
+CVE_CHECK_DB_FILENAME ?= "nvdcve_2-2.db"
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
index 92177712dc..5fbe9095cc 100644
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


