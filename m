Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6947C326
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2019 21:08:37 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 697C25C0224;
	Sat,  5 Oct 2019 23:08:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570309717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=a5fq91TfD/frd12y2unrAJ/UDotcBLdPF7S1Ssi9tEY=;
	b=ESPiIdFcIpiWrN8A6cFslGLT2u0vR/9M1DX8cZ5sTLBkZnWuxJzfs6ZsXvTuzluRlb7IKl
	AukcmCPFFa4+UDOFER/eCWaItDlsQnB7VxbCIvvnEj+6TZQIsyxwpVTlbC4/jeKgdE8Ni0
	uSFb4c+6quSEou0ctBB4E/c60gPwvc0=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2019 23:08:34 +0200
Message-Id: <20191005210834.28170-1-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] zram: properly implement systemd service
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
X-List-Received-Date: Sat, 05 Oct 2019 21:08:37 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

The systemd service points ot a script which is not installed by
zram or any of its dependencies. It seems that the service got
migrated without the necessary script.

The sysvinit script seems rather dated and initializes multiple
zram instances to support multiprocessor systems. This is no
longer necessary with modern implementations as newer kernel
version support multiple streams by default.

Create a modern implementation based on Fedoras zram package.
Make use of systemd swap unit files instead of enabling swap
directly.

This removes the need for util-linux-swaponoff (since swap is
now handled by systemd, which presumably depends on swaponoff).
However, it adds the dependency to util-linux for zramctl.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../recipes-extended/zram/zram/dev-zram0.swap | 10 ++++
 .../zram/zram/zram-swap-deinit                | 19 +++++++
 .../recipes-extended/zram/zram/zram-swap-init | 26 ++++++++++
 .../zram/zram/zram-swap.service               | 10 ++++
 .../recipes-extended/zram/zram/zram.service   | 12 -----
 meta-oe/recipes-extended/zram/zram/zramstop   |  5 ++
 meta-oe/recipes-extended/zram/zram_0.1.bb     | 33 -------------
 meta-oe/recipes-extended/zram/zram_0.2.bb     | 49 +++++++++++++++++++
 8 files changed, 119 insertions(+), 45 deletions(-)
 create mode 100644 meta-oe/recipes-extended/zram/zram/dev-zram0.swap
 create mode 100755 meta-oe/recipes-extended/zram/zram/zram-swap-deinit
 create mode 100755 meta-oe/recipes-extended/zram/zram/zram-swap-init
 create mode 100644 meta-oe/recipes-extended/zram/zram/zram-swap.service
 delete mode 100644 meta-oe/recipes-extended/zram/zram/zram.service
 create mode 100644 meta-oe/recipes-extended/zram/zram/zramstop
 delete mode 100644 meta-oe/recipes-extended/zram/zram_0.1.bb
 create mode 100644 meta-oe/recipes-extended/zram/zram_0.2.bb

