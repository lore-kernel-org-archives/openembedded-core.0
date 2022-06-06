Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F86C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 09:33:23 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.30011.1654508001630546626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 02:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bkUqOE28;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id c2so17977332edf.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 02:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1E/47OM9bJ6NQbt23ei6qKU7PVv/HVGvy5uOA+X9ofI=;
        b=bkUqOE28IH7Zr+P+vAT7QOodccMfKkhyPjRwOrVFmNet0g0J82EbRUeQa6VTHktNBi
         rwMAJzMuGX/F9XTeZcfA8OH84jcNsu4eXouyDIJRMmlyuhajkt39REB0nL6xM7/iOEWG
         +9Y+/rP4uSMyPYyWMl+SanoMIXcEzPUbDGg8NsDLROdSKz7sgVwO02HBKGYXcbZs543Y
         +OG5GN9+gdvRkwPCTWWUvmyDPg4WoXt0wLxbopEVInPKely0woUL5SlNNmLEnTGQ4BSz
         c0UhVm/mY3U/dCmjzZhcUEVv1nVKjOL19L3wRHEiRO4HX/NLvFcVIrURS0SjDr/SW941
         b7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1E/47OM9bJ6NQbt23ei6qKU7PVv/HVGvy5uOA+X9ofI=;
        b=KAl0CkSrcCgMsobE+cFI3c7Dz6CVowxFWKa85d6HPY9fu7Lc4jiSMHOgC9BIdv3ZPL
         nhu65cCpS/1STI+MZzUqSsVF6T414l97ALMkrvLwcLd52MBhgiN0//+hMd+gX9CVFPwA
         dKh4dlrjKkpKe0tLt4YQfVZ7pGvtQDkb2IjkSyzB/piwyjRVnMXMSk1QTTbfY0Qw1CTv
         Ib9xC1pizWmE9/sZ/NG0yC5IG1WtD6UGLBHjKS7ELX1l2hN1M3Q0tAiP4KIz8/jIZHu9
         uZ9luZ++mzJDEUNvJJsPmgKXt76Xzay1ygNGMubDsNHNfMdWslCBbAb0cBUGySgWJLYb
         FH3Q==
X-Gm-Message-State: AOAM532VnyeYojJM+11xXH5i4RJkP/n1mmLO+xiN/KtB2JQSZZTVrhjQ
	GKjGtRZtdQGbvbwnBlI5wkH2l187qvQ=
X-Google-Smtp-Source: 
 ABdhPJwVjqte1mUaI37j1NbycIHXmcm/HtF5CCyxueqJ/OA/0vqAiGS73W+Ig1wJG5tm/6hu3Uy4DA==
X-Received: by 2002:a05:6402:249e:b0:42d:bb88:865b with SMTP id
 q30-20020a056402249e00b0042dbb88865bmr16323432eda.141.1654507999319;
        Mon, 06 Jun 2022 02:33:19 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:9439:9cc8:c7ab:ede:1498])
        by smtp.gmail.com with ESMTPSA id
 q24-20020aa7d458000000b0042aad9edc9bsm8363891edr.71.2022.06.06.02.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:33:18 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] udev-extraconf: let automount base directory
 configurable
Date: Mon,  6 Jun 2022 11:33:14 +0200
Message-Id: <20220606093314.23402-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 09:33:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166588

From: Ming Liu <liu.ming50@gmail.com>

Dont hard-code automount base directory to '/run/media', introduce a
variable MOUNT_BASE to let it configurable, like in udisks2 the mount
base is also configurable by setting option: --enable-fhs-media.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-core/udev/udev-extraconf/mount.sh | 25 ++++++++++---------
 meta/recipes-core/udev/udev-extraconf_1.1.bb  |  2 ++
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 5ba66e98e2..c8b773bc07 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -6,6 +6,7 @@
 
 BASE_INIT="`readlink -f "@base_sbindir@/init"`"
 INIT_SYSTEMD="@systemd_unitdir@/systemd"
+MOUNT_BASE="@MOUNT_BASE@"
 
 if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
     # systemd as init uses systemd-mount to mount block devices
@@ -40,7 +41,7 @@ automount_systemd() {
 
     # Skip already mounted partitions
     if [ -f /run/systemd/transient/run-media-$name.mount ]; then
-        logger "mount.sh/automount" "/run/media/$name already mounted"
+        logger "mount.sh/automount" "$MOUNT_BASE/$name already mounted"
         return
     fi
 
@@ -53,7 +54,7 @@ automount_systemd() {
         grep "^[[:space:]]*$tmp" /etc/fstab && return
     done
 
-    [ -d "/run/media/$name" ] || mkdir -p "/run/media/$name"
+    [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
 
     MOUNT="$MOUNT -o silent"
 
@@ -70,12 +71,12 @@ automount_systemd() {
         ;;
     esac
 
-    if ! $MOUNT --no-block -t auto $DEVNAME "/run/media/$name"
+    if ! $MOUNT --no-block -t auto $DEVNAME "$MOUNT_BASE/$name"
     then
-        #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
-        rm_dir "/run/media/$name"
+        #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"$MOUNT_BASE/$name\" failed!"
+        rm_dir "$MOUNT_BASE/$name"
     else
-        logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
+        logger "mount.sh/automount" "Auto-mount of [$MOUNT_BASE/$name] successful"
         touch "/tmp/.automount-$name"
     fi
 }
@@ -93,7 +94,7 @@ automount() {
 	# configured in fstab
 	grep -q "^$DEVNAME " /proc/mounts && return
 
-	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
+	! test -d "$MOUNT_BASE/$name" && mkdir -p "$MOUNT_BASE/$name"
 	# Silent util-linux's version of mounting auto
 	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
 	then
@@ -113,12 +114,12 @@ automount() {
 		;;
 	esac
 
-	if ! $MOUNT -t auto $DEVNAME "/run/media/$name"
+	if ! $MOUNT -t auto $DEVNAME "$MOUNT_BASE/$name"
 	then
-		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
-		rm_dir "/run/media/$name"
+		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"$MOUNT_BASE/$name\" failed!"
+		rm_dir "$MOUNT_BASE/$name"
 	else
-		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
+		logger "mount.sh/automount" "Auto-mount of [$MOUNT_BASE/$name] successful"
 		touch "/tmp/.automount-$name"
 	fi
 }
@@ -157,5 +158,5 @@ if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [
 
     # Remove empty directories from auto-mounter
     name="`basename "$DEVNAME"`"
-    test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
+    test -e "/tmp/.automount-$name" && rm_dir "$MOUNT_BASE/$name"
 fi
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 7da04379c0..2b908ac05b 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}"
 
+MOUNT_BASE = "/run/media"
 
 do_install() {
     install -d ${D}${sysconfdir}/udev/rules.d
@@ -31,6 +32,7 @@ do_install() {
     install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
     sed -i 's|@systemd_unitdir@|${systemd_unitdir}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
     sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
+    sed -i 's|@MOUNT_BASE@|${MOUNT_BASE}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
 
     install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
 }
-- 
2.25.1


