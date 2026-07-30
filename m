Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBE5C5516D
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 23:16:57 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.165.1785453413983907597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 16:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AganuiVs;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49800c6a846so1697825e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785453412; x=1786058212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+nEnqi5z4PbqdCciUaUJ6Gv4lH4n6mk+yjWjAFyHV0=;
        b=AganuiVsRonRrNMGJ2462Rc+6XDTQYfZr06kIvCvAVWdYi2Mj0zEpz1PGmeV6W1F7s
         JMAp4fx/tTGzlbq2cJ+O6UM+G+UCcsCcVb6kpg3G5XxB+mIVh37W/MkFypQ9Uu/8DepR
         ZPe3en/ZXYqMej54+K2CJR9c8quBfar3muwJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453412; x=1786058212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+nEnqi5z4PbqdCciUaUJ6Gv4lH4n6mk+yjWjAFyHV0=;
        b=ltBy7HBahHHc0fthbValjoStImfKNMmcElmW4W+lZhaaBQlg8FzWN5Q7nw9cni2P4q
         BVPgvrlgURvWgwjKOwmdU6j110tOSgDjB1gQ+nIWHA5gkRESFJo2zbnCnIJZlH/Hsxsa
         Lr3QECNI4mmumvt0QBM2HA/XazTnowqpT6+uuopAQJsSyzW8MFFMSoxIqSQsL6mX9Ab3
         zjZHP9Asp+rO5sRQE0aVVJdK3j8IERpuqYao04zmhsQ1AozRHFF/Xp5aQuNk5aI08UkX
         3FudJEVaKfCrwZ6Kmbxwhk0h7CTDMj6+I0d1bQJkJTLT3f81TxTZlt9C+AfGqk8TTOZQ
         mcJw==
X-Gm-Message-State: AOJu0YysK2Tk0uHjngZkafgT7Q07s+1X4xqBsvRXtxBeooaanozAarB3
	JWTyLhYnZFt90HC/LDZgS0yEL8lqwon9jOu/EEKKQNVWmlMVMxdRzE02oXqDTQ4fQhWne1SMbBE
	gTemVP00=
X-Gm-Gg: AR+sD10n3BoWUZClI93lmSb6aCZ0/lmPSnJ+1ql7X6K3V5UQJHnTZniNRcuze4Ry2Lb
	Y20jX6AOtO+y38CwQ1sxwmkQwDZJU73/OpUljmIKJcTxyHs4ku73G/NxumW38vqsX02l0IZP+DI
	VvG2r1VDWwV5HASGmnI7TenP00YjmuR5MRcvyi6sFakaHqe3Kso3cJZ3H3mecUZdddn6YFpRc1h
	Kujc6D0Q8N3G+og25i9MPCmtveIuqIsgWCFb/4HKy6NXYbMPJLEK6zYkO8ucQmcS5pVz4sGmCx2
	ICXBy9fKxadybd2AQsaq7K5nrmgx4JDm7ms8fdagzyfo+qAtcVKqzZeOYpc/tbaq2wwZyg38Siw
	vXs1ba3DHkw8m7z4mAURlZ6DLzHzML9me8MjHWokFNuKGN1I1+M+qT7BczrASamPJJZ07/7PAOq
	R7Z4GACEC/LYWSBa8B9258fUA10OZ2M2wddiVNTnnAHAlhXfwzY2DOERkJbsZBTI4Ae/EQFAiWc
	NXuwyFIAogC+j173muGmfafGAnT7HdY6W7UHnDCzMDpnrsbjrupTt0Wg9UJWN6K
X-Received: by 2002:a05:600c:6305:b0:496:bba5:33a8 with SMTP id 5b1f17b1804b1-49800eb9dd7mr67734065e9.33.1785453412191;
        Thu, 30 Jul 2026 16:16:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498062fb5a1sm6423525e9.3.2026.07.30.16.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:16:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone 1/2] cve_check: Use a local copy of the database during builds
Date: Fri, 31 Jul 2026 01:16:22 +0200
Message-ID: <d7f74cd94e4916e4d93252328f8484d13a877554.1785450470.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785450470.git.yoann.congal@smile.fr>
References: <cover.1785450470.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 23:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242383

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Rtaher than trying to use a sqlite database over NFS from DL_DIR, work from
a local copy in STAGING DIR after fetching.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03596904392d257572a905a182b92c780d636744)
[YC: Fixing [YOCTO #15660] ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/cve-check.bbclass                 |  7 ++++---
 .../meta/cve-update-nvd2-native.bb             | 18 +++++++++++++-----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 5e6bae17570..19d7ef5d852 100644
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
@@ -156,7 +157,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build
-do_cve_check[depends] = "cve-update-nvd2-native:do_fetch"
+do_cve_check[depends] = "cve-update-nvd2-native:do_unpack"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 1a3eeba6d0c..4f96883beba 100644
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

