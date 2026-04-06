Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6736FB5179
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 22:12:03 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66608.1775513516591672510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 15:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=k0WJHsz6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260406221153db7d90206a0002073d-c2i17x@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260406221153db7d90206a0002073d
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Apr 2026 00:11:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sxTaJ8WdaPLxaV4Ps/RE+WiZsrELO/6TTVIVshJZSI0=;
 b=k0WJHsz67NQk6RcUlJQlk8AcBlZJMvgEgggDhBtTR0WkMD9UJwEgq3Cq30morVz0mNj95G
 QTOkeIYi9+g1Rkgb0Y9RcWPA/wI2IgysqMvfbOiWcV50HiuOiMRvU/nfBK/fJ95+ELG1LMaK
 vT+GkeEs2lWvwUfR58Xeljv5EqYFIoIf5ViWAZHYJl4AweOE3Vw6JNshM4dYnX/aSw/mqtT0
 GafMN7Yhl7SlPPtDk70N5lwTIEj2RzJlAkcHY2Mtqy+wjjODNaCNGCmkD8aHKARDMys1zVSt
 vlFZHYw6yC78tSe3pcDHqXIXK9UORKbazJuLcp6gGX7rIJEtOq6i4aRw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/6] devtool/deploy: warn when deploying a recipe with dynamic UID/GID
Date: Tue,  7 Apr 2026 00:10:28 +0200
Message-ID: <20260406221133.2769152-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
References: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 22:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234687

From: Adrian Freihofer <adrian.freihofer@siemens.com>

When a recipe inherits useradd.bbclass but does not use
useradd-staticids, pseudo assigns arbitrary UID/GID values during the
build. Package preinst scripts normally handle this by running
useradd/groupadd on the target and then chowning the installed files to
the correct IDs. devtool deploy-target skips those preinst scripts, so
any deployed files that have non-root ownership will land on the target
with the wrong ownership, silently.

Add a warning to deploy() that fires when USERADD_PACKAGES is set and
'useradd-staticids' is absent from USERADDEXTENSION. The warning names
the affected users and groups to make it actionable.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 270e9104b2..7866cfbaae 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -157,6 +157,38 @@ def deploy(args, config, basepath, workspace):
         max_process = oe.utils.get_bb_number_threads(rd)
         fakerootcmd = rd.getVar('FAKEROOTCMD')
         fakerootenv = rd.getVar('FAKEROOTENV')
+
+        # Warn if the recipe creates users/groups without static IDs.
+        # Without useradd-staticids, pseudo assigns arbitrary UIDs/GIDs during
+        # the build. The target preinst scripts would normally re-create them
+        # with correct IDs and chown the files, but devtool deploy-target skips
+        # those scripts, so deployed files will have the wrong ownership.
+        useradd_packages = rd.getVar('USERADD_PACKAGES') or ''
+        if useradd_packages:
+            useraddextension = (rd.getVar('USERADDEXTENSION') or '').split()
+            if 'useradd-staticids' not in useraddextension:
+                users = set()
+                groups = set()
+                for pkg in useradd_packages.split():
+                    for param in (rd.getVar('USERADD_PARAM:%s' % pkg) or '').split(';'):
+                        param = param.strip().split()
+                        if param:
+                            users.add(param[-1])
+                    for param in (rd.getVar('GROUPADD_PARAM:%s' % pkg) or '').split(';'):
+                        param = param.strip().split()
+                        if param:
+                            groups.add(param[-1])
+                if users or groups:
+                    items = []
+                    if users:
+                        items.append('users: %s' % ', '.join(sorted(users)))
+                    if groups:
+                        items.append('groups: %s' % ', '.join(sorted(groups)))
+                    logger.warning('Recipe %s creates %s without static UID/GID '
+                                   'assignments (USERADDEXTENSION does not include '
+                                   '"useradd-staticids"). Deployed files may have '
+                                   'incorrect ownership on the target.'
+                                   % (args.recipename, ' and '.join(items)))
     finally:
         tinfoil.shutdown()
 
-- 
2.53.0


