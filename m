Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8128671C2C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:18:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 08 Dec 2016 08:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496505"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:18:57 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:41 -0600
Message-Id: <a4f2094357bef4b96e0a5115161dbc2aa1a897b5.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 13/30] oe/data: Add export2json function
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
X-List-Received-Date: Thu, 08 Dec 2016 16:18:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The export2json function export the variables contained in
the data store to JSON format, the main usage for now will be
to provide test data to QA framework.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/data.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index ee48950..db3bd6d 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -1,3 +1,4 @@
+import json
 import oe.maketype
 
 def typed_value(key, d):
@@ -15,3 +16,30 @@ def typed_value(key, d):
         return oe.maketype.create(d.getVar(key, True) or '', var_type, **flags)
     except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
+
+def export2json(d, json_file, expand=True):
+    data2export = {}
+    keys2export = []
+
+    for key in d.keys():
+        if key.startswith("_"):
+            continue
+        elif key.startswith("BB"):
+            continue
+        elif key.startswith("B_pn"):
+            continue
+        elif key.startswith("do_"):
+            continue
+        elif d.getVarFlag(key, "func", True):
+            continue
+
+        keys2export.append(key)
+
+    for key in keys2export:
+        try:
+            data2export[key] = d.getVar(key, expand)
+        except bb.data_smart.ExpansionError:
+            data2export[key] = ''
+
+    with open(json_file, "w") as f:
+        json.dump(data2export, f, skipkeys=True, indent=4, sort_keys=True)
-- 
2.1.4


