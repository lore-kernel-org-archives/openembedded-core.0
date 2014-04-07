Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8593B6F5BB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 02:29:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3N002XY2X42450@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 06 Apr 2014 21:29:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2841B20265; Sun,
	06 Apr 2014 22:29:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 06 Apr 2014 22:29:14 -0400
Message-id: <1396837755-4659-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
In-reply-to: <1396837755-4659-1-git-send-email-denis@denix.org>
References: <1396837755-4659-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/4] cryptodev-module: recipe for out-of-tree cryptodev device driver
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
X-List-Received-Date: Mon, 07 Apr 2014 02:29:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Depends on cryptodev-linux for providing a header file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../cryptodev/cryptodev-module_1.6.bb              | 15 ++++++++++++
 ...talling-header-file-provided-by-another-p.patch | 28 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
new file mode 100644
index 0000000..fdf07b2
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.6.bb
@@ -0,0 +1,15 @@
+require cryptodev_${PV}.inc
+
+SUMMARY = "A /dev/crypto device driver kernel module"
+
+inherit module
+
+# Header file provided by a separate package
+DEPENDS += "cryptodev-linux"
+
+SRC_URI += "file://0001-Disable-installing-header-file-provided-by-another-p.patch"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
+
+RCONFLICTS_${PN} = "ocf-linux"
+RREPLACES_${PN} = "ocf-linux"
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
new file mode 100644
index 0000000..a580fc6
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
@@ -0,0 +1,28 @@
+From 8a884f55bd1527baa82fab68c186ba546273860c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 6 Apr 2014 19:51:39 -0400
+Subject: [PATCH] Disable installing header file provided by another package
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+
+Upstream-Status: Inappropriate [ OE specific ]
+---
+ Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d66ef26..8e97c6a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -23,8 +23,6 @@ install: modules_install
+ 
+ modules_install:
+ 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
+-	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
+-	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
+ 
+ clean:
+ 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
+-- 
+1.9.1
+
-- 
1.9.1


