Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D80C75D8D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 10:59:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2015 03:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,431,1432623600"; d="scan'208";a="520745278"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2015 03:59:52 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 13:59:49 +0300
Message-Id: <1436353189-21566-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436353189-21566-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1436353189-21566-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] combo-layer: implement --hard-reset option
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
X-List-Received-Date: Wed, 08 Jul 2015 10:59:54 -0000

This option causes combo-layer to do git fetch and hard reset instead of
git pull in the component repositories. This makes sure that the local
component repositories are always in sync with the remote - tolerating
force pushes and overriding any locally made changes.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/combo-layer | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 8637add..6b0c56d 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -586,9 +586,14 @@ def action_pull(conf, args):
         ldir = repo['local_repo_dir']
         branch = repo.get('branch', "master")
         runcmd("git checkout %s" % branch, ldir)
-        logger.info("git pull for component repo %s in %s ..." % (name, ldir))
-        output=runcmd("git pull --ff-only", ldir)
-        logger.info(output)
+        logger.info("update component repo %s in %s ..." % (name, ldir))
+        if not args.hard_reset:
+            output=runcmd("git pull --ff-only", ldir)
+            logger.info(output)
+        else:
+            output=runcmd("git fetch", ldir)
+            logger.info(output)
+            runcmd("git reset --hard FETCH_HEAD", ldir)
 
 def action_update(conf, args):
     """
@@ -895,6 +900,10 @@ Action:
     parser.add_option("-n", "--no-pull", help = "skip pulling component repos during update",
                action = "store_true", dest = "nopull", default = False)
 
+    parser.add_option("--hard-reset",
+               help = "instead of pull do fetch and hard-reset in component repos",
+               action = "store_true", default = False)
+
     parser.add_option("-H", "--history", help = "import full history of components during init",
                       action = "store_true", default = False)
 
-- 
2.1.4


