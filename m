Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E156876FF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 21:39:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2015 14:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,704,1437462000"; d="scan'208";a="814711677"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2015 14:39:05 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 21:38:42 +0000
Message-Id: <1445290723-3041-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 1/2] oeqa/utils/ftools: Ignore the exception if file does not exist
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
X-List-Received-Date: Mon, 19 Oct 2015 21:39:05 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There may be cases where the configuration file (path) does not exist,
thus the remove_from_file should catch this exception. In case the exception
is not the latter (errno.ENOENT), then re-raise it.

[YOCTO #8540]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/ftools.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index 64ebe3d..1ec8a09 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -1,5 +1,6 @@
 import os
 import re
+import errno
 
 def write_file(path, data):
     wdata = data.rstrip() + "\n"
@@ -18,7 +19,15 @@ def read_file(path):
     return data
 
 def remove_from_file(path, data):
-    lines = read_file(path).splitlines()
+    try:
+        rdata = read_file(path)
+    except IOError as e:
+        # if file does not exit, just quit, otherwise raise an exception
+        if e.errno == errno.ENOENT:
+            return
+        else:
+            raise
+    lines = rdata.splitlines()
     rmdata = data.strip().splitlines()
     for l in rmdata:
         for c in range(0, lines.count(l)):
-- 
1.8.4.5


