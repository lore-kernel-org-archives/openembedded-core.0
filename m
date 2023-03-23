Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C0FC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 11:02:49 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.69662.1679569367267595956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 04:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FG4ONQ3a;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202303231102439fcc5f1cfcc2adfb7b-n_ccuv@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202303231102439fcc5f1cfcc2adfb7b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 23 Mar 2023 12:02:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JF0DSUikZwR/QAHPm/NiRLm3Xmg711nIs4ObgrOQVsw=;
 b=FG4ONQ3a72Knh0joQvnemhE0lDwGQ3mxfOTWB/ojt69G7g4ufIEZJ/lVd/8CB3GMCM0o00
 utaonxDqGeSX2/4drchjJvWRPoU/ZzBQoncyPqWpXeZQnSyYxoEDhvGXsgvZrGxAxgh8ZrDi
 +ggeaW1d8Xnxd+3HDHBAwo1vniDSY=;
From: "P. Marko" <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][langdale][kirkstone][PATCH] gcc-shared-source: ensure that S exists in do_deploy_source_date_epoch
Date: Thu, 23 Mar 2023 12:01:46 +0100
Message-Id: <20230323110146.243968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 11:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178977

From: Peter Marko <peter.marko@siemens.com>

This include overrides do_deploy_source_date_epoch function
and is additionally referencing ${S}.
If ${S} does not exist yet, the function will fail because
it cannot evaluate path .. from non-existing directory.

Reproducer (verified in kirkstone):
  bitbake gcc -c deploy_source_date_epoch
  bitbake gcc -c cleansstate
  rm -rf build/tmp
  bitbake gcc -c deploy_source_date_epoch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index cd2e341099..7c84ea088d 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -10,6 +10,7 @@ SRC_URI = ""
 do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
 do_deploy_source_date_epoch[depends] += "gcc-source-${PV}:do_deploy_source_date_epoch"
+do_deploy_source_date_epoch[dirs] += "${S}"
 
 # Copy the SDE from the shared workdir to the recipe workdir
 do_deploy_source_date_epoch () {
-- 
2.30.2


