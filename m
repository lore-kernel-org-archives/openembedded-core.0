Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw0A6-0004FQ-Df
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 02:18:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 17:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175049405"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 17:06:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 01:06:25 +0100
Message-Id: <c0c6856ea08dc44a97da9f4da0100805e6b371c0.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] combo-layer: check that last_revision is valid
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
X-List-Received-Date: Tue, 31 Jul 2012 00:18:10 -0000

If the user edits the configuration file by hand and sets last_revision,
we need to ensure that the revision is valid and on the specified
branch.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 40e63b9..95653b0 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -197,6 +197,25 @@ def drop_to_shell(workdir=None):
     else:
         return True
 
+def check_rev_branch(repodir, rev, branch):
+    try:
+        actualbranch = runcmd("git branch --contains %s" % rev, repodir, printerr=False).rstrip()
+    except subprocess.CalledProcessError as e:
+        if e.returncode == 129:
+            actualbranch = ""
+        else:
+            raise
+
+    if ' ' in actualbranch:
+        actualbranch = actualbranch.split(' ')[-1]
+    if not actualbranch:
+        logger.error("Specified revision %s is invalid!" % rev)
+        return False
+    elif actualbranch != branch:
+        logger.error("Specified revision %s is not on specified branch %s!" % (rev, branch))
+        return False
+    return True
+
 def get_repos(conf, args):
     repos = []
     if len(args) > 1:
@@ -273,6 +292,8 @@ def action_update(conf, args):
             patch_cmd_range = "--root %s" % branch
             rev_cmd_range = branch
         else:
+            if not check_rev_branch(ldir, repo['last_revision'], branch):
+                sys.exit(1)
             patch_cmd_range = "%s..%s" % (repo['last_revision'], branch)
             rev_cmd_range = patch_cmd_range
 
-- 
1.7.9.5



