Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D80BCA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:59:21 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.18367.1756047557387973094
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=G7yvLzYV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250824145914ce434e94e208a991c4-wqw2va@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250824145914ce434e94e208a991c4
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:59:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ynRdbeCpP5pQgq/KUqLdc38ZgAA1027vYmdHjxK8/eE=;
 b=G7yvLzYVu6eyPnOLbOd9rZX3m+JLq4PWFM4OyaJTcF2cPQ6qQ3TWewe0qgYqDxx+BVYT5K
 tAfOS8CWmx+hJ6CA3sBWLJY99eH3RphGD8xq8qFV8SR7zSWOvgTnSCnu67l9JNBgB2favwfx
 lzkCou2nZK78fBKMqRzRPplolsQ+GcZarV/dSIFjuaKIn4xinL8sML1Au6nAYuK22LT5876z
 5H0uePV8jaxg5ryWsUCzPvYy5lHldxgSQxVoP/7wEFDOaoSd8ImIdvOBYrqhdTxD+tow/eBK
 jZjERgaq9dhJ9j3ok7+QVXKKbXgByG0OlsZ/Ln+Sw1hLHw2zsWHQO3qw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/7] cve-update-db-native: Handle BB_NO_NETWORK and missing db
Date: Sun, 24 Aug 2025 16:57:40 +0200
Message-Id: <20250824145745.1099373-2-peter.marko@siemens.com>
In-Reply-To: <20250824145745.1099373-1-peter.marko@siemens.com>
References: <20250824145745.1099373-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 14:59:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222382

From: Peter Marko <peter.marko@siemens.com>

OE-Core rev: 337c0806d2784d74bee8d6420fb8b4d48795d5fa

This commit was not applied on nvd1/fkie fetcher.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 70bef2179f..fe7b8a017f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -54,6 +54,8 @@ python do_fetch() {
         update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
         if update_interval < 0:
             bb.note("CVE database update skipped")
+            if not os.path.exists(db_file):
+                bb.error("CVE database %s not present, database fetch/update skipped" % db_file)
             return
         if time.time() - os.path.getmtime(db_file) < update_interval:
             bb.debug(2, "Recently updated, skipping")
@@ -62,6 +64,9 @@ python do_fetch() {
     except OSError:
         pass
 
+    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
+        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe uses CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable fetch or update")
+
     bb.utils.mkdirhier(db_dir)
     bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
     if os.path.exists(db_file):

