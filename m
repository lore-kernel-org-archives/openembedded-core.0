Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23720C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 12:26:30 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.71116.1679574379959074637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 05:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hctXSR+l;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20230323122616d5f963e8a1d66ebdd4-pdsxqd@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20230323122616d5f963e8a1d66ebdd4
        for <openembedded-core@lists.openembedded.org>;
        Thu, 23 Mar 2023 13:26:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=braVwp1QL8mbubtkJjaLiVmFdIjUJkshIyNc4Mk8PM4=;
 b=hctXSR+l41P1tfJ/wUzboCRIEkBD2FbvDfmwI3H+O9Kvicy6E/aP6v25uJZFkY3GLfXPYj
 U/Q64x8UM8ZcVm1jGyvOFgJJbygSHLGQwHHQNcutbLakUkrprEPWKuTHnfv9pTB9wecxROan
 63VayS1d7nYF9k80sf4UzsC0tcTAI=;
From: "P. Marko" <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][langdale][kirkstone][PATCH] gcc-shared-source: do not use ${S}/.. in  deploy_source_date_epoch
Date: Thu, 23 Mar 2023 13:25:16 +0100
Message-Id: <20230323122516.336367-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 12:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178982

From: Peter Marko <peter.marko@siemens.com>

This function is referencing '${S}/..'.
It uses ${S} only as good known directory path to start
traversing from, and it does not need it to exist or be populated.
If ${S} does not exist yet, the function will fail because
it cannot evaluate path .. from non-existing directory.

Reproducer (verified in master and kirkstone):
  bitbake gcc -c deploy_source_date_epoch
  bitbake gcc -c cleansstate
  rm -rf build/tmp
  bitbake gcc -c deploy_source_date_epoch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index cd2e341099..03f520b093 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -16,6 +16,6 @@ do_deploy_source_date_epoch () {
 	sde_file=${SDE_FILE}
 	sde_file=${sde_file#${WORKDIR}/}
 	mkdir -p ${SDE_DEPLOYDIR} $(dirname ${SDE_FILE})
-	cp -p ${S}/../$sde_file ${SDE_DEPLOYDIR}
-	cp -p ${S}/../$sde_file ${SDE_FILE}
+	cp -p $(dirname ${S})/$sde_file ${SDE_DEPLOYDIR}
+	cp -p $(dirname ${S})/$sde_file ${SDE_FILE}
 }
-- 
2.30.2


