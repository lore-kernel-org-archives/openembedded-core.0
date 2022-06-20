Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673DFCCA479
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 12:27:07 +0000 (UTC)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web09.29670.1655728022939923464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 05:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.92,306,1650960000";
   d="scan'208";a="77540531"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 20 Jun 2022 04:27:03 -0800
IronPort-SDR: 
 s3Pz/+53zBsz0UNVfqCS3a3AUgsRYhvu6NUIp4Ralc4IPbP1Ug1unfs9RMV2o7N5anrRhtp1pO
 4Xq+jOi7YG3C5dOOOFT5jSv0fR2uMC3889tJVGW+/koxa/RTLcM5m64e9ImRenfdbAFuqMJlYo
 fG7bqfoxVlEHgEIzViENy2i7dm8u52zKL8v7XcOaz8b1iZ4ZAnX3/kGJvcxUdC60b/US2EWpZx
 zPqjH7GxlX93umf2/aEnzcc1LM23t8o/sWqI+dKzsr/Vsxrk6LnIc4yqdcYo/gM9Y5rHLF8TgF
 qIg=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Muhammad Hamza <muhammad_hamza@mentor.com>, "Arsalan H . Awan"
	<Arsalan_Awan@mentor.com>
Subject: [PATCH] udev-extraconf/mount.sh: add LABELs to mountpoints
Date: Mon, 20 Jun 2022 17:26:40 +0500
Message-ID: <20220620122640.239381-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 12:27:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167095

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
 .../recipes-core/udev/udev-extraconf/mount.sh | 20 +++++++++++++++++++
 meta/recipes-core/udev/udev-extraconf_1.1.bb  |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index c8b773bc07..12c6a5af22 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -54,6 +54,16 @@ automount_systemd() {
         grep "^[[:space:]]*$tmp" /etc/fstab && return
     done
 
+    # Get the LABEL or PARTLABEL
+    LABEL=`/sbin/blkid | grep "${DEVNAME}:" | grep -o 'LABEL=".*"' | cut -d '"' -f2`
+    # If the $DEVNAME has a LABEL or a PARTLABEL
+    if [ -n "$LABEL" ]; then
+            # Set the mount location dir name to LABEL appended
+            # with $name e.g. label-sda. That would avoid overlapping
+            # mounts in case two devices have same LABEL
+            name="${LABEL}-${name}"
+    fi
+
     [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
 
     MOUNT="$MOUNT -o silent"
@@ -94,6 +104,16 @@ automount() {
 	# configured in fstab
 	grep -q "^$DEVNAME " /proc/mounts && return
 
+        # Get the LABEL or PARTLABEL
+        LABEL=`/sbin/blkid | grep "${DEVNAME}:" | grep -o 'LABEL=".*"' | cut -d '"' -f2`
+        # If the $DEVNAME has a LABEL or a PARTLABEL
+        if [ -n "$LABEL" ]; then
+                # Set the mount location dir name to LABEL appended
+                # with $name e.g. label-sda. That would avoid overlapping
+                # mounts in case two devices have same LABEL
+                name="${LABEL}-${name}"
+        fi
+
 	! test -d "$MOUNT_BASE/$name" && mkdir -p "$MOUNT_BASE/$name"
 	# Silent util-linux's version of mounting auto
 	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
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


