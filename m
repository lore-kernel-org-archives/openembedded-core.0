Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 305B760720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 01:46:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2016 17:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,616,1473145200"; d="scan'208";a="189697412"
Received: from yspay-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.149])
	by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2016 17:46:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 14:45:19 +1300
Message-Id: <1f4d71e6296c711d38615319be632edcb3fbfcf5.1478742229.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478742229.git.paul.eggleton@linux.intel.com>
References: <cover.1478742229.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] lib/oe/recipeutils: ignore archives by default in get_recipe_local_files()
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
X-List-Received-Date: Thu, 10 Nov 2016 01:46:02 -0000

By default, have get_recipe_local_files() not return any archive
files. This prevents a local tarball from being erroneously removed
from SRC_URI if you run "devtool modify" on a recipe followed by
"devtool update-recipe". It doesn't actually help you to directly
update the contents of such tarballs, but at least now it won't break
the recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index ab4177a..1589feb 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -389,10 +389,15 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True):
     return copied, remotes
 
 
-def get_recipe_local_files(d, patches=False):
+def get_recipe_local_files(d, patches=False, archives=False):
     """Get a list of local files in SRC_URI within a recipe."""
     uris = (d.getVar('SRC_URI', True) or "").split()
     fetch = bb.fetch2.Fetch(uris, d)
+    # FIXME this list should be factored out somewhere else (such as the
+    # fetcher) though note that this only encompasses actual container formats
+    # i.e. that can contain multiple files as opposed to those that only
+    # contain a compressed stream (i.e. .tar.gz as opposed to just .gz)
+    archive_exts = ['.tar', '.tgz', '.tar.gz', '.tar.Z', '.tbz', '.tbz2', '.tar.bz2', '.tar.xz', '.tar.lz', '.zip', '.jar', '.rpm', '.srpm', '.deb', '.ipk', '.tar.7z', '.7z']
     ret = {}
     for uri in uris:
         if fetch.ud[uri].type == 'file':
@@ -409,7 +414,14 @@ def get_recipe_local_files(d, patches=False):
                 if os.path.isabs(subdir):
                     continue
                 fname = os.path.join(subdir, fname)
-            ret[fname] = fetch.localpath(uri)
+            localpath = fetch.localpath(uri)
+            if not archives:
+                # Ignore archives that will be unpacked
+                if localpath.endswith(tuple(archive_exts)):
+                    unpack = fetch.ud[uri].parm.get('unpack', True)
+                    if unpack:
+                        continue
+            ret[fname] = localpath
     return ret
 
 
-- 
2.5.5


