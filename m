Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E76C5DF7E
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:41:44 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15976.1786909295039986467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=RO7ExbJm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260816194131bce9ea56e30002079a-wat99d@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260816194131bce9ea56e30002079a
        for <openembedded-core@lists.openembedded.org>;
        Sun, 16 Aug 2026 21:41:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=5VQ2D8P3tTzFlOGYHLE+KG4twPBVxqhSmR48g+AKgM4=;
 b=RO7ExbJm0616lNpH3l/UtGF2t9SNdFbBFhvEZD5xPLAbkqLDhxA11coFCOz4mO8YMRr1ov
 zmbeZMmqNDOGxDB/6XVpa5fgR4YMN/8OXP4/Y8D+bmbTWTN6/77nrZhuLZ3VyrXkTH8Ip1vE
 BHi5SHr0DoNttOSHnOdf3PTZNYOW7j11zrm08t/tBlTZGuGTQ7ndu0Vugzw9hukkqDkYsO8J
 VlaIu+LugHuigHG+YBlcqkrDNjHbPCq20GIxQFUmgQySal0eNY9XaCJaoYCjGOtoAvC0my0Q
 hDZTkSpH+2wVgEY7hUQyIHWVnVV9Butf/eMxggtCzqYIquPusc5sdncQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/14] devtool: deploy-target: pass tar -m to avoid future timestamp warnings
Date: Sun, 16 Aug 2026 21:40:44 +0200
Message-ID: <20260816194127.86607-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243549

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


