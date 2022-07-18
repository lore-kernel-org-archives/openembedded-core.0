Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5785C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:32 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.28028.1658155771495079800
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jxgKo349;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id x21so9221683plb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f/o7W/gkXyV4zPG+OlUOssnr3f3vxIKeqzatcfnwOh4=;
        b=jxgKo349DnU1sSVUFnBgij4K9EYbrg/YCl2tr9bvBL0eUgGk/x/fPoGhqevdCaNqMg
         TkokkPl82f62RXnDWl+j5Ey+EkVSYruAOca4p9A00sKyj8BxXLW7bshegy9UU0tIWlba
         E7ryZiMeOrHq4G6JClN/tIRAKCJtQxyagWdUFCT6HxvElMzzVtVXL3M8DQEWGw/UqWIK
         dAOFaVaWLQac7CO1J8xcF80Sq2kVYapyvk8/5VX9/uXVw20Hq9qKE3/nYxa1yKdXoQWt
         eDc5w4aVxNd7gbnRvArXwzEGgEvCBpS0KoQs7MSDZVwDLbLDcYmiXuyLm6BnMLOCZXlI
         CtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f/o7W/gkXyV4zPG+OlUOssnr3f3vxIKeqzatcfnwOh4=;
        b=2mOePBr5NzdaGAsd82RQF5Gh7N7K/WZkJt0zwPCnmiugPm1WaaK7gqlDrkv2MB0oJN
         XLppn3Kj6HAZMkJycyQqZz+AncD/tlOHEnSAOQKBGTl/n8XyVdUZvTzc3D3KzNWhwigs
         il1xQa+lzF/uklELLCcb9bfNc8oP6xudUlxAep9NgTh8euq+iS3o3ddrEaGaROgYF6+Q
         3CbqEKZlU0/16w8fv/1RwoYLxnvZmgqEZcAER6mbjFSKMYo016BVRuhBr5LVA29UyUA0
         2DFlnkl4xAgq4gVkhIlZ0vOZtHnJsDqdR0mSZPN856phmogI3+uLhSzftaD98Fe9nmcA
         VbCQ==
X-Gm-Message-State: AJIora+5lKScAknRp9R+hTSvGq9zF/KLUZs1o1mzGe/UJv0sNo8g3Z7d
	pJ2WP3kcYBrk7YBHpAUX8nS5l5s9ap43zxZP
X-Google-Smtp-Source: 
 AGRyM1sKE/7eBAKyp61yGlFtLJ3CfT0OY+AFPPZvkra+57xrqQ5wsMiI8zDFw92WzWFSUczqvoVEbw==
X-Received: by 2002:a17:90b:78d:b0:1ef:c46f:19a7 with SMTP id
 l13-20020a17090b078d00b001efc46f19a7mr32624267pjz.216.1658155770385;
        Mon, 18 Jul 2022 07:49:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/35] udev-extraconf/mount.sh: add LABELs to
 mountpoints
Date: Mon, 18 Jul 2022 04:48:30 -1000
Message-Id: 
 <229e7a911a8b1e0223cfee0bdc2f5fc79cf300fe.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168205

From: Muhammad Hamza <Muhammad_Hamza@mentor.com>

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
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit a9a0a0967832445f1bcc65d58f95343d1b562e1b)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


