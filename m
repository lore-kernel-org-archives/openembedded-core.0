Return-Path: <peter@berginkonsult.se>
Received: from mailrelay7.public.one.com (mailrelay7.public.one.com
	[91.198.169.215])
	by mail.openembedded.org (Postfix) with ESMTP id 8415A77AF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=berginkonsult.se; s=20140924;
	h=from:subject:date:message-id:to:cc;
	bh=5TjxdtoY7+lC2pfEVfw617Ra49cExmJNFSBcL58D5h0=;
	b=JYt+nCyfuddc77dMZyf35NJcPht/1m8HzjJByk+0aqaDcIWUxZqFDbz5QYVYtDiPllfgjhn463MYP
	/EPgA6q7C2OWoRzgHX5gaQR1vbyk78hNcyb+nQuKI7y/qOZLOF+nIv0P6FjzHlOIBd0JUj6uqJXzYn
	6mQ2cpdmAYzwTcRE=
X-HalOne-Cookie: 323b9c1e222ff69e8ab147a4468c0a6a55d7bf89
X-HalOne-ID: 64efc1e6-13f2-11e7-bc36-b82a72cffc46
Received: from localhost.localdomain (unknown [37.123.162.211])
	by smtpfilter4.public.one.com (Halon) with ESMTPSA
	id 64efc1e6-13f2-11e7-bc36-b82a72cffc46;
	Tue, 28 Mar 2017 20:09:10 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 22:08:46 +0200
Message-Id: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Tue, 28 Mar 2017 20:09:13 -0000

Move config fragments that are unconditionally and always applied
to the configuration to the default defconfig file. This will
make it easier to provide your own defconfig file for your target.

The problem this commit will solve is that if you provide your own
defconfig file for your target it will be tampered with by the
configuration fragments in SRC_URI. If you not want those
configurations in your own setup you have to modify SRC_URI
variable in your setup. As those confguration fragment was always
applied it is a better solution to have them in the default
defconfig file instead.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-core/busybox/busybox/defconfig        | 64 +++++++++++-----------
 meta/recipes-core/busybox/busybox/getopts.cfg      |  3 -
 .../busybox/busybox/login-utilities.cfg            | 13 -----
 .../busybox/busybox/mount-via-label.cfg            |  9 ---
 meta/recipes-core/busybox/busybox/resize.cfg       |  2 -
 meta/recipes-core/busybox/busybox/sha1sum.cfg      |  1 -
 meta/recipes-core/busybox/busybox/sha256sum.cfg    |  1 -
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  6 --
 8 files changed, 32 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/getopts.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/login-utilities.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/mount-via-label.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/sha1sum.cfg
 delete mode 100644 meta/recipes-core/busybox/busybox/sha256sum.cfg

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index f649738..4e49b15 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -273,8 +273,8 @@ CONFIG_RM=y
 CONFIG_RMDIR=y
 # CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
 CONFIG_SEQ=y
-# CONFIG_SHA1SUM is not set
-# CONFIG_SHA256SUM is not set
+CONFIG_SHA1SUM=y
+CONFIG_SHA256SUM=y
 # CONFIG_SHA512SUM is not set
 # CONFIG_SHA3SUM is not set
 CONFIG_SLEEP=y
@@ -346,8 +346,8 @@ CONFIG_LOADFONT=y
 CONFIG_LOADKMAP=y
 CONFIG_OPENVT=y
 CONFIG_RESET=y
-# CONFIG_RESIZE is not set
-# CONFIG_FEATURE_RESIZE_PRINT is not set
+CONFIG_RESIZE=y
+CONFIG_FEATURE_RESIZE_PRINT=y
 CONFIG_SETCONSOLE=y
 # CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
 # CONFIG_SETFONT is not set
@@ -473,39 +473,39 @@ CONFIG_MESG=y
 #
 # CONFIG_ADD_SHELL is not set
 # CONFIG_REMOVE_SHELL is not set
