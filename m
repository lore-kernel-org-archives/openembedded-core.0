Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D62D3A68F
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1970.1730228417928678401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tv0mmLvA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e5a62031aso4271881b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228417; x=1730833217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6Nqnu2l5zGVdp7uF2PpUbGF6V/Lpwepe5k7o8UjKaI=;
        b=tv0mmLvACAcFsCnBCSjiCyA+EoElgndHo3KE61piDd9yF8ypXOX17mxcQxFshM/LAl
         rGXtxCCXGPoNPBRO12VjN0/TgvjFk/sLx1aXyzVPU1zRuWGIoO328l9Xwg+x4X1uloQ+
         xQn6pdkYS1yYcP+Yimk76Y5fJnDccpLJvrOeM3fNT4T+FEOjhnX27x0QyhXXmMUx/h3K
         hPGlodWbkrRk/0WcRb8e3QiFL/sUQCWfOElzaoqSzmOL8Efpy4qp4d2vNToZ98tD4PSP
         O0jrj5CjCDJCvfh1OHkExnUGmDuonp3EJFU84WunxZbUkY1riCyyqk+Hw1tXrXrz4kqB
         VQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228417; x=1730833217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6Nqnu2l5zGVdp7uF2PpUbGF6V/Lpwepe5k7o8UjKaI=;
        b=nAmLpoC8gd8I2Eq6ZiVfX4j1Dh/LUqed3ttS27t3/+q19TRgburNbc2RA6JfpNi04O
         jscULJTyne1X4iHI8vCAm0A0qFiAheiCtsYKWIrj9dYvdbAxqCVp6NFumowWV0I2jDZN
         ngZMSwnmmq34NcI1YDhJK+D86lIumPqCmlQkXBxmFBc90x4KVSdwbvlg6gwXpd0SuVdk
         7nSgEu37UHeLITFbET7nVVFZMYh68XZirTp9JaCKKKUQJFpX31voS0cbNxCWFNnxyvdZ
         uCH8m7SZiAhv4C1BpmUQ3PigSLBWcNEWfMMWQ/pbaqCWWhTNB14fJogX3XIglUBkziEb
         uCgg==
X-Gm-Message-State: AOJu0Ywxi6kv5NwHLyfcLfAnLutjpLa8qraoJQ2yfJLXdDsaT6pqfs0k
	oXVpZ4omCHRRLPLt1lnG5feMkw+Vz6rpcaPLiUzhoaTzvf2IFL7sqy8EndX3FcsxibIrNHbz3uu
	X
X-Google-Smtp-Source: AGHT+IHgfYdPvYbLSjAh6cJLN4HmwG+2PJNkp57MBkAIVGpbnJSIpOVGG2uuSw5RErCPzWPfY8M8uw==
X-Received: by 2002:a05:6a00:3a1a:b0:71e:2a0:b0b8 with SMTP id d2e1a72fcca58-72062f4becbmr17129384b3a.1.1730228417196;
        Tue, 29 Oct 2024 12:00:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/19] overlayfs-etc: add option to skip creation of mount dirs
Date: Tue, 29 Oct 2024 11:59:43 -0700
Message-Id: <302dd4a63f97e23631a62a0b902cc253f6843ab0.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206520

From: "baruch@tkos.co.il" <baruch@tkos.co.il>

The 'preinit' script can't create mount directories when rootfs is
read-only. Add an option to skip this step. The user must make sure that
all required directories are already in the rootfs directory layout.

Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3d433d8559467d255bd19af2d0999c65ea24a48d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/overlayfs-etc.bbclass     |  5 ++++-
 meta/files/overlayfs-etc-preinit.sh.in | 16 +++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-etc.bbclass
index 40116e4c6e..7096aae1a8 100644
--- a/meta/classes/overlayfs-etc.bbclass
+++ b/meta/classes/overlayfs-etc.bbclass
@@ -35,6 +35,7 @@ OVERLAYFS_ETC_USE_ORIG_INIT_NAME ??= "1"
 OVERLAYFS_ETC_MOUNT_OPTIONS ??= "defaults"
 OVERLAYFS_ETC_INIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-etc-preinit.sh.in"
 OVERLAYFS_ETC_EXPOSE_LOWER ??= "0"
+OVERLAYFS_ETC_CREATE_MOUNT_DIRS ??= "1"
 
 python create_overlayfs_etc_preinit() {
     overlayEtcMountPoint = d.getVar("OVERLAYFS_ETC_MOUNT_POINT")
@@ -56,6 +57,7 @@ python create_overlayfs_etc_preinit() {
     initBaseName = oe.path.join(d.getVar("base_sbindir"), "init")
     origInitNameSuffix = ".orig"
     exposeLower = oe.types.boolean(d.getVar('OVERLAYFS_ETC_EXPOSE_LOWER'))
+    createMoundDirs = oe.types.boolean(d.getVar('OVERLAYFS_ETC_CREATE_MOUNT_DIRS'))
 
     args = {
         'OVERLAYFS_ETC_MOUNT_POINT': overlayEtcMountPoint,
@@ -63,7 +65,8 @@ python create_overlayfs_etc_preinit() {
         'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
         'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
         'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigInit else initBaseName,
-        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"
+        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false",
+        'CREATE_MOUNT_DIRS': "true" if createMoundDirs else "false"
     }
 
     if useOrigInit:
diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayfs-etc-preinit.sh.in
index 8db076f4ba..b05e3957a3 100644
--- a/meta/files/overlayfs-etc-preinit.sh.in
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -3,12 +3,15 @@
 echo "PREINIT: Start"
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
-mount -o remount,rw /
-
-mkdir -p /proc
-mkdir -p /sys
-mkdir -p /run
-mkdir -p /var/run
+if {CREATE_MOUNT_DIRS}; then
+    mount -o remount,rw /
+
+    mkdir -p /proc
+    mkdir -p /sys
+    mkdir -p /run
+    mkdir -p /var/run
+    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
+fi
 
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
@@ -20,7 +23,6 @@ UPPER_DIR=$BASE_OVERLAY_ETC_DIR/upper
 WORK_DIR=$BASE_OVERLAY_ETC_DIR/work
 LOWER_DIR=$BASE_OVERLAY_ETC_DIR/lower
 
-mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
 if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
     -o {OVERLAYFS_ETC_MOUNT_OPTIONS} \
     {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
-- 
2.34.1


