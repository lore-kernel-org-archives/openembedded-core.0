Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TDg7l-0007Rx-EA
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 20:32:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Sep 2012 11:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,437,1344236400"; d="scan'208";a="193745787"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.193])
	by azsmga001.ch.intel.com with ESMTP; 17 Sep 2012 11:19:59 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 11:19:59 -0700
Message-Id: <1347905999-7117-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] nfs-utils: add x32 patch to fix nfsctl issue
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
X-List-Received-Date: Mon, 17 Sep 2012 18:32:49 -0000

nfsservctl syscall does not exist for x32, so return an error.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../nfs-utils/nfs-utils-nfsctl-x32-fix.patch       |   30 ++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
new file mode 100644
index 0000000..26b4631
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-nfsctl-x32-fix.patch
@@ -0,0 +1,30 @@
+
+Upstream-Status: Pending
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+
+--- nfs-utils-1.2.3/support/nfs/nfsctl.c.x32	2010-09-28 05:24:16.000000000 -0700
++++ nfs-utils-1.2.3/support/nfs/nfsctl.c	2011-11-30 13:34:09.369917161 -0800
+@@ -12,15 +12,22 @@
+ 
+ #include <unistd.h>
+ #include <asm/unistd.h>
++#include <errno.h>
+ #include "nfslib.h"
+ 
+ /* compatibility hack... */
+ #ifndef __NR_nfsctl
++#ifdef __NR_nfsservctl
+ #define __NR_nfsctl	__NR_nfsservctl
+ #endif
++#endif
+ 
+ int
+ nfsctl (int cmd, struct nfsctl_arg * argp, union nfsctl_res * resp)
+ {
++#ifdef __NR_nfsctl
+   return syscall (__NR_nfsctl, cmd, argp, resp);
++#else
++  return -ENOSYS;
++#endif
+ }
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index eb18aaa..5a4a7e7 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -12,11 +12,12 @@ DEPENDS = "libcap libnfsidmap libevent util-linux tcp-wrappers"
 RDEPENDS_${PN} = "portmap"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
            file://nfs-utils-1.0.6-uclibc.patch \
            file://nfs-utils-1.2.3-uclibc-libio.h.patch \
+           file://nfs-utils-nfsctl-x32-fix.patch \
            file://nfsserver"
 
 SRC_URI[md5sum] = "1131dc5f27c4f3905a6e7ee0d594fd4d"
-- 
1.7.7.6



