Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.60242.1629317880343551260
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 13:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XVvfNLbO;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id m21so4466642qkm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sikocR8+ry0NxCExWm8V10BR8Ae2CA5uJGUFKz4Z6KU=;
        b=XVvfNLbOFgUQFXNSRiTICukjrMBNtI1qWyDr92f9/pPnlUrnKzoCrKvRmj2RTwJ13h
         JS/uAMddCjqMjZCzGJgOk8YUl4lSka1V8rVKStYmqjzE/bqQWFiG90ns/kPsKe+Cd/lf
         PV76uX+Klgfovj/4Jwu5xQvT08in+UnWmJX8o4KOrH4EIHreaGq5WIWmZ/UkCOdVVFRz
         RQHdfvUbW2SO4pK84OtQB3J4s9Br/UFK1UhwiR7fG8d072RnLEIxThS4FRrKgpLyjhGT
         jharuxBbAbNyL9ihc9vbSyrT+sgfFwUnS++WDR5I9W2f4x5989rA15+ZqL7XmF/+lXDA
         8ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sikocR8+ry0NxCExWm8V10BR8Ae2CA5uJGUFKz4Z6KU=;
        b=mtHJlUAUMHmdtCgidfsYa7gCxTkpQliNTwBqlhl3el1Bjfkz2/oWmBLDuib5KHk1zD
         GFrCydCRjTEu6vS++w7LzhbclIhTLuoxyrpmH0y9gFP8CFj2INisgo0z5KgnPnaJaxWa
         hpclQMQt6aorfqVjGNdznbjBd8sJbAnUiAAJ0ov2XbvsBypXXPwE+G0CGUQKL82/UZKE
         VdTJ3/8DoI8Uuq6A4y+UElOjSs7mmeaFQ7E3hhNldYkBUmiporqMnuPmgrwnNvU1Gegu
         oxizpbrxMtu6WdQpqpiBT34sB1wWzxq5HRv+PZ4QfHK/infyGa//jq4d/YXiq9vtgScx
         zzvw==
X-Gm-Message-State: AOAM531Bm1qnk23Ji/iDp4F3pfRyF/prW93itDkHNgsjmpjLxPfGfaL7
	XWac51LaMJKSxCeMpx2Xy6vfDPmDZX37QA==
X-Google-Smtp-Source: ABdhPJxZ9+nXD+iBEz6Dvzneq5+ojvnYHnqQ1V8KxwVSiBc2UquKwii5zt7sYVnKYWWXAfwsz6EKNQ==
X-Received: by 2002:a05:620a:b0f:: with SMTP id t15mr80688qkg.352.1629317879048;
        Wed, 18 Aug 2021 13:17:59 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id u189sm464887qkh.14.2021.08.18.13.17.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:17:58 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC WIP][PATCH] add two zram IMAGE_FEATUREs
Date: Wed, 18 Aug 2021 16:17:51 -0400
Message-Id: <20210818201751.27985-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The zram kernel module creates RAM-based block devices named /dev/zram<id>
(<id> = 0, 1, ...). Pages written to these disks are compressed and stored
in memory itself. These disks allow very fast I/O and compression provides
good amounts of memory savings. Some of the use cases include /tmp storage,
use as swap disks, various caches under /var and maybe many more.

If the user wants to switch from using uncompressed tmpfs to compressed
zram-based in-RAM temporary filesystems then add "zram-tmpfs" to
IMAGE_FEATURES. Currently the base install uses tmpfs filesystems for /run and
/var/volatile. By default the /run filesystem will be 10MiB in size and the
/var/volatile (which holds /tmp, among others) will be 30MiB in size. The
following variables can be tweaked to adjust these sizes:
	ZRAM_RUN_SIZE
	ZRAM_TMP_SIZE

If the user wants to enable an in-RAM, compressed, zram-backed SWAP for
their system, simply add "zram-swap" to IMAGE_FEATURES. The size of the swap
will be based on a percentage of the total system RAM which the user can
adjust by modifying the following variable:
	ZRAM_SWAP_PERCENT

By default ZRAM_SWAP_PERCENT is set to "100" which means the initial SWAP size
will be the same size as the total system RAM.

The kernel provides several compression algorithms from which the user can
choose. By default the "lzo-rle" compression is used, but the user can modify
the following variable to choose from any one of the other available
compression algorithms:
	ZRAM_ALGORITHM

Currently the set of available compression algorithms include:
	lzo
	lzo-rle
	lz4
	lz4hc
	842
	zstd

!!!NOTE!!!
this is a WIP patch submitted for RFC
this patch only works, currently, with sysvinit
but I wanted to get feedback on the general approach before tackling systemd

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/core-image.bbclass               |  4 ++
 meta/classes/image.bbclass                    |  2 +-
 meta/classes/rootfs-postcommands.bbclass      | 35 +++++++++++++++++
 .../initscripts/initscripts-1.0/mountall.sh   | 27 ++++++++++++-
 .../packagegroup-core-zram-swap.bb            | 10 +++++
 .../packagegroup-core-zram-tmpfs.bb           |  9 +++++
 .../sysvinit/sysvinit/rcS-default             |  8 ++++
 meta/recipes-core/sysvinit/sysvinit_2.99.bb   | 38 ++++++++++++++++++-
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +
 9 files changed, 131 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-zram-swap.bb
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-zram-tmpfs.bb

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 84fd3eeb38..ed6184d11c 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -39,6 +39,8 @@
 # - read-only-rootfs    - tweaks an image to support read-only rootfs
 # - stateless-rootfs    - systemctl-native not run, image populated by systemd at runtime
 # - splash              - bootup splash screen
