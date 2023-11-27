Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0F4C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 19:38:20 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.104713.1701113895489240338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 11:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FliZZ9Qg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2023112719381314f1c8dc1745ae5657-gi16xj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2023112719381314f1c8dc1745ae5657
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Nov 2023 20:38:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=uJwX6SUGxfPvTT9sZaI1AzQ7IeSg8WyOUscBTlSpS9k=;
 b=FliZZ9QgoqdjiEjKuGVTZMVgMb0+QVguVFtmMQltJ7Kyi198U4w+54e/amUoB2Cuh/Nh4R
 Buaffqeh9hZNKmSgG58iKiLcZgXoNycCOrf92zxwbxsplzLQ/25GmIhNiLF0nHT0n0+AG4Dv
 ZB/tHm3Rf0nZCFYE2Um/Th8PtSTuw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] cve-update-nvd2-native: make number of fetch attemtps configurable
Date: Mon, 27 Nov 2023 20:37:08 +0100
Message-Id: <20231127193708.427995-2-peter.marko@siemens.com>
In-Reply-To: <20231127193708.427995-1-peter.marko@siemens.com>
References: <20231127193708.427995-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 19:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191319

From: Peter Marko <peter.marko@siemens.com>

Sometimes NVD servers are unstable and return too many errors.

Last time we increased number of attempts from 3 to 5, but
further increasing is not reasonable as in normal case
too many retries is just abusive.

Keep retries low as default and allow to increase as needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 64a96a46f0..dab0b69edc 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,6 +26,9 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
+# Number of attmepts for each http query to nvd server before giving up
+CVE_DB_UPDATE_ATTEMPTS ?= "5"
+
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
 
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
@@ -111,7 +114,7 @@ def cleanup_db_download(db_file, db_tmp_file):
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
-def nvd_request_next(url, api_key, args):
+def nvd_request_next(url, attempts, api_key, args):
     """
     Request next part of the NVD dabase
     """
@@ -127,7 +130,7 @@ def nvd_request_next(url, api_key, args):
         request.add_header("apiKey", api_key)
     bb.note("Requesting %s" % request.full_url)
 
-    for attempt in range(5):
+    for attempt in range(attempts):
         try:
             r = urllib.request.urlopen(request)
 
@@ -183,10 +186,11 @@ def update_db_file(db_tmp_file, d, database_time):
         index = 0
         url = d.getVar("NVDCVE_URL")
         api_key = d.getVar("NVDCVE_API_KEY") or None
+        attempts = int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
 
         while True:
             req_args['startIndex'] = index
-            raw_data = nvd_request_next(url, api_key, req_args)
+            raw_data = nvd_request_next(url, attempts, api_key, req_args)
             if raw_data is None:
                 # We haven't managed to download data
                 return False
-- 
2.30.2


