Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C6FC369B8
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 07:43:02 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.14694.1744702978664385936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 00:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=UQ1fg+n0;
 spf=pass (domain: thaumatec.com, ip: 209.85.218.51, mailfrom: dse@thaumatec.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acae7e7587dso410627266b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1744702977; x=1745307777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ud0zK3OEduNrSmU+HEgAB9h0RiG6i8XehWLyrluPWls=;
        b=UQ1fg+n0+kG3d9JAAgw6ZUa7T5HHh6Gg1r4t8+LTkkCbdjtl2NHe7k/gaxqZQhwQBW
         mbyLUbIz2LoIXCnI0dpjijmmuhj1YCzxx+z3a4ceatYWPBBrrWvOF0j/e8Au2Yttpv7i
         5nLOlBMtqKOEmsZtk4NtpONI/hwyRnTd/RdDxM9hDvYjvGV8HEv6fB/dZHJhgrISyhBO
         8nozNGDbEqaMqLFG6IoxEA8E1rsCgscHRclp3W/t7xKEu6FH2tsUqp+cm+bK/PbdIlqC
         bKunj2kjlsGslEmqRTVzoTruHH2tHMSU0z4OkFZIQyFQb1NyXS3yKzD85YfbDEHbVRYS
         cRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702977; x=1745307777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ud0zK3OEduNrSmU+HEgAB9h0RiG6i8XehWLyrluPWls=;
        b=ED1f+y8m3LGw4NEh9kYhMbId9U+nKJnnpBIflsEAMcOoezCKf8Bbiw6Hl8dgzA7SWF
         HAHn669+ZaEbI//dtHcsucQelbcW2pnBRM+nrISMuBhZHd1B07XQWYqjgi8g34op2qnW
         PGN6TMvMM3tg4+mUYbXNUeKEUl+MVgwtY+02dMN8fWMJ1ep9cK19Bgi5TWPPkA8ToDkO
         h3+vyleGnW+dYIdUegQK5L/LVBUyiQCViQRqYufgnycQv2+wQfFppf3cb6D+cCrj1WA3
         rEiBsl2UA4xGmmg3BWo3y8sm541/bSNqN9eGQGSkuH9PwTWPxKA8gT49+tr4ST4qSKIE
         To+w==
X-Gm-Message-State: AOJu0Yz/UeI9RjcZb6Epvk6HoEuCAbSdeir5J/IGUxtAP1GP/tUXMqZ0
	e406ioXhluAfrKD1BJp74mc5tU9bRhUUHCPR3d/GwABY96i8x+QbtXND3yXj0aJOF7hQW8IjLsU
	5
X-Gm-Gg: ASbGncsuJZ8jeaxyX7iwpH5CW2baXtAn2W/uX9+UsooDaT+P/QsMkbbZDc++0y5K9xk
	Cl3FTRxA2ZyU95AWHvl+f6Mc/ZsBgSuUBZvSKPPNK5IJPqNYwtK+BECMlYcqRgkQjht5VVf2Wtw
	TLV1wRJUz54ofS1Wax6AKTEUZ8LDnvvySoQVwNmikAAzo9m0ITOnmkMlyBeJ1M4O2f8QXlm64h8
	7P0/U1MOQ+1Yd+ez5mJA4xIbBWtFZ5wRvIA68sIOB3GliGqQ0GVl5rJxRCq+heV0ZP39ZCLy48S
	DlOc1Iuq+6rpzKQZTYLEwmlC+YNZ4llfWTpAzWZLBQ==
X-Google-Smtp-Source: AGHT+IHdGP88gHtCMqEsheuSf9N0+oRgHbcQkUNwaMnMrlDCQmMp7lyDPjt/AFX5SsBXa4ul2SiMUA==
X-Received: by 2002:a17:907:3d87:b0:ac1:ea29:4e63 with SMTP id a640c23a62f3a-acad34c4447mr1321033866b.26.1744702976974;
        Tue, 15 Apr 2025 00:42:56 -0700 (PDT)
Received: from fedora.. ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce72f5sm1058794966b.173.2025.04.15.00.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:42:56 -0700 (PDT)
From: Daniel Semkowicz <dse@thaumatec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Semkowicz <dse@thaumatec.com>
Subject: [PATCH v1] udev/udev-extraconf: Fix race in automount cache
Date: Tue, 15 Apr 2025 09:42:11 +0200
Message-ID: <20250415074212.2559315-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 07:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214826

Cache files with names of automounted devices were saved in /tmp
directory, but base directories for mount points are created by default
in the /run/media directory.

With systemd init manager, /tmp is mounted by the systemd service.
Udev has no dependency on /tmp and this creates a race condition.
It is possible that the block device is already present in the device
and the udev rules for automount are triggered during boot
before /tmp is mounted. In such a case, mount cache files are created
on the base file system. If the base file system is read-write,
the cached file persists after the reboot and prevents automount
on the next boot.

Use the mount base directory for storing cache files. Both mount points
and cache will be created in the same place, so there will be no race.

Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 0cbae48729..467703daa4 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -7,6 +7,7 @@
 BASE_INIT="`readlink -f "@base_sbindir@/init"`"
 INIT_SYSTEMD="@systemd_unitdir@/systemd"
 MOUNT_BASE="@MOUNT_BASE@"
+AUTOMOUNT_CACHE_DIR="${MOUNT_BASE}/.automount"
 
 if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
     # systemd as init uses systemd-mount to mount block devices
@@ -60,7 +61,7 @@ automount_systemd() {
 
     # Only go for auto-mounting when the device has been cleaned up in remove
     # or has not been identified yet
-    if [ -e "/tmp/.automount-$name" ]; then
+    if [ -e "${AUTOMOUNT_CACHE_DIR}/$name" ]; then
             logger "mount.sh/automount" "[$MOUNT_BASE/$name] is already cached"
             return
     fi
@@ -104,7 +105,8 @@ automount_systemd() {
         rm_dir "$MOUNT_BASE/$name"
     else
         logger "mount.sh/automount" "Auto-mount of [$MOUNT_BASE/$name] successful"
-        echo "$name" > "/tmp/.automount-$name"
+        [ -d "${AUTOMOUNT_CACHE_DIR}" ] || mkdir "${AUTOMOUNT_CACHE_DIR}"
+        echo "$name" > "${AUTOMOUNT_CACHE_DIR}/$name"
     fi
 }
 
@@ -126,7 +128,7 @@ automount() {
 
         # Only go for auto-mounting when the device has been cleaned up in remove
         # or has not been identified yet
-        if [ -e "/tmp/.automount-$name" ]; then
+        if [ -e "${AUTOMOUNT_CACHE_DIR}/$name" ]; then
                 logger "mount.sh/automount" "[$MOUNT_BASE/$name] is already cached"
                 return
         fi
@@ -162,10 +164,11 @@ automount() {
 		# The actual device might not be present in the remove event so blkid cannot
 		# be used to calculate what name was generated here. Simply save the mount
 		# name in our tmp file.
-		echo "$name" > "/tmp/.automount-$name"
+		[ -d "${AUTOMOUNT_CACHE_DIR}" ] || mkdir "${AUTOMOUNT_CACHE_DIR}"
+        echo "$name" > "${AUTOMOUNT_CACHE_DIR}/$name"
 	fi
 }
-	
+
 rm_dir() {
 	# We do not want to rm -r populated directories
 	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
@@ -206,7 +209,7 @@ fi
 
 if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
     name="`basename "$DEVNAME"`"
-    tmpfile=`find /tmp | grep "\.automount-.*${name}$"`
+    tmpfile=`find "${AUTOMOUNT_CACHE_DIR}" -name "*${name}"`
     if [ ! -e "/sys/$DEVPATH" -a -e "$tmpfile" ]; then
         logger "mount.sh/remove" "cleaning up $DEVNAME, was mounted by the auto-mounter"
         for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `

