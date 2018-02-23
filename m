Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB447882C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:02:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 19:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,381,1515484800"; d="scan'208";a="30026524"
Received: from vsharmab-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.74.120])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2018 19:02:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 16:02:09 +1300
Message-Id: <e1e012bd3bb79e363b65b911f805989301f4188f.1519354910.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519354910.git.paul.eggleton@linux.intel.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/8] lib/oe/path: implement is_path_under()
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
X-List-Received-Date: Fri, 23 Feb 2018 03:02:51 -0000

In a few places we have checks to see path A is under path B, by adding
/ to the end of the path B and then seeing if path A starts with the
suffixed path B. Unfortunately there are two potential flaws: (1) path A
needs to be suffixed with / as well or the directory itself won't match
(semantics perhaps, but in a lot of scenarios returning True is
correct); (2) you need to run os.path.abspath() on both paths first or
you will wrongly return False for some relative paths where you should
return True. Let's solve this once and for all by writing a function
that takes care of these and put it in oe.path.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/path.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 1ea03d5d568..346b48f3641 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -237,3 +237,27 @@ def realpath(file, root, use_physdir = True, loop_cnt = 100, assume_dir = False)
         raise
 
     return file
+
+def is_path_under(path1, possible_parent):
+    """
+    Return True if a path is underneath another, False otherwise.
+    Multiple paths to test can be specified (as a list or tuple) in
+    which case all specified test paths must be under the parent to
+    return True.
+    """
+    def abs_path_trailing(pth):
+        pth_abs = os.path.abspath(pth)
+        if not pth_abs.endswith(os.sep):
+            pth_abs += os.sep
+        return pth_abs
+
+    possible_parent_abs = abs_path_trailing(possible_parent)
+    if isinstance(path1, str):
+        testpaths = [path1]
+    else:
+        testpaths = path1
+    for path in testpaths:
+        path_abs = abs_path_trailing(path)
+        if not path_abs.startswith(possible_parent_abs):
+            return False
+    return True
-- 
2.14.3


