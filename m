Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D58D26C518
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 09:56:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB39uG7b026210
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Dec 2018 01:56:27 -0800
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Dec 2018 01:56:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 3 Dec 2018 18:13:29 +0800
Message-ID: <1543832010-8787-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543832010-8787-1-git-send-email-hongxu.jia@windriver.com>
References: <1543832010-8787-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] initramfs-module-setup-live: add umountfs
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
X-List-Received-Date: Mon, 03 Dec 2018 09:56:52 -0000
Content-Type: text/plain

In init-live.sh, due to udev, mount points (/run\/media/**) are available,
except realroot, other mount points are moved to the corresponding directories
under the real root filesystem.

For initramfs-module-setup-live, rather than move them to real root,
just umount these mount points. After switch_root, let udev/fstab in
rootfs to process the partition. It aligns the principle that `Initrd
is used to mount the root file system at boot time'[1]
[1] https://en.wikipedia.org/wiki/Initial_ramdisk

Umount dev rather mount point to avoid `spaces in the mount points to
actual ASCII char'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/umountfs   | 10 ++++++++++
 .../initrdscripts/initramfs-module-setup-live_1.0.bb           |  3 +++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/umountfs

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/umountfs b/meta/recipes-core/initrdscripts/initramfs-framework/umountfs
new file mode 100644
index 0000000..9d41538
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/umountfs
@@ -0,0 +1,10 @@
+umountfs_enabled() {
+    return 0
+}
+
+umountfs_run() {
+    # Umount available mount points
+    for dev in `awk '/\/dev.* \/run\/media/{print $1}' /proc/mounts`; do
+        umount $dev
+    done
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index c0ebd40..c8986cb 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -11,6 +11,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/initramfs-framework:"
 SRC_URI = "file://setup-live \
            file://union-fs \
            file://realroot \
+           file://umountfs \
 "
 
 S = "${WORKDIR}"
@@ -20,9 +21,11 @@ do_install() {
     install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
     install -m 0755 ${WORKDIR}/union-fs ${D}/init.d/91-union-fs
     install -m 0755 ${WORKDIR}/realroot ${D}/init.d/92-realroot
+    install -m 0755 ${WORKDIR}/umountfs ${D}/init.d/93-umountfs
 }
 
 FILES_${PN} = "/init.d/80-setup-live \
                /init.d/91-union-fs \
                /init.d/92-realroot \
+               /init.d/93-umountfs \
               "
-- 
2.7.4


