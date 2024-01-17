Return-Path: <ubely@ilbers.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0EEC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 08:08:18 +0000 (UTC)
Received: from shymkent.ilbers.de (shymkent.ilbers.de [85.214.156.166])
 by mx.groups.io with SMTP id smtpd.web10.4622.1705478889027654869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 00:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: ilbers.de, ip: 85.214.156.166, mailfrom: ubely@ilbers.de)
Received: from azat.m.ilbers.de (host-80-81-17-52.static.customer.m-online.net [80.81.17.52])
	(authenticated bits=0)
	by shymkent.ilbers.de (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id 40H8866i031709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 09:08:07 +0100
From: Uladzimir Bely <ubely@ilbers.de>
To: openembedded-core@lists.openembedded.org
Cc: Uladzimir Bely <ubely@ilbers.de>
Subject: [meta-oe][PATCH 1/2] buildstats: consider multiconfigs when collecting statistics.
Date: Wed, 17 Jan 2024 09:07:53 +0100
Message-Id: <20240117080754.16123-2-ubely@ilbers.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240117080754.16123-1-ubely@ilbers.de>
References: <20240117080754.16123-1-ubely@ilbers.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193900

When multiconfigs are used, statistics for the same package name but
from the different multiconfigs is collected into the same file.

This causes incorrect charts generated with pybootchartgui, when
only the most recent part of statistics is shown.

This patch adds custom multiconfig prefix to the file names that
hold statistics.

Signed-off-by: Uladzimir Bely <ubely@ilbers.de>
---
 meta/classes/buildstats.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 0de605200a..b417929b61 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -185,6 +185,8 @@ python run_buildstats () {
     if bn is not None:
         bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
         taskdir = os.path.join(bsdir, d.getVar('PF'))
+        if d.getVar('BB_CURRENT_MC') != 'default':
+            taskdir = os.path.join(bsdir, d.getVar('BB_CURRENT_MC') + '_' + d.getVar('PF'))
         if isinstance(e, bb.event.HeartbeatEvent) and bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_INTERVAL")):
             bb.utils.mkdirhier(bsdir)
             write_host_data(os.path.join(bsdir, "host_stats_interval"), e, d, "interval")
-- 
2.41.0


