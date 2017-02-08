Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5E22071CF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:15:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2017 06:15:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1092332150"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 06:15:46 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:15:39 +0200
Message-Id: <20170208141542.13484-4-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
References: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/6] oeqa.utils.git: support bare repos
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
 meta/lib/oeqa/utils/git.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index 5dd90e0..e0cb3f0 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -16,12 +16,17 @@ class GitError(Exception):
 class GitRepo(object):
     """Class representing a Git repository clone"""
     def __init__(self, path, is_topdir=False):
-        self.top_dir = self._run_git_cmd_at(['rev-parse', '--show-toplevel'],
-                                            path)
         git_dir = self._run_git_cmd_at(['rev-parse', '--git-dir'], path)
         git_dir = git_dir if os.path.isabs(git_dir) else os.path.join(path, git_dir)
         self.git_dir = os.path.realpath(git_dir)
 
+        if self._run_git_cmd_at(['rev-parse', '--is-bare-repository'], path) == 'true':
+            self.bare = True
+            self.top_dir = self.git_dir
+        else:
+            self.bare = False
+            self.top_dir = self._run_git_cmd_at(['rev-parse', '--show-toplevel'],
+                                                path)
         realpath = os.path.realpath(path)
         if is_topdir and realpath != self.top_dir:
             raise GitError("{} is not a Git top directory".format(realpath))
@@ -40,9 +45,12 @@ class GitRepo(object):
         return ret.output.strip()
 
     @staticmethod
-    def init(path):
+    def init(path, bare=False):
         """Initialize a new Git repository"""
-        GitRepo._run_git_cmd_at('init', cwd=path)
+        cmd = ['init']
+        if bare:
+            cmd.append('--bare')
+        GitRepo._run_git_cmd_at(cmd, cwd=path)
         return GitRepo(path, is_topdir=True)
 
     def run_cmd(self, git_args, env_update=None):
-- 
2.10.2


