Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 087836FF30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 16:40:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 15 Apr 2016 09:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,488,1455004800"; d="scan'208";a="785713950"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga003.jf.intel.com with ESMTP; 15 Apr 2016 09:39:59 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 09:40:29 -0700
Message-Id: <1460738429-29956-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH v2] devtool: sdk-update: reset git metadata on update
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
X-List-Received-Date: Fri, 15 Apr 2016 16:40:05 -0000

Replace git pull with fetch and reset to avoid the merge logic in the
event that the layers repo in the published SDK we're updating to isn't
fast-forward merge from the local repo.

Also add gitignore and committer info during publish to avoid errors and
to be sure that the first commit has a dummy user in it.

[ YOCTO #9368 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 10 ++++++++--
 scripts/oe-publish-sdk     |  4 ++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index b1905f9..a22841d 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -186,9 +186,15 @@ def sdk_update(args, config, basepath, workspace):
                 return 0
             # Update metadata
             logger.debug("Updating metadata via git ...")
-            # Try using 'git pull', if failed, use 'git clone'
+            #Check for the status before doing a fetch and reset
             if os.path.exists(os.path.join(basepath, 'layers/.git')):
-                ret = subprocess.call("git pull %s/layers/.git" % updateserver, shell=True, cwd=layers_dir)
+                out = subprocess.check_output("git status --porcelain", shell=True, cwd=layers_dir)
+                if not out:
+                    ret = subprocess.call("git fetch --all; git reset --hard", shell=True, cwd=layers_dir)
+                else:
+                    logger.error("Failed to update metadata as there have been changes made to it. Aborting.");
+                    logger.error("Changed files:\n%s" % out);
+                    return -1
             else:
                 ret = -1
             if ret != 0:
diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index e6cb7af..55872f2 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -114,9 +114,9 @@ def publish(args):
 
     # Setting up the git repo
     if not is_remote:
-        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
+        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo "*.pyc\n*.pyo" > .gitignore; fi; git add -A .; git config user.email "oe@oe.oe" && git config user.name "OE" && git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; echo '*.pyc\n*.pyo' > .gitignore; fi; git add -A .; git config user.email 'oe@oe.oe' && git config user.name 'OE' && git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.8.0


