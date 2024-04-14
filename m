Return-Path: <vincent@coelebs.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29B2C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 18:31:41 +0000 (UTC)
Received: from outbound.soverin.net (outbound.soverin.net [185.233.34.146])
 by mx.groups.io with SMTP id smtpd.web11.3725.1713119494852563795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 11:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: coelebs.dev, ip: 185.233.34.146, mailfrom: vincent@coelebs.dev)
Received: from smtp.soverin.net (c04cst-smtp-sov01.int.sover.in [10.10.4.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4VHf5c1g2Vz5G;
	Sun, 14 Apr 2024 18:31:32 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.99]) by soverin.net (Postfix) with ESMTPSA id 4VHf5b6T6Gz3L;
	Sun, 14 Apr 2024 18:31:31 +0000 (UTC)
From: vincent@coelebs.dev
To: openembedded-core@lists.openembedded.org
Cc: Vincent Kriek <vincent@coelebs.dev>
Subject: [PATCH] devtool: sync: Fix Execution error
Date: Sun, 14 Apr 2024 20:32:47 +0200
Message-ID: <20240414183247.8637-1-vincent@coelebs.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Apr 2024 18:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198215

From: Vincent Kriek <vincent@coelebs.dev>

When executing devtool sync on a recipe that was extract with devtool
extract earlier the following error occured:

    Traceback (most recent call last):
    [...]
    bb.process.ExecutionError: Execution of 'git fetch file:///home/vin/p=
rojects/poky/build/tmp/work/all-poky-linux/netbase/6.4/devtooltmp-figt1jm=
r/workdir/netbase devtool:devtool' failed with exit code 128:
    fatal: refusing to fetch into branch 'refs/heads/devtool' checked out=
 at '/home/vin/projects/poky/build/netbase-src'

Fix this by adding --update-head-ok and --force to git fetch so it will
override the current head even if it is checked out and has changes.
Possible existing changes in the devtool branch can be retrieved by
checking out the devtool.bak branch

Signed-off-by: Vincent Kriek <vincent@coelebs.dev>
---
 scripts/lib/devtool/standard.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 7972b4f822..248a1e1218 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -661,7 +661,18 @@ def _extract_source(srctree, keep_temp, devbranch, s=
ync, config, basepath, works
         srctree_localdir =3D os.path.join(srctree, 'oe-local-files')
=20
         if sync:
-            bb.process.run('git fetch file://' + srcsubdir + ' ' + devbr=
anch + ':' + devbranch, cwd=3Dsrctree)
+            try:
+                logger.info('Backing up current %s branch as branch: %s.=
bak' % (devbranch, devbranch))
+                bb.process.run('git branch -f ' + devbranch + '.bak', cw=
d=3Dsrctree)
+
+                # Use git fetch to update the source with the current re=
cipe
+                # To be able to update the currently checked out branch =
with
+                # possibly new history (no fast-forward) git needs to be=
 told
+                # that's ok
+                logger.info('Syncing source files including patches to g=
it branch: %s' % devbranch)
+                bb.process.run('git fetch --update-head-ok --force file:=
//' + srcsubdir + ' ' + devbranch + ':' + devbranch, cwd=3Dsrctree)
+            except bb.process.ExecutionError as e:
+                raise DevtoolError("Error when syncing source files to l=
ocal checkout: %s" % str(e))
=20
             # Move the oe-local-files directory to srctree.
             # As oe-local-files is not part of the constructed git tree,
--=20
2.44.0


