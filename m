Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6D01271D4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:15:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2017 06:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1092332156"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 06:15:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:15:40 +0200
Message-Id: <20170208141542.13484-5-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
References: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/6] scripts/oe-git-archive: support creating bare repositories
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
X-List-Received-Date: Wed, 08 Feb 2017 14:15:51 -0000

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-git-archive | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index 419332d..117118b 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -55,7 +55,7 @@ def format_str(string, fields):
                                string, err, ', '.join(sorted(fields.keys()))))
 
 
-def init_git_repo(path, no_create):
+def init_git_repo(path, no_create, bare):
     """Initialize local Git repository"""
     path = os.path.abspath(path)
     if os.path.isfile(path):
@@ -72,7 +72,7 @@ def init_git_repo(path, no_create):
                 raise ArchiveError("Failed to mkdir {}: {}".format(path, err))
         if not os.listdir(path):
             log.info("Initializing a new Git repo at %s", path)
-            repo = GitRepo.init(path)
+            repo = GitRepo.init(path, bare)
     try:
         repo = GitRepo(path, is_topdir=True)
     except GitError:
@@ -108,7 +108,7 @@ def git_commit_data(repo, data_dir, branch, message):
         repo.run_cmd(git_cmd)
 
         # Update current HEAD, if we're on branch 'branch'
-        if repo.get_current_branch() == branch:
+        if not repo.bare and repo.get_current_branch() == branch:
             log.info("Updating %s HEAD to latest commit", repo.top_dir)
             repo.run_cmd('reset --hard')
 
@@ -158,6 +158,9 @@ def parse_args(argv):
     parser.add_argument('--no-create', action='store_true',
                         help="If GIT_DIR is not a valid Git repository, do not "
                              "try to create one")
+    parser.add_argument('--bare', action='store_true',
+                        help="Initialize a bare repository when creating a "
+                             "new one")
     parser.add_argument('--push', '-p', nargs='?', default=False, const=True,
                         help="Push to remote")
     parser.add_argument('--branch-name', '-b',
@@ -195,7 +198,7 @@ def main(argv=None):
         if not os.path.isdir(args.data_dir):
             raise ArchiveError("Not a directory: {}".format(args.data_dir))
 
-        data_repo = init_git_repo(args.git_dir, args.no_create)
+        data_repo = init_git_repo(args.git_dir, args.no_create, args.bare)
 
         # Get keywords to be used in tag and branch names and messages
         metadata = metadata_from_bb()
-- 
2.10.2


