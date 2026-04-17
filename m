Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9360CF8DFFF
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 17:29:20 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50734.1776446950615444776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 10:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jXEYUDqx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260417172907b3c1636fad0002077a-uovncj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260417172907b3c1636fad0002077a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 17 Apr 2026 19:29:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UIhuG2LxQGh1uWMnraXPATgft0lMZs7oM+6WVp2tWhQ=;
 b=jXEYUDqxuKDzz8VoPdgtnei34KUVs7DT5hCaXiVtiyJ18D5R8wIl1I7GEgxvXbeoGT70dV
 N+S3ZZwg6xIkGfLabcGudoX/8GCa7/r68nlwa7LztBq1s83rETc1MCFCdH34EL+YEJ31YWDF
 HrIsM0VF6eab75w6YLS74S1FLngo7X9wXj/4tKueFhNgyHZyydVbvBAINHPjicoQS5I7pc+q
 69pO070XQ3tpKGmyPhFGpk/tO96qdB9jBX2TtLC1jg+nggtItfEFXv9y5vHEa4Wr2f0f1iKw
 p8v1a8AwwOxnvJMQJYoiZrpCh2Daxizi6DuM5CKF95b+0JQmQ0LfLUjA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] create-spdx-3.0: rerun do_create_recipe_spdx on patch changes
Date: Fri, 17 Apr 2026 19:28:57 +0200
Message-ID: <20260417172857.8469-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 17:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235511

From: Peter Marko <peter.marko@siemens.com>

Valkyrie patchmetrics from 2026-04-17 is showing two CVEs where patches
were merged the day before (2026-04-16) - inetutils/CVE-2026-32746 and
re2c/CVE-2026-2903.
Root-cause is that the CVE patches are evaluated in task
do_create_recipe_spdx which does not have any dependency on SRC_URI nor
content of the patches, so it is taken from sstate-cache which contains
old (stale) data.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: reworked from scheduling after do_patch to using file-checksums flag

 meta/classes/create-spdx-3.0.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 432adb14cd..56fd01fd53 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -201,6 +201,7 @@ do_create_recipe_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_recipe_spdx[cleandirs] = "${SPDXRECIPEDEPLOY}"
 do_create_recipe_spdx[deptask] += "do_create_recipe_spdx"
 do_create_recipe_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
+do_create_recipe_spdx[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
 
 python do_create_recipe_spdx_setscene () {
     sstate_setscene(d)

