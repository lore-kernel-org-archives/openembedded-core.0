Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C23DD6C534
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 09:56:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wB39uXVM026933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Dec 2018 01:56:33 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Dec 2018 01:56:33 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 3 Dec 2018 18:13:30 +0800
Message-ID: <1543832010-8787-4-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543832010-8787-1-git-send-email-hongxu.jia@windriver.com>
References: <1543832010-8787-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] initrdscripts/init-live.sh: umount extra mount points
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
X-List-Received-Date: Mon, 03 Dec 2018 09:56:32 -0000
Content-Type: text/plain

Just umount these mount points. After switch_root, let udev/fstab in
rootfs to process these partition. It aligns the principle that `Initrd
is used to mount the root file system at boot time'[1]

[1] https://en.wikipedia.org/wiki/Initial_ramdisk

Umount dev rather mount point to avoid `spaces in the mount points to
actual ASCII char'

Here are test steps:
$ echo 'INITRAMFS_SCRIPTS = "initramfs-live-boot initramfs-live-install \
    initramfs-live-install-efi"' >> conf/local.conf
$ echo 'IMAGE_FSTYPES_pn-core-image-minimal_append = " live"' >> conf/local.conf
$ echo 'KERNEL_FEATURES_append = " features/overlayfs/overlayfs.scc"' >> conf/local.conf
$ bitbake core-image-minimal
$ runqemu core-image-minimal slirp iso
qemux86-64 login: root
root@qemux86-64:~# touch /abc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 65183d7..068e049 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -92,15 +92,11 @@ boot_live_root() {
     mkdir -p  ${ROOT_MOUNT}/media/realroot
     mount -n --move "/run/media/${ROOT_DISK}" ${ROOT_MOUNT}/media/realroot
 
-    # Move the mount points of some filesystems over to
-    # the corresponding directories under the real root filesystem.
-    for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
-        # Parse any OCT or HEX encoded chars such as spaces
-        # in the mount points to actual ASCII chars
-        dir=`printf $dir`
-        mkdir -p "${ROOT_MOUNT}/media/${dir##*/}"
-        mount -n --move "$dir" "${ROOT_MOUNT}/media/${dir##*/}"
+    # Umount available mount points
+    for dev in `awk '/\/dev.* \/run\/media/{print $1}' /proc/mounts`; do
+        umount $dev
     done
+
     mount -n --move /proc ${ROOT_MOUNT}/proc
     mount -n --move /sys ${ROOT_MOUNT}/sys
     mount -n --move /dev ${ROOT_MOUNT}/dev
-- 
2.7.4


