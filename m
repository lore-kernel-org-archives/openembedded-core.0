Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6020676563
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:57:02 +0000 (UTC)
Received: by igk11 with SMTP id 11so19386102igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d+WtlLWDzpuTJulNvwz7vhoiebHGp13HkqZlkHVd0mE=;
	b=dtOyL5zqSL2JkwKimPgXobM7hCDw0+9GTG88Ir6UeU9+GKkc3A7iZc/o9F+JfGBFEZ
	T8gaquk8l98pxsHOehxPiCDRqSuQ14sXzeoX+U5YKLjrwKoMCHOU7kkcK+suB+Zbco0A
	btHf6tD/vMxSm9L1ZzkhCpBeu0GeeBuYTBPhPgzHzo31S6rFYulfzylUEA/3TX3QIgqt
	EHhD90YmRsl8dRIgPJZDeklmNDZaB0la5eLIB7FwMOFAnRZ5uXWvn/he2f6fptZ78xnQ
	bCpbKHLWXI948/nGbLujThdnc9WOdmIdAkB0MM8ZS2Vug76S4MXiupVaAEzp5i+6V27K
	zLIA==
X-Received: by 10.50.88.6 with SMTP id bc6mr89430igb.24.1438289823219;
	Thu, 30 Jul 2015 13:57:03 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id a6sm1530978ioj.1.2015.07.30.13.57.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:57:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:56:27 -0700
Message-Id: <1438289788-23120-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
References: <1438289788-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/7] busybox: support mount via label for btrfs and squashfs
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
X-List-Received-Date: Thu, 30 Jul 2015 20:57:03 -0000

Also move the mount via label (and mount via UUID) support into its
own config fragment and disable volume ID support for less common
filesystem formats exFAT and NILFS.

Following this commit, mount via label is supported for btrfs, ext, f2fs,
fat and squashfs.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig           | 18 +++++++-----------
 meta/recipes-core/busybox/busybox/mount-via-label.cfg |  9 +++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb           |  1 +
 meta/recipes-core/busybox/busybox_git.bb              |  1 +
 4 files changed, 18 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/mount-via-label.cfg

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index c5d3275..4f5df9e 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -603,7 +603,7 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_FAKE is not set
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
-CONFIG_FEATURE_MOUNT_LABEL=y
+# CONFIG_FEATURE_MOUNT_LABEL is not set
 CONFIG_FEATURE_MOUNT_NFS=y
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
@@ -629,24 +629,20 @@ CONFIG_FEATURE_UMOUNT_ALL=y
 CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
-CONFIG_VOLUMEID=y
-
-#
-# Filesystem/Volume identification
-#
+# CONFIG_VOLUMEID is not set
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-CONFIG_FEATURE_VOLUMEID_EXFAT=y
-CONFIG_FEATURE_VOLUMEID_EXT=y
-CONFIG_FEATURE_VOLUMEID_F2FS=y
-CONFIG_FEATURE_VOLUMEID_FAT=y
+# CONFIG_FEATURE_VOLUMEID_EXFAT is not set
+# CONFIG_FEATURE_VOLUMEID_EXT is not set
+# CONFIG_FEATURE_VOLUMEID_F2FS is not set
+# CONFIG_FEATURE_VOLUMEID_FAT is not set
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
 # CONFIG_FEATURE_VOLUMEID_JFS is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
 # CONFIG_FEATURE_VOLUMEID_LUKS is not set
-CONFIG_FEATURE_VOLUMEID_NILFS=y
+# CONFIG_FEATURE_VOLUMEID_NILFS is not set
 # CONFIG_FEATURE_VOLUMEID_NTFS is not set
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
 # CONFIG_FEATURE_VOLUMEID_REISERFS is not set
diff --git a/meta/recipes-core/busybox/busybox/mount-via-label.cfg b/meta/recipes-core/busybox/busybox/mount-via-label.cfg
new file mode 100644
index 0000000..2fe7ab2
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/mount-via-label.cfg
@@ -0,0 +1,9 @@
+CONFIG_BLKID=y
+CONFIG_FEATURE_BLKID_TYPE=y
+CONFIG_FEATURE_MOUNT_LABEL=y
+CONFIG_VOLUMEID=y
+CONFIG_FEATURE_VOLUMEID_BTRFS=y
+CONFIG_FEATURE_VOLUMEID_EXT=y
+CONFIG_FEATURE_VOLUMEID_F2FS=y
+CONFIG_FEATURE_VOLUMEID_FAT=y
+CONFIG_FEATURE_VOLUMEID_SQUASHFS=y
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 85e462e..b84f499 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-cross-menuconfig.patch \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
            file://0001-chown-fix-help-text.patch \
+           file://mount-via-label.cfg \
 "
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index c5596d8..71e6c13 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://busybox-cross-menuconfig.patch \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
            file://0001-chown-fix-help-text.patch \
+           file://mount-via-label.cfg \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.9.1


