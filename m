Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E19C52D11
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.82043.1674238266670787536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VixoPuBS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id i65so4614866pfc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvWOkLsRh8N+pBD/Yi6OzMgR4IqWoU5ANkgAdi/EuQM=;
        b=VixoPuBS3aQDA/9/wcWuo5bINxvCqkQCNj2r6uDYibDKChQeY4nwSQAAcwbMnUGGM1
         KjNJqJueO7MzVvQ5mF11p5fEAcDY7/ozmzYJDBYzF1zmQ5Slm0ecdC1UdfDdNLJ4l3zD
         j1+hrFY8hjxpoZiLqzUS2UXSkM4WGYO3Hs1Gc7o/pFTylBYjffe4eLLCAE65OMHfunuH
         Lb1YJPY9aooXYBqidaZyPM5TvnFji2X4IqNDR7XwJGfOtO5aoDbzkpF61n0+2jOl0MLN
         wm/bbkAhkw9NrwplYMhBU1f2hu6EgEWLGEduN/6fxAQ3/GjLfsZuD6ouVzCh3SAxLD5/
         lJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvWOkLsRh8N+pBD/Yi6OzMgR4IqWoU5ANkgAdi/EuQM=;
        b=23bzEkbx3gkBW3fsDsC/KuXjosJHWjSNbZeTiRkZR/qm17h++Ytk1MXP/lI63UGiLm
         qiFeTuCh5kIRo3tIsi42gDDfLzo8KyqGfSwLXoWix14z5xshy5FoJprVm32UxkkgDRaT
         HOzBjjZayIj5imL1LZjQTDExn8LOH0QEb99pvvs7L1nSpKrc/wbp/jqeFXqrA06DaYUW
         9N4VmK/f0MnmcwWcTvKe1II7sWfCgTQYJz5YaBhkQTe+hggJrUey7wTgJ/mF/PXCQRrV
         NNazi76DoAVH2X9BvFZWuF2HjnfASQxJUdIhxn6FmyyoZyUAGfPgzh9q4GmqeNSjIcqA
         QN9Q==
X-Gm-Message-State: AFqh2ko4p6IpZr8GIVZBJWJAebbk54PaJvt5zYAsF4sA0toRUz2OLUD1
	b/uFph5W4vqep6hmKFO+YgMfRVL58hnFAjD9nMw=
X-Google-Smtp-Source: AMrXdXuybAhnUwKfYkd3lHJEfowNzmY9pQ5lP8VzlAMFQhC08zQj239w78F5GR4a+XbuPkndelEQcA==
X-Received: by 2002:aa7:972e:0:b0:58d:b330:6e7d with SMTP id k14-20020aa7972e000000b0058db3306e7dmr18176470pfg.26.1674238265678;
        Fri, 20 Jan 2023 10:11:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/41] cve-update-db-native: avoid incomplete updates
Date: Fri, 20 Jan 2023 08:10:18 -1000
Message-Id: <66aa05be4c237d24295d5e02de6e2dbef43af6dc.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176207

From: Marta Rybczynska <rybczynska@gmail.com>

The database update has been done on the original file. In case of
network connection issues, temporary outage of the NVD server or
a similar situation, the function could exit with incomplete data
in the database. This patch solves the issue by performing the update
on a copy of the database. It replaces the main one only if the whole
update was successful.

See https://bugzilla.yoctoproject.org/show_bug.cgi?id=14929

Reported-by: Alberto Pianon <alberto@pianon.eu>
Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8efe99214d8b005f0ecac690ce5ba17b31758f92)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 83 ++++++++++++++-----
 1 file changed, 61 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 9b9dbbd75f..079f062f79 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -21,6 +21,8 @@ CVE_DB_UPDATE_INTERVAL ?= "86400"
 # Timeout for blocking socket operations, such as the connection attempt.
 CVE_SOCKET_TIMEOUT ?= "60"
 
+CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
+
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
@@ -32,25 +34,15 @@ python do_fetch() {
     """
     import bb.utils
     import bb.progress
-    import sqlite3, urllib, urllib.parse, gzip
-    from datetime import date
+    import shutil
 
     bb.utils.export_proxies(d)
 
-    YEAR_START = 2002
-
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     db_dir = os.path.dirname(db_file)
+    db_tmp_file = d.getVar("CVE_DB_TEMP_FILE")
 
-    cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
-
-    if os.path.exists("{0}-journal".format(db_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_file))
-
-        if os.path.exists(db_file):
-            os.remove(db_file)
+    cleanup_db_download(db_file, db_tmp_file)
 
     # The NVD database changes once a day, so no need to update more frequently
     # Allow the user to force-update
@@ -68,9 +60,60 @@ python do_fetch() {
         pass
 
     bb.utils.mkdirhier(db_dir)
+    if os.path.exists(db_file):
+        shutil.copy2(db_file, db_tmp_file)
+
+    if update_db_file(db_tmp_file, d) == True:
+        # Update downloaded correctly, can swap files
+        shutil.move(db_tmp_file, db_file)
+    else:
+        # Update failed, do not modify the database
+        bb.note("CVE database update failed")
+        os.remove(db_tmp_file)
+}
+
+do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
+do_fetch[file-checksums] = ""
+do_fetch[vardeps] = ""
+
+def cleanup_db_download(db_file, db_tmp_file):
+    """
+    Cleanup the download space from possible failed downloads
+    """
+
+    # Clean up the updates done on the main file
+    # Remove it only if a journal file exists - it means a complete re-download
+    if os.path.exists("{0}-journal".format(db_file)):
+        # If a journal is present the last update might have been interrupted. In that case,
+        # just wipe any leftovers and force the DB to be recreated.
+        os.remove("{0}-journal".format(db_file))
+
+        if os.path.exists(db_file):
+            os.remove(db_file)
+
+    # Clean-up the temporary file downloads, we can remove both journal
+    # and the temporary database
+    if os.path.exists("{0}-journal".format(db_tmp_file)):
+        # If a journal is present the last update might have been interrupted. In that case,
+        # just wipe any leftovers and force the DB to be recreated.
+        os.remove("{0}-journal".format(db_tmp_file))
+
+    if os.path.exists(db_tmp_file):
+        os.remove(db_tmp_file)
+
+def update_db_file(db_tmp_file, d):
+    """
+    Update the given database file
+    """
+    import bb.utils, bb.progress
+    from datetime import date
+    import urllib, gzip, sqlite3
+
+    YEAR_START = 2002
+    cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
 
     # Connect to database
-    conn = sqlite3.connect(db_file)
+    conn = sqlite3.connect(db_tmp_file)
     initialize_db(conn)
 
     with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
@@ -88,7 +131,7 @@ python do_fetch() {
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e.reason)
-                return
+                return False
 
             if response:
                 for l in response.read().decode("utf-8").splitlines():
@@ -98,7 +141,7 @@ python do_fetch() {
                         break
                 else:
                     bb.warn("Cannot parse CVE metadata, update failed")
-                    return
+                    return False
 
             # Compare with current db last modified date
             cursor = conn.execute("select DATE from META where YEAR = ?", (year,))
@@ -119,7 +162,7 @@ python do_fetch() {
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
                     bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
-                    return
+                    return False
             else:
                 bb.debug(2, "Already up to date (last modified %s)" % last_modified)
             # Update success, set the date to cve_check file.
@@ -128,11 +171,7 @@ python do_fetch() {
 
         conn.commit()
         conn.close()
-}
-
-do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
-do_fetch[file-checksums] = ""
-do_fetch[vardeps] = ""
+        return True
 
 def initialize_db(conn):
     with conn:
-- 
2.25.1