-# CONFIG_FEATURE_SHADOWPASSWDS is not set
+CONFIG_FEATURE_SHADOWPASSWDS=y
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
-# CONFIG_ADDUSER is not set
-# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
+CONFIG_ADDUSER=y
+CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
-# CONFIG_ADDGROUP is not set
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+CONFIG_ADDGROUP=y
+CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
 # CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
-# CONFIG_DELUSER is not set
-# CONFIG_DELGROUP is not set
+CONFIG_DELUSER=y
+CONFIG_DELGROUP=y
 # CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
-# CONFIG_GETTY is not set
-# CONFIG_LOGIN is not set
+CONFIG_GETTY=y
+CONFIG_LOGIN=y
 # CONFIG_LOGIN_SESSION_AS_CHILD is not set
 # CONFIG_LOGIN_SCRIPTS is not set
 # CONFIG_FEATURE_NOLOGIN is not set
 # CONFIG_FEATURE_SECURETTY is not set
-# CONFIG_PASSWD is not set
+CONFIG_PASSWD=y
 # CONFIG_FEATURE_PASSWD_WEAK_CHECK is not set
 # CONFIG_CRYPTPW is not set
 # CONFIG_CHPASSWD is not set
 CONFIG_FEATURE_DEFAULT_PASSWD_ALGO=""
-# CONFIG_SU is not set
+CONFIG_SU=y
 # CONFIG_FEATURE_SU_SYSLOG is not set
 # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
-# CONFIG_SULOGIN is not set
-# CONFIG_VLOCK is not set
+CONFIG_SULOGIN=y
+CONFIG_VLOCK=y
 
 #
 # Linux Ext2 FS Progs
@@ -562,7 +562,7 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_FAKE is not set
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
-# CONFIG_FEATURE_MOUNT_LABEL is not set
+CONFIG_FEATURE_MOUNT_LABEL=y
 # CONFIG_FEATURE_MOUNT_NFS is not set
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
@@ -572,8 +572,8 @@ CONFIG_FEATURE_MOUNT_FSTAB=y
 # CONFIG_UEVENT is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
-# CONFIG_BLKID is not set
-# CONFIG_FEATURE_BLKID_TYPE is not set
+CONFIG_BLKID=y
+CONFIG_FEATURE_BLKID_TYPE=y
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
 CONFIG_FBSET=y
@@ -599,8 +599,8 @@ CONFIG_FLOCK=y
 # CONFIG_FEATURE_MINIX2 is not set
 # CONFIG_MKFS_REISER is not set
 # CONFIG_MKFS_VFAT is not set
-# CONFIG_GETOPT is not set
-# CONFIG_FEATURE_GETOPT_LONG is not set
+CONFIG_GETOPT=y
+CONFIG_FEATURE_GETOPT_LONG=y
 CONFIG_HEXDUMP=y
 # CONFIG_FEATURE_HEXDUMP_REVERSE is not set
 # CONFIG_HD is not set
@@ -636,13 +636,17 @@ CONFIG_FEATURE_UMOUNT_ALL=y
 CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
-# CONFIG_VOLUMEID is not set
-# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
+CONFIG_VOLUMEID=y
+
+#
+# Filesystem/Volume identification
+#
+CONFIG_FEATURE_VOLUMEID_BTRFS=y
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
 # CONFIG_FEATURE_VOLUMEID_EXFAT is not set
-# CONFIG_FEATURE_VOLUMEID_EXT is not set
-# CONFIG_FEATURE_VOLUMEID_F2FS is not set
-# CONFIG_FEATURE_VOLUMEID_FAT is not set
+CONFIG_FEATURE_VOLUMEID_EXT=y
+CONFIG_FEATURE_VOLUMEID_F2FS=y
+CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
 # CONFIG_FEATURE_VOLUMEID_JFS is not set
@@ -654,7 +658,7 @@ CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
 # CONFIG_FEATURE_VOLUMEID_REISERFS is not set
 # CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
+CONFIG_FEATURE_VOLUMEID_SQUASHFS=y
 # CONFIG_FEATURE_VOLUMEID_SYSV is not set
 # CONFIG_FEATURE_VOLUMEID_UDF is not set
 # CONFIG_FEATURE_VOLUMEID_XFS is not set
