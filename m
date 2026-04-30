Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AFCFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 09:27:10 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16152.1777541209932558685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 02:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=XTkDvKIJ;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=573b96a85=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1777541210; x=1809077210;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=umDTb6SuOpdiiGS3b12SfEQyBvCLw0rzFZ1x2KPUQYI=;
  b=XTkDvKIJaXC+XvJFqVoMcnEZbhzLww1PXPI0Lav/PgOyuMILtEu/hduW
   E5CUTOifP4fL7canKX5iwBllF4jQIT/CTwCPzbyqdzk8+AXvGzsw6b1QT
   X6Eu9KOvi94CP/DqV7Y+TmpFHiK2lJnP/d0leIwQqVO5YnX3zvQF5rWy7
   E=;
X-CSE-ConnectionGUID: OlwVQEIkRJKcJgIZfBoz9A==
X-CSE-MsgGUID: +fYsizfiTKSJxQSW8aHf7g==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 30 Apr 2026 11:26:48 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw6.muc with
 ESMTP/TLS; 30 Apr 2026 11:26:48 +0200
Received: from smucmp15g.bmwgroup.net (HELO smucmp15g.europe.bmw.corp)
 ([10.30.13.141]) by esabb4.muc with ESMTP/TLS; 30 Apr 2026 11:26:48 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp15g.europe.bmw.corp (2a03:1e80:a15:58f::1:58) with Microsoft SMTP
 Server (version=TLS; Thu, 30 Apr 2026 11:26:47 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.200) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Thu, 30 Apr 2026 11:26:47 +0200
X-CSE-ConnectionGUID: FaL9Q6MlTAaHJQrYtz/Tvw==
X-CSE-MsgGUID: +L4NQ+zBSRq8N0h76evwXA==
X-CSE-ConnectionGUID: uRDOvoshTly9oGg/ENJe7Q==
X-CSE-MsgGUID: 0/EFZnUnQsWA9cHpQQbmkw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH v2] devtool: Disable gpg signing when setting up source tree repos
Date: Thu, 30 Apr 2026 11:26:36 +0200
Message-ID: <20260430092636.122677-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16f.europe.bmw.corp (2a03:1e80:a15:58f::1:148) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 09:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236151

This stops 'devtool modify foo' from failing with an error message like

    ERROR: Execution of 'git -c user.name=\"OpenEmbedded\" -c
    user.email=\"oe.patch@oe\" commit -q -m "Initial commit from upstream at
    version 1.90.0"' failed with exit code 128:
    error: cannot run ssh-keygen: No such file or directory
    error:
    fatal: failed to write commit object

when GPG signing is enabled in the git configuration.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 scripts/lib/devtool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index cb727f324f..f47f57c465 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -200,7 +200,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
         bb.process.run('git add -f -A .', cwd=repodir)
         commit_cmd = ['git']
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
-        commit_cmd += ['commit', '-q']
+        commit_cmd += ['commit', '-q', '--no-gpg-sign']
         stdout, _ = bb.process.run('git status --porcelain', cwd=repodir)
         if not stdout:
             commit_cmd.append('--allow-empty')

