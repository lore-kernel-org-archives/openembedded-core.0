Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8555E6C1B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 09:56:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wB39u3gw026915
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Dec 2018 01:56:03 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Dec 2018 01:56:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 3 Dec 2018 18:13:27 +0800
Message-ID: <1543832010-8787-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/4] initramfs-module-setup-live: support union fs
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
X-List-Received-Date: Mon, 03 Dec 2018 09:56:03 -0000
Content-Type: text/plain

Since commit [882ae0dc core-image-minimal-initramfs: use initramfs-framework
for initialization] applied. The setup-live module of initramfs-framework is
introduced to integrate the functionality of init-live.sh, but it missed to
setup union filesystem which caused the rootfs is not writable.

Refer init-live.sh, add scriptlet named `union-fs' after scriptlet `rootfs'

Here are test steps:
$ echo 'IMAGE_FSTYPES_pn-core-image-minimal_append = " live"' >> conf/local.conf
$ echo 'KERNEL_FEATURES_append = " features/overlayfs/overlayfs.scc"' >> conf/local.conf
$ bitbake core-image-minimal
$ runqemu core-image-minimal slirp iso
qemux86-64 login: root
root@qemux86-64:~# touch /abc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../initrdscripts/initramfs-framework/union-fs     | 55 ++++++++++++++++++++++
 .../initramfs-module-setup-live_1.0.bb             |  9 +++-
 2 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/union-fs

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/union-fs b/meta/recipes-core/initrdscripts/initramfs-framework/union-fs
new file mode 100644
index 0000000..2fb6241
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/union-fs
@@ -0,0 +1,55 @@
+union_enabled() {
+    if touch $ROOTFS_DIR/bin 2>/dev/null; then
+        # The root image is read-write, directly return.
+        return 1
+    fi
+    return 0
+}
+
+union_run() {
+    # determine which unification filesystem to use
+    union_fs_type=""
+    if grep -q -w "overlay" /proc/filesystems; then
+        union_fs_type="overlay"
+    elif grep -q -w "aufs" /proc/filesystems; then
+        union_fs_type="aufs"
+    else
+        union_fs_type=""
+    fi
+
+    # make a union mount if possible
+    case $union_fs_type in
+        "overlay")
+            mkdir -p /rootfs.ro /rootfs.rw
+            if ! mount -n --move $ROOTFS_DIR /rootfs.ro; then
+                rm -rf /rootfs.ro /rootfs.rw
+                fatal "overlay: Could not move rootfs mount point to /rootfs.ro"
+            else
+                mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+                mkdir -p /rootfs.rw/upperdir /rootfs.rw/work
+                mount -t overlay overlay -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw/upperdir,workdir=/rootfs.rw/work" $ROOTFS_DIR
+                mkdir -p $ROOTFS_DIR/rootfs.ro $ROOTFS_DIR/rootfs.rw
+                mount --move /rootfs.ro $ROOTFS_DIR/rootfs.ro
+                mount --move /rootfs.rw $ROOTFS_DIR/rootfs.rw
+            fi
+            ;;
+        "aufs")
+            mkdir -p /rootfs.ro /rootfs.rw
+            if ! mount -n --move $ROOTFS_DIR /rootfs.ro; then
+                rm -rf /rootfs.ro /rootfs.rw
+                fatal "aufs: Could not move rootfs mount point to /rootfs.ro"
+            else
+                mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+                mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro" aufs $ROOTFS_DIR
+                mkdir -p $ROOTFS_DIR/rootfs.ro $ROOTFS_DIR/rootfs.rw
+                mount --move /rootfs.ro $ROOTFS_DIR/rootfs.ro
+                mount --move /rootfs.rw $ROOTFS_DIR/rootfs.rw
+            fi
+            ;;
+        "")
+            mount -t tmpfs -o rw,noatime,mode=755 tmpfs $ROOTFS_DIR/media
+            ;;
+    esac
+
+    debug "setup union filesystem $union_fs_type"
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index 4d2fe9d..30831c2 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -8,13 +8,18 @@ PR = "r4"
 inherit allarch
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/initramfs-framework:"
-SRC_URI = "file://setup-live"
+SRC_URI = "file://setup-live \
+           file://union-fs \
+"
 
 S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}/init.d
     install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
+    install -m 0755 ${WORKDIR}/union-fs ${D}/init.d/91-union-fs
 }
 
-FILES_${PN} = "/init.d/80-setup-live"
+FILES_${PN} = "/init.d/80-setup-live \
+               /init.d/91-union-fs \
+              "
-- 
2.7.4


