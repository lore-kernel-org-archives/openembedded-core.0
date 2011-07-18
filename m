Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QihBZ-0002fH-E6
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 08:20:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jul 2011 23:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,221,1309762800"; d="scan'208";a="28317537"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 17 Jul 2011 23:16:02 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 14:13:03 +0800
Message-Id: <f95b2b1a8c6f212e7be5f0f60af7027feb843aa9.1310969462.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310969462.git.dongxiao.xu@intel.com>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1310969462.git.dongxiao.xu@intel.com>
References: <cover.1310969462.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/4] pciutils: Change the hardcoded /usr/lib to support multilib.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2011 06:20:09 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../pciutils/pciutils-3.1.7/makefile.patch         |   14 ++++++++++++++
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    5 +++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch

diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch
new file mode 100644
index 0000000..811aac8
--- /dev/null
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate [configuration]
+
+diff -ruN pciutils-3.1.7-orig/Makefile pciutils-3.1.7/Makefile
+--- pciutils-3.1.7-orig/Makefile	2011-07-11 14:41:59.000000000 +0800
++++ pciutils-3.1.7/Makefile	2011-07-11 14:42:31.000000000 +0800
+@@ -31,7 +31,7 @@
+ IDSDIR=$(SHAREDIR)
+ MANDIR:=$(shell if [ -d $(PREFIX)/share/man ] ; then echo $(PREFIX)/share/man ; else echo $(PREFIX)/man ; fi)
+ INCDIR=$(PREFIX)/include
+-LIBDIR=$(PREFIX)/lib
++LIBDIR=$(libdir)
+ PKGCFDIR=$(LIBDIR)/pkgconfig
+ 
+ # Commands
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
index 4e6d4e1..b48aaf0 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
@@ -9,13 +9,14 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib"
 RDEPENDS_${PN} = "${PN}-ids"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://configure.patch \
            file://pcimodules-pciutils.diff \
            file://lib-build-fix.patch \
-           file://guess-fix.patch"
+           file://guess-fix.patch \
+           file://makefile.patch"
 
 SRC_URI[md5sum] = "35222edb86b50a6641352c66fe829b2e"
 SRC_URI[sha256sum] = "d8fe23b6966c1abf29b3b38b08b0cf33f731cd6e6a89d9b8d2b8d5e982c3f544"
-- 
1.7.1



