Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 912C578336
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:54:59 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494372"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:54:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:05 +1200
Message-Id: <6acf76beda4d824bd7edf9ab5bfbb425d4b5aa69.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/13] devtool: update-recipe: ensure patches get deleted in srcrev mode
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
X-List-Received-Date: Wed, 30 Aug 2017 23:54:59 -0000

Patches that we identify as having been "deleted" (i.e. patches in
SRC_URI that no longer appear in the git tree) need to be dropped even
if we're updating in srcrev mode. This fixes the case where HEAD of the
git tree is valid upstream (i.e. no extra commits), but there are
patches left over in the recipe, e.g. when we do devtool upgrade and
then all of the commits rebased on top of the new branch get skipped.

Fixes [YOCTO #11972].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index fa9d347..d79ebf1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1352,9 +1352,10 @@ def _update_recipe_srcrev(srctree, rd, appendlayerdir, wildcard_version, no_remo
             old_srcrev = (rd.getVar('SRCREV', False) or '')
             upd_p, new_p, del_p = _export_patches(srctree, rd, old_srcrev,
                                                   patches_dir)
+            logger.debug('Patches: update %s, new %s, delete %s' % (dict(upd_p), dict(new_p), dict(del_p)))
 
             # Remove deleted local files and "overlapping" patches
-            remove_files = list(del_f.values()) + list(upd_p.values())
+            remove_files = list(del_f.values()) + list(upd_p.values()) + list(del_p.values())
             if remove_files:
                 removedentries = _remove_file_entries(srcuri, remove_files)[0]
                 update_srcuri = True
-- 
2.9.5


