Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E0F21773A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305685"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:30 +1300
Message-Id: <42427e8db55557125c0e1f30cf87587f705af8dc.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/14] devtool: upgrade: eliminate unnecessary datastore copy
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:22 -0000

We aren't modifying the datastore copy here, so we don't need a copy at
all.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index fae20ef..50c670e 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -241,14 +241,13 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
 
 def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
-    crd = rd.createCopy()
 
-    bpn = crd.getVar('BPN', True)
+    bpn = rd.getVar('BPN', True)
     path = os.path.join(workspace, 'recipes', bpn)
     bb.utils.mkdirhier(path)
-    oe.recipeutils.copy_recipe_files(crd, path)
+    oe.recipeutils.copy_recipe_files(rd, path)
 
-    oldpv = crd.getVar('PV', True)
+    oldpv = rd.getVar('PV', True)
     if not newpv:
         newpv = oldpv
     origpath = rd.getVar('FILE', True)
-- 
2.5.0


