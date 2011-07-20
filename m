Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDB-0001Zu-77
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:32:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753256"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:27:56 -0700
Message-Id: <dd9afcd775337fc098ab52e792f6de03cdd53d74.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 09/50] udev: Change hard coded /usr/lib to support multilib
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
X-List-Received-Date: Wed, 20 Jul 2011 08:32:58 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/udev/udev-164/makefile.patch |   16 ++++++++++++++++
 meta/recipes-core/udev/udev-new.inc            |    1 +
 meta/recipes-core/udev/udev_164.bb             |    2 +-
 3 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev-164/makefile.patch

diff --git a/meta/recipes-core/udev/udev-164/makefile.patch b/meta/recipes-core/udev/udev-164/makefile.patch
new file mode 100644
index 0000000..c46ff4b
--- /dev/null
+++ b/meta/recipes-core/udev/udev-164/makefile.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Inappropriate [configuration]
+
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
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 567e62e..518d37a 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
-- 
1.7.3.4