+# - zram-tmpfs          - use a zram disk for temporary filesystems instead of tmpfs
+# - zram-swap           - use a zram-backed swap
 #
 FEATURE_PACKAGES_weston = "packagegroup-core-weston"
 FEATURE_PACKAGES_x11 = "packagegroup-core-x11"
@@ -53,6 +55,8 @@ FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server"
 FEATURE_PACKAGES_nfs-client = "packagegroup-core-nfs-client"
 FEATURE_PACKAGES_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
 FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh"
+FEATURE_PACKAGES_zram-tmpfs = "packagegroup-core-zram-tmpfs"
+FEATURE_PACKAGES_zram-swap = "packagegroup-core-zram-swap"
 FEATURE_PACKAGES_hwcodecs = "${MACHINE_HWCODECS}"
 
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d76895178f..57178baace 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -33,7 +33,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging zram-tmpfs zram-swap"
 
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c5746eba13..a1e00aeebc 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -17,6 +17,12 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
 
+# Use zram for temporary filesystems instead of tmpfs
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "zram-tmpfs", "zram_tmpfs_hook; ", "",d)}'
+
+# Use a zram-backed swap
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "zram-swap", "zram_swap_hook; ", "",d)}'
+
 # We also need to do the same for the kernel boot parameters,
 # otherwise kernel or initramfs end up mounting the rootfs read/write
 # (the default) if supported by the underlying storage.
@@ -143,6 +149,35 @@ read_only_rootfs_hook () {
 	fi
 }
 
+#
+# A hook function to support zram-tmpfs IMAGE_FEATURES
+#
+zram_tmpfs_hook () {
+	# Remove tmpfs entries from fstab
+	if [ -f ${IMAGE_ROOTFS}/etc/fstab ]; then
+		sed -n -i -e '/tmpfs/!p' ${IMAGE_ROOTFS}/etc/fstab
+	fi
+
+	# Enable zram when sysvinit is used
+	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
+		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
+			sed -i 's/USE_ZRAM_TMPFS=no/USE_ZRAM_TMPFS=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
+		fi
+	fi
+}
+
+#
+# A hook function to support using a zram-backed swap
+#
+zram_swap_hook () {
+	# Enable zram when sysvinit is used
+	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
+		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
+			sed -i 's/USE_ZRAM_SWAP=no/USE_ZRAM_SWAP=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
+		fi
+	fi
+}
+
 #
 # This function is intended to disallow empty root password if 'debug-tweaks' is not in IMAGE_FEATURES.
 #
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
index 2839d57cbe..996709bce6 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
@@ -35,11 +35,36 @@ if [ ! -p "$INITCTL" ] && [ "${INIT_SYSTEM}" = "sysvinit" ]; then
 		[ -n "$PID" ] && kill -s USR1 "$PID"
 fi
 
+# If the user wants to use zram tmpfs
+# create and mount those now
+if [ "$USE_ZRAM_TMPFS"z = "yes"z ]; then
+	ZDEVICE=$(zramctl -f -s ${ZRAM_TMP_SIZE}MiB -a ${ZRAM_ALGORITHM})
+	if [ $? -eq 0 ]; then
+		mkfs.ext2 $ZDEVICE
+		mount $ZDEVICE /var/volatile
+	fi
+	ZDEVICE=$(zramctl -f -s ${ZRAM_RUN_SIZE}MiB -a ${ZRAM_ALGORITHM})
+	if [ $? -eq 0 ]; then
+		mkfs.ext2 $ZDEVICE
+		mount $ZDEVICE /run
+	fi
+fi
+
 #
 # Execute swapon command again, in case we want to swap to
 # a file on a now mounted filesystem.
 #
-[ -x /sbin/swapon ] && swapon -a
+if [ "$USE_ZRAM_SWAP"z = "yes"z ]; then
+	MEMTOTAL=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
+	MEMZRAM=$((${MEMTOTAL}*${ZRAM_SWAP_PERCENT}/100))
+	ZDEVICE=$(zramctl -f -s ${MEMZRAM}KiB -a ${ZRAM_ALGORITHM})
+	if [ $? -eq 0 ]; then
+		mkswap -L "zram-swap" $ZDEVICE
+		swapon -p 100 $ZDEVICE
+	fi
+else
+	[ -x /sbin/swapon ] && swapon -a
+fi
 
 : exit 0
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-zram-swap.bb b/meta/recipes-core/packagegroups/packagegroup-core-zram-swap.bb
new file mode 100644
index 0000000000..fa6da61b47
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-core-zram-swap.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Use zram-backed swap"
+PR = "r1"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = " \
+	util-linux-zramctl \
+	util-linux-swaponoff \
+	util-linux-mkswap \
+	"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-zram-tmpfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-zram-tmpfs.bb
new file mode 100644
index 0000000000..84b6642340
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-core-zram-tmpfs.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Use zram for temporary directories instead of tmpfs"
+PR = "r1"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = " \
+	util-linux-zramctl \
+	e2fsprogs-mke2fs \
+	"
diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
index f7c4a2f841..91739183d9 100644
--- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
+++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
@@ -34,3 +34,11 @@ INIT_SYSTEM=sysvinit
 PSPLASH_FIFO_DIR=/mnt
 # psplash textual updates knob
 PSPLASH_TEXT_UPDATES=#PSPLASH_TEXT#
