Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528FCCCA480
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:15 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.15411.1658062629590235730
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IicwBowh;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 19so10741087ljz.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lvum3lG7JAzpUDVqbQaPAv+CzFm7fDPoP3bXIWMZDkY=;
        b=IicwBowhsKdSoEZ2DR+BsrofQqAbNzp2DOx9rJJvbFEAVI+zJGdVEacgztBcfK8z6J
         f/AslYALPDHv7quVindRl38F9R/yOlg1O0w0QB4xQ9ZfA0e86sJpj3kWEVibIpjY/Zd9
         8dYI+BlESe4zOxp+sox5nhXHLPe3y32xGRSXQE+M4i0LHaeWXYVGU432Sz4KP/HSdKaS
         EM4/3H5dQMqmFwJPdfMk+rpB4U47gRLObPsDkOgFJB2PXV0OKwwVT6oTAoq3Z+Ih3f3H
         8kG9HDskg4KySWPfaSftG+UKPQL4lrMoiVRME5D2MRWjEnQMzBBUlP9p/B0Rvc8b+eLJ
         WZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lvum3lG7JAzpUDVqbQaPAv+CzFm7fDPoP3bXIWMZDkY=;
        b=FBxHw18Z9Kf4+grTK3xUWILL903z3FLZ7DU2sMBkGj4lb06htueHuXGCT/8Cuo3suy
         0R/fcJ2HfrZtmYGX/8TmtlBuBgIO4H9/ljOtKUO832P8VzgtUuPKrNdAAG2blN495vIU
         HJ3Pw7ifJu/LpvbSd09SJEz3GYkmOdebeQKVxtvAHKMHM90LCWKgA+2D8M9DzMaUnh1e
         7MIi+S2qP07oSDckNyKavNdk9nM/hTK9mDoc0YPE5QhHam4TiPpnQg2rFK8mKIwwR5jx
         mVY64k2coGG9+A7HEdx1DA2AIsd5aPxLF8yZC1wmTb7jZGz2OWVfXzkiPIKgsuQD3yIF
         0zQw==
X-Gm-Message-State: AJIora9X93VOPScen+JbxCv2JSwZx0TCHK85n2SCUnOilqgiQXs86rGP
	xl+dzXU4iTA9C0Mvn26Fbp9X4VT6cSY=
X-Google-Smtp-Source: 
 AGRyM1sUhmRiezOmMcEVwVRqMgZjgvkkvxpc7VrjykRlLg3EUUeaJ5+fOn3nuvlxF2JMKGDAICO5cQ==
X-Received: by 2002:a2e:a9a6:0:b0:25d:6062:91af with SMTP id
 x38-20020a2ea9a6000000b0025d606291afmr10362081ljq.144.1658062627376;
        Sun, 17 Jul 2022 05:57:07 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:57:06 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Muhammad Hamza <Muhammad_Hamza@mentor.com>,
	"Arsalan H . Awan" <Arsalan_Awan@mentor.com>,
	Muhammad Hamza <muhammad_hamza@mentor.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 3/9] udev-extraconf/mount.sh: add LABELs
 to mountpoints
Date: Sun, 17 Jul 2022 14:56:42 +0200
Message-Id: <20220717125648.2942046-4-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717125648.2942046-1-liu.ming50@gmail.com>
References: <20220717125648.2942046-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:57:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168151

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


