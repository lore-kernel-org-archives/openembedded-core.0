Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48D1B7CE73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:21:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2L3LK4e018661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 20:21:20 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:21:17 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 23:19:13 -0400
Message-ID: <1553138356-85237-6-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] initramfs-framework: add lvm module
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
X-List-Received-Date: Thu, 21 Mar 2019 03:21:19 -0000
Content-Type: text/plain

lvm module will initial lvm volume to support boot from
Logical Volume.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/lvm    | 13 +++++++++++++
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb |  9 +++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/lvm

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/lvm b/meta/recipes-core/initrdscripts/initramfs-framework/lvm
new file mode 100644
index 000000000000..7deeccb9a29e
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/lvm
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+lvm_enabled() {
+	if ! lvscan |grep -i -w "inactive" &>/dev/null;then
+		return 1
+	fi
+	return 0
+}
+
+lvm_run() {
+	lvm pvscan --cache --activate ay
+	udevadm trigger --action=add
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 660343eafa23..c53a0c03ae6c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "file://init \
            file://udev \
            file://e2fs \
            file://debug \
+           file://lvm \
           "
 
 S = "${WORKDIR}"
@@ -45,6 +46,9 @@ do_install() {
     # debug
     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
 
+    # lvm
+    install -m 0755 ${WORKDIR}/lvm ${D}/init.d/09-lvm
+
     # Create device nodes expected by some kernels in initramfs
     # before even executing /init.
     install -d ${D}/dev
@@ -59,6 +63,7 @@ PACKAGES = "${PN}-base \
             initramfs-module-nfsrootfs \
             initramfs-module-rootfs \
             initramfs-module-debug \
+            initramfs-module-lvm \
            "
 
 FILES_${PN}-base = "/init /init.d/99-finish /dev"
@@ -98,3 +103,7 @@ FILES_initramfs-module-rootfs = "/init.d/90-rootfs"
 SUMMARY_initramfs-module-debug = "initramfs dynamic debug support"
 RDEPENDS_initramfs-module-debug = "${PN}-base"
 FILES_initramfs-module-debug = "/init.d/00-debug"
+
+SUMMARY_initramfs-module-lvm = "initramfs lvm rootfs support"
+RDEPENDS_initramfs-module-lvm = "${PN}-base"
+FILES_initramfs-module-lvm = "/init.d/09-lvm"
-- 
2.7.4


