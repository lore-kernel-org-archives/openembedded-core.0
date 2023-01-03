Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85ECC46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 14:04:21 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.63849.1672754654590984096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 06:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XQEL0a+/;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id co23so29551725wrb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 06:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a9LcCFHWCCaJvI6uNfvuCGrS+3U5jY5Q3JCcGl3TYbI=;
        b=XQEL0a+/g9taFkr6mKs8KRxTVcFdSTBfdOdBo1lRiiNhUO7BJmKDuSRMw0OM4YSUIb
         8SA0Uuhsnwu1K3CDD7P90/H/zguoO96XmamJKS8BJ7wqk3ltiz2yI/jxrXrzBnuANp99
         tUAA6qOrERw0No3lxS1qInzhzec9QrSsCStC+dXcYsvLmeWVewFM7Y/9Sf7jWFMiK8nA
         n136n4ffvCYxbOh8OgrUWKOl0Ir66Eu2jMPbkXsU8RQuJeZg5x0Mf0znQD6RQFmw0UVb
         XeVoDMXbnTtwKa/ZrRcrYDNS5RFHfxbI6NbAuB85mbuU/6okp+RJLc6VnVxQ+K6/7Po0
         lUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9LcCFHWCCaJvI6uNfvuCGrS+3U5jY5Q3JCcGl3TYbI=;
        b=QCcLJ2oaR9aAGzMOxUYdBWnRD97e5NTDgtccoM0NsGKqxSDDb76skr1j0shGrCNjFR
         fQ/BXWZN/vHoUS+RZSclkxcpFNxs64EZ06tn3sdlviqAoBw+iGBycAEaJRP271WKqmLb
         o12z4CcFQkQw0UpgQgsXOelsWVkvRzulfB2TidmO/SJ6Lx4171+jve3XfdU3YnRijqij
         Y2PQvE4e3RNFq1ykTOdOekbbwurDId5OiDGG3M1uk92MnqjMSLge4yvyMI4A/RK9dAtp
         xG4Etbn/EsDnpS0p4htL379JJjdZuKdl93cVvoofIx1z0k9wHzGUtv5jr6P+3quW6pNc
         nFtA==
X-Gm-Message-State: AFqh2krOqYZbc20eUiOmIgiGYZK/SW/sC9I1HER3dgn4OU5Y4Sdjh8wj
	HxxrWaSD9v1J0rWol+j9JcMVg8ucJ8U=
X-Google-Smtp-Source: AMrXdXsL63DwKMlTq6PZARSvhR+1XLtwS3sfKD5m6rrO4MGl1jaujQojLF/ZL16arZ05wa6M28/lmQ==
X-Received: by 2002:a5d:5102:0:b0:278:9f85:94d with SMTP id s2-20020a5d5102000000b002789f85094dmr25759625wrt.45.1672754652531;
        Tue, 03 Jan 2023 06:04:12 -0800 (PST)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b00236883f2f5csm30900847wrq.94.2023.01.03.06.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:04:12 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Alberto Pianon <alberto@pianon.eu>,
	Marta Rybczynska <marta.rybczynska@linaro.org>
Subject: [oe-core][PATCH v2]] cve-update-db-native: avoid incomplete updates
Date: Tue,  3 Jan 2023 15:03:59 +0100
Message-Id: <20230103140400.700736-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 14:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175355

The database update has been done on the original file. In case of
network connection issues, temporary outage of the NVD server or
a similar situation, the function could exit with incomplete data
in the database. This patch solves the issue by performing the update
on a copy of the database. It replaces the main one only if the whole
update was successful.

See https://bugzilla.yoctoproject.org/show_bug.cgi?id=14929

Reported-by: Alberto Pianon <alberto@pianon.eu>
Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
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
2.35.1


