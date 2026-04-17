Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D99F8DFE9
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:31:05 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40141.1776414661096994772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VFP1Q5dJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260417083057b6477d00420002074e-_0opyd@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260417083057b6477d00420002074e
        for <openembedded-core@lists.openembedded.org>;
        Fri, 17 Apr 2026 10:30:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gUC2xdQFHvFXp3UH3H//FAfSEPFz/YlTaUHWLpCkwbI=;
 b=VFP1Q5dJpWiKPD+F7ErkWdW7MVivNYPY24s49r3R0bON6OCGEkI+cjX8UINMk63ia6gKgD
 LziKV42i2R4OxQTQzTMd7C2Bdo9znISFud3jT09hR68+HGsTmZ16WKWxkgBbQo2IKuiPnqNd
 b19CoYnr0HBfdEoJNBBaiT+9RkFEbbeVGT5XlK1zfLtCSj9bH2sQdMDj6mqLpbySqc5fnLcO
 3YXuHNgTDFD6rL5M7pR4zvpv09C5ZHrYd9Oea5zeddH/3wcWXKpi0xpqJVukXvB+Agd1f8dG
 LMspqJqBxRbf4tDPyM+SGsOFxo+rcekWY2yvFD9PXDDr+iUZgcRppnWA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] create-spdx-3.0: rerun do_create_recipe_spdx on patch changes
Date: Fri, 17 Apr 2026 10:30:25 +0200
Message-ID: <20260417083025.95554-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 08:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235490

From: Peter Marko <peter.marko@siemens.com>

Valkyrie patchmetrics from 2026-04-17 is showing two CVEs where patches
were merged the day before (2026-04-16) - inetutils/CVE-2026-32746 and
re2c/CVE-2026-2903.
Root-cause is that the CVE patches are evaluated in task
do_create_recipe_spdx which does not have any dependency on SRC_URI nor
content of the patches, so it is taken from sstate-cache which contains
old (stale) data.

Note that this will mean that running sbom-cve-check will run do_fetch
task for all evaluated recipes, however that is necessary to catch also
changes within patch content (e.g. adding additional CVE: tags) in
addition to re-running when adding new patches if we would only add
dependency on SRC_URI variable.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 432adb14cd..db1ccc0c81 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -192,7 +192,7 @@ python do_create_recipe_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_recipe_spdx(d)
 }
-addtask do_create_recipe_spdx
+addtask do_create_recipe_spdx after do_fetch
 
 SSTATETASKS += "do_create_recipe_spdx"
 do_create_recipe_spdx[sstate-inputdirs] = "${SPDXRECIPEDEPLOY}"