+# zram
+# zram can be used for swap or tmp filesystems (or both)
+ZRAM_ALGORITHM=#ZRAM_ALGORITHM#
+USE_ZRAM_SWAP=#USE_ZRAM_SWAP#
+ZRAM_SWAP_PERCENT=#ZRAM_SWAP_PERCENT#
+USE_ZRAM_TMPFS=#USE_ZRAM_TMPFS#
+ZRAM_TMP_SIZE=#ZRAM_TMP_SIZE#
+ZRAM_RUN_SIZE=#ZRAM_RUN_SIZE#
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.99.bb b/meta/recipes-core/sysvinit/sysvinit_2.99.bb
index 9ba9652f94..3a7be5f100 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.99.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.99.bb
@@ -83,6 +83,34 @@ EXTRA_OEMAKE += "'base_bindir=${base_bindir}' \
 		 'mandir=${mandir}' \
                  MNTPOINT=yes"
 
+# zram defaults (if enabled in IMAGE_FEATURES)
+# choose one of: lzo lzo-rle lz4 lz4hc 842 zstd (depending on your kernel config)
+ZRAM_ALGORITHM ?= "lzo-rle"
+# swap size as a percentage of total RAM
+ZRAM_SWAP_PERCENT ?= "100"
+# size of /tmp in MiB
+ZRAM_TMP_SIZE ?= "30"
+# size of /run in MiB
+ZRAM_RUN_SIZE ?= "10"
+python __anonymous() {
+    imagefeatures = (d.getVar("IMAGE_FEATURES") or "")
+
+    d.setVar("USE_ZRAM_SWAP", "no")
+    if 'zram-swap' in imagefeatures:
+        swappercent = (d.getVar("ZRAM_SWAP_PERCENT") or "")
+        if int(swappercent) <= 0:
+            bb.error("ZRAM_SWAP_PERCENT must be greater than 0")
+        d.setVar("USE_ZRAM_SWAP", "yes")
+
+    d.setVar("USE_ZRAM_TMPFS", "no")
+    if 'zram-tmpfs' in imagefeatures:
+        valid_algorithms = ['lzo', 'lzo-rle', 'lz4', 'lz4hc', '842', 'zstd']
+        algorithm = (d.getVar("ZRAM_ALGORITHM") or "")
+        if algorithm not in valid_algorithms:
+            bb.error("ZRAM_ALGORITHM must be one of: %s" % valid_algorithms)
+        d.setVar("USE_ZRAM_TMPFS", "yes")
+}
+
 do_install () {
 	oe_runmake 'ROOT=${D}' install
 
@@ -93,8 +121,14 @@ do_install () {
 		install -d ${D}${sysconfdir}/rc$level.d
 	done
 
-	sed -e \
-		's:#PSPLASH_TEXT#:${@bb.utils.contains("PACKAGECONFIG","psplash-text-updates","yes","no", d)}:g' \
+	sed \
+		-e 's:#PSPLASH_TEXT#:${@bb.utils.contains("PACKAGECONFIG","psplash-text-updates","yes","no", d)}:g' \
+		-e 's:#ZRAM_ALGORITHM#:${ZRAM_ALGORITHM}:g' \
+		-e 's:#USE_ZRAM_SWAP#:${USE_ZRAM_SWAP}:g' \
+		-e 's:#ZRAM_SWAP_PERCENT#:${ZRAM_SWAP_PERCENT}:g' \
+		-e 's:#USE_ZRAM_TMPFS#:${USE_ZRAM_TMPFS}:g' \
+		-e 's:#ZRAM_TMP_SIZE#:${ZRAM_TMP_SIZE}:g' \
+		-e 's:#ZRAM_RUN_SIZE#:${ZRAM_RUN_SIZE}:g' \
 		${WORKDIR}/rcS-default > ${D}${sysconfdir}/default/rcS
 	chmod 0644 ${D}${sysconfdir}/default/rcS
 	install -m 0755    ${WORKDIR}/rc		${D}${sysconfdir}/init.d
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 331727d62c..66aa8df4a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -35,6 +35,8 @@ KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
 
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('IMAGE_FEATURES', 'zram-tmpfs', 'features/zram/zram.scc', '', d)}"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('IMAGE_FEATURES', 'zram-swap', 'features/zram/zram.scc', '', d)}"
 
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
-- 
2.30.0.rc0

