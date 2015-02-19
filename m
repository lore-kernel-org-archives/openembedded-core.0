Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 74AC96B6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425529"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:51 +0000
Message-Id: <1153404e073d30092ddf18b8fe879aad88e42262.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/15] lib/oe/patch: fix PATCHTOOL = "git" with source in a subdirectory
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:21 -0000

For recipes that have their actual source in a subdirectory of what is
fetched (e.g. mkelfimage), we need to find the root of the repository
within the GitApplyTree code that attempts to set up the required git
hooks and use that, rather than expecting the root to be the same as
${S}.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index b838be8..f68d40f 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -313,9 +313,12 @@ class GitApplyTree(PatchTree):
             return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
 
         # Add hooks which add a pointer to the original patch file name in the commit message
-        commithook = os.path.join(self.dir, '.git', 'hooks', 'commit-msg')
+        reporoot = (runcmd("git rev-parse --show-toplevel".split(), self.dir) or '').strip()
+        if not reporoot:
+            raise Exception("Cannot get repository root for directory %s" % self.dir)
+        commithook = os.path.join(reporoot, '.git', 'hooks', 'commit-msg')
         commithook_backup = commithook + '.devtool-orig'
-        applyhook = os.path.join(self.dir, '.git', 'hooks', 'applypatch-msg')
+        applyhook = os.path.join(reporoot, '.git', 'hooks', 'applypatch-msg')
         applyhook_backup = applyhook + '.devtool-orig'
         if os.path.exists(commithook):
             shutil.move(commithook, commithook_backup)
-- 
1.9.3


