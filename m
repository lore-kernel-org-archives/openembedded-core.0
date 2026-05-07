Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7F3CD3427
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 05:35:52 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5675.1778132146240102125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 22:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ci7DRQNG;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=58084c559=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1778132146; x=1809668146;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bY3LxoT/K6LxqE0gUD4bPtku0L3rCtB1bI7Q0RiBwCs=;
  b=ci7DRQNGRv4BARkG8r9Z+H+S0xWkVtMyeWeNj6mV5eO9EbR6LWJIiil9
   jPOyXKwFVDHf+U56f2tI/FYTOIYiYUY1mQnOKyDdv5yZ8cmepfdZvucQI
   iIQdUHBHnYmS7/3cmetTG2pSblEVezbj569rtrLUxCNC/wbIvmor64uBn
   E=;
X-CSE-ConnectionGUID: BsVu2osEQZCG+8EhiBpfew==
X-CSE-MsgGUID: 9uLCvQCkTj+Lr8fYKx3ugw==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 07 May 2026 07:35:44 +0200
Received: from unknown (HELO esabb1.muc) ([10.31.187.132]) by esagw2.muc with
 ESMTP/TLS; 07 May 2026 07:35:44 +0200
Received: from smucmp16a.bmwgroup.net (HELO smucmp16a.europe.bmw.corp)
 ([10.30.13.143]) by esabb1.muc with ESMTP/TLS; 07 May 2026 07:35:44 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp16a.europe.bmw.corp (2a03:1e80:a15:58f::1:2a) with Microsoft SMTP
 Server (version=TLS; Thu, 7 May 2026 07:35:44 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.210) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Thu, 7 May 2026 07:35:43 +0200
X-CSE-ConnectionGUID: 6rRj2mKAQWqMnppZ550EjQ==
X-CSE-MsgGUID: m42CKMLwTYGp+VioD8XU7Q==
X-CSE-ConnectionGUID: 9GndLr2kQu67kufmeZ1iPQ==
X-CSE-MsgGUID: TckYo/n+QNe3GhOYOmny5w==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH] devtool: Disable gpg signing when setting up source tree repos
Date: Thu, 7 May 2026 07:35:23 +0200
Message-ID: <20260507053523.771263-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16f.europe.bmw.corp (2a03:1e80:a15:58f::1:148) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 05:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236558

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

