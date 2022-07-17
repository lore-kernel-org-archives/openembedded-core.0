Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52976CCA485
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:15 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.15573.1658062627861176877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gYyAURiw;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id n18so15221878lfq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TzHxw6UFRSajqbmNIrEA8MPjuLNxiX/LnsXdeSc3BYc=;
        b=gYyAURiwPKUWM1r5kIXsn6qr3Zc5Uz3eHKupuMTnesM6AT1R006hgzxc023khJCKcj
         A9ZxmCPKg32rUz2+2iA3fdyD2uyMUeXWMXAXf/mNysrUgc6/u/8G2vuLa7E+hWIxVrwU
         h0YgjMlBg+3Rv8Y+s+S6xjg0+CbfqfYg1Fr1wmM04tcMoeI2h4/NvxQuYdXt+5C4IToM
         M3HtBKvVoZ4JnJnCJzlcJtCCi2/dxmrTgJWAqpQtGminMOoFtdEcPD5qim+4j1mlHsHT
         tU+F09S+x0KsxCAOxZL9Qi9/e9MdBXSSU6DU8pUx3IgqPK+RLNRhxhPVU9urFEp7GTFv
         S23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TzHxw6UFRSajqbmNIrEA8MPjuLNxiX/LnsXdeSc3BYc=;
        b=MZYf4w/41vnmaVoa0sNvbD1HjW75l1Wc9ty+k0+8dDJagW2E57EqDjP6au6r4HMpUK
         DR2icPA7miN2404CqkbhNAbaAgDuUtfCjyhrmhWwHlJly+Tqma+wDGsiGYkAIQI7EJcJ
         7pTF1sScIHYuc+jd+AR76vGw4JjHJAD3Zk04LxIpxnIFJSKGZmKmVJQEZVbNgBXAjhOg
         Q86dHau0wSmKzMxygifir6vbtjCzNvAsbOaExV9s+EDhlUicZ6cpDZdFllHruoq4Z6+7
         Ec3ZFX2Ej5XxIMZumDbpj+Po6EbxHchcAdifGmNWmoZ9v3ThQe5gGH/bgmeqXm9G7xIp
         WbAw==
X-Gm-Message-State: AJIora8yKHXnCXsAzq7C7dxrOEvRw+BhIOAoncs2QjNo8JtgFtJKXQQo
	rftPfH04/1+gS581SFgDngMfAexcBXo=
X-Google-Smtp-Source: 
 AGRyM1v/lpj7h3lD/iMZ/+rNyySkvZ/KIUjD77sR9aKy2yZ3sstrIS8lsA/R5gjYoSJpzZtZm9yitg==
X-Received: by 2002:a19:4f0c:0:b0:48a:1dcf:9b64 with SMTP id
 d12-20020a194f0c000000b0048a1dcf9b64mr7329069lfb.120.1658062625655;
        Sun, 17 Jul 2022 05:57:05 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:57:05 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ming Liu <liu.ming50@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [kirkstone] [PATCH 2/9] udev-extraconf: let automount base
 directory configurable
Date: Sun, 17 Jul 2022 14:56:41 +0200
Message-Id: <20220717125648.2942046-3-liu.ming50@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/168150

From: Ming Liu <liu.ming50@gmail.com>

Dont hard-code automount base directory to '/run/media', introduce a
variable MOUNT_BASE to let it configurable, like in udisks2 the mount
base is also configurable by setting option: --enable-fhs-media.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f077befd5f36ad88623aaf6a38b1a837ecb18650)
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


