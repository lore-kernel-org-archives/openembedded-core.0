Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAlk4-0004g6-MP
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:24:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2012 10:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="143359127"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2012 10:15:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 17:15:04 +0000
Message-Id: <587666661eacb8bad434b7f634dcd3213a7c5b96.1332436375.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332436375.git.paul.eggleton@linux.intel.com>
References: <cover.1332436375.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332436375.git.paul.eggleton@linux.intel.com>
References: <cover.1332436375.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] scripts/combo-layer: limit component repo dirty check
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
X-List-Received-Date: Thu, 22 Mar 2012 17:24:04 -0000

If one or more components are specified for update, only check if their
repository/repositories are dirty rather than checking all of the
configured repositories.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 7457ba2..3612323 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -150,15 +150,6 @@ def action_update(conf, args):
         generate the patch list
         apply the generated patches
     """
-    # make sure all repos are clean
-    for name in conf.repos:
-        check_repo_clean(conf.repos[name]['local_repo_dir'])
-    check_repo_clean(os.getcwd())
-
-    import uuid
-    patch_dir = "patch-%s" % uuid.uuid4()
-    os.mkdir(patch_dir)
-
     repos = []
     if len(args) > 1:
         for arg in args[1:]:
@@ -174,6 +165,15 @@ def action_update(conf, args):
     if not repos:
         repos = conf.repos
 
+    # make sure all repos are clean
+    for name in repos:
+        check_repo_clean(conf.repos[name]['local_repo_dir'])
+    check_repo_clean(os.getcwd())
+
+    import uuid
+    patch_dir = "patch-%s" % uuid.uuid4()
+    os.mkdir(patch_dir)
+
     for name in repos:
         repo = conf.repos[name]
         ldir = repo['local_repo_dir']
-- 
1.7.5.4



