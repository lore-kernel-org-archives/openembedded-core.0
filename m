Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC826AC6C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 07:16:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s767GGoX005124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Aug 2014 00:16:16 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 6 Aug 2014 00:16:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 6 Aug 2014 15:16:00 +0800
Message-ID: <89a5cb62a6e089d49fec0a4c279fba5ba27560d1.1407306581.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407306581.git.hongxu.jia@windriver.com>
References: <cover.1407306581.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/3] bbclass/sstate_readonly_2 approach 2: add event handler at TaskStarted time
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

Add event handler at TaskStarted time to handle the sstate-cache
read-only cheking. If read-only sstate-cache enable, and the building recipe
not in the ${SSTATECACHE_WHITELIST}, it trigered an instant error.

Flaws:
1. For every task, there is a read-only sstate-cache checking, it increased
   the build loads.

2. The instant error breaks the building randomly while there are multible
   recipes not in the ${SSTATECACHE_WHITELIST}, and also could not list all
   the missing recipes which sould be added to ${SSTATECACHE_WHITELIST}.

...
$ bitbake db
ERROR:
Read-only sstate-cache is enabled, the build of ncurses-native
did not come from sstate-cache. Only the recipe listed in
SSTATECACHE_WHITELIST is allowed to build from source
ERROR: Execution of event handler 'sstate_readonly_eventhandler' failed
ERROR: Task 350 (virtual:native:poky/meta/recipes-core/ncurses/ncurses_5.9.bb, do_fetch) failed with exit code '1'
ERROR:
Read-only sstate-cache is enabled, the build of gcc-cross-initial-i586
did not come from sstate-cache. Only the recipe listed in
SSTATECACHE_WHITELIST is allowed to build from source
ERROR: Execution of event handler 'sstate_readonly_eventhandler' failed
ERROR: Task 290 (poky/meta/recipes-devtools/gcc/gcc-cross-initial_4.9.bb, do_fetch) failed with exit code '1'
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/sstate_readonly_2.bbclass | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/classes/sstate_readonly_2.bbclass

diff --git a/meta/classes/sstate_readonly_2.bbclass b/meta/classes/sstate_readonly_2.bbclass
new file mode 100644
index 0000000..871b56f
--- /dev/null
+++ b/meta/classes/sstate_readonly_2.bbclass
@@ -0,0 +1,25 @@
+# 1) If ${SSTATECACHE_WHITELIST} is "", it means read-only sstate-cache
+#    disabled;
+#
+# 2) If read-only sstate-cache enabled and the recipe's ${PN} not listed
+#    in ${SSTATECACHE_WHITELIST}, the build from source will triger an
+#    instant error;
+SSTATECACHE_WHITELIST ?= ""
+
+addhandler sstate_readonly_eventhandler
+sstate_readonly_eventhandler[eventmask] = "bb.build.TaskStarted"
+python sstate_readonly_eventhandler() {
+    d = e.data
+    whitelist = d.getVar('SSTATECACHE_WHITELIST', True) or ""
+    if whitelist != "":
+        taskname = d.getVar('BB_CURRENTTASK', True)
+        if not taskname.startswith('do_'):
+            taskname = 'do_%s' % taskname
+        if not taskname.endswith("_setscene") and taskname != "do_setscene":
+            pn = d.getVar('PN', True)
+            if pn not in whitelist.split():
+                msg =  '\nRead-only sstate-cache is enabled, the build of %s\n' % pn
+                msg += 'did not come from sstate-cache. Only the recipe listed in\n'
+                msg += 'SSTATECACHE_WHITELIST is allowed to build from source'
+                bb.msg.fatal('sstate', msg)
+}
-- 
1.9.1


