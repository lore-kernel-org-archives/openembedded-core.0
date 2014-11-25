Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 423DB7229E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:29:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2014 09:29:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,456,1413270000"; d="scan'208";a="637908691"
Received: from ksperera-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.204])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2014 09:29:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Nov 2014 17:28:41 +0000
Message-Id: <34bc6edfa0a43ee42f91fab28d009a8c3814b44a.1416934753.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/7] lib/oe/patch: fall back to patch if git apply fails
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
X-List-Received-Date: Tue, 25 Nov 2014 17:29:49 -0000

When PATCHTOOL = "git", git apply doesn't support fuzzy application, so
if a patch requires that it's better to be able to apply it rather than
just failing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index b085c9d..788f465 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -219,7 +219,11 @@ class GitApplyTree(PatchTree):
             return _applypatchhelper(shellcmd, patch, force, reverse, run)
         except CmdError:
             shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
-            return _applypatchhelper(shellcmd, patch, force, reverse, run)
+            try:
+                output = _applypatchhelper(shellcmd, patch, force, reverse, run)
+            except CmdError:
+                output = PatchTree._applypatch(self, patch, force, reverse, run)
+            return output
 
 
 class QuiltTree(PatchSet):
-- 
1.9.3


