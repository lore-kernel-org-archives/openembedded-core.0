Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A87C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.28226.1658155764587267173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=g1f/H3aW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id b2so9227567plx.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yxgmJNG1YOZxoL1NIo+a72tJBKGHuoiRnb1LQPnuO6A=;
        b=g1f/H3aWs4rNRV3YGtkt079SvelByIC0UiOZhVBf+V9x+XNOF+4SjyNNPDcQg5xJsj
         6bZaPG8sycwddnGTWhXGBRZqBq0LdefLgYZOWtrC6b3qaJoVrM8AI5B8080Dsik2r7M1
         vxas0onsFYwGpjEqFRMlD0nUXYmaT4KcWSZmQSYRanivWWVpzqgPRvSh4OxIVAcDJGY/
         2Iyw13PzPM7G2kNLaWqcgTVa5QG6CGr+ThZ3FKHp5ltGjN9f+EKSifjTjeXrqiwMaNSL
         55OUdwPOrlY3B65EnONiftB97j5wDyENtxZpSyism95IfDV0mA/9kXp1Et618CQfJTft
         hFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yxgmJNG1YOZxoL1NIo+a72tJBKGHuoiRnb1LQPnuO6A=;
        b=PhtH6YQQdwmR+zB/06E6HVhXvG9rpTZ+y2OtdZlepIzYQGMQIVXrZ9Sx5Xwb0DnZwk
         4WuzXqnET+YERoZ3w20BzmrxvUZK/VLPOZoSYC0CspFnM6eyREDHJw/Wg/dYI7VUy6vA
         zsjWjCsCspTS1Vu+Mbefz8oK3+Ot6dmL47ijezvHRoplwo4YvpYN/nqaSgC9ZT5oiapc
         j8iRX5Wy5g0U22ZJHvUMK5iuaAAB+1upcmoXqXaoD08Hd+iGF5rA7Hj1A8i5/sQx6eLs
         9Da0esgEMHqQq3D58HuNPduXB5O624dFW96CQbNsKl2h6xPt66beLh6LRhe88Rbl28+i
         HP0Q==
X-Gm-Message-State: AJIora+DchBP6IyiOXB1yTsl7wGMLMyN8yHQ6DR8C2JuhKX1pF62jAfE
	BLaGFn7aBBNpOd2Q1THs+8ccKj82c787ouiG
X-Google-Smtp-Source: 
 AGRyM1u/CCC4XiFRb2m/MvL2Uq4pOWGFTIA6/HvCOd1fr7ZvOCdFlV4RG8RB3ucuvmMVh7TWTaas1g==
X-Received: by 2002:a17:90b:1d8a:b0:1f0:6083:5d80 with SMTP id
 pf10-20020a17090b1d8a00b001f060835d80mr37978767pjb.147.1658155768179;
        Mon, 18 Jul 2022 07:49:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/35] udev-extraconf: let automount base
 directory configurable
Date: Mon, 18 Jul 2022 04:48:29 -1000
Message-Id: 
 <c021f5592c3d920eda1bfc10c099ad1484e9c0ce.1658155579.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/168204

From: Ming Liu <liu.ming50@gmail.com>

Dont hard-code automount base directory to '/run/media', introduce a
variable MOUNT_BASE to let it configurable, like in udisks2 the mount
base is also configurable by setting option: --enable-fhs-media.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f077befd5f36ad88623aaf6a38b1a837ecb18650)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


