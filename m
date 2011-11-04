Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO5V-0000tc-B7
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:01:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71129592"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2011 10:55:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:55:37 +0000
Message-Id: <9b04ba1eebb16dd3a3c4b941119efbbd3382dc3a.1320429268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] scripts/combo-layer: make component repo branch configurable
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
X-List-Received-Date: Fri, 04 Nov 2011 18:01:57 -0000

Add an optional per-component branch setting to allow specifying the
branch instead of always using master.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   22 ++++++++++++++--------
 1 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index e39e4e0..4cb9ee0 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -108,19 +108,23 @@ def action_init(conf, args):
         if not os.path.exists(ldir):
             logger.info("cloning %s to %s" %(conf.repos[name]['src_uri'], ldir))
             subprocess.check_call("git clone %s %s" % (conf.repos[name]['src_uri'], ldir), shell=True)
+        branch = conf.repos[name].get('branch', "master")
+        runcmd("git checkout %s" % branch, ldir)
     if not os.path.exists(".git"):
         runcmd("git init")
         for name in conf.repos:
-            ldir = conf.repos[name]['local_repo_dir']
+            repo = conf.repos[name]
+            ldir = repo['local_repo_dir']
             logger.info("copying data from %s..." % name)
-            dest_dir = conf.repos[name]['dest_dir']
+            dest_dir = repo['dest_dir']
             if dest_dir and dest_dir != ".":
                 extract_dir = os.path.join(os.getcwd(), dest_dir)
                 os.makedirs(extract_dir)
             else:
                 extract_dir = os.getcwd()
-            file_filter = conf.repos[name].get('file_filter',"")
-            runcmd("git archive master | tar -x -C %s %s" % (extract_dir, file_filter), ldir)
+            branch = repo.get('branch', "master")
+            file_filter = repo.get('file_filter', "")
+            runcmd("git archive %s | tar -x -C %s %s" % (branch, extract_dir, file_filter), ldir)
             lastrev = runcmd("git rev-parse HEAD", ldir).strip()
             conf.update(name, "last_revision", lastrev)
         runcmd("git add .")
@@ -162,9 +166,11 @@ def action_update(conf, args):
         repo = conf.repos[name]
         ldir = repo['local_repo_dir']
         dest_dir = repo['dest_dir']
+        branch = repo.get('branch', "master")
         repo_patch_dir = os.path.join(os.getcwd(), patch_dir, name)
 
         # Step 1: update the component repo
+        runcmd("git checkout %s" % branch, ldir)
         logger.info("git pull for component repo %s in %s ..." % (name, ldir))
         output=runcmd("git pull", ldir)
         logger.info(output)
@@ -177,11 +183,11 @@ def action_update(conf, args):
             prefix = ""
         if repo['last_revision'] == "":
             logger.info("Warning: last_revision of component %s is not set, so start from the first commit" % name)
-            patch_cmd_range = "--root master"
-            rev_cmd_range = "master"
+            patch_cmd_range = "--root %s" % branch
+            rev_cmd_range = branch
         else:
-            patch_cmd_range = "%s..master" % repo['last_revision']
-            rev_cmd_range = "%s..master" % repo['last_revision']
+            patch_cmd_range = "%s..%s" % (repo['last_revision'], branch)
+            rev_cmd_range = patch_cmd_range
 
         file_filter = repo.get('file_filter',"")
 
-- 
1.7.5.4



