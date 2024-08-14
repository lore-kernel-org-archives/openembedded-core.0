Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891A0C52D7D
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 12:02:30 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.96182.1723636941235429151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 05:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZcDhGPGy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7c3e0a3c444so601622a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723636940; x=1724241740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9q2V8K1AV5Bt4jA9l19XPN9+cnziQ6a53cmAawxD1IY=;
        b=ZcDhGPGyake7J+AOBJsFM8QC8dLkwdNnadPFMLGKbD8uHyVpVXaKLtYl6mNY0s0lbO
         qrWqopd3Kvr/GnNtoWS8OAhDm8/8e64g0mTzzdKkt58apNYoXb6j2wnY/oCtjiQareO2
         sTO9GvIKc6h1tWB+yWwJZ8ETNuZpOji5f0YV6OLy3d9cyj71o/TaWmA83A2u7CEm4lCH
         cE60glV7WMRwzmswxdm/c+sKvZMDzRwbnw0Its543OTknOvjV3QbaNWViocXuJhoHDNr
         ShMv+6obtOwEoc/Ffpmuy+PJmsH2odDmOL7Ck9n0Og/axkwNYHYjElEPEUY7TCppPwE3
         yucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723636940; x=1724241740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q2V8K1AV5Bt4jA9l19XPN9+cnziQ6a53cmAawxD1IY=;
        b=kZi5i7VDQyZTLKGus+B7Kkb3z5g8YIqctMv60V2UpyCzx/ec2amEWJ29QDusfkkgjy
         B6K40+hXWLH0zmRv1rJMNbWX6uDRwPi/L+cwnT89TEu5MCaw4XiUwlZCEKbpN/kBRcRw
         hWhkVI5RteAFnjJCZuT+gRt3QbWWQHqY8AfTCbcYEx4JSgvE+xUuJ2xwy4mics37Eg+R
         3l6fWYWIGNaraJKvjNnb3cFXyb8wXQnBRCPLlj9S7pPj4WoabqpdTjNMTvGApGoXPsJC
         p3282nSBXVJLZU33yxbq+2gzKcECLO3yuPpoOPI5hrubj1zG6JWkxETmG318OceSDVCe
         ujAg==
X-Gm-Message-State: AOJu0Yx5AsF0sIozrAjp1F6avisk7CVeCVs8CIHppwfM0mhHZkliQHbM
	ASII8Se3slG+1elS8BXEuxB0BWxewgGuv44nfueMhXx78yei19cQzi4uuBXWCNZCAwGwPGgHYsw
	2mbk=
X-Google-Smtp-Source: AGHT+IFCeSeK/Kl4hAxXSwrrkANqWpD0OUaM6N93NuT/7Qb6OdB0zCu78UuHv2kAhp3nsuew4wVRtg==
X-Received: by 2002:a17:90a:d586:b0:2c9:6abd:ca64 with SMTP id 98e67ed59e1d1-2d3acbf5253mr2981891a91.9.1723636940041;
        Wed, 14 Aug 2024 05:02:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac80e0d1sm1512214a91.43.2024.08.14.05.02.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 05:02:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the database during builds
Date: Wed, 14 Aug 2024 05:02:01 -0700
Message-Id: <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723636705.git.steve@sakoman.com>
References: <cover.1723636705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 12:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203312

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
index 93a2a1413d..c946de29a4 100644
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
index 1901641965..2d23d28c3e 100644
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


