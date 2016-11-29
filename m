Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BDFE371ABE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 14:42:58 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2016 06:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="36902317"
Received: from ylu41-mobl2.amr.corp.intel.com (HELO
	mlopezva-MOBL2.amr.corp.intel.com) ([10.254.1.198])
	by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2016 06:43:00 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 08:42:59 -0600
Message-Id: <d576d1ae718e3ac9b589e3c23e1f2052dae5c487.1480429545.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <cover.1480429545.git.mariano.lopez@linux.intel.com>
References: <cover.1480429545.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1480429545.git.mariano.lopez@linux.intel.com>
References: <cover.1480429545.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/2] oe-selftest: Add option to submit test result to a git repository.
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
X-List-Received-Date: Tue, 29 Nov 2016 14:42:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This new option allows to commit the result to a git repository,
along with the results it will add a metadata file for information
of the current selftest run, such as: hostname, machine, distro,
distro version, host version, and layers.

This implementation will have a branch per different hostname,
testing branch, and machine.

To use this feature use:

oe-selftest <options> --repository <repository_link>

[YOCTO #9954]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/oe-selftest | 98 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index deaa432..81dfa3d 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -36,6 +36,7 @@ import re
 import fnmatch
 import collections
 import imp
+import git
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -46,6 +47,7 @@ import argparse_oe
 import oeqa.selftest
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer
+from oeqa.utils.metadata import metadata_from_bb, write_metadata_file
 from oeqa.selftest.base import oeSelfTest, get_available_machines
 
 try:
@@ -106,6 +108,8 @@ def get_args_parser():
                        help='List all tags that have been set to test cases.')
     parser.add_argument('--machine', required=False, dest='machine', choices=['random', 'all'], default=None,
                         help='Run tests on different machines (random/all).')
+    parser.add_argument('--repository', required=False, dest='repository', default='', action='store',
+                        help='Submit test results to a repository')
     return parser
 
 
@@ -572,6 +576,71 @@ def main():
 
         log.info("Finished")
 
+        if args.repository:
+            # Commit tests results to repository
+            metadata = metadata_from_bb()
+            git_dir = os.path.join(os.getcwd(), 'selftest')
+            if not os.path.isdir(git_dir):
+                os.mkdir(git_dir)
+
+            log.debug('Checking for git repository in %s' % git_dir)
+            try:
+                repo = git.Repo(git_dir)
+            except git.exc.InvalidGitRepositoryError:
+                log.debug("Couldn't find git repository %s; "
+                         "cloning from %s" % (git_dir, args.repository))
+                repo = git.Repo.clone_from(args.repository, git_dir)
+
+            r_branches = repo.git.branch(r=True)
+            r_branches = set(r_branches.replace('origin/', '').split())
+            l_branches = {str(branch) for branch in repo.branches}
+            branch = '%s/%s/%s' % (metadata['hostname'],
+                                   metadata['layers']['meta']['branch'],
+                                   metadata['machine'])
+
+            if branch in r_branches:
+                log.debug('Found branch in remote repository, checking'
+                          ' out and pulling')
+                repo.git.checkout(branch)
+                repo.git.pull()
+            elif branch in l_branches:
+                log.debug('Found branch in local repository, checking out')
+                repo.git.checkout(branch)
+            else:
+                log.debug('New branch %s' % branch)
+                repo.git.checkout('master')
+                repo.git.checkout(b=branch)
+
+            cleanResultsDir(repo)
+            xml_dir = os.path.join(os.getcwd(), log_prefix)
+            copyResultFiles(xml_dir, git_dir, repo)
+            metadata_file = os.path.join(git_dir, 'metadata.xml')
+            write_metadata_file(metadata_file, metadata)
+            repo.index.add([metadata_file])
+            repo.index.write()
+
+            # Get information for commit message
+            layer_info = ''
+            for layer, values in metadata['layers'].items():
+                layer_info = '%s%-17s = %s:%s\n' % (layer_info, layer,
+                              values['branch'], values['revision'])
+            msg = 'Selftest for build %s of %s %s for machine %s on %s\n\n%s' % (
+                   log_prefix[12:], metadata['distro'], metadata['distro_version'],
+                   metadata['machine'], metadata['hostname'], layer_info)
+
+            log.debug('Commiting results to local repository')
+            repo.index.commit(msg)
+            if not repo.is_dirty():
+                if branch in r_branches:
+                    log.debug('Pushing changes to remote repository')
+                    repo.git.push()
+                else:
+                    log.debug('Pushing changes to remote repository '
+                              'creating new branch')
+                    repo.git.push('-u', 'origin', branch)
+            else:
+                log.error('Local repository is dirty, not pushing commits')
+
         if result.wasSuccessful():
             return 0
         else:
@@ -655,6 +724,35 @@ def buildResultClass(args):
 
     return StampedResult
 
+def cleanResultsDir(repo):
+    """ Remove result files from directory """
+
+    xml_files = []
+    directory = repo.working_tree_dir
+    for f in os.listdir(directory):
+        path = os.path.join(directory, f)
+        if os.path.isfile(path) and path.endswith('.xml'):
+            xml_files.append(f)
+    repo.index.remove(xml_files, working_tree=True)
+
+def copyResultFiles(src, dst, repo):
+    """ Copy result files from src to dst removing the time stamp. """
+
+    import shutil
+
+    re_time = re.compile("-[0-9]+")
+    file_list = []
+
+    for root, subdirs, files in os.walk(src):
+        tmp_dir = root.replace(src, '').lstrip('/')
+        for s in subdirs:
+            os.mkdir(os.path.join(dst, tmp_dir, s))
+        for f in files:
+            file_name = os.path.join(dst, tmp_dir, re_time.sub("", f))
+            shutil.copy2(os.path.join(root, f), file_name)
+            file_list.append(file_name)
+    repo.index.add(file_list)
+
 class TestRunner(_TestRunner):
     """Test runner class aware of exporting tests."""
     def __init__(self, *args, **kwargs):
-- 
2.7.3


