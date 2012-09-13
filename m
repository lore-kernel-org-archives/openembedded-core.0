Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCCOj-0001sf-GT
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 18:36:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2012 09:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,417,1344236400"; d="scan'208";a="144736950"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2012 09:23:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 17:23:12 +0100
Message-Id: <5684a6393820c30ca1aea3b87e6b2e04c92b4c13.1347553357.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347553357.git.paul.eggleton@linux.intel.com>
References: <cover.1347553357.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1347553357.git.paul.eggleton@linux.intel.com>
References: <cover.1347553357.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] scripts/combo-layer: ensure we validate branch/revision on init
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

If both branch and last_revision are specified for a component when
combo-layer init is run, ensure that the specified revision is actually
on the specified branch and error out if not. Also ensure that the error
message mentions the component.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 65435db..3baea24 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -183,6 +183,9 @@ def action_init(conf, args):
             lastrev = repo.get('last_revision', None)
             if lastrev and lastrev != "HEAD":
                 initialrev = lastrev
+                if branch:
+                    if not check_rev_branch(name, ldir, lastrev, branch):
+                        sys.exit(1)
                 logger.info("Copying data from %s at specified revision %s..." % (name, lastrev))
             else:
                 lastrev = None
@@ -278,7 +281,7 @@ def drop_to_shell(workdir=None):
     else:
         return True
 
-def check_rev_branch(repodir, rev, branch):
+def check_rev_branch(component, repodir, rev, branch):
     try:
         actualbranch = runcmd("git branch --contains %s" % rev, repodir, printerr=False).rstrip()
     except subprocess.CalledProcessError as e:
@@ -290,10 +293,10 @@ def check_rev_branch(repodir, rev, branch):
     if ' ' in actualbranch:
         actualbranch = actualbranch.split(' ')[-1]
     if not actualbranch:
-        logger.error("Specified revision %s is invalid!" % rev)
+        logger.error("%s: specified revision %s is invalid!" % (component, rev))
         return False
     elif actualbranch != branch:
-        logger.error("Specified revision %s is not on specified branch %s!" % (rev, branch))
+        logger.error("%s: specified revision %s is not on specified branch %s!" % (component, rev, branch))
         return False
     return True
 
@@ -373,7 +376,7 @@ def action_update(conf, args):
             patch_cmd_range = "--root %s" % branch
             rev_cmd_range = branch
         else:
-            if not check_rev_branch(ldir, repo['last_revision'], branch):
+            if not check_rev_branch(name, ldir, repo['last_revision'], branch):
                 sys.exit(1)
             patch_cmd_range = "%s..%s" % (repo['last_revision'], branch)
             rev_cmd_range = patch_cmd_range
-- 
1.7.9.5



