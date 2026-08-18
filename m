Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE81C5DF8B
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 06:31:44 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3326.1787034698953510541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 23:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=ae58XCrI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202608180631360b7346dd7700020755-oufiyo@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608180631360b7346dd7700020755
        for <openembedded-core@lists.openembedded.org>;
        Tue, 18 Aug 2026 08:31:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5VQ2D8P3tTzFlOGYHLE+KG4twPBVxqhSmR48g+AKgM4=;
 b=ae58XCrIaW4R9h7gevvprImsTw6cErRoCrZkTd9Wct2WuhqQ+x9P0klY9OSketVJAuf6ty
 qN871z3N60APD9xskWnZlR6n6eo6vAy+E/gDFjpXi1ELWb/qK0XkDJ6A0iSTiM1w8fx172a0
 OTU/puuYMKp0D0OKiDaFByGPPInCxqT7BOuGZvC1YN1AGD63rsu8b4hH4eUFFGHnc5AUxM3I
 6JAMoXNJZi2fFyqnSr3NsmtqgagK8CnO6L9UHZYotR/TpYU+b3a6J797kj3olblT96mmirqM
 vd9cBjKZMYLZoGidAZokHD7pOlykDg/gfFmjTFPWN/bFaPyDf3bKheIQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 02/14] devtool: deploy-target: pass tar -m to avoid future timestamp warnings
Date: Tue, 18 Aug 2026 08:30:41 +0200
Message-ID: <20260818063120.73042-3-adrian.freihofer@siemens.com>
In-Reply-To: <20260818063120.73042-1-adrian.freihofer@siemens.com>
References: <20260818063120.73042-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 06:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243654

From: Adrian Freihofer <adrian.freihofer@siemens.com>

devtool deploy-target tars up the build output and pipes it through
ssh to the target, where it's extracted with "tar xv". If the
target's clock is behind the host, tar prints a "time stamp ... is
... in the future" warning per file, since the archived mtimes come
from the host.

Add -m (--touch) so tar sets mtimes to the current time on extraction
instead of restoring them from the archive, avoiding the warning.
Supported identically by GNU tar and BusyBox tar.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/deploy.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 8228d9914f..35ec0b1b4d 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -108,9 +108,10 @@ def _prepare_remote_script(deploy, destdir='/', verbose=False, dryrun=False, und
         lines.append('mkdir -p `dirname $manifest`')
         lines.append('mkdir -p $2')
         if verbose:
-            lines.append('    tar xv -C $2 -f - | tee $manifest')
+            # -m avoids "time stamp is in the future" warnings if the target's clock is behind
+            lines.append('    tar xvm -C $2 -f - | tee $manifest')
         else:
-            lines.append('    tar xv -C $2 -f - > $manifest')
+            lines.append('    tar xvm -C $2 -f - > $manifest')
         lines.append('sed -i "s!^./!$2!" $manifest')
     elif not dryrun:
         # Put any preserved files back
-- 
2.55.0


