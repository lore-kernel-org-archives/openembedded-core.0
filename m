Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EA94B770D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 23:34:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 07 Apr 2016 16:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="780431308"
Received: from bitbang.jf.intel.com ([10.7.199.152])
	by orsmga003.jf.intel.com with ESMTP; 07 Apr 2016 16:34:58 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 16:34:53 -0700
Message-Id: <8225a97e2d60e9fb8e13efad2ffb7a21d49de87a.1460071932.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 5/5] devtool: Create unlocked-sigs.inc containing items in the workspace
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
X-List-Received-Date: Thu, 07 Apr 2016 23:34:59 -0000

When a recipe is added to the workspace, the signatures for the tasks
will change. This means that bitbake must be told to allow the
signatures to be different if they are in locked-sigs.inc.

This is done by creating an unlocked-sigs.inc file which contains all
the recipes in the workspace each time devtool reads the workspace.

So not only will necessary things get added, previously added items will
be removed by virtue of them no longer being in the workspace.

This also makes sure that the extensible sdk picks up unlocked-sigs.inc
as part of the configuration.

[YOCTO #9195]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  5 +++++
 scripts/devtool                       | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index d1977a7..87518d1 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -140,6 +140,10 @@ python copy_buildsystem () {
     with open(os.path.join(baseoutpath, 'conf', 'devtool.conf'), 'w') as f:
         config.write(f)
 
+    unlockedsigs =  os.path.join(baseoutpath, 'conf', 'unlocked-sigs.inc')
+    with open(unlockedsigs, 'w') as f:
+        pass
+
     # Create a layer for new recipes / appends
     bbpath = d.getVar('BBPATH', True)
     bb.process.run(['devtool', '--bbpath', bbpath, '--basepath', baseoutpath, 'create-workspace', '--create-only', os.path.join(baseoutpath, 'workspace')])
@@ -238,6 +242,7 @@ python copy_buildsystem () {
                     f.write(line.strip() + '\n')
 
             f.write('require conf/locked-sigs.inc\n')
+            f.write('require conf/unlocked-sigs.inc\n')
 
     if os.path.exists(builddir + '/conf/auto.conf'):
         if derivative:
diff --git a/scripts/devtool b/scripts/devtool
index e1198b1..4780390 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -125,6 +125,25 @@ def read_workspace():
                                      'recipefile': recipefile}
                     logger.debug('Found recipe %s' % workspace[pn])
 
+def create_unlockedsigs():
+    """ This function will make unlocked-sigs.inc match the recipes in the
+    workspace. This runs on every run of devtool, but it lets us ensure
+    the unlocked items are in sync with the workspace. """
+
+    confdir = os.path.join(basepath, 'conf')
+    unlockedsigs = os.path.join(confdir, 'unlocked-sigs.inc')
+    bb.utils.mkdirhier(confdir)
+    with open(os.path.join(confdir, 'unlocked-sigs.inc'), 'w') as f:
+        f.write("# DO NOT MODIFY! YOUR CHANGES WILL BE LOST.\n" +
+                "# This layer was created by the OpenEmbedded devtool" +
+                " utility in order to\n" +
+                "# contain recipes that are unlocked.\n")
+
+        f.write('SIGGEN_UNLOCKED_RECIPES += "\\\n')
+        for pn in workspace:
+            f.write('    ' + pn)
+        f.write('"')
+
 def create_workspace(args, config, basepath, workspace):
     if args.layerpath:
         workspacedir = os.path.abspath(args.layerpath)
@@ -299,6 +318,7 @@ def main():
 
     if not getattr(args, 'no_workspace', False):
         read_workspace()
+        create_unlockedsigs()
 
     try:
         ret = args.func(args, config, basepath, workspace)
-- 
2.5.5


