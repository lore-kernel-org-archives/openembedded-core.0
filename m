Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1C98377097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:33:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Oct 2015 06:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="829999466"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2015 06:32:54 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 05:24:44 +0000
Message-Id: <1c795f9672bcf9ffe43d311177019f10ce997d3a.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1445231631.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 3/3] oeqa/utils/ftools: Checks before appending/reading files
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
X-List-Received-Date: Mon, 19 Oct 2015 13:33:25 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Before trying to append/read a file, check if file exists.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/ftools.py | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index 64ebe3d..70a55b8 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -8,20 +8,24 @@ def write_file(path, data):
 
 def append_file(path, data):
     wdata = data.rstrip() + "\n"
-    with open(path, "a") as f:
+    if os.path.isfile(path):
+        with open(path, "a") as f:
             f.write(wdata)
 
 def read_file(path):
     data = None
-    with open(path) as f:
-        data = f.read()
+    if os.path.isfile(path):
+        with open(path) as f:
+            data = f.read()
     return data
 
 def remove_from_file(path, data):
-    lines = read_file(path).splitlines()
-    rmdata = data.strip().splitlines()
-    for l in rmdata:
-        for c in range(0, lines.count(l)):
-            i = lines.index(l)
-            del(lines[i])
-    write_file(path, "\n".join(lines))
+    rawdata = read_file(path)
+    if rawdata:
+        lines = rawdata.splitlines()
+        rmdata = data.strip().splitlines()
+        for l in rmdata:
+            for c in range(0, lines.count(l)):
+                i = lines.index(l)
+                del(lines[i])
+        write_file(path, "\n".join(lines))
-- 
1.8.4.5


