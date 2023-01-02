Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D021C4167B
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 07:04:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.30697.1672643036129495023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 23:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N4vwPaE7;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id co23so25581165wrb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 23:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6zmCWCO+VchVe/nLVmMnD/4DbJnD24TVDrbNufgiNQ=;
        b=N4vwPaE7JLxqitLKqRCyPozgK3sJXwI9teqoLTGHCr86c5v06CiRopVvac9y2i5Eda
         gZxLHHKZeb3abw4q5uMrCq0s/sLBDeLOcgpR/luktEt1zhboJ0/pUcRYh+4hIzN1kvhK
         P6XliSv9rQDyqYmjoWl5pMUO4jds0h9ue8DN66Ltvt4d12/3mv1hFMaTu1rr4M3wqE5Z
         aS2QDVEQ6bxmU96rDA2WzIg9MQ3DznSUhfh/SBWhX45Zl6FF+N+OJ7E0x6wViV7GAsPd
         6OPgAsJxMF3j5ztv1wgNvqYSPmpbTZtfr67YmgiOeF/EMy/m/dsNeuNh3WQJ3Rcm/a60
         WUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6zmCWCO+VchVe/nLVmMnD/4DbJnD24TVDrbNufgiNQ=;
        b=BCemPl2lggrND7ubXxBDuK6PkrCY+PdNF7AQciT9xGSg+VEFRd792B1hN5STqqheUt
         nlf/Kz3rkXWpjQQRdDV3mPqO4ZN+TL1GY+wy1Yz0fw1F2gQgLVVwRVmGbo40AlUO4F5V
         Q/LnFJ6cJKCTL4mbASOo9V5h3WGTIjXHyS/DgMzB9tMt+BuLF71qrA1MGv7PFJOTFZQS
         zGTJ+J7lAtvYalJafWs3YjC0CF4j74I6scSGCQXLkJN6nSiZ+SatmwRLe1ZA4IMU8Tk0
         pXtpWLPBNe0Czp3KMSwA0iezVeiVfS1OcYPovAH9hIWqbAndM9CnlJrTl0Q4XM6kdgX8
         JVig==
X-Gm-Message-State: AFqh2kqKdWyYLenNtpShNu3s8GNcQXz+BdUiAtYci6+4UcRZwl2ZjeIJ
	RVzN8S80SCtD84iURKsMySFWcrY6fLQ=
X-Google-Smtp-Source: AMrXdXspHmLz4jUGOZT2Db/cfgRF088/NQdGODLeG+qC7X9fEWl3e8h/XMy39VZZn29uLwH1vAE56g==
X-Received: by 2002:adf:f785:0:b0:274:c45:5c3c with SMTP id q5-20020adff785000000b002740c455c3cmr19754930wrp.46.1672643034083;
        Sun, 01 Jan 2023 23:03:54 -0800 (PST)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id l7-20020adfc787000000b002238ea5750csm33587582wrg.72.2023.01.01.23.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 23:03:53 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Alberto Pianon <alberto@pianon.eu>,
	Marta Rybczynska <marta.rybczynska@linaro.org>
Subject: [PATCH 2/2] cve-update-db-native: avoid partial updates
Date: Mon,  2 Jan 2023 08:03:27 +0100
Message-Id: <20230102070327.55373-2-rybczynska@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230102070327.55373-1-rybczynska@gmail.com>
References: <20230102070327.55373-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 07:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175314

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
 .../recipes-core/meta/cve-update-db-native.bb | 81 +++++++++++++------
 1 file changed, 56 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 642fda5395..89804b9e5c 100644
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
@@ -32,19 +34,15 @@ python do_fetch() {
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
-    cleanup_db_download(db_file)
+    cleanup_db_download(db_file, db_tmp_file)
 
     # The NVD database changes once a day, so no need to update more frequently
     # Allow the user to force-update
@@ -62,9 +60,55 @@ python do_fetch() {
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
+    if os.path.exists("{0}-journal".format(db_file)):
+        # If a journal is present the last update might have been interrupted. In that case,
+        # just wipe any leftovers and force the DB to be recreated.
+        os.remove("{0}-journal".format(db_file))
+
+        if os.path.exists(db_file):
+            os.remove(db_file)
+
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
@@ -82,7 +126,7 @@ python do_fetch() {
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e.reason)
-                return
+                return False
 
             if response:
                 for l in response.read().decode("utf-8").splitlines():
@@ -92,7 +136,7 @@ python do_fetch() {
                         break
                 else:
                     bb.warn("Cannot parse CVE metadata, update failed")
-                    return
+                    return False
 
             # Compare with current db last modified date
             cursor = conn.execute("select DATE from META where YEAR = ?", (year,))
@@ -113,7 +157,7 @@ python do_fetch() {
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
                     bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
-                    return
+                    return False
             else:
                 bb.debug(2, "Already up to date (last modified %s)" % last_modified)
             # Update success, set the date to cve_check file.
@@ -122,20 +166,7 @@ python do_fetch() {
 
         conn.commit()
         conn.close()
-}
-
-do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
-do_fetch[file-checksums] = ""
-do_fetch[vardeps] = ""
-
-def cleanup_db_download(db_file):
-    if os.path.exists("{0}-journal".format(db_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_file))
-
-        if os.path.exists(db_file):
-            os.remove(db_file)
+        return True
 
 def initialize_db(conn):
     with conn:
-- 
2.35.1


