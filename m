Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DB039773F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 14:20:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2016 06:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,383,1477983600"; d="scan'208";a="205357147"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2016 06:20:15 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8ADCC6A4080;
	Wed, 21 Dec 2016 06:19:25 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 16:19:57 +0200
Message-Id: <1482329997-20677-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: fix parsing of 'bitbake -e' output
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
X-List-Received-Date: Wed, 21 Dec 2016 14:20:16 -0000

Current parsing code can wrongly interpret arbitrary lines
that are of 'key=value' format as legitimate bitbake variables.

Implemented more strict parsing of key=value pairs using
regular expressions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index fe188c9..1dbbe92 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -27,6 +27,7 @@
 """Miscellaneous functions."""
 
 import os
+import re
 from collections import defaultdict
 from distutils import spawn
 
@@ -155,14 +156,11 @@ class BitbakeVars(defaultdict):
         """
         if "=" not in line:
             return
-        try:
-            key, val = line.split("=")
-        except ValueError:
+        match = re.match("^(\w+)=(.+)", line)
+        if not match:
             return
-        key = key.strip()
-        val = val.strip()
-        if key.replace('_', '').isalnum():
-            self[image][key] = val.strip('"')
+        key, val = match.groups()
+        self[image][key] = val.strip('"')
 
     def get_var(self, var, image=None):
         """
-- 
2.1.4


