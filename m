Return-Path: <chuck.wolber@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BE8C54EBE
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 01:59:51 +0000 (UTC)
Received: from clt-mbsout-02.mbs.boeing.net (clt-mbsout-02.mbs.boeing.net [130.76.144.163])
 by mx.groups.io with SMTP id smtpd.web11.186883.1673920787476680797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 17:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=cabZSE+k;
 spf=pass (domain: boeing.com, ip: 130.76.144.163, mailfrom: chuck.wolber@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 30H1xkNP022926;
	Mon, 16 Jan 2023 20:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1673920786;
	bh=hxjFoYHZabRhzHcETdGG2OsUWlDbOp0plw0W/rAfV+o=;
	h=From:To:Cc:Subject:Date:From;
	b=cabZSE+k4OnPuZUgrB3dHi+QA1jvrWqBjsM9USdHBcm/pgZcRVUIHtA7q/aI8jQGp
	 WtK6UlPYwXANIRm3g/aHh6lWS01wAaZg/om94TbVxK4rYm9VLDKnOxMEY6v0weWFV/
	 DLcmaDmL8BvlL/gCMSJLTXU1wXzI2tw/BgCKWMMmR2u1g/RVU96RakwZ8Lot2AI0nM
	 6CNtqgrIJ14MGqhyBZxf+HYV4lehlXnmMUKzH8YxHa266XJBIgEWH0o8/fj2Se+7XW
	 3AZT3dXTgz6nFYRnLxp0+zZeEq6pH/PDJ1bSK59JufX9na05xAkds4tDiVeFaWy69m
	 ixOkD4hhCTsHg==
Received: from clt-av-01.mbs.boeing.net (clt-av-01.mbs.boeing.net [144.115.64.247])
	by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 30H1xfrh022902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 20:59:41 -0500
Received: from localhost (localhost [127.0.0.1])
	by clt-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id 30H1xdWU002613;
	Mon, 16 Jan 2023 20:59:39 -0500
Received: from onsbuild1.cbb.boeing.com (onsbuild1.cbb.boeing.com [132.224.17.88])
	by clt-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id 30H1xarh002496;
	Mon, 16 Jan 2023 20:59:36 -0500
From: Chuck Wolber <chuck.wolber@boeing.com>
To: openembedded-core@lists.openembedded.org
Cc: Chuck Wolber <chuck.wolber@boeing.com>
Subject: [PATCH v2] scripts/oe-setup-layers: Make efficiently idempotent
Date: Mon, 16 Jan 2023 17:59:30 -0800
Message-Id: <1673920770-31378-1-git-send-email-chuck.wolber@boeing.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 01:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176019

The effect of subsequent setup-layers executions is now either a NOOP
or the minimal set of changes required to ensure layers precisely match
the JSON configuration.

This change allows setup-layers to be incorporated into a team's
configuration management strategy. In particular, the configuration
JSON manages a "pinning policy" that documents the oversight of sources
of change (a requirement for embedded development in highly regulated
industries).

One model for this strategy would work as follows. Team level policy is
developed to regularly review upstream commits that occur between the
current upstream HEAD and the previously pinned revision. The JSON
configuration is periodically updated after a review, test, and approval
process. In the rare instance that an upstream change is considered
problematic, the bbappend mechanism can be used to make relevant
changes in the team's project repository. This approach also requires
that team developers regularly run the project repository copy of
setup-layers. This is most easily accomplished by including setup-layers
in a wrapper script that all team developers use to interact with the
bitbake tool suite (e.g. "bb bitbake foo-image"). Project level policy
and oversight is effectively "contained" within this wrapper script,
thereby reducing a significant source of human error.

Left unstated, but acknowledged here, are a number of nuances required
to successfully implement the above strategy.  The details are out of
scope for this explanation. What should be clear is that a larger
configuration management strategy can now benefit from the utility
provided by setup-layers.

Note: Neither the above configuration management strategy example nor
the change itself is intended to alter the original intent to use
"bitbake-layers create-layers-setup destdir" to keep pace with upstream
activity for those who wish to use it that way.

Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
---
 scripts/oe-setup-layers | 55 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 6ecaffe..d0bc9f1 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -10,12 +10,42 @@
 # bitbake-layers create-layers-setup destdir
 #
 # It is recommended that you do not modify this file directly, but rather re-run the above command to get the freshest upstream copy.
+#
+# This script is idempotent. Subsequent runs only change what is necessary to
+# ensure your layers match your configuration.
 
 import argparse
 import json
 import os
 import subprocess
 
+def _is_layer_git_repo(layerdir):
+    git_dir = os.path.join(layerdir, ".git")
+    if not os.access(git_dir, os.R_OK):
+        return False
+    try:
+        return subprocess.check_output("git -C %s rev-parse --is-inside-git-dir" % git_dir, shell=True, stderr=subprocess.DEVNULL)
+    except subprocess.CalledProcessError:
+        return False
+
+def _is_layer_at_rev(layerdir, rev):
+    try:
+        curr_rev = subprocess.check_output("git -C %s rev-parse HEAD" % layerdir, shell=True, stderr=subprocess.DEVNULL)
+        if curr_rev.strip().decode("utf-8") == rev:
+            return True
+    except subprocess.CalledProcessError:
+        pass
+    return False
+
+def _is_layer_at_remote_uri(layerdir, remote, uri):
+    try:
+        curr_uri = subprocess.check_output("git -C %s remote get-url %s" % (layerdir, remote), shell=True, stderr=subprocess.DEVNULL)
+        if curr_uri.strip().decode("utf-8") == uri:
+            return True
+    except subprocess.CalledProcessError:
+        pass
+    return False
+
 def _do_checkout(args, json):
     layers = json['sources']
     for l_name in layers:
@@ -36,23 +66,30 @@ def _do_checkout(args, json):
         remotes = l_remote['remotes']
 
         print('\nSetting up source {}, revision {}, branch {}'.format(l_name, desc, branch))
-        cmd = 'git init -q {}'.format(layerdir)
-        print("Running '{}'".format(cmd))
-        subprocess.check_output(cmd, shell=True)
+        if not _is_layer_git_repo(layerdir):
+            cmd = 'git init -q {}'.format(layerdir)
+            print("Running '{}'".format(cmd))
+            subprocess.check_output(cmd, shell=True)
 
         for remote in remotes:
-            cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
+            if not _is_layer_at_remote_uri(layerdir, remote, remotes[remote]['uri']):
+                cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
+                print("Running '{}' in {}".format(cmd, layerdir))
+                subprocess.check_output(cmd, shell=True, cwd=layerdir)
+
+                cmd = "git fetch -q {} || true".format(remote)
+                print("Running '{}' in {}".format(cmd, layerdir))
+                subprocess.check_output(cmd, shell=True, cwd=layerdir)
+
+        if not _is_layer_at_rev(layerdir, rev):
+            cmd = "git fetch -q --all || true"
             print("Running '{}' in {}".format(cmd, layerdir))
             subprocess.check_output(cmd, shell=True, cwd=layerdir)
 
-            cmd = "git fetch -q {} || true".format(remote)
+            cmd = 'git checkout -q {}'.format(rev)
             print("Running '{}' in {}".format(cmd, layerdir))
             subprocess.check_output(cmd, shell=True, cwd=layerdir)
 
-        cmd = 'git checkout -q {}'.format(rev)
-        print("Running '{}' in {}".format(cmd, layerdir))
-        subprocess.check_output(cmd, shell=True, cwd=layerdir)
-
 parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
 
 parser.add_argument('--force-bootstraplayer-checkout', action='store_true',
-- 
1.8.3.1


