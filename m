Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxIny-0005Be-Ei
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:52:26 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Feb 2012 05:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117410012"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:44:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:44:03 +0000
Message-Id: <f89d08fbfb684c72336184f809ed771251d3a36c.1329226937.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226937.git.paul.eggleton@linux.intel.com>
References: <cover.1329226937.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226937.git.paul.eggleton@linux.intel.com>
References: <cover.1329226937.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] scripts/combo-layer: allow updating a specific component(s) only
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Feb 2012 13:52:26 -0000

If you specify one or more components to update immediately following
the "update" command, only these components will be updated as opposed
to the default behaviour of updating all of them.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   31 +++++++++++++++++++++++--------
 1 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index b4b1e48..2fac1c9 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -26,7 +26,7 @@ import logging
 import subprocess
 import ConfigParser
 
-__version__ = "0.2.0"
+__version__ = "0.2.1"
 
 def logger_create():
     logger = logging.getLogger("")
@@ -158,7 +158,22 @@ def action_update(conf, args):
     patch_dir = "patch-%s" % uuid.uuid4()
     os.mkdir(patch_dir)
 
-    for name in conf.repos:
+    repos = []
+    if len(args) > 1:
+        for arg in args[1:]:
+            if arg.startswith('-'):
+                break
+            else:
+                repos.append(arg)
+        for repo in repos:
+            if not repo in conf.repos:
+                logger.error("Specified component '%s' not found in configuration" % repo)
+                sys.exit(0)
+
+    if not repos:
+        repos = conf.repos
+
+    for name in repos:
         repo = conf.repos[name]
         ldir = repo['local_repo_dir']
         dest_dir = repo['dest_dir']
@@ -227,7 +242,7 @@ def action_update(conf, args):
             sys.exit(0)
 
     # Step 6: apply the generated and revised patch
-    action_apply_patch(conf, args)
+    apply_patchlist(conf, repos)
     runcmd("rm -rf %s" % patch_dir)
 
     # Step 7: commit the updated config file if it's being tracked
@@ -242,11 +257,11 @@ def action_update(conf, args):
         if output.lstrip().startswith("M"):
             runcmd('git commit -m "Automatic commit to update last_revision" %s' % relpath)
 
-def action_apply_patch(conf, args):
+def apply_patchlist(conf, repos):
     """
         apply the generated patch list to combo repo
     """
-    for name in conf.repos:
+    for name in repos:
         repo = conf.repos[name]
         lastrev = repo["last_revision"]
         for line in open(repo['patchlist']):
@@ -325,9 +340,9 @@ def main():
 Create and update a combination layer repository from multiple component repositories.
 
 Action:
-  init              initialise the combo layer repo
-  update            get patches from component repos and apply them to the combo repo
-  splitpatch [commit] generate commit patch and split per component, default commit is HEAD""")
+  init                 initialise the combo layer repo
+  update [components]  get patches from component repos and apply them to the combo repo
+  splitpatch [commit]  generate commit patch and split per component, default commit is HEAD""")
 
     parser.add_option("-c", "--conf", help = "specify the config file (conf/combo-layer.conf is the default).",
                action = "store", dest = "conffile", default = "conf/combo-layer.conf")
-- 
1.7.5.4



