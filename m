Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A824ECA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:59:31 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.18370.1756047565054559532
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Xgf3sqtF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202508241459231b2e5badb0de42efcd-wamvfm@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202508241459231b2e5badb0de42efcd
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:59:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iGd2MqXYKnc/G8apeAT8LxzsXOi6oHDgQkJ6+yAkzmk=;
 b=Xgf3sqtFFGeAUTg+K3ujK80Uo+XUGcZvpeOy16vj/OA+6u6zbdG4Y4j/eJYNBOWYzffkcm
 W5MARVqNClw5m0LJntj7OJJ/KkPIWNTHZNa7tAhCJLmRSPAIqOusQFtQ5qWqduORL4o4R342
 37BveTC+iP4ocqWRbcbI4Ug4aANRdxAejt1fuGajeurpxTR4oqvtJVoONgmYtB/PALgJDhH5
 Wh2wUl1ysCuLZJgViHEKQd3Mx5qpl2hSv/0fZb5QqzUx9TmqFqdDfhKsKhfN7tcQNpVLXeKn
 +LCHxXy1DsnCuG9fQLuiBKFy/rjHF4VxkZcX6uepEy4IlwucD05ZdS6Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 3/7] cve-update-db-native: log a little more
Date: Sun, 24 Aug 2025 16:57:41 +0200
Message-Id: <20250824145745.1099373-3-peter.marko@siemens.com>
In-Reply-To: <20250824145745.1099373-1-peter.marko@siemens.com>
References: <20250824145745.1099373-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222383

From: Peter Marko <peter.marko@siemens.com>

OE-Core rev: b64a869b9c5e1d504f1011da16b5c5ff721afbf0

This commit was not applied on nvd1/fkie fetcher.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index fe7b8a017f..8a3746a9c1 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -58,7 +58,7 @@ python do_fetch() {
                 bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
         if time.time() - os.path.getmtime(db_file) < update_interval:
-            bb.debug(2, "Recently updated, skipping")
+            bb.note("CVE database recently updated, skipping")
             return
 
     except OSError:
@@ -77,7 +77,7 @@ python do_fetch() {
         shutil.move(db_tmp_file, db_file)
     else:
         # Update failed, do not modify the database
-        bb.note("CVE database update failed")
+        bb.warn("CVE database update failed")
         os.remove(db_tmp_file)
 }
 
@@ -159,7 +159,7 @@ def update_db_file(db_tmp_file, d):
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years = date.today().year + 1 - YEAR_START
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
-            bb.debug(2, "Updating %d" % year)
+            bb.note("Updating %d" % year)
             ph.update((float(i + 1) / total_years) * 100)
             json_url, meta_url = db_file_names(d, year, is_nvd)
 
@@ -190,7 +190,7 @@ def update_db_file(db_tmp_file, d):
             cursor.close()
 
             if not meta or meta[0] != last_modified:
-                bb.debug(2, "Updating entries")
+                bb.note("Updating entries")
                 # Clear products table entries corresponding to current year
                 conn.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,)).close()
 

