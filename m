Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EAB657875A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 01:50:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2018 17:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,395,1515484800"; d="scan'208";a="206908178"
Received: from cthanang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.39])
	by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2018 17:50:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 14:49:54 +1300
Message-Id: <14916aba59e4784b073b99c02db927e1c86e8d65.1519609613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519609613.git.paul.eggleton@linux.intel.com>
References: <cover.1519609613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/8] lib/oe/path: implement is_path_parent()
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
X-List-Received-Date: Mon, 26 Feb 2018 01:50:37 -0000

In a few places we have checks to see path B is the parent of path A, by
adding / to the end of the path B and then seeing if path A starts with
the suffixed path B. Unfortunately there are two potential flaws:
(1) path A needs to be suffixed with / as well or the directory itself
won't match (semantics perhaps, but in a lot of scenarios returning True
is correct); (2) you need to run os.path.abspath() on both paths first
or you will wrongly return False for some relative paths where you
should return True. Let's solve this once and for all by writing a
function that takes care of these and put it in oe.path.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/path.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 1ea03d5d568..76c58fa7601 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -237,3 +237,25 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False)
         raise
 
     return file
+
+def is_path_parent(possible_parent, *paths):
+    """
+    Return True if a path is the parent of another, False otherwise.
+    Multiple paths to test can be specified in which case all
+    specified test paths must be under the parent in order to
+    return True.
+    """
+    def abs_path_trailing(pth):
+        pth_abs = os.path.abspath(pth)
+        if not pth_abs.endswith(os.sep):
+            pth_abs += os.sep
+        return pth_abs
+
+    possible_parent_abs = abs_path_trailing(possible_parent)
+    if not paths:
+        return False
+    for path in paths:
+        path_abs = abs_path_trailing(path)
+        if not path_abs.startswith(possible_parent_abs):
+            return False
+    return True
-- 
2.14.3


