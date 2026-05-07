Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8E8CD343B
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 05:41:42 +0000 (UTC)
Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5572.1778132498374852192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 22:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=WiLQvdw4;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=58084c559=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1778132498; x=1809668498;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2zgt0pcI1lSCBUL9MpHwx17Zq5dbyLgKVxSKMx/vFXY=;
  b=WiLQvdw4omNR09Uc013y8II5acS6XeSfvydUyobx+nd+zsvUu6svfkhH
   Fkdl3++N6H65YyMte7fEDYlms/qDfFn/tW2hn/YHXW2g5+mOUwD+xtR9s
   oigbJq0mUud/xt94Nbm7kVejdw+AmZzqvKPGOw5NxIfOzOdVQGaKwmW+j
   Q=;
X-CSE-ConnectionGUID: k1C2qMdHTKmJvF6y9Sfwew==
X-CSE-MsgGUID: e5KviZoATl+AjF8d3vXIMw==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 07 May 2026 07:41:36 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw3.muc with
 ESMTP/TLS; 07 May 2026 07:41:35 +0200
Received: from smucmp19g.bmwgroup.net (HELO smucmp19g.europe.bmw.corp)
 ([10.30.13.173]) by esabb4.muc with ESMTP/TLS; 07 May 2026 07:41:36 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp19g.europe.bmw.corp (2a03:1e80:a15:58f::1:84) with Microsoft SMTP
 Server (version=TLS; Thu, 7 May 2026 07:41:35 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.211) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Thu, 7 May 2026 07:41:35 +0200
X-CSE-ConnectionGUID: 5qRQkc45RTG5n1xq1MO62w==
X-CSE-MsgGUID: ZzyI6mOCSO+oVqHPBAN4vg==
X-CSE-ConnectionGUID: u6QeuOsnTtanu7tW00kSoQ==
X-CSE-MsgGUID: HTgZ4T/7T9Ozo7zAdWx/7w==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] devtool: Disable gpg signing when setting up source tree repos
Date: Thu, 7 May 2026 07:41:17 +0200
Message-ID: <20260507054117.772619-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15g.europe.bmw.corp (2a03:1e80:a15:58f::1:58) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236560

This stops 'devtool modify foo' from failing with an error message like

    ERROR: Execution of 'git -c user.name=\"OpenEmbedded\" -c
    user.email=\"oe.patch@oe\" commit -q -m "Initial commit from upstream at
    version 1.90.0"' failed with exit code 128:
    error: cannot run ssh-keygen: No such file or directory
    error:
    fatal: failed to write commit object

when GPG signing is enabled in the git configuration.

(cherry picked from commit b5c84b07b87eafb4f68f7662b6cf26d8b73e3247)

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 702db669de..f72c41aa07 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -199,7 +199,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
         bb.process.run('git add -f -A .', cwd=repodir)
         commit_cmd = ['git']
         oe.patch.GitApplyTree.gitCommandUserOptions(commit_cmd, d=d)
-        commit_cmd += ['commit', '-q']
+        commit_cmd += ['commit', '-q', '--no-gpg-sign']
         stdout, _ = bb.process.run('git status --porcelain', cwd=repodir)
         if not stdout:
             commit_cmd.append('--allow-empty')

