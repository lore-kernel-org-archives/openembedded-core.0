Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CE9D13598
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 08:30:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.46744.1730104216075567212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 01:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8g-0000iW-5J; Mon, 28 Oct 2024 09:30:14 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-000omJ-2m;
	Mon, 28 Oct 2024 09:30:13 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1t5L8f-001oDL-2S;
	Mon, 28 Oct 2024 09:30:13 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Andrej Valek <andrej.v@skyrain.eu>
Subject: [PATCH v2 9/9] busybox: disable defconfig options from mount-via-label.cfg
Date: Mon, 28 Oct 2024 09:29:13 +0100
Message-Id: <20241028082913.418505-10-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028082913.418505-1-ejo@pengutronix.de>
References: <20241028082913.418505-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206427

Accidentally enabled in
6a6c6442 ("busybox: refresh the defconfig from 1.33.0").

With this, also CONFIG_FEATURE_VOLUMEID_EROFS was enabled accidentally.
To not break possible existing use cases, we add it to the existing
fragment manually.

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-core/busybox/busybox/defconfig   | 24 ++++++++-----------
 .../busybox/busybox/mount-via-label.cfg       |  1 +
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index ab74d2616d..38b82457b7 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -605,8 +605,8 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 # CONFIG_BLKDISCARD is not set
-CONFIG_BLKID=y
-CONFIG_FEATURE_BLKID_TYPE=y
+# CONFIG_BLKID is not set
+# CONFIG_FEATURE_BLKID_TYPE is not set
 # CONFIG_BLOCKDEV is not set
 # CONFIG_CAL is not set
 # CONFIG_CHRT is not set
@@ -674,7 +674,7 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_FAKE is not set
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
-CONFIG_FEATURE_MOUNT_LABEL=y
+# CONFIG_FEATURE_MOUNT_LABEL is not set
 # CONFIG_FEATURE_MOUNT_NFS is not set
 # CONFIG_FEATURE_MOUNT_CIFS is not set
 CONFIG_FEATURE_MOUNT_FLAGS=y
@@ -722,19 +722,15 @@ CONFIG_FEATURE_UMOUNT_ALL=y
 CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
-CONFIG_VOLUMEID=y
-
-#
-# Filesystem/Volume identification
-#
+# CONFIG_VOLUMEID is not set
 # CONFIG_FEATURE_VOLUMEID_BCACHE is not set
-CONFIG_FEATURE_VOLUMEID_BTRFS=y
+# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-CONFIG_FEATURE_VOLUMEID_EROFS=y
+# CONFIG_FEATURE_VOLUMEID_EROFS is not set
 # CONFIG_FEATURE_VOLUMEID_EXFAT is not set
-CONFIG_FEATURE_VOLUMEID_EXT=y
-CONFIG_FEATURE_VOLUMEID_F2FS=y
-CONFIG_FEATURE_VOLUMEID_FAT=y
+# CONFIG_FEATURE_VOLUMEID_EXT is not set
+# CONFIG_FEATURE_VOLUMEID_F2FS is not set
+# CONFIG_FEATURE_VOLUMEID_FAT is not set
 # CONFIG_FEATURE_VOLUMEID_HFS is not set
 # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
 # CONFIG_FEATURE_VOLUMEID_JFS is not set
@@ -748,7 +744,7 @@ CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
 # CONFIG_FEATURE_VOLUMEID_REISERFS is not set
 # CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-CONFIG_FEATURE_VOLUMEID_SQUASHFS=y
+# CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
 # CONFIG_FEATURE_VOLUMEID_SYSV is not set
 # CONFIG_FEATURE_VOLUMEID_UBIFS is not set
 # CONFIG_FEATURE_VOLUMEID_UDF is not set
diff --git a/meta/recipes-core/busybox/busybox/mount-via-label.cfg b/meta/recipes-core/busybox/busybox/mount-via-label.cfg
index 5a285de7cd..c9ae95c8c2 100644
--- a/meta/recipes-core/busybox/busybox/mount-via-label.cfg
+++ b/meta/recipes-core/busybox/busybox/mount-via-label.cfg
@@ -4,6 +4,7 @@ CONFIG_FEATURE_MOUNT_LABEL=y
 CONFIG_FEATURE_SWAPONOFF_LABEL=y
 CONFIG_VOLUMEID=y
 CONFIG_FEATURE_VOLUMEID_BTRFS=y
+CONFIG_FEATURE_VOLUMEID_EROFS=y
 CONFIG_FEATURE_VOLUMEID_EXT=y
 CONFIG_FEATURE_VOLUMEID_F2FS=y
 CONFIG_FEATURE_VOLUMEID_FAT=y
-- 
2.39.5


