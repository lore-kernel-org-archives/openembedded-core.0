Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qih0g-0002RM-Qq
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 08:08:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2011 23:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,221,1309762800"; d="scan'208";a="28794757"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2011 23:04:50 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 14:01:47 +0800
Message-Id: <565584242caa748562f26f3ebef8e565b502d3b2.1310968787.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1310968787.git.dongxiao.xu@intel.com>
References: <cover.1310968787.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1310968787.git.dongxiao.xu@intel.com>
References: <cover.1310968787.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/4] udev: Change hard coded /usr/lib to support multilib
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
X-List-Received-Date: Mon, 18 Jul 2011 06:08:55 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/udev/udev-164/makefile.patch |   14 ++++++++++++++
 meta/recipes-core/udev/udev-new.inc            |    1 +
 meta/recipes-core/udev/udev_145.bb             |    2 +-
 3 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev-164/makefile.patch

diff --git a/meta/recipes-core/udev/udev-164/makefile.patch b/meta/recipes-core/udev/udev-164/makefile.patch
new file mode 100644
index 0000000..1fb0307
--- /dev/null
+++ b/meta/recipes-core/udev/udev-164/makefile.patch
@@ -0,0 +1,14 @@
+diff -ruN udev-164-orig/Makefile.am udev-164/Makefile.am
+--- udev-164-orig/Makefile.am	2011-07-11 16:10:26.000000000 +0800
++++ udev-164/Makefile.am	2011-07-11 16:11:14.000000000 +0800
+@@ -468,8 +468,8 @@
+ libexec_PROGRAMS += extras/udev-acl/udev-acl
+ 
+ udevacl-install-hook:
+-	mkdir -p $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d
+-	ln -sf $(libexecdir)/udev-acl $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck
++	mkdir -p $(DESTDIR)$(libdir)/ConsoleKit/run-seat.d
++	ln -sf $(libexecdir)/udev-acl $(DESTDIR)$(libdir)/ConsoleKit/run-seat.d/udev-acl.ck
+ 
+ INSTALL_EXEC_HOOKS += udevacl-install-hook
+ 
diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 4c4451f..b482a5a 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -16,6 +16,7 @@ RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
 RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
+           file://makefile.patch \
            file://run.rules \
            file://udev.rules \
            file://devfs-udev.rules \
diff --git a/meta/recipes-core/udev/udev_145.bb b/meta/recipes-core/udev/udev_145.bb
index becef04..e13e0a5 100644
--- a/meta/recipes-core/udev/udev_145.bb
+++ b/meta/recipes-core/udev/udev_145.bb
@@ -1,6 +1,6 @@
 RPROVIDES_${PN} = "hotplug"
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://enable-gudev.patch;patch=1 \
-- 
1.7.1



