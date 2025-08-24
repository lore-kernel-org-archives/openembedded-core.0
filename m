Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3D8CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 14:59:41 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.18222.1756047572994020825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 07:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=X4IRYbzO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2025082414593104b7252aee4973825b-yvjox_@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025082414593104b7252aee4973825b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 16:59:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kRwxljFGk/m2uU+0TPOWZ1EldkHAQRb94q7iZVqHGYE=;
 b=X4IRYbzO6vsCneDNHB7GbbelWdWUu864EIm+RqMCared6MGgpXg/2g2yQEdRhyFQ0akKPr
 7DmZ0SP0MNGc324Vx+vP0/O5T+A2Q1psQHbhJJJKSFSEvKMziZlTl2zT9lC1zNbYe7XFd+jO
 lrhWF4Cw/e42HhMX0ocSwveSxizg1HbxEJAvGsUSO0m7E0aEzcbfbgNmOBIdOAC374l0Tkzk
 GnAmE7cfzqUhEU5w8Nv3+Pq0NbmzJBUkEsTTtZd8g2bfHdIVI3PVW0JfMNllQjqq6b2BAhJl
 8iddQlp5J8B5aQ2Rp27Dzfm9jylSGIX6vvtTsMhT/YZjJdeyEAz2etnQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 4/7] cve-update: decrease update interval to 23 hours
Date: Sun, 24 Aug 2025 16:57:42 +0200
Message-Id: <20250824145745.1099373-4-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222384

From: Peter Marko <peter.marko@siemens.com>

If the job runs every day at the same time, it usually updates only
every second day, because it takes non-0 time for DB update and set the
timestamp. So it does not take full 24-hours from time when the DB was
updated until the next job starts.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb   | 4 ++--
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 8a3746a9c1..ecdb1ed8fd 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -14,10 +14,10 @@ deltask do_populate_sysroot
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
 FKIE_URL ?= "https://github.com/fkie-cad/nvd-json-data-feeds/releases/latest/download/CVE-"
 
-# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# CVE database update interval, in seconds. By default: once a day (23*60*60).
 # Use 0 to force the update
 # Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?= "86400"
+CVE_DB_UPDATE_INTERVAL ?= "82800"
 
 # Timeout for blocking socket operations, such as the connection attempt.
 CVE_SOCKET_TIMEOUT ?= "60"
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 32a14a932b..83876c7467 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -20,10 +20,10 @@ NVDCVE_URL ?= "https://services.nvd.nist.gov/rest/json/cves/2.0"
 # then setting this to get higher rate limits.
 NVDCVE_API_KEY ?= ""
 
-# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# CVE database update interval, in seconds. By default: once a day (23*60*60).
 # Use 0 to force the update
 # Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?= "86400"
+CVE_DB_UPDATE_INTERVAL ?= "82800"
 
 # CVE database incremental update age threshold, in seconds. If the database is
 # older than this threshold, do a full re-download, else, do an incremental