diff --git a/meta-oe/recipes-extended/zram/zram/dev-zram0.swap b/meta-oe/recipes-extended/zram/zram/dev-zram0.swap
new file mode 100644
index 000000000..05eae7eed
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram/dev-zram0.swap
@@ -0,0 +1,10 @@
+[Unit]
+Description=Enable compressed swap in memory using zram
+Requires=zram-swap.service
+After=zram-swap.service
+
+[Swap]
+What=/dev/zram0
+
+[Install]
+WantedBy=swap.target
diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-deinit b/meta-oe/recipes-extended/zram/zram/zram-swap-deinit
new file mode 100755
index 000000000..46248c401
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap-deinit
@@ -0,0 +1,19 @@
+#!/bin/sh
+set -e
+
+device=$1
+if [ "$device" = "" ]; then
+    echo "Usage: zram-swap-deinit <device>"
+    exit 1
+fi
+
+sysblockdev=/sys/block/$(basename $device)
+if [ ! -d $sysblockdev ]; then
+    echo "Block device not found in sysfs"
+    exit 1
+fi
+
+# zramctl -r is not suitable as it also removes the actual device. Recreating
+# it is non-trivial, especially if not /dev/zram0 is used...
+echo 1 > ${sysblockdev}/reset
+
diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
new file mode 100755
index 000000000..0643dbca2
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
@@ -0,0 +1,26 @@
+#!/bin/sh
+set -e
+
+device=$1
+if [ "$device" = "" ]; then
+    echo "Usage: zram-swap-init <device>"
+    exit 1
+fi
+
+# Allocate zram to be size of actual system memory
+# Note: zram is only allocated when used. When swapped pages compress with a
+# a 2:1 ratio zram will require 50% of system memory (while allowing to use
+# 150% memory).
+ZRAM_SIZE_PERCENT=100
+ZRAM_ALGORITHM=lz4
+
+[ -f /etc/default/zram ] && ./etc/default/zram || true
+
+memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
+memzram=$(($memtotal*${ZRAM_SIZE_PERCENT}/100))
+
+# Try loading zram module
+modprobe -q zram || true
+
+zramctl -a ${ZRAM_ALGORITHM} -s ${memzram}KB $device
+mkswap -L "zram-swap" $device
diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap.service b/meta-oe/recipes-extended/zram/zram/zram-swap.service
new file mode 100644
index 000000000..7bb9e0a45
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Create compressed swap in memory using zram
+DefaultDependencies=no
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+TimeoutStartSec=30sec
+ExecStart=/usr/libexec/zram-swap-init /dev/zram0
+ExecStop=/usr/libexec/zram-swap-deinit /dev/zram0
diff --git a/meta-oe/recipes-extended/zram/zram/zram.service b/meta-oe/recipes-extended/zram/zram/zram.service
deleted file mode 100644
index 4a19367d9..000000000
--- a/meta-oe/recipes-extended/zram/zram/zram.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Enable zram compressed in-memory swap.
-After=multi-user.target
-
-[Service]
-RemainAfterExit=yes
-ExecStart=/usr/bin/zram-load.sh --load
-ExecStop=/usr/bin/zram-load.sh --unload
-Type=oneshot
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/zram/zram/zramstop b/meta-oe/recipes-extended/zram/zram/zramstop
new file mode 100644
index 000000000..07777978e
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram/zramstop
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+for i in $(grep '^/dev/zram' /proc/swaps | awk '{ print $1 }'); do
+	swapoff "$i" && zramctl --reset "$i"
+done
diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
deleted file mode 100644
index dfd75e71c..000000000
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Linux zram compressed in-memory swap"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-inherit update-rc.d systemd
-
-RDEPENDS_${PN} = "util-linux-swaponoff kmod"
-RRECOMMENDS_${PN} = "kernel-module-zram"
-
-PR = "r3"
-
-SRC_URI = " \
-           file://init \
-           file://zram.service \
-"
-
-do_install () {
-    # Sysvinit
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
-}
-
-FILES_${PN} = "${sysconfdir}"
-INITSCRIPT_NAME = "zram"
-INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "zram.service"
diff --git a/meta-oe/recipes-extended/zram/zram_0.2.bb b/meta-oe/recipes-extended/zram/zram_0.2.bb
new file mode 100644
index 000000000..ca3b3b0c1
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram_0.2.bb
@@ -0,0 +1,49 @@
+SUMMARY = "Linux zram compressed in-memory swap"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+inherit update-rc.d systemd
+
+RDEPENDS_${PN} = "kmod \
+    ${@bb.utils.contains('DISTRO_FEATURES','systemd','util-linux','util-linux-swaponoff',d)}"
+RRECOMMENDS_${PN} = "kernel-module-zram"
+
+PR = "r3"
+
+SRC_URI = " \
+           file://init \
+           file://zram-swap-init \
+           file://zram-swap-deinit \
+           file://zram-swap.service \
+           file://dev-zram0.swap \
+"
+
+do_install () {
+    # Install systemd related configuration file
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${libexecdir}
+        install -m 0755 ${WORKDIR}/zram-swap-init ${D}${libexecdir}
+        install -m 0755 ${WORKDIR}/zram-swap-deinit ${D}${libexecdir}
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/zram-swap.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/dev-zram0.swap ${D}${systemd_unitdir}/system
+    fi
+}
+
+FILES_${PN} = " \
+    ${sysconfdir} \
+    ${systemd_unitdir} \
+    ${libexecdir} \
+"
+INITSCRIPT_NAME = "zram"
+INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "dev-zram0.swap"
-- 
2.20.1


