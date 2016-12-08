Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4493F71BF9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:18:52 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 08 Dec 2016 08:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496463"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:18:53 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:33 -0600
Message-Id: <6a96f7f7c5c4d1aacf93d3c78869f4dfd1462bb1.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 05/30] oeqa/core/decorator: Add support for OETestID and OETestTag
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
X-List-Received-Date: Thu, 08 Dec 2016 16:18:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These two decorators stores certain TAG or ID for the test case
also provides support for filtering in loading step.

[YOCTO #10236]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/decorator/oeid.py  | 23 +++++++++++++++++++++++
 meta/lib/oeqa/core/decorator/oetag.py | 24 ++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/lib/oeqa/core/decorator/oeid.py
 create mode 100644 meta/lib/oeqa/core/decorator/oetag.py

diff --git a/meta/lib/oeqa/core/decorator/oeid.py b/meta/lib/oeqa/core/decorator/oeid.py
new file mode 100644
index 0000000..ea8017a
--- /dev/null
+++ b/meta/lib/oeqa/core/decorator/oeid.py
@@ -0,0 +1,23 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from . import OETestFilter, registerDecorator
+from oeqa.core.utils.misc import intToList
+
+def _idFilter(oeid, filters):
+     return False if oeid in filters else True
+
+@registerDecorator
+class OETestID(OETestFilter):
+    attrs = ('oeid',)
+
+    def bind(self, registry, case):
+        super(OETestID, self).bind(registry, case)
+
+    def filtrate(self, filters):
+        if filters.get('oeid'):
+            filterx = intToList(filters['oeid'], 'oeid')
+            del filters['oeid']
+            if _idFilter(self.oeid, filterx):
+                return True
+        return False
diff --git a/meta/lib/oeqa/core/decorator/oetag.py b/meta/lib/oeqa/core/decorator/oetag.py
new file mode 100644
index 0000000..ad38ab7
--- /dev/null
+++ b/meta/lib/oeqa/core/decorator/oetag.py
@@ -0,0 +1,24 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from . import OETestFilter, registerDecorator
+from oeqa.core.utils.misc import strToList
+
+def _tagFilter(tags, filters):
+    return False if set(tags) & set(filters) else True
+
+@registerDecorator
+class OETestTag(OETestFilter):
+    attrs = ('oetag',)
+
+    def bind(self, registry, case):
+        super(OETestTag, self).bind(registry, case)
+        self.oetag = strToList(self.oetag, 'oetag')
+
+    def filtrate(self, filters):
+        if filters.get('oetag'):
+            filterx = strToList(filters['oetag'], 'oetag')
+            del filters['oetag']
+            if _tagFilter(self.oetag, filterx):
+                return True
+        return False
-- 
2.1.4


