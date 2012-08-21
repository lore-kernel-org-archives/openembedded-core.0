Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T3oWN-0005SV-LM
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 15:29:27 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Aug 2012 06:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="189271640"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.105])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2012 06:17:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 14:17:10 +0100
Message-Id: <1345555030-24506-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] scripts/combo-layer: specify branch when getting current revision
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
X-List-Received-Date: Tue, 21 Aug 2012 13:29:27 -0000

Handle the case during update where the configured branch is not
currently checked out in the component repository by just specifying
it in the places where it was not previously.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 448fe71..330faca 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -191,7 +191,7 @@ def action_init(conf, args):
             branch = repo.get('branch', "master")
             file_filter = repo.get('file_filter', "")
             runcmd("git archive %s | tar -x -C %s %s" % (branch, extract_dir, file_filter), ldir)
-            lastrev = runcmd("git rev-parse HEAD", ldir).strip()
+            lastrev = runcmd("git rev-parse %s" % branch, ldir).strip()
             conf.update(name, "last_revision", lastrev, initmode=True)
         runcmd("git add .")
         if conf.localconffile:
@@ -475,7 +475,8 @@ def apply_patchlist(conf, repos):
         else:
             logger.info("No patches to apply from %s" % name)
             ldir = conf.repos[name]['local_repo_dir']
-            lastrev = runcmd("git rev-parse HEAD", ldir).strip()
+            branch = conf.repos[name].get('branch', "master")
+            lastrev = runcmd("git rev-parse %s" % branch, ldir).strip()
 
         if lastrev != repo['last_revision']:
             conf.update(name, "last_revision", lastrev)
-- 
1.7.9.5



