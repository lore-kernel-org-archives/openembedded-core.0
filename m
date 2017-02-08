Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A4ED071C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:15:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2017 06:15:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1092332141"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2017 06:15:44 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:15:37 +0200
Message-Id: <20170208141542.13484-2-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
References: <20170208141542.13484-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/6] oeqa.utils.git: add git_dir property
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
X-List-Received-Date: Wed, 08 Feb 2017 14:15:46 -0000

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/git.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index ae85d27..5dd90e0 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -18,6 +18,10 @@ class GitRepo(object):
     def __init__(self, path, is_topdir=False):
         self.top_dir = self._run_git_cmd_at(['rev-parse', '--show-toplevel'],
                                             path)
+        git_dir = self._run_git_cmd_at(['rev-parse', '--git-dir'], path)
+        git_dir = git_dir if os.path.isabs(git_dir) else os.path.join(path, git_dir)
+        self.git_dir = os.path.realpath(git_dir)
+
         realpath = os.path.realpath(path)
         if is_topdir and realpath != self.top_dir:
             raise GitError("{} is not a Git top directory".format(realpath))
-- 
2.10.2


