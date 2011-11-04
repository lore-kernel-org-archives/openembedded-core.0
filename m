Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO5a-0000xH-KH
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:02:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71129618"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2011 10:55:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:55:40 +0000
Message-Id: <d11973c68082447a33728c53ef7d9d268de50607.1320429268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] scripts/combo-layer: improve some messages
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
X-List-Received-Date: Fri, 04 Nov 2011 18:02:02 -0000

Fix some grammar in output messages.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 64ea9a9..fbf77e6 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -71,7 +71,7 @@ class Configuration(object):
                 if option not in self.repos[name]:
                     msg = "%s\nOption %s is not defined for component %s" %(msg, option, name)
         if msg != "":
-            logger.error("configuration file %s has the following error:%s" % (self.conffile,msg))
+            logger.error("configuration file %s has the following error: %s" % (self.conffile,msg))
             sys.exit(1)
 
         # filterdiff is required by action_splitpatch, so check its availability
@@ -145,7 +145,7 @@ def check_repo_clean(repodir):
 
 def action_update(conf, args):
     """
-        update the component repo
+        update the component repos
         generate the patch list
         apply the generated patches
     """
@@ -178,7 +178,7 @@ def action_update(conf, args):
         else:
             prefix = ""
         if repo['last_revision'] == "":
-            logger.info("Warning: last_revision of component %s is not set, so start from the first commit" % name)
+            logger.info("Warning: last_revision of component %s is not set, starting from the first commit" % name)
             patch_cmd_range = "--root %s" % branch
             rev_cmd_range = branch
         else:
@@ -218,12 +218,12 @@ def action_update(conf, args):
     if conf.interactive:
         print   'Edit the patch and patch list in %s\n' \
                 'For example, remove the unwanted patch entry from patchlist-*, so that it will be not applied later\n' \
-                'After finish, press following command to continue\n' \
+                'When you are finished, run the following to continue:\n' \
                 '       exit 0  -- exit and continue to apply the patch\n' \
-                '       exit 1  -- abort and not apply patch\n' % patch_dir
+                '       exit 1  -- abort and do not apply the patch\n' % patch_dir
         ret = subprocess.call(["bash"], cwd=patch_dir)
         if ret != 0:
-            print "Abort without applying patch"
+            print "Aborting without applying the patch"
             sys.exit(0)
 
     # Step 6: apply the generated and revised patch
@@ -257,11 +257,11 @@ def action_apply_patch(conf, args):
             try:
                 runcmd(cmd)
             except subprocess.CalledProcessError:
-                logger.info('"git am --abort" is executed to cleanup repo')
+                logger.info('running "git am --abort" to cleanup repo')
                 runcmd("git am --abort")
                 logger.error('"%s" failed' % cmd)
                 logger.info("please manually apply patch %s" % patchfile)
-                logger.info("After applying, run this tool again to apply the rest patches")
+                logger.info("After applying, run this tool again to apply the remaining patches")
                 conf.update(name, "last_revision", lastrev)
                 sys.exit(0)
         conf.update(name, "last_revision", lastrev)
-- 
1.7.5.4



