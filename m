Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B971C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:42 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web08.9620.1642084661227864789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2c6uIH+5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id b3so1164628plc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lyezwQBKaGcUthP7sPgevqJIxlN+mmkCjUpgXpeqiCo=;
        b=2c6uIH+5v/Y75bQSgPwAt9xTjcB0s1zSPGQ/Mg6l5Z2/cQ1oz5BG4Pl1wmBcAXoer8
         eoe3Nq3Pr/tlA2LdFUPo+7LefD0mE1HVuwJ3Uz89iWdnXPrwEt5es2b3Gm8SZfh7RmNT
         WXGJ8mwnxKgbvxRosAAoO6dh5wSZY49lfuK3Ugia25D4c0S43VU64vbkJ/+PutRmHyFj
         JtGtQbP63mSXGdaiya6LDZFyiL2k+y3t/JIdROij6yxQME643LYYge/fmukiXhvnQYDw
         sfkbXe5sXAVNH5hEhFM9UYXt4I+EqwhprtNKNjaqqQn+jbx1VewNwKnBhZSEkgwxKjQZ
         0AOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lyezwQBKaGcUthP7sPgevqJIxlN+mmkCjUpgXpeqiCo=;
        b=chJ5vQux/biBZLWYs/RmNvJwpzMXtx2VjAasuftZzdjp4bGQXqpifxiPoP4pH4phE5
         /Kiz82qZMxrDn1gDwipxFPsvPGyITxVMt52nXHqdTR59M3F3c+yO81mVFEKKWbsIsEK2
         xIMib5wdx7zLfJXTV4q4A3QgSA8sLeCERnldFGv740pYnJRftcOa+xJMrLYNgLAm3gX2
         1hsdOB71hoAeTwSp8wRgYHCuBPATwvab835ZNCRalJjO4+eCVSehi377eaXEyKWNzYFI
         AYlLto8x/tEyoOBNVlB5DnzKjpH8J35o5eFD5JrfZI6jncH7j8ljX7wSa+Udtf0QKKzs
         xHjA==
X-Gm-Message-State: AOAM532NwZGKcD0MGpvHTZCqqEBXTo41OX7CLYRGGsHOKklcbA/80WEB
	i5mddI6Zsk8GW2riRfEiGciGtgOh+2E2pTto+Wo=
X-Google-Smtp-Source: 
 ABdhPJz17vrVAH2/4Y4Hqb3UwNJ9Fodr8BC4LAnfQn+RelMFAemK7N0fKyys8we6fG7/xYFEJJv5Qw==
X-Received: by 2002:a17:902:e80f:b0:14a:43d9:c91 with SMTP id
 u15-20020a170902e80f00b0014a43d90c91mr4989748plg.160.1642084660273;
        Thu, 13 Jan 2022 06:37:40 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] cve-update-db-native: use fetch task
Date: Thu, 13 Jan 2022 04:37:07 -1000
Message-Id: 
 <1ed53d5cfc2be40b2d57b5392ec4d30313209934.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642083419.git.steve@sakoman.com>
References: <cover.1642083419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160514

From: Ross Burton <ross@burtonini.com>

Instead of inventing a new task to fetch the CVE data, use the existing
fetch task.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5f97d33a1703d75b9fd9760f2c7767081538e00)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass                 | 2 +-
 meta/recipes-core/meta/cve-update-db-native.bb | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index b6df2c31da..97cbc63d1d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -110,7 +110,7 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build after do_fetch
-do_cve_check[depends] = "cve-update-db-native:do_populate_cve_db"
+do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index e86c69803f..50052f8532 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -17,7 +17,7 @@ python () {
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
 }
 
-python do_populate_cve_db() {
+python do_fetch() {
     """
     Update NVD database with json data feed
     """
@@ -110,7 +110,9 @@ python do_populate_cve_db() {
         conn.close()
 }
 
-do_populate_cve_db[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
+do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
+do_fetch[file-checksums] = ""
+do_fetch[vardeps] = ""
 
 def initialize_db(c):
     c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
@@ -217,7 +219,6 @@ def update_db(c, jsondata):
             parse_node_and_insert(c, config, cveId)
 
 
-addtask do_populate_cve_db before do_fetch
-do_populate_cve_db[nostamp] = "1"
+do_fetch[nostamp] = "1"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.25.1


