Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405DEC433FE
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:06:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web08.5768.1652954775612988058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 03:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=EIjBK+uS;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA6CI8884853
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:06:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652954772;
	bh=eDUd+ezmGlAwC941iMqD3OkuhR09WitcQwfxEAr7YeI=; l=2419;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EIjBK+uSJPOkOsOJyWVnrAeVvJtGdDyI8kuFsZ/JT0MJ3WOHJUV3Xye2KzXmiUa0+
	 iJdoMFSYZBYae/EMDlmBov5IghGm+ccE7U1JrKtHjuO4eoiJUsnN/jS+WWmT0KYecN
	 M9mwAEbKrsJiMKxOdCAynNpIXFbqJQUwboqOcnSWp4pzPPbV2ja3cC0H57o5TIQKbD
	 KSFYzi7LNDwlle0p8MymwTM42drQcGzdt9OgtGuyfNfm1O/KSpcgl1ay/v7k1Tc6Gt
	 PnWQEeyE51yqtzoR5i2YnWjrHxocWVTVsZFWFTfbKutQZIKhbkv8wc6iyQxAip7rHd
	 3AxHhNXWCfmVQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JA68j12313867
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:06:10 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 4671F054540; Thu, 19 May 2022 12:06:07 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 24JA66te856493
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 12:06:06 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrd2k-004ImP-Hn;
	Thu, 19 May 2022 12:06:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/6] npm: replace 'npm pack' call by 'tar czf'
Date: Thu, 19 May 2022 12:05:51 +0200
Message-Id: 
 <42a8c94825cdcee944a274210a78e9e9940e6b63.1652954597.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 10:06:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165877

'npm pack' is a maintainer tool which tries to execute 'prepare'
and similar scripts.  This fails usually in OE because it requires
completely installed 'node_modules'.

Earlier nodejs versions supported an undocumented 'ignore-scripts'
option.  This has been removed in nodejs 16.

We could patch 'package.json' and remove the unwanted scripts.  But
this might complicate local workflows (applying patches) and installed
packages will contain the modified 'package.json'.

Instead of, package it manually by 'tar czf'.  As a sideeffect,
'do_configure' is running much faster now.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/npm.bbclass | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index ba50fcac20..91f8f36b0d 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -57,13 +57,36 @@ def npm_global_configs(d):
     configs.append(("cache", d.getVar("NPM_CACHE")))
     return configs
 
+## 'npm pack' runs 'prepare' and 'prepack' scripts. Support for
+## 'ignore-scripts' which prevents this behavior has been removed
+## from nodejs 16.  Use simple 'tar' instead of.
 def npm_pack(env, srcdir, workdir):
-    """Run 'npm pack' on a specified directory"""
-    import shlex
-    cmd = "npm pack %s" % shlex.quote(srcdir)
-    args = [("ignore-scripts", "true")]
-    tarball = env.run(cmd, args=args, workdir=workdir).strip("\n")
-    return os.path.join(workdir, tarball)
+    """Emulate 'npm pack' on a specified directory"""
+    import subprocess
+    import os
+    import json
+
+    src = os.path.join(srcdir, 'package.json')
+    with open(src) as f:
+        j = json.load(f)
+
+    # base does not really matter and is for documentation purposes
+    # only.  But the 'version' part must exist because other parts of
+    # the bbclass rely on it.
+    base = j['name'].split('/')[-1]
+    tarball = os.path.join(workdir, "%s-%s.tgz" % (base, j['version']));
+
+    # TODO: real 'npm pack' does not include directories while 'tar'
+    # does.  But this does not seem to matter...
+    subprocess.run(['tar', 'czf', tarball,
+                    '--exclude', './node-modules',
+                    '--exclude-vcs',
+                    '--transform', 's,^\./,package/,',
+                    '--mtime', '1985-10-26T08:15:00.000Z',
+                    '.'],
+                   check = True, cwd = srcdir)
+
+    return tarball
 
 python npm_do_configure() {
     """
-- 
2.36.1


