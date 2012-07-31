Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw0A4-0004FO-C4
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 02:18:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 17:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175049386"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 17:06:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 01:06:21 +0100
Message-Id: <1e8c185d75f8c5bf3c3c386bae597361af89fc4f.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] combo-layer: allow component pull to be done separately
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
X-List-Received-Date: Tue, 31 Jul 2012 00:18:08 -0000

* Add a -n option to disable component repo pull during update
* Add a 'pull' action to pull the component repos only

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   51 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index b1a9dca..554ac06 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -181,12 +181,7 @@ def check_patch(patchfile):
         of.close()
         os.rename(patchfile + '.tmp', patchfile)
 
-def action_update(conf, args):
-    """
-        update the component repos
-        generate the patch list
-        apply the generated patches
-    """
+def get_repos(conf, args):
     repos = []
     if len(args) > 1:
         for arg in args[1:]:
@@ -202,15 +197,48 @@ def action_update(conf, args):
     if not repos:
         repos = conf.repos
 
+    return repos
+
+def action_pull(conf, args):
+    """
+        update the component repos only
+    """
+    repos = get_repos(conf, args)
+
     # make sure all repos are clean
     for name in repos:
         check_repo_clean(conf.repos[name]['local_repo_dir'])
+
+    for name in repos:
+        repo = conf.repos[name]
+        ldir = repo['local_repo_dir']
+        branch = repo.get('branch', "master")
+        runcmd("git checkout %s" % branch, ldir)
+        logger.info("git pull for component repo %s in %s ..." % (name, ldir))
+        output=runcmd("git pull", ldir)
+        logger.info(output)
+
+def action_update(conf, args):
+    """
+        update the component repos
+        generate the patch list
+        apply the generated patches
+    """
+    repos = get_repos(conf, args)
+
+    # make sure combo repo is clean
     check_repo_clean(os.getcwd())
 
     import uuid
     patch_dir = "patch-%s" % uuid.uuid4()
     os.mkdir(patch_dir)
 
+    # Step 1: update the component repos
+    if conf.nopull:
+        logger.info("Skipping pull (-n)")
+    else:
+        action_pull(conf, args)
+
     for name in repos:
         repo = conf.repos[name]
         ldir = repo['local_repo_dir']
@@ -218,12 +246,6 @@ def action_update(conf, args):
         branch = repo.get('branch', "master")
         repo_patch_dir = os.path.join(os.getcwd(), patch_dir, name)
 
-        # Step 1: update the component repo
-        runcmd("git checkout %s" % branch, ldir)
-        logger.info("git pull for component repo %s in %s ..." % (name, ldir))
-        output=runcmd("git pull", ldir)
-        logger.info(output)
-
         # Step 2: generate the patch list and store to patch dir
         logger.info("generating patches for %s" % name)
         if dest_dir != ".":
@@ -369,6 +391,7 @@ def action_error(conf, args):
 actions = {
     "init": action_init,
     "update": action_update,
+    "pull": action_pull,
     "splitpatch": action_splitpatch,
 }
 
@@ -382,6 +405,7 @@ Create and update a combination layer repository from multiple component reposit
 Action:
   init                 initialise the combo layer repo
   update [components]  get patches from component repos and apply them to the combo repo
+  pull [components]    just pull component repos only
   splitpatch [commit]  generate commit patch and split per component, default commit is HEAD""")
 
     parser.add_option("-c", "--conf", help = "specify the config file (conf/combo-layer.conf is the default).",
@@ -393,6 +417,9 @@ Action:
     parser.add_option("-D", "--debug", help = "output debug information",
                action = "store_true", dest = "debug", default = False)
 
+    parser.add_option("-n", "--no-pull", help = "skip pulling component repos during update",
+               action = "store_true", dest = "nopull", default = False)
+
     options, args = parser.parse_args(sys.argv)
 
     # Dispatch to action handler
-- 
1.7.9.5



