Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF14C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:28:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.23780.1641767281209599069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mAJOLD5b;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so4163968wme.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdXAw8kjS4PxKeKVEO56au29PI2b9Pm/+Lv1tNSXf5g=;
        b=mAJOLD5b73Pf8/1HYRBm52WVQ8K0WkGm97UuUtRyJjmj3ydpsdQZUCAej4OSeONrmT
         n9FrfTWKgq6DPbsMLz8WOLfbwj6xHoTncldwvGmfN0wLignZK9ICZSRZzrwsl1xXrj+M
         +pCqB0kdlNSH7nIVkY94Gp6f+EBobbagHZ4n28ADAXTihQMoHx311ZfWOcQC1E/SvPmu
         CFtZjHQEJSqkN0dwYSvyYPRC+nxCz4AW9uoGe1ANRNvj6wIxJ5kHSto/+ioCB3SeA5+A
         igaOzNGW3Ht2LpwS/ecipx7Ko55RRYt+xDK1DbJcsS56JhgUQ74MrVM2WqT8VUzqNHfu
         2rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdXAw8kjS4PxKeKVEO56au29PI2b9Pm/+Lv1tNSXf5g=;
        b=m2KtmvzPm5e0doQMxeqCv9jFt0MqKxcRPvIKNWNmB5XBnQadS15N0HPxD0U/S55JVx
         JJ4x6osgzai0BnE5pIEkLfaLhQSCWivteZbtW9RQiNTUapbxiH+N+5kOwLvTGcFcDy6W
         JZDjtWoZbH39fv89rXa0ADUs7gozb9dxfdv+7a39h6MGwJ0z0SAQDMLUWru7FJ8fFpdw
         Tw88MoOIwkEXQHKHhzcboRNd6pL+qX7LA+SZnZ8mhMjvgNUvdDMA8bRHC112I3FAIPIL
         FgSafDJFci9q/NejMolDQE9nBXDGydhcGkIz4arw7l7y87d+rVXJtlMuWUdiG/zufURL
         eEnQ==
X-Gm-Message-State: AOAM532poJ8SSKCVLJmyskOfz7PUL7PyxJZhHk0u5XqXHqV5mF1us9l3
	DaWNAQNyidjK7mo0iDiNxZ6Zjb67mrU=
X-Google-Smtp-Source: 
 ABdhPJw4GlaFVAA6jbIb8tjIGG3xKkJCRJZ1DV7D/LuDK0jHYYC0vuFebNHDFJT5XSDTW865InzKfw==
X-Received: by 2002:a05:600c:1da5:: with SMTP id
 p37mr19903489wms.59.1641767279783;
        Sun, 09 Jan 2022 14:27:59 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/14] connman: do nothing in qemu, do not touch eth0
Date: Sun,  9 Jan 2022 23:27:31 +0100
Message-Id: <20220109222732.2252416-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160316

qemu kernel itself is nowdays perfectly capable of setting up
what was passed in via ip=:

[    1.676847] IP-Config: Complete:
[    1.677768]      device=eth0, hwaddr=52:54:00:12:34:02, ipaddr=192.168.7.2, mask=255.255.255.0, gw=192.168.7.1
[    1.679933]      host=192.168.7.2, domain=, nis-domain=(none)
[    1.681201]      bootserver=255.255.255.255, rootserver=255.255.255.255, rootpath=
[    1.681203]      nameserver0=8.8.8.8

connman-conf only does the same thing again by (badly and incompletely)
parsing those parameters with sed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 meta/conf/layer.conf                          |  1 -
 .../connman/connman-conf.bb                   | 36 -------------------
 .../qemuall/wired-connection.service          | 10 ------
 .../connman/connman-conf/qemuall/wired-setup  | 16 ---------
 .../connman/connman-conf/qemuall/wired.config |  9 -----
 meta/recipes-connectivity/connman/connman.inc |  6 ++++
 .../connman/connman/connman                   |  5 ++-
 .../connman/connman_1.40.bb                   |  1 -
 9 files changed, 8 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ab7915482a..ace9894c46 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -97,7 +97,6 @@ RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-cmake = "Pascal Bach <pascal.bach@siemens.com>"
 RECIPE_MAINTAINER:pn-cmake-native = "Pascal Bach <pascal.bach@siemens.com>"
 RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-consolekit = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-core-image-base = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b3cc8a249e..d51ec1dc44 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -27,7 +27,6 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   opkg-arch-config \
   netbase \
   init-ifupdown \
-  connman-conf \
   formfactor \
   xserver-xf86-config \
   pointercal-xinput \
diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
deleted file mode 100644
index 006f976997..0000000000
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Connman config to setup wired interface on qemu machines"
-DESCRIPTION = "This is the ConnMan configuration to set up a Wired \
-network interface for a qemu machine."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
-
-inherit systemd
-
-SRC_URI:append:qemuall = " file://wired.config \
-                           file://wired-setup \
-                           file://wired-connection.service \
-"
-PR = "r2"
-
-S = "${WORKDIR}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-FILES:${PN} = "${localstatedir}/* ${datadir}/*"
-
-do_install() {
-    #Configure Wired network interface in case of qemu* machines
-    if test -e ${WORKDIR}/wired.config &&
-       test -e ${WORKDIR}/wired-setup &&
-       test -e ${WORKDIR}/wired-connection.service; then
-        install -d ${D}${localstatedir}/lib/connman
-        install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/lib/connman
-        install -d ${D}${datadir}/connman
-        install -m 0755 ${WORKDIR}/wired-setup ${D}${datadir}/connman
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 ${WORKDIR}/wired-connection.service ${D}${systemd_system_unitdir}
-        sed -i -e 's|@SCRIPTDIR@|${datadir}/connman|g' ${D}${systemd_system_unitdir}/wired-connection.service
-    fi
-}
-
-SYSTEMD_SERVICE:${PN}:qemuall = "wired-connection.service"
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
deleted file mode 100644
index 48adfc08ac..0000000000
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Setup a wired interface
-Before=connman.service
-
-[Service]
-Type=oneshot
-ExecStart=@SCRIPTDIR@/wired-setup
-
-[Install]
-WantedBy=network.target
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
deleted file mode 100644
index c46899ef32..0000000000
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-CONFIGF=/var/lib/connman/wired.config
-
-# Extract wired network config from /proc/cmdline
-NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([^ ]*\):\([^ ]*\):\([^ ]*\):\([^ ]*\).*$/\1\/\4\/\3/p'`
-
-# Check if eth0 is already set via kernel cmdline
-if [ "x$NET_CONF" = "x" ]; then
-	# Wired interface is not configured via kernel cmdline
-	# Remove connman config file template
-	rm -f ${CONFIGF}
-else
-	# Setup a connman config accordingly
-	sed -i -e "s|^IPv4 =.*|IPv4 = ${NET_CONF}|" ${CONFIGF}
-fi
diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
deleted file mode 100644
index 42998ce897..0000000000
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
+++ /dev/null
@@ -1,9 +0,0 @@
-[global]
-Name = Wired
-Description = Wired network configuration
-
-[service_ethernet]
-Type = ethernet
-IPv4 =
-MAC = 52:54:00:12:34:56
-Nameservers = 8.8.8.8
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 748eefa748..07049fbf21 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -101,6 +101,12 @@ do_install:append() {
     fi
 }
 
+# Kernel IP-Config is perfectly capable of setting up networking passed in via ip=
+do_install:append:qemuall() {
+    mkdir -p ${D}${sysconfdir}/default
+    echo "export EXTRA_PARAM=\"-I eth0\"" > ${D}${sysconfdir}/default/connman
+}
+
 # These used to be plugins, but now they are core
 RPROVIDES:${PN} = "\
 	connman-plugin-loopback \
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index c64fa0d715..310a696863 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -27,7 +27,6 @@ while read dev mtpt fstype rest; do
 done
 
 do_start() {
-	EXTRA_PARAM=""
 	if test $nfsroot -eq 1 ; then
 	    NET_DEVS=`cat /proc/net/dev | sed -ne 's/^\([a-zA-Z0-9 ]*\):.*$/\1/p'`
 	    NET_ADDR=`cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'`
@@ -36,13 +35,13 @@ do_start() {
 		if [ "$NET_ADDR" = dhcp ]; then
 		    ethn=`ifconfig | grep "^eth" | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
 		    if [ ! -z "$ethn" ]; then
-			EXTRA_PARAM="-I $ethn"
+			EXTRA_PARAM="$EXTRA_PARAM -I $ethn"
 		    fi
 		else
 		    for i in $NET_DEVS; do
 			ADDR=`ifconfig $i | sed 's/addr://g' | sed -ne 's/^.*inet \([0-9.]*\) .*$/\1/p'`
 			if [ "$NET_ADDR" = "$ADDR" ]; then
-			    EXTRA_PARAM="-I $i"
+			    EXTRA_PARAM="$EXTRA_PARAM -I $i"
 			    break
 			fi
 		    done
diff --git a/meta/recipes-connectivity/connman/connman_1.40.bb b/meta/recipes-connectivity/connman/connman_1.40.bb
index edb23a1267..84cc3959d1 100644
--- a/meta/recipes-connectivity/connman/connman_1.40.bb
+++ b/meta/recipes-connectivity/connman/connman_1.40.bb
@@ -11,5 +11,4 @@ SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_nin
 
 SRC_URI[sha256sum] = "1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12"
 
-RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.20.1


