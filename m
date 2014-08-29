Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8C87122C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 06:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7T6hrSc027693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:43:54 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 28 Aug 2014 23:43:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Fri, 29 Aug 2014 14:43:39 +0800
Message-ID: <920b639352b4fc8467253369d3074d95224f7904.1409294050.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409294050.git.hongxu.jia@windriver.com>
References: <cover.1409294050.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bbclass/sstate_readonly: only allowed sstate-cache objects to be built (read-only sstate-cache)
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
X-List-Received-Date: Fri, 29 Aug 2014 06:43:52 -0000
Content-Type: text/plain

The requirement is the developer who demand only the "new" software
they write is allowed to be compiled from source, they only want to
reuse binaries from an existed sstate-cache, if the developer makes
a change that triggers a rebuild, it should be an instant error.

When the readonly sstate-cache is enabled, an error will be generated
if a recipe is not available within the sstate-cache. Adding recipes
to the whitelist will allow only select recipes to be allowed to build
from source.

[YOCTO #6639]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sstate_readonly.bbclass | 53 ++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta/classes/sstate_readonly.bbclass

diff --git a/meta/classes/sstate_readonly.bbclass b/meta/classes/sstate_readonly.bbclass
new file mode 100644
index 0000000..488353d
--- /dev/null
+++ b/meta/classes/sstate_readonly.bbclass
@@ -0,0 +1,53 @@
+SSTATE_CHECK_FUNCTIONS_append = " sstate_readonly_check"
+# 1) The read-only sstate-cache will always be enabled if this bbclass
+#    inherited
+#
+# 2) If ${SSTATECACHE_WHITELIST} is "", it means always blacklist
+#    everything
+#
+# 3) Adding recipes to ${SSTATECACHE_WHITELIST} will allow only select
+#    recipes to be allowed to build
+#
+# 4) While recipes not in ${SSTATECACHE_WHITELIST}, an error will be
+#    generated if a recipe is not available within sstate-cache.
+SSTATECACHE_WHITELIST ?= ""
+
+python sstate_readonly_check(){
+    whitelist = (d.getVar('SSTATECACHE_WHITELIST', True) or '').split()
+    sq_fn = d.getVar('sq_fn', True) or []
+    missed = d.getVar('missed', True) or []
+    missed_pn = []
+    for task in missed:
+        fn = sq_fn[task]
+        data = bb.cache.Cache.loadDataFull(fn, '', d)
+        pn = data.getVar('PN', True)
+        if pn and pn not in missed_pn:
+            missed_pn.append(pn)
+
+    if missed_pn:
+        blacklist = [pn for pn in missed_pn if pn not in whitelist]
+        if blacklist:
+            msg =  'Read-only sstate-cache is enabled, the build of \n'
+            msg += '"' + ' '.join(blacklist) + '"\n'
+            msg += 'did not come from sstate-cache. Only the recipe listed in\n'
+            msg += 'SSTATECACHE_WHITELIST is allowed to build from source'
+            bb.fatal(msg)
+}
+
+def _sstate_readonly_clean_check(d):
+    whitelist = (d.getVar('SSTATECACHE_WHITELIST', True) or '').split()
+    pn = d.getVar('PN', True)
+    if pn not in whitelist:
+        msg =  'Read-only sstate-cache is enabled, the clean of \n'
+        msg += '%s is not allowed. Only the recipe listed in\n' % pn
+        msg += 'SSTATECACHE_WHITELIST is allowed to clean sstate-cache'
+        bb.fatal(msg)
+
+python do_cleansstate_prepend() {
+        _sstate_readonly_clean_check(d)
+}
+
+python do_cleanall_prepend() {
+    _sstate_readonly_clean_check(d)
+}
+
-- 
1.9.1


