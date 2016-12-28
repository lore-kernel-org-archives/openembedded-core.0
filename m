Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5661F71A75
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 14:45:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 28 Dec 2016 06:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,422,1477983600"; d="scan'208";a="23724334"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 28 Dec 2016 06:45:50 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id EA1166A4006;
	Wed, 28 Dec 2016 06:44:58 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2016 16:45:45 +0200
Message-Id: <182900f26a2e61e3a9aa06bd05632509b0e98aa8.1482936066.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482936066.git.jussi.kukkonen@intel.com>
References: <cover.1482936066.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] ppp: Add patch to fix build with musl and 4.9 headers
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
X-List-Received-Date: Wed, 28 Dec 2016 14:45:49 -0000

Removing unused includes fixes the build.

Fixes [YOCTO #10853].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../ppp/ppp/0001-ppp-Remove-unneeded-include.patch | 43 ++++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch
new file mode 100644
index 0000000..a32f89f
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-ppp-Remove-unneeded-include.patch
@@ -0,0 +1,43 @@
+commit cd90fd147844a0cfec101f1e2db7a3c59d236621
+Author: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date:   Wed Dec 28 14:11:22 2016 +0200
+
+pppol2tp plugin: Remove unneeded include
+
+The include is not required and will break compile on musl libc with
+    
+| In file included from pppol2tp.c:34:0:
+| /usr/include/linux/if.h:97:2: error: expected identifier before numeric constant
+|   IFF_LOWER_UP   = 1<<16, /* __volatile__ */
+
+Patch originally from Khem Raj.
+
+Upstream-Status: Pending [https://github.com/paulusmack/ppp/issues/73]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+diff --git a/pppd/plugins/pppol2tp/openl2tp.c b/pppd/plugins/pppol2tp/openl2tp.c
+index 9643b96..458316b 100644
+--- a/pppd/plugins/pppol2tp/openl2tp.c
++++ b/pppd/plugins/pppol2tp/openl2tp.c
+@@ -47,7 +47,6 @@
+ #include <linux/if_ether.h>
+ #include <linux/ppp_defs.h>
+ #include <linux/if_ppp.h>
+-#include <linux/if_pppox.h>
+ #include <linux/if_pppol2tp.h>
+ 
+ #include "l2tp_event.h"
+diff --git a/pppd/plugins/pppol2tp/pppol2tp.c b/pppd/plugins/pppol2tp/pppol2tp.c
+index 0e28606..4f6d98c 100644
+--- a/pppd/plugins/pppol2tp/pppol2tp.c
++++ b/pppd/plugins/pppol2tp/pppol2tp.c
+@@ -46,7 +46,6 @@
+ #include <linux/if_ether.h>
+ #include <linux/ppp_defs.h>
+ #include <linux/if_ppp.h>
+-#include <linux/if_pppox.h>
+ #include <linux/if_pppol2tp.h>
+ 
+ /* should be added to system's socket.h... */
+---
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 56dbd98..86ada69 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://ppp@.service \
            file://fix-CVE-2015-3310.patch \
            file://ppp-fix-building-with-linux-4.8.patch \
+           file://0001-ppp-Remove-unneeded-include.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.1.4


