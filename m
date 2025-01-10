Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8ADDE77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 16:01:10 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.22343.1736524868358959997
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 08:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T0Dtx7WI;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f2e13cb359so636434eaf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736524867; x=1737129667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1zHlxSl2D5npdlNMDxREqRdAhoyGS7onhMIi9J79DWE=;
        b=T0Dtx7WIQwepPmVxIlY/qnawfIWuwYTDM3CqwyRLLCUdhGHaujH3rL01vzbMBI9q6k
         BAtthA0XI7UHc+IMSH6g0/QVUVO+OXmoOptP6Xt74h9p589HVJX2UhYUya6KFei4eCSl
         JpKjuYgFjAb0uCi6Hn7vPj2+JVM2X9ikpwqohQpqxKvIuVAU25rh7g3/1YsNADtXhcuU
         TpUetAVn2gjwOnQMT0//uGUvx8y5mHStn3tr+bDJhM6Gp7hAj3K81g0D23/nRV24S/eu
         jjv8I/MsOPWAajqPi3MmOXSnB4CVXRRavC0VS/fomSF9O2AAptha7FQaFC54Cy2V0y7v
         e41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524867; x=1737129667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zHlxSl2D5npdlNMDxREqRdAhoyGS7onhMIi9J79DWE=;
        b=wNL1365wwp7LRifrB5pMHtrIUSUGc/S5fyGpCPw0eY4m2OvsIiriSVQMmFKTZTq7rl
         /OjNRZWkF/UqIzg9Q+vxCkGFkzAYOm8EOkZHPOiDj6hfbNkWV+tofl+2xjn+jQ0IgdyI
         rCDwbf+uXHMZyoPlFon2NAA2/JNDI0Hj5GMqJoYsowqsvKgsoOrD3KT3LmiQT7y9YFsp
         kTIqI7YGUhmZAbzhnuRB+P/N5/QeJQFx28n70ThcQfCLLCy0UyCtEc57cENhduYF+enr
         R8YjzY61Tjqo0t4wfwAQmehHbHXln9QUFbnm9HcxAUyADLxKs4JW2cLs25yLcREocs4E
         p6mQ==
X-Gm-Message-State: AOJu0YxD11et/A7nwycuQRk/fxloHtmraCCQyrFe/+/ltnRCpQS7/2OB
	dpH21QVJlOb8HqkYWeBwnGHCyZnbqkcBsA5LJFwkVmMQwJs9/2HvgbXurg==
X-Gm-Gg: ASbGnct+lDwojgxs1dkEcan2orHcNYrYMFex2dV2ycpHOWqxT0xRKKgQDCUDn0mjR1G
	370rs2R/r/y8aD38M8b5R4TWodpLaoF+GFFIGxZNVR8HZ+QZ5UUtec0StXWJqHz61NWkZFP8yIg
	ArBGhk3CC/2cbidgbHb4IBCrtVPtQoMXPVeKwv2x5Rvmwrs2Hjb3PCKsRcrHle+caWWesGTxPgR
	oeFh64BeDWxVnJweZcv9nq6KGddc9Jfe4EEg9XNmLpUFb1mam4SAv8=
X-Google-Smtp-Source: AGHT+IEcw9SP5NWHIzPpUF8qIS/lZ2WE+gKmw9wnWlhoTVWZJmDUaDVlkRoFdTt5h+YqwENzy96rng==
X-Received: by 2002:a05:6870:7008:b0:29e:14ff:2f9c with SMTP id 586e51a60fabf-2aa06719715mr6005696fac.18.1736524865469;
        Fri, 10 Jan 2025 08:01:05 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::22a5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad809a759dsm991184fac.33.2025.01.10.08.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 08:01:03 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] udev-extraconf: Allow FAT mount group to be specified
Date: Fri, 10 Jan 2025 09:00:55 -0700
Message-ID: <20250110160055.3527577-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 16:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209656

Adds a variable that allows the group given permissions to access FAT
mounted file systems to be specified, instead of being hardcoded to
'disk'.

As a note, the usage of 'disk' as the mount group is not a very secure
default, since the disk user usually has read/write access to all block
devices in /dev/, meaning that adding a user to this group for the
purpose of accessing FAT file systems effectively gives the write access
to all block devices.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 8 ++++----
 meta/recipes-core/udev/udev-extraconf_1.1.bb   | 9 ++++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index eb84a468be..0cbae48729 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -83,11 +83,11 @@ automount_systemd() {
 
     MOUNT="$MOUNT -o silent"
 
-    # If filesystemtype is vfat, change the ownership group to 'disk', and
+    # If filesystemtype is vfat, change the ownership group to mount group, and
     # grant it with  w/r/x permissions.
     case $ID_FS_TYPE in
     vfat|fat)
-        MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
+        MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^@MOUNT_GROUP@:/{print $3}' /etc/group`"
         ;;
     swap)
         return ;;
@@ -138,11 +138,11 @@ automount() {
 		MOUNT="$MOUNT -o silent"
 	fi
 
-	# If filesystem type is vfat, change the ownership group to 'disk', and
+	# If filesystem type is vfat, change the ownership group to mount group, and
 	# grant it with  w/r/x permissions.
 	case $ID_FS_TYPE in
 	vfat|fat)
-		MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
+		MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^@MOUNT_GROUP@:/{print $3}' /etc/group`"
 		;;
 	swap)
 		return ;;
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 0e2abcd424..0d7e4f4f36 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -17,6 +17,7 @@ S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
 
 MOUNT_BASE = "/run/media"
+MOUNT_GROUP ?= "disk"
 
 do_install() {
     install -d ${D}${sysconfdir}/udev/rules.d
@@ -31,9 +32,11 @@ do_install() {
     install -d ${D}${sysconfdir}/udev/scripts/
 
     install -m 0755 ${S}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
-    sed -i 's|@systemd_unitdir@|${systemd_unitdir}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
-    sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
-    sed -i 's|@MOUNT_BASE@|${MOUNT_BASE}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
+    sed -e 's|@systemd_unitdir@|${systemd_unitdir}|g' \
+        -e 's|@base_sbindir@|${base_sbindir}|g' \
+        -e 's|@MOUNT_BASE@|${MOUNT_BASE}|g' \
+        -e 's|@MOUNT_GROUP@|${MOUNT_GROUP}|g' \
+        -i ${D}${sysconfdir}/udev/scripts/mount.sh
 
     install -m 0755 ${S}/network.sh ${D}${sysconfdir}/udev/scripts
 }
-- 
2.47.1


