Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw0A5-0004FQ-LJ
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 02:18:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 17:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175049397"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 17:06:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 01:06:23 +0100
Message-Id: <dac29b4263ec6b023b40b9efecb27ea85800de39.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] combo-layer: drop to a shell when apply fails during update
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
X-List-Received-Date: Tue, 31 Jul 2012 00:18:09 -0000

If applying a patch fails during the update process, drop to a shell
instead of exiting; at that point the user can manually apply the patch,
do nothing and "exit" to skip it, or "exit 1" to abort the process.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index a93fb9b..4025b72 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -184,6 +184,19 @@ def check_patch(patchfile):
         of.close()
         os.rename(patchfile + '.tmp', patchfile)
 
+def drop_to_shell(workdir=None):
+    shell = os.environ.get('SHELL', 'bash')
+    print('Dropping to shell "%s"\n' \
+          'When you are finished, run the following to continue:\n' \
+          '       exit    -- continue to apply the patches\n' \
+          '       exit 1  -- abort\n' % shell);
+    ret = subprocess.call([shell], cwd=workdir)
+    if ret != 0:
+        print "Aborting"
+        return False
+    else:
+        return True
+
 def get_repos(conf, args):
     repos = []
     if len(args) > 1:
@@ -295,14 +308,9 @@ def action_update(conf, args):
 
     # Step 5: invoke bash for user to edit patch and patch list
     if conf.interactive:
-        print   'Edit the patch and patch list in %s\n' \
-                'For example, remove the unwanted patch entry from patchlist-*, so that it will be not applied later\n' \
-                'When you are finished, run the following to continue:\n' \
-                '       exit 0  -- exit and continue to apply the patch\n' \
-                '       exit 1  -- abort and do not apply the patch\n' % patch_dir
-        ret = subprocess.call(["bash"], cwd=patch_dir)
-        if ret != 0:
-            print "Aborting without applying the patch"
+        print('You may now edit the patch and patch list in %s\n' \
+              'For example, you can remove unwanted patch entries from patchlist-*, so that they will be not applied later' % patch_dir);
+        if not drop_to_shell(patch_dir):
             sys.exit(0)
 
     # Step 6: apply the generated and revised patch
@@ -328,6 +336,7 @@ def apply_patchlist(conf, repos):
     for name in repos:
         repo = conf.repos[name]
         lastrev = repo["last_revision"]
+        prevrev = lastrev
         for line in open(repo['patchlist']):
             patchfile = line.split()[0]
             lastrev = line.split()[1]
@@ -343,9 +352,12 @@ def apply_patchlist(conf, repos):
                     runcmd("git am --abort")
                     logger.error('"%s" failed' % cmd)
                     logger.info("please manually apply patch %s" % patchfile)
-                    logger.info("After applying, run this tool again to apply the remaining patches")
-                    conf.update(name, "last_revision", lastrev)
-                    sys.exit(0)
+                    logger.info("Note: if you exit and continue applying without manually applying the patch, it will be skipped")
+                    if not drop_to_shell():
+                        if prevrev != repo['last_revision']:
+                            conf.update(name, "last_revision", prevrev)
+                        sys.exit(0)
+            prevrev = lastrev
         if lastrev != repo['last_revision']:
             conf.update(name, "last_revision", lastrev)
 
-- 
1.7.9.5



