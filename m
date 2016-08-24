Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6D627731BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620618"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:56 +0300
Message-Id: <1472022789-13028-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 06/19] oeqa.utils.git.GitRepo: new arg to require topdir
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:25 -0000

Add a new 'is_topdir' argument to the GitRepo init method which
validates that the given path is the top directory of a Git repository.
Without this argument GitRepo also accepts subdirectories of a Git
repository (in which case GitRepo will point to the parent directory
that is the top directory of this repository) which may have undesired
in some cases.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/git.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index 0fc8112..ca84680 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -4,6 +4,8 @@
 # Released under the MIT license (see COPYING.MIT)
 #
 """Git repository interactions"""
+import os
+
 from oeqa.utils.commands import runCmd
 
 
@@ -13,9 +15,12 @@ class GitError(Exception):
 
 class GitRepo(object):
     """Class representing a Git repository clone"""
-    def __init__(self, cwd):
+    def __init__(self, path, is_topdir=False):
         self.top_dir = self._run_git_cmd_at(['rev-parse', '--show-toplevel'],
-                                            cwd)
+                                            path)
+        realpath = os.path.realpath(path)
+        if is_topdir and realpath != self.top_dir:
+            raise GitError("{} is not a Git top directory".format(realpath))
 
     @staticmethod
     def _run_git_cmd_at(git_args, cwd, **kwargs):
-- 
2.6.6


