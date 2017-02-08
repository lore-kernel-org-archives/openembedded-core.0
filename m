Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3B071C5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:15:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2017 06:15:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1092332167"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 06:15:50 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:15:42 +0200
Message-Id: <20170208141542.13484-7-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
References: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 6/6] oe-build-perf-test: drop --commit-results
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

Drop support for committing results into Git repository. The
functionality was not directly related to testing and feels unnecessary
complication of the script. The functionality has been moved into a
separate oe-git-archive script.

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 104 ---------------------------------------------
 1 file changed, 104 deletions(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index f3867ab..8950c32 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -33,7 +33,6 @@ import oeqa.buildperf
 from oeqa.buildperf import (BuildPerfTestLoader, BuildPerfTestResult,
                             BuildPerfTestRunner, KernelDropCaches)
 from oeqa.utils.commands import runCmd
-from oeqa.utils.git import GitRepo, GitError
 from oeqa.utils.metadata import metadata_from_bb, write_metadata_file
 
 
@@ -74,31 +73,6 @@ def pre_run_sanity_check():
         return False
     return True
 
-def init_git_repo(path):
-    """Check/create Git repository where to store results"""
-    path = os.path.abspath(path)
-    if os.path.isfile(path):
-        log.error("Invalid Git repo %s: path exists but is not a directory", path)
-        return False
-    if not os.path.isdir(path):
-        try:
-            os.mkdir(path)
-        except (FileNotFoundError, PermissionError) as err:
-            log.error("Failed to mkdir %s: %s", path, err)
-            return False
-    if not os.listdir(path):
-        log.info("Initializing a new Git repo at %s", path)
-        GitRepo.init(path)
-    try:
-        GitRepo(path, is_topdir=True)
-    except GitError:
-        log.error("No Git repository but a non-empty directory found at %s.\n"
-                  "Please specify a Git repository, an empty directory or "
-                  "a non-existing directory", path)
-        return False
-    return True
-
-
 def setup_file_logging(log_file):
     """Setup loggin to file"""
     log_dir = os.path.dirname(log_file)
@@ -118,68 +92,6 @@ def archive_build_conf(out_dir):
     shutil.copytree(src_dir, tgt_dir)
 
 
-def git_commit_results(repo_dir, results_dir, branch, tag, metadata):
-    """Commit results into a Git repository"""
-    repo = GitRepo(repo_dir, is_topdir=True)
-    distro_branch = metadata['layers']['meta']['branch']
-    distro_commit = metadata['layers']['meta']['commit']
-    distro_commit_count = metadata['layers']['meta']['commit_count']
-
-    # Replace keywords
-    branch = branch.format(git_branch=distro_branch,
-                           tester_host=metadata['hostname'])
-
-    log.info("Committing test results into %s %s", repo_dir, branch)
-    tmp_index = os.path.join(repo_dir, '.git', 'index.oe-build-perf')
-    try:
-        # Create new commit object from the new results
-        env_update = {'GIT_INDEX_FILE': tmp_index,
-                      'GIT_WORK_TREE': results_dir}
-        repo.run_cmd('add .', env_update)
-        tree = repo.run_cmd('write-tree', env_update)
-        parent = repo.rev_parse(branch)
-        msg = "Results of {}:{}\n".format(distro_branch, distro_commit)
-        git_cmd = ['commit-tree', tree, '-m', msg]
-        if parent:
-            git_cmd += ['-p', parent]
-        commit = repo.run_cmd(git_cmd, env_update)
-
-        # Update branch head
-        git_cmd = ['update-ref', 'refs/heads/' + branch, commit]
-        if parent:
-            git_cmd.append(parent)
-        repo.run_cmd(git_cmd)
-
-        # Update current HEAD, if we're on branch 'branch'
-        if repo.get_current_branch() == branch:
-            log.info("Updating %s HEAD to latest commit", repo_dir)
-            repo.run_cmd('reset --hard')
-
-        # Create (annotated) tag
-        if tag:
-            # Find tags matching the pattern
-            tag_keywords = dict(git_branch=distro_branch,
-                                git_commit=distro_commit,
-                                git_commit_count=distro_commit_count,
-                                tester_host=metadata['hostname'],
-                                tag_num='[0-9]{1,5}')
-            tag_re = re.compile(tag.format(**tag_keywords) + '$')
-            tag_keywords['tag_num'] = 0
-            for existing_tag in repo.run_cmd('tag').splitlines():
-                if tag_re.match(existing_tag):
-                    tag_keywords['tag_num'] += 1
-
-            tag = tag.format(**tag_keywords)
-            msg = "Test run #{} of {}:{}\n".format(tag_keywords['tag_num'],
-                                                   distro_branch,
-                                                   distro_commit)
-            repo.run_cmd(['tag', '-a', '-m', msg, tag, commit])
-
-    finally:
-        if os.path.exists(tmp_index):
-            os.unlink(tmp_index)
-
-
 def update_globalres_file(result_obj, filename, metadata):
     """Write results to globalres csv file"""
     # Map test names to time and size columns in globalres
@@ -235,15 +147,6 @@ def parse_args(argv):
                         help="Log file of this script")
     parser.add_argument('--run-tests', nargs='+', metavar='TEST',
                         help="List of tests to run")
-    parser.add_argument('--commit-results', metavar='GIT_DIR',
-                        type=os.path.abspath,
-                        help="Commit result data to a (local) git repository")
-    parser.add_argument('--commit-results-branch', metavar='BRANCH',
-                        default="{git_branch}",
-                        help="Commit results to branch BRANCH.")
-    parser.add_argument('--commit-results-tag', metavar='TAG',
-                        default="{git_branch}/{git_commit_count}-g{git_commit}/{tag_num}",
-                        help="Tag results commit with TAG.")
 
     return parser.parse_args(argv)
 
@@ -266,9 +169,6 @@ def main(argv=None):
 
     if not pre_run_sanity_check():
         return 1
-    if args.commit_results:
-        if not init_git_repo(args.commit_results):
-            return 1
 
     # Check our capability to drop caches and ask pass if needed
     KernelDropCaches.check()
@@ -311,10 +211,6 @@ def main(argv=None):
         result.write_results_json()
     if args.globalres_file:
         update_globalres_file(result, args.globalres_file, metadata)
-    if args.commit_results:
-        git_commit_results(args.commit_results, out_dir,
-                           args.commit_results_branch, args.commit_results_tag,
-                           metadata)
     if result.wasSuccessful():
         return 0
 
-- 
2.10.2


