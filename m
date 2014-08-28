Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8A371165
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 06:16:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7S6GEH4029717
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Aug 2014 23:16:14 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 27 Aug 2014 23:16:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <mark.hatle@windriver.com>
Date: Thu, 28 Aug 2014 14:15:59 +0800
Message-ID: <dcf275752cdb75cd8d82ef7e5e72759eeca68b09.1409206228.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409206228.git.hongxu.jia@windriver.com>
References: <cover.1409206228.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bbclass/sstate_readonly: only allowed sstate-cache objects are allowed in a build (read-only sstate-cache)
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
X-List-Received-Date: Thu, 28 Aug 2014 06:16:17 -0000
Content-Type: text/plain

The requirement is the developer who demand only the "new" software
they write is allowed to be compiled from source, they only want to
reuse binaries from an existed sstate-cache, if the developer makes
a change that triggers a rebuild, it should be an instant error.

The purpose of this is for the sstate-cache to check if the item
exists or not. If it doesn't the item needs to be in a whitelist
or we need to fail.

If read-only sstate-cache enable, and the recipe's ${PN} not in the
${SSTATECACHE_WHITELIST}, it trigered an instant error.

[YOCTO #6639]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sstate_readonly.bbclass | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 meta/classes/sstate_readonly.bbclass

diff --git a/meta/classes/sstate_readonly.bbclass b/meta/classes/sstate_readonly.bbclass
new file mode 100644
index 0000000..9eabf81
--- /dev/null
+++ b/meta/classes/sstate_readonly.bbclass
@@ -0,0 +1,51 @@
+SSTATE_CHECK_FUNCTIONS_append = " sstate_readonly_check"
+
+# 1) If ${SSTATECACHE_WHITELIST} is "", it means read-only sstate-cache
+#    disabled;
+#
+# 2) If read-only sstate-cache enabled and the recipe's ${PN} not listed
+#    in ${SSTATECACHE_WHITELIST}, the build from source will triger an
+#    instant error;
+SSTATECACHE_WHITELIST ?= ""
+
+python sstate_readonly_check(){
+    whitelist = (d.getVar('SSTATECACHE_WHITELIST', True) or '').split()
+    if whitelist:
+        sq_fn = d.getVar('sq_fn', True) or []
+        missed = d.getVar('missed', True) or []
+        missed_pn = []
+        for task in missed:
+            fn = sq_fn[task]
+            data = bb.cache.Cache.loadDataFull(fn, '', d)
+            pn = data.getVar('PN', True)
+            if pn and pn not in missed_pn:
+                missed_pn.append(pn)
+
+        if missed_pn:
+            blacklist = [pn for pn in missed_pn if pn not in whitelist]
+            if blacklist:
+                msg =  'Read-only sstate-cache is enabled, the build of \n'
+                msg += '"' + ' '.join(blacklist) + '"\n'
+                msg += 'did not come from sstate-cache. Only the recipe listed in\n'
+                msg += 'SSTATECACHE_WHITELIST is allowed to build from source'
+                bb.fatal(msg)
+}
+
+def _sstate_readonly_clean_check(d):
+    whitelist = (d.getVar('SSTATECACHE_WHITELIST', True) or '').split()
+    if whitelist:
+        pn = d.getVar('PN', True)
+        if pn not in whitelist:
+            msg =  'Read-only sstate-cache is enabled, the clean of \n'
+            msg += '%s is not allowed. Only the recipe listed in\n' % pn
+            msg += 'SSTATECACHE_WHITELIST is allowed to clean sstate-cache'
+            bb.fatal(msg)
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


