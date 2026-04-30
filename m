Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D28ACCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 08:47:58 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15722.1777538876258355908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 01:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=VHDrRxeY;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=573b96a85=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1777538876; x=1809074876;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZMytQmql6hymuOngb141CYr2Ve7rz137c/9Nrmxv2q8=;
  b=VHDrRxeYmCLS5zFiqL1Xm5MsvfAD0/9nM+hA88JGXVe8g3wBghDWDEyl
   qhudctaTJsNs+P86Hj+pSJFQTIBUh9NiQwHWGB2BHB+GnIMoD33YiJVcg
   nEQ8LsPu7N5U5oARCQKBda4Weyk6Yxck717ZO4N4RX4Ka0BBJ02INw8cS
   g=;
X-CSE-ConnectionGUID: LCv2tL5rSbaIgcmXl5aGkg==
X-CSE-MsgGUID: RdbkqY+IRIq8xs/u4opmhQ==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 30 Apr 2026 10:47:54 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw6.muc with
 ESMTP/TLS; 30 Apr 2026 10:47:54 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb4.muc with ESMTP/TLS; 30 Apr 2026 10:47:54 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d) with Microsoft SMTP
 Server (version=TLS; Thu, 30 Apr 2026 10:47:53 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.209) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Thu, 30 Apr 2026 10:47:53 +0200
X-CSE-ConnectionGUID: vNP2FIx+SYeEDAw8QTdyBg==
X-CSE-MsgGUID: X/EH8qVrRVGEEBJq7gblKg==
X-CSE-ConnectionGUID: oOM+HgciRE+QWXBIpmXjHA==
X-CSE-MsgGUID: UcZL9s6KQVOV1LCDfw5J4w==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] devtool: Disable gpg signing when setting up source tree repos
Date: Thu, 30 Apr 2026 10:47:24 +0200
Message-ID: <20260430084724.116381-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17f.europe.bmw.corp (2a03:1e80:a16:52a::1:65) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 08:47:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236147

This stops 'devtool modify foo' from failing with an error message like

    ERROR: Execution of 'git -c user.name=\"OpenEmbedded\" -c
    user.email=\"oe.patch@oe\" commit -q -m "Initial commit from upstream at
    version 1.90.0"' failed with exit code 128:
    error: cannot run ssh-keygen: No such file or directory
    error:
    fatal: failed to write commit object

when GPG signing is enabled in the git configuration.
---
 scripts/lib/devtool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index cb727f324f426bbdf68756a7faed07e9f6c406e8..f47f57c465d292e2da4d05b54238b8ef0c575448 100644
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

