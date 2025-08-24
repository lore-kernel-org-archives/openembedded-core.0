Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CEDCA0EFF
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:59:41 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.18374.1756047580918115640
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HWDALIZn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025082414593817a906d5d9bd18d836-yaop_2@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025082414593817a906d5d9bd18d836
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:59:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=y7g0AQY1yBtG4zUn3ezNtKWHjMSxAUz1pUJMwzlMUNk=;
 b=HWDALIZn2zWfUfAAWPVR7/qlzjPKBD4IwFam1RpQDVv7KsROuhttTRXbyx4NWmCzQ/OFbj
 YfzCMuVYHYJPO5Vay26megvQuA2OC1EnSHSI1o+I5njLnp3CCpjRG2Sh13xRVnKJRi2oFdIv
 nPZBGDujSMsV2r8fEXs1ocvIPUlmHiMvseXkwdTIFrkTfSNsbH/fj21VGoYv97pI6zlPAGer
 KPh7Kq9VhellLMWYx7cAmp7B4bWy43fTGXEJG7UkTxNpyjTkekgwUc0bI0XfOPVuDgz37z8k
 rubowroESqFlfeUHGulR8SKA4C5JzC/PAa1ed19RE+RGHJJudyO87WfA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 5/7] cve-update: remove cleanup of db_file in downloads
Date: Sun, 24 Aug 2025 16:57:43 +0200
Message-Id: <20250824145745.1099373-5-peter.marko@siemens.com>
In-Reply-To: <20250824145745.1099373-1-peter.marko@siemens.com>
References: <20250824145745.1099373-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222385

From: Peter Marko <peter.marko@siemens.com>

Since the code was changed to update the DB in temporary file, code
cleaning the final file in downloads is never executed.
Remove it.

Since the code always removes both files in temporary directory, remove
also comment which is trying to differentiate this code from code just
removed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb  | 17 ++---------------
 .../recipes-core/meta/cve-update-nvd2-native.bb | 17 ++---------------
 2 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index ecdb1ed8fd..43cafb52b1 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -45,7 +45,7 @@ python do_fetch() {
     db_dir = os.path.dirname(db_file)
     db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
-    cleanup_db_download(db_file, db_tmp_file)
+    cleanup_db_download(db_tmp_file)
 
     # The NVD database changes once a day, so no need to update more frequently
     # Allow the user to force-update
@@ -91,28 +91,15 @@ python do_unpack() {
 }
 do_unpack[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_LOCK}"
 
-def cleanup_db_download(db_file, db_tmp_file):
+def cleanup_db_download(db_tmp_file):
     """
     Cleanup the download space from possible failed downloads
     """
 
-    # Clean up the updates done on the main file
-    # Remove it only if a journal file exists - it means a complete re-download
-    if os.path.exists("{0}-journal".format(db_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_file))
-
-        if os.path.exists(db_file):
-            os.remove(db_file)
-
     # Clean-up the temporary file downloads, we can remove both journal
     # and the temporary database
     if os.path.exists("{0}-journal".format(db_tmp_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
         os.remove("{0}-journal".format(db_tmp_file))
-
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 83876c7467..f7a306c995 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -57,7 +57,7 @@ python do_fetch() {
     db_dir = os.path.dirname(db_file)
     db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
-    cleanup_db_download(db_file, db_tmp_file)
+    cleanup_db_download(db_tmp_file)
     # By default let's update the whole database (since time 0)
     database_time = 0
 
@@ -106,28 +106,15 @@ python do_unpack() {
 }
 do_unpack[lockfiles] += "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FILE_LOCK}"
 
-def cleanup_db_download(db_file, db_tmp_file):
+def cleanup_db_download(db_tmp_file):
     """
     Cleanup the download space from possible failed downloads
     """
 
-    # Clean up the updates done on the main file
-    # Remove it only if a journal file exists - it means a complete re-download
-    if os.path.exists("{0}-journal".format(db_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
-        os.remove("{0}-journal".format(db_file))
-
-        if os.path.exists(db_file):
-            os.remove(db_file)
-
     # Clean-up the temporary file downloads, we can remove both journal
     # and the temporary database
     if os.path.exists("{0}-journal".format(db_tmp_file)):
-        # If a journal is present the last update might have been interrupted. In that case,
-        # just wipe any leftovers and force the DB to be recreated.
         os.remove("{0}-journal".format(db_tmp_file))
-
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 

