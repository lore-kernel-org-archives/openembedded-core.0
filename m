Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCCOi-0001sf-Oh
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 18:36:12 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2012 09:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,417,1344236400"; d="scan'208";a="144736939"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2012 09:23:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 17:23:11 +0100
Message-Id: <bc3591e23b39577a2d2e457ec8bd35600245623e.1347553357.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347553357.git.paul.eggleton@linux.intel.com>
References: <cover.1347553357.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1347553357.git.paul.eggleton@linux.intel.com>
References: <cover.1347553357.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] scripts/combo-layer: use last_revision if specified in init
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 16:36:13 -0000

If last_revision is specified for a component when running combo-layer
init, then use that revision instead of the latest revision on the
branch. Also, remove unnecessary git checkout during init since we
specify the revision to all calls to git when dealing with the component
repositories.

Fixes [YOCTO #3040].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 330faca..65435db 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -174,25 +174,31 @@ def action_init(conf, args):
         if not os.path.exists(ldir):
             logger.info("cloning %s to %s" %(conf.repos[name]['src_uri'], ldir))
             subprocess.check_call("git clone %s %s" % (conf.repos[name]['src_uri'], ldir), shell=True)
-        branch = conf.repos[name].get('branch', "master")
-        runcmd("git checkout %s" % branch, ldir)
     if not os.path.exists(".git"):
         runcmd("git init")
         for name in conf.repos:
             repo = conf.repos[name]
             ldir = repo['local_repo_dir']
-            logger.info("copying data from %s..." % name)
+            branch = repo.get('branch', "master")
+            lastrev = repo.get('last_revision', None)
+            if lastrev and lastrev != "HEAD":
+                initialrev = lastrev
+                logger.info("Copying data from %s at specified revision %s..." % (name, lastrev))
+            else:
+                lastrev = None
+                initialrev = branch
+                logger.info("Copying data from %s..." % name)
             dest_dir = repo['dest_dir']
             if dest_dir and dest_dir != ".":
                 extract_dir = os.path.join(os.getcwd(), dest_dir)
                 os.makedirs(extract_dir)
             else:
                 extract_dir = os.getcwd()
-            branch = repo.get('branch', "master")
             file_filter = repo.get('file_filter', "")
-            runcmd("git archive %s | tar -x -C %s %s" % (branch, extract_dir, file_filter), ldir)
-            lastrev = runcmd("git rev-parse %s" % branch, ldir).strip()
-            conf.update(name, "last_revision", lastrev, initmode=True)
+            runcmd("git archive %s | tar -x -C %s %s" % (initialrev, extract_dir, file_filter), ldir)
+            if not lastrev:
+                lastrev = runcmd("git rev-parse %s" % initialrev, ldir).strip()
+                conf.update(name, "last_revision", lastrev, initmode=True)
         runcmd("git add .")
         if conf.localconffile:
             localadded = True
-- 
1.7.9.5



