Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52554C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:38 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28904.1788763051709714317
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=DwIW3b91;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202609070637298fd15167ac000207ab-nd1w9v@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202609070637298fd15167ac000207ab
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Sep 2026 08:37:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zYG0e4ej8TNUoQk2tx+r2uj0vaZOTs/okZIRpj3iVQk=;
 b=DwIW3b91xQ7srjVSgZ7rs3Jq6wWNEvfr2SKqYjiczgHVLWxHATqvGJrP429hyO6V46eIyv
 hoADxRuKLAkeEH38D1jd0I0ODBMa1+I+aFWk1sEZzzJgIWGjrEzhQM/r1/Z6iCeAh74pkpTN
 KvnXmjFwZ5xxgmOfl1mwB+JBzEADIeJFcauury1LadcGWBs5RvrTvl1oN+XArJIoH20PvWkw
 ijfG94yaGasREPky8/hFJPGbnA/2SLzdwNqZcuGhPbE4FKaX3TgNPx97oBlNHqMyHOSuZX8b
 sjxZdYAemukf2Vf/zu6bf8kmpndiJ3Nvp+Ot2y8GKxt+HVIQq5bIyVrQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 9/9] devtool: deploy: remove dead files_list computation
Date: Mon,  7 Sep 2026 08:36:15 +0200
Message-ID: <20260907063720.56742-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260907063720.56742-1-adrian.freihofer@siemens.com>
References: <20260907063720.56742-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245236

From: Adrian Freihofer <adrian.freihofer@siemens.com>

deploy_no_d() built a files_list from os.walk(recipe_outdir) after a
successful deploy but never used it. It fed a host-side manifest file
written via open(deploy_file, 'w') until commit a16a0c9334b7
("devtool: deploy-target: write deployed files list to target",
2016-02-19), which moved manifest writing to the target's shell script
and dropped that write, leaving the list-building loop as dead code
ever since.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 7a83d4a23a..51a1944f38 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -431,12 +431,6 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
 
     logger.info('Successfully deployed %s' % recipe_outdir)
 
-    files_list = []
-    for root, _, files in os.walk(recipe_outdir):
-        for filename in files:
-            filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
-            files_list.append(os.path.join(destdir, filename))
-
     return 0
 
 def undeploy(args, config, basepath, workspace):
-- 
2.55.0


