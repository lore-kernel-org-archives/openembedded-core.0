Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F377A77BB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490365082; x=1521901082;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YaI/cZlag6ucIEmu+HOjTtjujKR2UCgJBIB/XOHByCY=;
	b=F5V58cemho+TwOR7b730mnz0qfPrvl0z/6ZoMVwhlW545YrkgWvX4lbE
	+3L+xyANz2Vt6CBUJL3Brdh/3bbn4Q==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="1146511865"
Received: from mlehtone-mac02.fi.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.237.66.34])
	by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2017 07:17:40 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:17:29 +0200
Message-Id: <1490365050-11776-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/6] scripts/oe-git-archive: implement --notes
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

Option for adding git-notes to the commit.

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-git-archive | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index 1805ab3..ab19cb9 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -83,7 +83,7 @@ def init_git_repo(path, no_create, bare):
     return repo
 
 
-def git_commit_data(repo, data_dir, branch, message, exclude):
+def git_commit_data(repo, data_dir, branch, message, exclude, notes):
     """Commit data into a Git repository"""
     log.info("Committing data into to branch %s", branch)
     tmp_index = os.path.join(repo.git_dir, 'index.oe-git-archive')
@@ -106,6 +106,12 @@ def git_commit_data(repo, data_dir, branch, message, exclude):
             git_cmd += ['-p', parent]
         commit = repo.run_cmd(git_cmd, env_update)
 
+        # Create git notes
+        for ref, filename in notes:
+            ref = ref.format(branch_name=branch)
+            repo.run_cmd(['notes', '--ref', ref, 'add',
+                          '-F', os.path.abspath(filename), commit])
+
         # Update branch head
         git_cmd = ['update-ref', 'refs/heads/' + branch, commit]
         if parent:
@@ -191,6 +197,13 @@ def parse_args(argv):
     parser.add_argument('--exclude', action='append', default=[],
                         help="Glob to exclude files from the commit. Relative "
                              "to DATA_DIR. May be specified multiple times")
+    parser.add_argument('--notes', nargs=2, action='append', default=[],
+                        metavar=('GIT_REF', 'FILE'),
+                        help="Add a file as a note under refs/notes/GIT_REF. "
+                             "{branch_name} in GIT_REF will be expanded to the "
+                             "actual target branch name (specified by "
+                             "--branch-name). This option may be specified "
+                             "multiple times.")
     parser.add_argument('data_dir', metavar='DATA_DIR',
                         help="Data to commit")
     return parser.parse_args(argv)
@@ -229,7 +242,7 @@ def main(argv=None):
 
         # Commit data
         commit = git_commit_data(data_repo, args.data_dir, branch_name,
-                                 commit_msg, args.exclude)
+                                 commit_msg, args.exclude, args.notes)
 
         # Create tag
         if tag_name:
@@ -242,7 +255,9 @@ def main(argv=None):
             # If no remote is given we push with the default settings from
             # gitconfig
             if args.push is not True:
-                cmd.extend([args.push, branch_name])
+                notes_refs = ['refs/notes/' + ref.format(branch_name=branch_name)
+                                for ref, _ in args.notes]
+                cmd.extend([args.push, branch_name] + notes_refs)
             log.info("Pushing data to remote")
             data_repo.run_cmd(cmd)
 
-- 
2.6.6


