Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CA6CCA473
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 09:05:33 +0000 (UTC)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web08.41238.1655802327197660218
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 02:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.92,209,1650960000";
   d="scan'208";a="77594084"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 21 Jun 2022 01:05:24 -0800
IronPort-SDR: 
 ZS83UzZROodE1GlH/Ft55bzoq1vR2pcPV5/hKsLhzBJ0XKWcia6kfG6FQ23BINPPe6KGzQ/Gqy
 VdouTbMwrU/g2sKo0mA3WgY4MD/iW2IWNW74Sar9KssM3vpcs1YmO7uFJRGYXZAWvd+JpmoRfw
 +ZrVDdsXUClioXuxXU1PEpnDVsYSXYkUlEt+JvRFbeQ8k4fafDPnM6DD9RnN9l/PdBY8SoZPsV
 HM8QIeRGlsPizOLXxhVy3dAunJ39ZyoZF/jyeJdysDl5aCW0lYz8yejP+pgNkYn3pzRKxouyXw
 owY=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Muhammad Hamza <muhammad_hamza@mentor.com>, "Arsalan H . Awan"
	<Arsalan_Awan@mentor.com>
Subject: [PATCH v2] udev-extraconf/mount.sh: add LABELs to mountpoints
Date: Tue, 21 Jun 2022 14:05:12 +0500
Message-ID: <20220621090512.3077919-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 09:05:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167141

This alters the mountpoints such that if a device has a LABEL or
a PARTLABEL, it will be mounted at e.g.:

  /run/media/$LABEL-<device-node>
  /run/media/$PARTLABEL-<device-node>
  /run/media/rootfs-sda2

otherwise the device will be mounted at e.g.:

  /run/media/<device-node>
  /run/media/sda1

The <device-node> appended with LABEL or PARTLABEL makes sure that
the mountpoint is unique, therefore, avoids overlapping mounts.

Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 18 ++++++++++++++++++
 meta/recipes-core/udev/udev-extraconf_1.1.bb   |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index c8b773bc07..40910be8bd 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -54,6 +54,9 @@ automount_systemd() {
         grep "^[[:space:]]*$tmp" /etc/fstab && return
     done
 
+    # Get the unique name for mount point
+    get_label_name "${DEVNAME}"
+
     [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
 
     MOUNT="$MOUNT -o silent"
@@ -94,6 +97,9 @@ automount() {
 	# configured in fstab
 	grep -q "^$DEVNAME " /proc/mounts && return
 
+	# Get the unique name for mount point
+	get_label_name "${DEVNAME}"
+
 	! test -d "$MOUNT_BASE/$name" && mkdir -p "$MOUNT_BASE/$name"
 	# Silent util-linux's version of mounting auto
 	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
@@ -134,6 +140,18 @@ rm_dir() {
 	fi
 }
 
+get_label_name() {
+	# Get the LABEL or PARTLABEL
+	LABEL=`/sbin/blkid | grep "$1:" | grep -o 'LABEL=".*"' | cut -d '"' -f2`
+	# If the $DEVNAME has a LABEL or a PARTLABEL
+	if [ -n "$LABEL" ]; then
+	        # Set the mount location dir name to LABEL appended
+        	# with $name e.g. label-sda. That would avoid overlapping
+	        # mounts in case two devices have same LABEL
+        	name="${LABEL}-${name}"
+	fi
+}
+
 # No ID_FS_TYPE for cdrom device, yet it should be mounted
 name="`basename "$DEVNAME"`"
 [ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 2b908ac05b..8213c1a930 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -38,7 +38,7 @@ do_install() {
 }
 
 FILES:${PN} = "${sysconfdir}/udev"
-RDEPENDS:${PN} = "udev"
+RDEPENDS:${PN} = "udev util-linux-blkid"
 CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
 
 # to replace udev-extra-rules from meta-oe
-- 
2.25.1


