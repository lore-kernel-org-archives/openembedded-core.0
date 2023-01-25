Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCF2C54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:17 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.46639.1674657732410551900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=AO44pLn/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id c124so4977910pfb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt6snABrVebGXOhTc9frZnq/CLjaLlQ6lJk6nUjhgjA=;
        b=AO44pLn/LGXuHXDjL4p5gaegtrtMcxpPG9j81RPbTG04UR+Ja9dnnOG1kFxxYvWTg+
         kUmsjWU4Pgrpz9oCOXgNuVGfNWovwosAr0lPjD2fns+T0S5Wu2TFSzf02r1sULGVf46m
         qVal/wHywszX0BUUdIDDcnWJi4JnufRodro+f+1HkFDLNxi66AkM/BMuXnnoC1obkBxv
         q1Uu1xW51bK6xyif45taoINzKTovbnglq/4yCngP0XTrboWSwg/hE4ArpF7uSJWGk/2f
         zDyyO8Gi+TFfrix0FQ+0QdbBlkJQfhzNgxlGwhJV1q1SNG0cmqDaKN2Vv/c8l+NyxIhl
         M6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dt6snABrVebGXOhTc9frZnq/CLjaLlQ6lJk6nUjhgjA=;
        b=IGhEqedUteBbcqoV0+7suj++vZhl68qg9BpzWEQbp+APtHcqymQMB5CCOuWFc/nF9y
         iz4PcdzU1gO67IsNEJHkjeppMcrVfRRPb0mhax5HlI5H7fQ94T3q6Yv16cmhrWbKV9sv
         Fy3Iko/DyCJFl0aJ4MamV+NpIXqUoWUtfJsFeV2xmLWU0x1Ntpv9fifrMaUo+wmJxGYj
         JEKHg71oJu+J0NwIApu7aOqgGUMYrXAzGWT4r7MIqX7YDmZLfAHiqn85yIAmveQSxRk4
         Ad5ftAcMdf7qqnMYoyxgn84+CRmlP3whh0UBB1IfWwO72c4dRw+pO44kHkpWdXyqOYQ5
         s1Jg==
X-Gm-Message-State: AFqh2koGl1aRLCIQCdyYt+p22KgAng893BIT8fsLn0Sj5znwzbupp9MM
	lafDmxXhkqqBJHTUnGFSU4YPhekoO+Yhunhjt14=
X-Google-Smtp-Source: AMrXdXv/R/M4ak12gbzVAa0pTPo4kCgFLAyCi4HQAahBIZ9h3eLaE7wQiT21miiWNxFpB7S1jZM5EA==
X-Received: by 2002:a05:6a00:24d4:b0:57e:866d:c095 with SMTP id d20-20020a056a0024d400b0057e866dc095mr42202650pfv.25.1674657731356;
        Wed, 25 Jan 2023 06:42:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/16] cve-update-db-native: avoid incomplete updates
Date: Wed, 25 Jan 2023 04:41:46 -1000
Message-Id: <6a219c50ee12b7fb584e2db3e4dde171903acfb7.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176354

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
index e267671628..28605bc13b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -21,6 +21,8 @@ CVE_DB_UPDATE_INTERVAL ?= "86400"
 CVE_SOCKET_TIMEOUT ?= "60"
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
 
+CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
+
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
@@ -32,25 +34,15 @@ python do_fetch() {
     """
     import bb.utils
     import bb.progress
-    import sqlite3, urllib, urllib.parse, shutil, gzip
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
@@ -67,9 +59,60 @@ python do_fetch() {
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
@@ -87,7 +130,7 @@ python do_fetch() {
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fetch CVE data.\n\n')
                 bb.warn("Failed to fetch CVE data (%s)" % e.reason)
-                return
+                return False
 
             if response:
                 for l in response.read().decode("utf-8").splitlines():
@@ -97,7 +140,7 @@ python do_fetch() {
                         break
                 else:
                     bb.warn("Cannot parse CVE metadata, update failed")
-                    return
+                    return False
 
             # Compare with current db last modified date
             cursor = conn.execute("select DATE from META where YEAR = ?", (year,))
@@ -118,7 +161,7 @@ python do_fetch() {
                 except urllib.error.URLError as e:
                     cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
                     bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
-                    return
+                    return False
             else:
                 bb.debug(2, "Already up to date (last modified %s)" % last_modified)
             # Update success, set the date to cve_check file.
@@ -127,11 +170,7 @@ python do_fetch() {
 
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


