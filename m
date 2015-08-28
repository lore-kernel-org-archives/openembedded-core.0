Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB4DB71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 09:13:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 28 Aug 2015 02:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="792613516"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.13.245])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2015 02:13:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 10:13:20 +0100
Message-Id: <c5e9b9984dacce1af0ea8912bddd9949aa3086bb.1440753140.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440753140.git.paul.eggleton@linux.intel.com>
References: <cover.1440753140.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440753140.git.paul.eggleton@linux.intel.com>
References: <cover.1440753140.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] lib/oe/patch: handle patches that delete files with older git
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
X-List-Received-Date: Fri, 28 Aug 2015 09:13:33 -0000

When running "git add" on a directory with older git versions, deleted
files aren't added to what is to be committed unless you explicitly
specify the -A option. The result of this is that when applying a patch
from a recipe which doesn't apply with "git am" (and we fall back to
applying the patch through other means then "git add" following by
a "git commit") these deletes weren't committed with the patch, leaving
them sitting deleted but not committed at the end.

This should fix test_devtool_modify_native (which unwittingly exercises
this scenario by attempting to run "devtool modify" on apt-native) on
machines with older git versions.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index c4f042d..108bf1d 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -415,7 +415,7 @@ class GitApplyTree(PatchTree):
                     # Fall back to patch
                     output = PatchTree._applypatch(self, patch, force, reverse, run)
                 # Add all files
-                shellcmd = ["git", "add", "-f", "."]
+                shellcmd = ["git", "add", "-f", "-A", "."]
                 output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
                 # Exclude the patches directory
                 shellcmd = ["git", "reset", "HEAD", self.patchdir]
-- 
2.1.0


