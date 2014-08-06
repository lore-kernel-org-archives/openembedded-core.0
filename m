Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2241C7035D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 07:16:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s767GEJq002113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Aug 2014 00:16:14 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 6 Aug 2014 00:16:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 6 Aug 2014 15:15:59 +0800
Message-ID: <471e56bb0b289649f777b33eeb0a80ffe9c9512c.1407306581.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407306581.git.hongxu.jia@windriver.com>
References: <cover.1407306581.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/3] bbclass/sstate_readonly approach 1: add prefuncs to SSTATETASKS
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
X-List-Received-Date: Wed, 06 Aug 2014 07:16:20 -0000
Content-Type: text/plain

Add prefuncs to SSTATETASKS to handle the sstate-cache read-only cheking.
If read-only sstate-cache enable, and the building recipe not in the
${SSTATECACHE_WHITELIST}, it trigered an instant error.

Flaws:
1. For each SSTATETASKS task, there is a read-only sstate-cache checking,
   it increased the build loads.

2. The instant error breaks the building randomly while there are multible
   recipes not in the ${SSTATECACHE_WHITELIST}, and also could not list all
   the missing recipes which sould be added to ${SSTATECACHE_WHITELIST}.

3. The checking time is postponed to SSTATETASKS, take db-native for example:
   if you tweak db-native's do_configure, the checking will occur at
   do_populate_sysroot time. The tasks 'do_compile', 'do_install' has
   been invoked.

...
$ bitbake db
ERROR: Read-only sstate-cache is enabled, the build of gettext-minimal-native
did not come from sstate-cache. Only the recipe listed in
SSTATECACHE_WHITELIST is allowed to build from source
ERROR: Function failed: sstate_readonly_check
ERROR: Logfile of failure stored in: tmp/work/x86_64-linux/gettext-minimal-native/0.18.3.2-r0/temp/log.do_populate_sysroot.23801
ERROR: Task 155 (poky/meta/recipes-core/gettext/gettext-minimal-native_0.18.3.2.bb, do_populate_sysroot) failed with exit code '1'
NOTE: Tasks Summary: Attempted 84 tasks of which 49 didn't need to be rerun and 1 failed.
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sstate_readonly.bbclass | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta/classes/sstate_readonly.bbclass

diff --git a/meta/classes/sstate_readonly.bbclass b/meta/classes/sstate_readonly.bbclass
new file mode 100644
index 0000000..88b1c39
--- /dev/null
+++ b/meta/classes/sstate_readonly.bbclass
@@ -0,0 +1,38 @@
+# 1) If ${SSTATECACHE_WHITELIST} is "", it means read-only sstate-cache
+#    disabled;
+#
+# 2) If read-only sstate-cache enabled and the recipe's ${PN} not listed
+#    in ${SSTATECACHE_WHITELIST}, the build from source will triger an
+#    instant error;
+SSTATECACHE_WHITELIST ?= ""
+
+python () {
+    unique_tasks = set((d.getVar('SSTATETASKS', True) or "").split())
+    d.setVar('SSTATETASKS', " ".join(unique_tasks))
+    for task in unique_tasks:
+        d.prependVarFlag(task, 'prefuncs', "sstate_readonly_check")
+}
+
+_sstate_readonly_check[vardepsexclude] += "SSTATECACHE_WHITELIST"
+def _sstate_readonly_check(d):
+    whitelist = d.getVar('SSTATECACHE_WHITELIST', True) or ""
+    if whitelist != "":
+        pn = d.getVar('PN', True)
+        if pn not in whitelist.split():
+            msg =  'Read-only sstate-cache is enabled, the build of %s\n' % pn
+            msg += 'did not come from sstate-cache. Only the recipe listed in\n'
+            msg += 'SSTATECACHE_WHITELIST is allowed to build from source'
+            bb.fatal(msg)
+
+python sstate_readonly_check(){
+    _sstate_readonly_check(d)
+}
+
+python do_cleansstate_prepend() {
+        _sstate_readonly_check(d)
+}
+
+python do_cleanall_prepend() {
+    _sstate_readonly_check(d)
+}
+
-- 
1.9.1


