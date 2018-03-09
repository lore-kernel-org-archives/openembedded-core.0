Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8ED7892A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 12:34:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 04:34:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,445,1515484800"; d="scan'208";a="181306767"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 09 Mar 2018 04:34:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 14:27:46 +0200
Message-Id: <20180309122747.39407-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH 1/2] meta/lib/oe/patch.py: do not leave .orig files if a patch isn't perfectly matching
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
X-List-Received-Date: Fri, 09 Mar 2018 12:34:29 -0000

Particularly, this was causing 'devtool modify' to erroneously add those
.orig files into commits. This was getting in the way, if the goal
was to amend/update those existing patches.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index d905159dd3f..925c03b706b 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -221,7 +221,7 @@ class PatchTree(PatchSet):
         self.patches.insert(i, patch)
 
     def _applypatch(self, patch, force = False, reverse = False, run = True):
-        shellcmd = ["cat", patch['file'], "|", "patch", "-p", patch['strippath']]
+        shellcmd = ["cat", patch['file'], "|", "patch", "--no-backup-if-mismatch", "-p", patch['strippath']]
         if reverse:
             shellcmd.append('-R')
 
-- 
2.16.1


