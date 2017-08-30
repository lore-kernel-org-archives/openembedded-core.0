Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B414B7837C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:05 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494435"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:07 +1200
Message-Id: <b13dbb2dbe5e7582386cef8450529134075c1aa7.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/13] devtool: upgrade: check that user has configured git properly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Aug 2017 23:55:05 -0000

From: paul <paul@peggleto-mobl.ger.corp.intel.com>

If user.name or user.email haven't been set then git rebase can't really
work properly. Check that the user has set these and error out if not.
(Elsewhere we are relying on OE's git patch functionality which forces
a dummy OE value - that's OK there as it's completely under OE's control
and therefore it's OK for a dummy OE user to be the committer, but here
the rebase may require intervention so it's reasonable to have the
user's actual name and email on the operation.)

Fixes [YOCTO #11947].

Signed-off-by: paul <paul@peggleto-mobl.ger.corp.intel.com>
---
 scripts/lib/devtool/upgrade.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 24937dc..e334d2b 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -1,6 +1,6 @@
 # Development tool - upgrade command plugin
 #
-# Copyright (C) 2014-2015 Intel Corporation
+# Copyright (C) 2014-2017 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -355,6 +355,29 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
 
     return fullpath, copied
 
+
+def _check_git_config():
+    def getconfig(name):
+        try:
+            value = bb.process.run('git config --global %s' % name)[0].strip()
+        except bb.process.ExecutionError as e:
+            if e.exitcode == 1:
+                value = None
+            else:
+                raise
+        return value
+
+    username = getconfig('user.name')
+    useremail = getconfig('user.email')
+    configerr = []
+    if not username:
+        configerr.append('Please set your name using:\n  git config --global user.name')
+    if not useremail:
+        configerr.append('Please set your email using:\n  git config --global user.email')
+    if configerr:
+        raise DevtoolError('Your git configuration is incomplete which will prevent rebases from working:\n' + '\n'.join(configerr))
+
+
 def upgrade(args, config, basepath, workspace):
     """Entry point for the devtool 'upgrade' subcommand"""
 
@@ -365,6 +388,8 @@ def upgrade(args, config, basepath, workspace):
     if args.srcbranch and not args.srcrev:
         raise DevtoolError("If you specify --srcbranch/-B then you must use --srcrev/-S to specify the revision" % args.recipename)
 
+    _check_git_config()
+
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
         rd = parse_recipe(config, tinfoil, args.recipename, True)
-- 
2.9.5


