Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEECCA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 19:00:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.73730.1756234812793816552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 12:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cTlogH1O;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025082619000985caa5ec6d00020715-mmyhq3@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025082619000985caa5ec6d00020715
        for <openembedded-core@lists.openembedded.org>;
        Tue, 26 Aug 2025 21:00:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4FdOQYi+aZHxiSMGFVr+G9nrYG2g6QVXSo1e3VwW5Sg=;
 b=cTlogH1OPjXFkDwK7tqiPFSbBqrtUVQ7s8BFmen3Rt/0HqFRLLZ0jewW907hVPeo0/Bfhd
 6E9+DOZLh0euk/FEEC4g2orebzk2YekKqbjkSowgPhlH7i1WEnqbi9zAnj8KnqyiBHMpSyju
 U/zcCv8gqJmGw3DleinK84F1efw4Bc9dtJWZV+yEb1e1PyW1VZWzYSQtQEElOZND05qI2ihz
 rWdRKT7lNKlkwxYWpxdhBj4z0/75eyQqeI5a0aAeQGP5ENFaEr1iHJhYM8vKJXy2bTo9H14Y
 RfXKVsGqQYa1bicKKuxMSmnDERrWZ4p+E2FiQAY3FXGFGql6YEPD12Lw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] cve-update: log timestamps and add force update for future time
Date: Tue, 26 Aug 2025 20:59:22 +0200
Message-Id: <20250826185922.20154-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 19:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222475

From: Peter Marko <peter.marko@siemens.com>

CVE update is currently not working properly on autobuilder.
This improves logging for problem analysis.

Future time is something which could be reason for current autobuilder
problems since the DB was not updated for more than 3 months by now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb   |  7 ++++++-
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 11 ++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 0c7bc5f4151..713c73e574f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -57,7 +57,12 @@ python do_fetch() {
             if not os.path.exists(db_file):
                 bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
-        if time.time() - os.path.getmtime(db_file) < update_interval:
+        curr_time = time.time()
+        database_time = os.path.getmtime(db_file)
+        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), time.ctime(database_time)))
+        if curr_time < database_time:
+            bb.warn("Database time is in the future, force DB update")
+        elif curr_time - database_time < update_interval:
             bb.note("CVE database recently updated, skipping")
             return
 
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index f7a306c995c..1411d16e20a 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -71,10 +71,15 @@ python do_fetch() {
             if not os.path.exists(db_file):
                 bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
-        if time.time() - os.path.getmtime(db_file) < update_interval:
-            bb.note("CVE database recently updated, skipping")
-            return
+        curr_time = time.time()
         database_time = os.path.getmtime(db_file)
+        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time), time.ctime(database_time)))
+        if curr_time < database_time:
+            bb.warn("Database time is in the future, force DB update")
+            database_time = 0
+        elif curr_time - database_time < update_interval:
+            bb.note("CVE database recently updated, skipping")
+            return
 
     except OSError:
         pass

