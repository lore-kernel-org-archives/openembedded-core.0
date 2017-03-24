Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 998ED77B07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490365082; x=1521901082;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4y3njQt/xfLo3EdUDCPI0V3K/ud8xxFqRu02UTt9aJQ=;
	b=ulDkjCWp2QZbNa5uvWdtqYErhAHB6kC2JA9SjixbK6ZX3QvF3AeGQEBq
	+dofhlu+jhl6nw5vR2GqnlViMXAfNw==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="1146511860"
Received: from mlehtone-mac02.fi.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.237.66.34])
	by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2017 07:17:39 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:17:28 +0200
Message-Id: <1490365050-11776-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/6] scripts/oe-git-archive: implement --exclude
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
X-List-Received-Date: Fri, 24 Mar 2017 14:18:01 -0000

May be used for excluding certain files from the commit.

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-git-archive | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index aef4ba1..1805ab3 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -83,7 +83,7 @@ def init_git_repo(path, no_create, bare):
     return repo
 
 
-def git_commit_data(repo, data_dir, branch, message):
+def git_commit_data(repo, data_dir, branch, message, exclude):
     """Commit data into a Git repository"""
     log.info("Committing data into to branch %s", branch)
     tmp_index = os.path.join(repo.git_dir, 'index.oe-git-archive')
@@ -92,6 +92,11 @@ def git_commit_data(repo, data_dir, branch, message):
         env_update = {'GIT_INDEX_FILE': tmp_index,
                       'GIT_WORK_TREE': os.path.abspath(data_dir)}
         repo.run_cmd('add .', env_update)
+
+        # Remove files that are excluded
+        if exclude:
+            repo.run_cmd(['rm', '--cached'] + [f for f in exclude], env_update)
+
         tree = repo.run_cmd('write-tree', env_update)
 
         # Create new commit object from the tree
@@ -183,6 +188,9 @@ def parse_args(argv):
     parser.add_argument('--tag-msg-body',
                         default='',
                         help="Tag message body (pattern)")
+    parser.add_argument('--exclude', action='append', default=[],
+                        help="Glob to exclude files from the commit. Relative "
+                             "to DATA_DIR. May be specified multiple times")
     parser.add_argument('data_dir', metavar='DATA_DIR',
                         help="Data to commit")
     return parser.parse_args(argv)
@@ -221,7 +229,7 @@ def main(argv=None):
 
         # Commit data
         commit = git_commit_data(data_repo, args.data_dir, branch_name,
-                                 commit_msg)
+                                 commit_msg, args.exclude)
 
         # Create tag
         if tag_name:
-- 
2.6.6


