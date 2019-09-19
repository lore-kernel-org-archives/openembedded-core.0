Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
	by mail.openembedded.org (Postfix) with ESMTP id C9F1A6D458
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 14:55:48 +0000 (UTC)
Received: from qschulz.suevie (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 46Z0K04SKtz5tlJ;
	Thu, 19 Sep 2019 16:55:48 +0200 (CEST)
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2019 16:55:14 +0200
Message-Id: <20190919145514.15353-1-quentin.schulz@streamunlimited.com>
X-Mailer: git-send-email 2.17.1
Cc: radek.dostal@streamunlimited.com,
	Quentin Schulz <quentin.schulz@streamunlimited.com>,
	andriy.danylovskyy@streamunlimited.com
Subject: [PATCH] meta: classes: externalsrc: stop rebuilds of 2+ externalsrc recipes sharing the same git repo
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
X-List-Received-Date: Thu, 19 Sep 2019 14:55:49 -0000

externalsrc do_configure task watches oe-devtool-tree-sha1 file and its
checksum. That file basically contains the result of `git add -A
${EXTERNALSRC} && git write-tree` which is the hash of temporary
"commit" of the non committed changes. This file is stored in the .git
directory of the git repo of the externalsrc recipe. do_configure then
depends on the checksum of oe-devtool-tree-sha1 file.

If 2+ recipes with different externalsrc paths but same git repo (e.g.
one recipe at /some/path and the other at /some/path/subdir) are parsed,
this oe-devtool-tree-sha1 will be overwritten by those recipes at
parsing time since .git is shared between those recipes.

If there is one non committed git change in /some/path but not in
/some/path/subdir, the oe-devtool-tree-sha1 of both recipes will be
different.

What will happen is that recipe1 will watch over the
oe-devtool-tree-sha1 with a specific checksum, fill in file-checksums
for do_configure correctly, then recipe2 will watch over the identically
named file with different content also fill in the file-checksums
varflag. When do_configure of recipe1 will be evaluated for
re-execution, oe-devtool-tree-sha1 will be of the value of what is
watched over by recipe2, thus triggering a rebuild of recipe1.

This behavior is not always reproducible which I'm guessing is due to a
small window between recipe1 putting info into oe-devtool-tree-sha1 and
calculating the checksum of that file and recipe2 putting its content
into oe-devtool-tree-sha1.

By appending the name of the recipe to oe-devtool-tree-sha1, we make
sure that a recipe won't have its oe-devtool-tree-sha1 overwritten by
another recipe sharing the same externalsrc git repo.

Signed-off-by: Quentin Schulz <quentin.schulz@streamunlimited.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 3618b99a86..ea59d02ed9 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -203,7 +203,7 @@ def srctree_hash_files(d, srcdir=None):
 
     ret = " "
     if git_dir is not None:
-        oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1')
+        oe_hash_file = os.path.join(git_dir, 'oe-devtool-tree-sha1-%s' % d.getVar('PN'))
         with tempfile.NamedTemporaryFile(prefix='oe-devtool-index') as tmp_index:
             # Clone index
             shutil.copyfile(os.path.join(git_dir, 'index'), tmp_index.name)
-- 
2.17.1


