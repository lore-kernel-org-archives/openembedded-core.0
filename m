Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 73A34731DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410445"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:16 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:36 +0300
Message-Id: <1466764661-24544-24-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 23/28] oeqa.utils: add git module
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:16 -0000

A new helper module for easier interaction with Git repositories.
Provides GitRepo class that represents one local Git repository clone.
The GitRepo class currently only has one method, run_cmd(), for running
arbitrary git commands in the repository. More specialized methods for
commonly used git operations can be added later.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/git.py | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/git.py

diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
new file mode 100644
index 0000000..a4c6741
--- /dev/null
+++ b/meta/lib/oeqa/utils/git.py
@@ -0,0 +1,38 @@
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+#
+"""Git repository interactions"""
+from oeqa.utils.commands import runCmd
+
+
+class GitError(Exception):
+    """Git error handling"""
+    pass
+
+class GitRepo(object):
+    """Class representing a Git repository clone"""
+    def __init__(self, cwd):
+        self.top_dir = self._run_git_cmd_at(['rev-parse', '--show-toplevel'],
+                                            cwd)
+
+    @staticmethod
+    def _run_git_cmd_at(git_args, cwd, **kwargs):
+        """Run git command at a specified directory"""
+        git_cmd = 'git ' if isinstance(git_args, str) else ['git']
+        git_cmd += git_args
+        ret = runCmd(git_cmd, ignore_status=True, cwd=cwd, **kwargs)
+        if ret.status:
+            cmd_str = git_cmd if isinstance(git_cmd, str) \
+                                else ' '.join(git_cmd)
+            raise GitError("'{}' failed with exit code {}: {}".format(
+                cmd_str, ret.status, ret.output))
+        return ret.output.strip()
+
+    def run_cmd(self, git_args):
+        """Run Git command"""
+        return self._run_git_cmd_at(git_args, self.top_dir)
+
+
+
-- 
2.6.6


