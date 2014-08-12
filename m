Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 67F8F65DB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:35:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2014 18:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,846,1400050800"; d="scan'208";a="583487602"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.255.12.45])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2014 18:35:43 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 20:35:36 -0500
Message-Id: <e646c60804ff223f54de4fb08353ec33cc573d6c.1407806939.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
References: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407806939.git.tom.zanussi@linux.intel.com>
References: <cover.1407806939.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/7] wic: Add utility function for parsing sourceparams
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
X-List-Received-Date: Tue, 12 Aug 2014 01:35:46 -0000

Parses strings of the form key1=val1[,key2=val2,...] and returns a
dict.  Also accepts valueless keys i.e. without =.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 87e3041..aa9b235 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -179,3 +179,26 @@ def get_bitbake_var(key):
             val = get_line_val(line, key)
             return val
     return None
+
+def parse_sourceparams(sourceparams):
+    """
+    Split sourceparams string of the form key1=val1[,key2=val2,...]
+    into a dict.  Also accepts valueless keys i.e. without =.
+
+    Returns dict of param key/val pairs (note that val may be None).
+    """
+    params_dict = {}
+
+    params = sourceparams.split(',')
+    if params:
+        for p in params:
+            if not p:
+                continue
+            if not '=' in p:
+                key = p
+                val = None
+            else:
+                key, val = p.split('=')
+            params_dict[key] = val
+
+    return params_dict
-- 
1.8.3.1


