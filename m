Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7ACD597A8
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 21:23:20 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.97868.1731446593575161267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 13:23:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4ACLNBm6013399
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 15:23:12 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-update-nvd2-native: Handle BB_NO_NETWORK and missing db
Date: Tue, 12 Nov 2024 15:23:11 -0600
Message-Id: <1731446591-5101-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 21:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207068

From: Mark Hatle <mark.hatle@amd.com>

The custom do_fetch routine is ignoring BB_NO_NETWORK, add a check for this
as the correct behavior for the user is to set:
  CVE_DB_UPDATE_INTERVAL = "-1"

If CVE_DB_UPDATE_INTERNAL is set to -1, check that a DB file exists, if not
we need to error so the user can deal with this.

Note, MIRRORs are NOT handled by this code.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---

For reference current behavior is a silent failure (due to being a bb.note)
that then results in an empty .cve file in the image directory and a bb.note
in each do_check_cve task log, but not to the screen.

This will ensure that the user gets an ERROR if they are in a no-network
situation and have not dealt with the database issues.  It does not resolve
the issue where things may still process with a non-existant database and give
a blank result.

Note, this applies to both master and scarthgap.  I haven't checked Styhead
yet, but once it's integrated in master then I'll work on backports for both.

 meta/recipes-core/meta/cve-update-nvd2-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 93d1fa1de6..a68a8bb89f 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -68,6 +68,8 @@ python do_fetch() {
         update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
         if update_interval < 0:
             bb.note("CVE database update skipped")
+            if not os.path.exists(db_file):
+                bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
         if time.time() - os.path.getmtime(db_file) < update_interval:
             bb.note("CVE database recently updated, skipping")
@@ -77,6 +79,9 @@ python do_fetch() {
     except OSError:
         pass
 
+    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
+        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe uses CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch or update")
+
     bb.utils.mkdirhier(db_dir)
     bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
     if os.path.exists(db_file):
-- 
2.34.1


