Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAvgN-0003dr-6X
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 06:05:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Feb 2013 20:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,753,1355126400"; d="scan'208";a="262444293"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.143])
	by azsmga001.ch.intel.com with ESMTP; 27 Feb 2013 20:48:45 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 20:48:43 -0800
Message-Id: <1362026924-10574-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1362026924-10574-1-git-send-email-sgw@linux.intel.com>
References: <1362026924-10574-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/2] connman: add header to define in6_addr
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 05:05:41 -0000

Needed because the 3.8 if_bridge.h uses in6_addr before it's defined

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../connman/connman/add-in.h-for-ipv6.patch           | 19 +++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.10.bb     |  3 ++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch

diff --git a/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch b/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch
new file mode 100644
index 0000000..e0f1d47
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch
@@ -0,0 +1,19 @@
+
+The 3.8 Kernel headers for if_bridge.h uses the in6_addr struct
+which is defined by netinet/in.h which is not included prior.
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.inte.com>
+Index: git/src/tethering.c
+===================================================================
+--- git.orig/src/tethering.c
++++ git/src/tethering.c
+@@ -35,6 +35,7 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <linux/if_tun.h>
++#include <netinet/in.h>
+ #include <linux/if_bridge.h>
+ 
+ #include "connman.h"
diff --git a/meta/recipes-connectivity/connman/connman_1.10.bb b/meta/recipes-connectivity/connman/connman_1.10.bb
index 10d5255..7dca1b4 100644
--- a/meta/recipes-connectivity/connman/connman_1.10.bb
+++ b/meta/recipes-connectivity/connman/connman_1.10.bb
@@ -7,7 +7,8 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
-            file://inet-fix-ip-cleanup-functions.patch"
+            file://inet-fix-ip-cleanup-functions.patch \
+            file://add-in.h-for-ipv6.patch"
 S = "${WORKDIR}/git"
 PR = "${INC_PR}.0"
 
-- 
1.8.0.2



