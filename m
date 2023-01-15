Return-Path: <chuck.wolber@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE584C46467
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 00:54:25 +0000 (UTC)
Received: from phx-mbsout-01.mbs.boeing.net (phx-mbsout-01.mbs.boeing.net [130.76.184.178])
 by mx.groups.io with SMTP id smtpd.web11.130874.1673744065079835268
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 16:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=obaO1mv1;
 spf=pass (domain: boeing.com, ip: 130.76.184.178, mailfrom: chuck.wolber@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by phx-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 30F0sMpc010478;
	Sat, 14 Jan 2023 17:54:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1673744062;
	bh=yT6fVfJwUWooRdED3FsvyR1SqosZEY+2teXIqR1eWGU=;
	h=From:To:Cc:Subject:Date:From;
	b=obaO1mv1ZqFBkxDA/CNfnSovnkS4ZNdi/dqy5dA1QENVptrcqab/c5FDttOmi87gz
	 FDFJjATRdlp9NPLLZLwZU70RL0wgslOgUkJAXbG19/EMVKMN0AxFFfjqxJGyxN9+SW
	 cbDNScI7nMKHqkeCPwtliHDVU/rdNtjOWmAEWvE4wLShwxbZKmOqb4PCpmf3mAOUbV
	 nMUiwh1l4ymzvTKhBPOA32KHfaKI9L1uMEqVlUttHwZaVvZYm3iUh1iKI47h3c/dvq
	 RgxOfcgMC6uHTrE68AIPoVZedgzcHhM1VSHnX1NDFAjafxGG0C0EnB824rrdZyCl1l
	 G6Pldg9Bzlv7g==
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net [137.136.102.153])
	by phx-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 30F0sIs8010455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 17:54:18 -0700
Received: from localhost (localhost [127.0.0.1])
	by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id 30F0sIZl022443;
	Sat, 14 Jan 2023 17:54:18 -0700
Received: from onsbuild1.cbb.boeing.com (onsbuild1.cbb.boeing.com [132.224.17.88])
	by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id 30F0s9fa022341;
	Sat, 14 Jan 2023 17:54:09 -0700
From: Chuck Wolber <chuck.wolber@boeing.com>
To: openembedded-core@lists.openembedded.org
Cc: Chuck Wolber <chuck.wolber@boeing.com>
Subject: [PATCH] Make oe-setup-layers efficiently idempotent
Date: Sat, 14 Jan 2023 16:53:57 -0800
Message-Id: <1673744037-3484-1-git-send-email-chuck.wolber@boeing.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 00:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175861

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

It is also worth noting that, where project level policy cannot be
asserted on layers with the bbappend mechanism (e.g. bbclass files), a
patch set can be checked in to the project repository and automatically
managed by the wrapper script. Patch management against local layer
clones would be superficial in nature (not pushed upstream). This
enables projects to "pull in" functionality and manage bug fixes on an
as-needed basis.

Left unstated, but acknowledged here, are a number of nuances required
to successfully implement this strategy e.g. setup-layers does not work
so well if your layer clone is dirty from locally applied patches, etc.
The details are out of scope for this explanation. What should be
clear is that a larger configuration management strategy can now benefit
from the utility provided by setup-layers.

Note: Neither the above configuration management strategy example nor
the change itself is intended to alter the original intent to use
"bitbake-layers create-layers-setup destdir" to keep pace with upstream
activity for those who wish to use it that way.

Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>
---
 scripts/oe-setup-layers | 55 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 7fe250c..a042a6c 100755
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
     oesetupbuild = None
     layers = json['sources']
@@ -37,23 +67,30 @@ def _do_checkout(args, json):
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
         if os.path.exists(os.path.join(layerdir, 'scripts/oe-setup-build')):
             oesetupbuild = os.path.join(layerdir, 'scripts/oe-setup-build')
 
-- 
1.8.3.1


