Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO5a-0000wQ-By
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:02:02 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71129616"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2011 10:55:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:55:39 +0000
Message-Id: <161f7b1dc39efa2a2f4041d223b0e52ee3fdf23c.1320429268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] scripts/combo-layer: auto-commit updated config file
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

If the config file is tracked within the combo-layer repository and it
is updated at the end of the "update" operation (because last_revision
has been changed), then automatically commit the file. This ensures that
multiple people can perform updates on different machines without the
last revision information going missing.

(If the file is outside the repository or is masked via .gitignore, this
will do nothing.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index f3480dc..64ea9a9 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -230,6 +230,18 @@ def action_update(conf, args):
     action_apply_patch(conf, args)
     runcmd("rm -rf %s" % patch_dir)
 
+    # Step 7: commit the updated config file if it's being tracked
+    relpath = os.path.relpath(conf.conffile)
+    try:
+        output = runcmd("git status --porcelain %s" % relpath)
+    except:
+        # Outside the repository
+        output = None
+    if output:
+        logger.info("Committing updated configuration file")
+        if output.lstrip().startswith("M"):
+            runcmd('git commit --author="combo-layer <combo-layer@localhost>" -m "Automatic commit to update last_revision" %s' % relpath)
+
 def action_apply_patch(conf, args):
     """
         apply the generated patch list to combo repo
-- 
1.7.5.4



