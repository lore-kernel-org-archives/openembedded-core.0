Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14E1CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:58:41 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.18348.1756047516204537641
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=G8XK9x5A;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2025082414583319a10df9dc87d0e410-n7odl2@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025082414583319a10df9dc87d0e410
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:58:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zjt4tBiqSWchByK9h8R+WdSGf4DlnRvV/IxvBsT5+Qg=;
 b=G8XK9x5AvyUuwREHnHbsXg1eh2/HS9EU9xdBfAdUIxzJ3gEx50X4VTR4IAwcnxOOr7MkfA
 yCYQQWdmfYJlPwnrvx6u3lTlitbh/h3fvxljIZBC1UdzULMdivGWqo4Sc3ZeVyjwlowy1jI9
 Vc1BtdjWdIAF54KBeRMwuCQ8246GirthU3zpbbQ46twiAVldfkJ66/txum5AEzmd8TbSWSeg
 ZnzLG+E/CdyAzfuj0z3BcO9M4HJqOwYlMk+3A2h6SClXUn9UD7chgYACTmqwC12VPxyBs89H
 oXPG0cedSqTDTUbJ2iKmlhBxlgGkO5OP6i5s8nFWh4Es2zcPFXm53H7Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/7] cve-update-db-native: Use a local copy of the database during builds
Date: Sun, 24 Aug 2025 16:57:39 +0200
Message-Id: <20250824145745.1099373-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222381

From: Peter Marko <peter.marko@siemens.com>

OE-Core rev: 03596904392d257572a905a182b92c780d636744

This seems to be misimplemented when re-adding update from nvd1 feed.
Use file in temporary directory instead of downloads directory for
update process.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index dff5cd1c61..70bef2179f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -24,8 +24,7 @@ CVE_SOCKET_TIMEOUT ?= "60"
 
 CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
-
-CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DLDIR_FILE}.tmp"
+CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -44,7 +43,7 @@ python do_fetch() {
 
     db_file = d.getVar("CVE_CHECK_DB_DLDIR_FILE")
     db_dir = os.path.dirname(db_file)
-    db_tmp_file = d.getVar("CVE_DB_TEMP_FILE")
+    db_tmp_file = d.getVar("CVE_CHECK_DB_TEMP_FILE")
 
     cleanup_db_download(db_file, db_tmp_file)
 
@@ -64,6 +63,7 @@ python do_fetch() {
         pass
 
     bb.utils.mkdirhier(db_dir)
+    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
     if os.path.exists(db_file):
         shutil.copy2(db_file, db_tmp_file)
 