@@ -981,10 +985,6 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=""
 # CONFIG_ENVUIDGID is not set
 # CONFIG_ENVDIR is not set
 # CONFIG_SOFTLIMIT is not set
-
-#
-#  SELinux utilities
-#
 # CONFIG_CHCON is not set
 # CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
 # CONFIG_GETENFORCE is not set
diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
deleted file mode 100644
index 8db0a4a..0000000
--- a/meta/recipes-core/busybox/busybox/getopts.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_GETOPT=y
-CONFIG_LONG_OPTS=y
-CONFIG_FEATURE_GETOPT_LONG=y
diff --git a/meta/recipes-core/busybox/busybox/login-utilities.cfg b/meta/recipes-core/busybox/busybox/login-utilities.cfg
deleted file mode 100644
index cc9b2db..0000000
--- a/meta/recipes-core/busybox/busybox/login-utilities.cfg
+++ /dev/null
@@ -1,13 +0,0 @@
-CONFIG_FEATURE_SHADOWPASSWDS=y
-CONFIG_ADDUSER=y
-CONFIG_FEATURE_ADDUSER_LONG_OPTIONS=y
-CONFIG_ADDGROUP=y
-CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS=y
-CONFIG_DELUSER=y
-CONFIG_DELGROUP=y
-CONFIG_GETTY=y
-CONFIG_LOGIN=y
-CONFIG_PASSWD=y
-CONFIG_SU=y
-CONFIG_SULOGIN=y
-CONFIG_VLOCK=y
diff --git a/meta/recipes-core/busybox/busybox/mount-via-label.cfg b/meta/recipes-core/busybox/busybox/mount-via-label.cfg
deleted file mode 100644
index 2fe7ab2..0000000
--- a/meta/recipes-core/busybox/busybox/mount-via-label.cfg
+++ /dev/null
@@ -1,9 +0,0 @@
-CONFIG_BLKID=y
-CONFIG_FEATURE_BLKID_TYPE=y
-CONFIG_FEATURE_MOUNT_LABEL=y
-CONFIG_VOLUMEID=y
-CONFIG_FEATURE_VOLUMEID_BTRFS=y
-CONFIG_FEATURE_VOLUMEID_EXT=y
-CONFIG_FEATURE_VOLUMEID_F2FS=y
-CONFIG_FEATURE_VOLUMEID_FAT=y
-CONFIG_FEATURE_VOLUMEID_SQUASHFS=y
diff --git a/meta/recipes-core/busybox/busybox/resize.cfg b/meta/recipes-core/busybox/busybox/resize.cfg
deleted file mode 100644
index a1d9c95..0000000
--- a/meta/recipes-core/busybox/busybox/resize.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_RESIZE=y
-CONFIG_FEATURE_RESIZE_PRINT=y
diff --git a/meta/recipes-core/busybox/busybox/sha1sum.cfg b/meta/recipes-core/busybox/busybox/sha1sum.cfg
deleted file mode 100644
index 20e72d9..0000000
--- a/meta/recipes-core/busybox/busybox/sha1sum.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_SHA1SUM=y
diff --git a/meta/recipes-core/busybox/busybox/sha256sum.cfg b/meta/recipes-core/busybox/busybox/sha256sum.cfg
deleted file mode 100644
index ce652ae..0000000
--- a/meta/recipes-core/busybox/busybox/sha256sum.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_SHA256SUM=y
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 41fc641..5a338dc 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -25,7 +25,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://run-ptest \
            file://inetd.conf \
            file://inetd \
-           file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
@@ -33,11 +32,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-1.24.1-unzip-regression.patch \
            file://busybox-1.24.1-truncate-open-mode.patch \
            file://0001-flock-update-the-behaviour-of-c-parameter-to-match-u.patch \
-           file://mount-via-label.cfg \
-           file://sha1sum.cfg \
-           file://sha256sum.cfg \
-           file://getopts.cfg \
-           file://resize.cfg \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
            file://inittab \
-- 
2.7.4


