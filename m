Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C8B3276DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520259"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:21:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:22 +0100
Message-Id: <5f534abe8071878100cb04e75e7fc206f88ff0a1.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/27] lib/oe/patch: fix for git am not cleaning up after itself
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:12 -0000

Unfortunately it appears that under certain circumstances, a failed
git am followed by git am --abort won't clean up any changes the patch
might have made - this was seen when running "devtool extract" on the
unzip recipe; unzip-6.0_overflow3.diff has a malformed date as far as
git am is concerned but it triggers this condition. Add a
git reset --hard HEAD followed by git clean -f in order to recover from
this scenario.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 108bf1d..7441214 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -407,6 +407,13 @@ class GitApplyTree(PatchTree):
                     runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
                 except CmdError:
                     pass
+                # git am won't always clean up after itself, sadly, so...
+                shellcmd = ["git", "--work-tree=%s" % reporoot, "reset", "--hard", "HEAD"]
+                runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+                # Also need to take care of any stray untracked files
+                shellcmd = ["git", "--work-tree=%s" % reporoot, "clean", "-f"]
+                runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+
                 # Fall back to git apply
                 shellcmd = ["git", "--git-dir=%s" % reporoot, "apply", "-p%s" % patch['strippath']]
                 try:
-- 
2.1.0


