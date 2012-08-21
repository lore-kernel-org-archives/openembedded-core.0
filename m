Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3m55-0001Rf-8o
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 12:53:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Aug 2012 03:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,801,1336374000"; d="scan'208";a="183373684"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.105])
	by orsmga001.jf.intel.com with ESMTP; 21 Aug 2012 03:41:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 11:40:55 +0100
Message-Id: <1345545655-14640-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] scripts/combo-layer: checkout branch in update when pull is disabled
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
X-List-Received-Date: Tue, 21 Aug 2012 10:53:09 -0000

If the user selects not to pull the component repos, at least ensure
that the correct branch is checked out before proceeding.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 448fe71..6134e81 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -356,6 +356,10 @@ def action_update(conf, args):
         branch = repo.get('branch', "master")
         repo_patch_dir = os.path.join(os.getcwd(), patch_dir, name)
 
+        if conf.nopull:
+            # Need to do this here as we didn't call action_pull that would do it otherwise
+            runcmd("git checkout %s" % branch, ldir)
+
         # Step 2: generate the patch list and store to patch dir
         logger.info("Generating patches from %s..." % name)
         if dest_dir != ".":
-- 
1.7.9.5



