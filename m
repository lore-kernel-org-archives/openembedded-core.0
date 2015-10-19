Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0F70F7702A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 21:39:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2015 14:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,704,1437462000"; d="scan'208";a="814711696"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2015 14:39:06 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 21:38:43 +0000
Message-Id: <1445290723-3041-2-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1445290723-3041-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
References: <1445290723-3041-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] oeqa/utils/ftools: From functions that expect data, check if None
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

ftools functions that expect data may get 'None'; this patch does this check
and return immediately if this is the case.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/ftools.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index 1ec8a09..1bd9a30 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -3,11 +3,17 @@ import re
 import errno
 
 def write_file(path, data):
+    # In case data is None, return immediately
+    if data is None:
+        return
     wdata = data.rstrip() + "\n"
     with open(path, "w") as f:
         f.write(wdata)
 
 def append_file(path, data):
+    # In case data is None, return immediately
+    if data is None:
+        return
     wdata = data.rstrip() + "\n"
     with open(path, "a") as f:
             f.write(wdata)
@@ -19,6 +25,9 @@ def read_file(path):
     return data
 
 def remove_from_file(path, data):
+    # In case data is None, return immediately
+    if data is None:
+        return
     try:
         rdata = read_file(path)
     except IOError as e:
-- 
1.8.4.5


