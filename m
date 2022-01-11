Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2853CC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:14:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.15045.1641939289329851560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZpRV0rB0;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id l25so739537wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mjoWR7x+sP1eprcLgQUcVKNvTDb5AFiY2I5J7E9BpK4=;
        b=ZpRV0rB0MI0oVecrGOQWCZ7VsF0eVEJySfV/+QRPEE0FXnMCTlhp6ORZhrm/fAuZ1q
         UtOuPuGF4uOW19f15o28VcxysDe4AUPaib7WNM8a6mdUnYLTjSfYUfQUOi9c091OW8Os
         J2HNLJihvmrYa6DwVt3o7GhpcpoHyv/OZO1P0EgEPmnjfoBFEOhmle0aPPh5WaCAP4Eh
         b+pvXchhmLBfIXpwyJMuJ0HnMNMQ8Dx5FlUFmGjNtYL5aqxE77kmzoB5oxujU4I05CN/
         AJhIJ4YSdw7cKBY7VDPJFZ522YcPL+dasv4/vdT6fMfYBzgesuYjHNaelPaajQFYm/Cp
         9keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mjoWR7x+sP1eprcLgQUcVKNvTDb5AFiY2I5J7E9BpK4=;
        b=NRXpO7Cp26dYHiKuPmVKb9bnW0rvgFQHloeZG8m9k+GUAdiS2AjU3PTm9PXBlyZT2B
         8KP8pqrAgcadhz4SVaYCAH68c5ZgBUdPzOrI91ruQ1kWsBTD996Hqt6xeUih6ko0+cEt
         BUP1JLtHOqF7mTUEcbgwh5QO6zTs9JhNkXUhxGkbK3Vi68bqNDxhpkfAPNsPFO1lht1z
         eVZcv/CCPS+7h+RUeyvUXJ+JX8gxIlfq+T75y1/mcPfRxRLAX4fFIr4xhkAPAbM9YmWk
         X8kkKC1XkSgkpcTYDVEZ1ck46NpbmvQ1UxNeVus+tLWeiOVKFW974TmmKhNK+YEtajV4
         zv9w==
X-Gm-Message-State: AOAM532CSwGp/JT1A1MnmYi2EV0jMu+Xw0tyRHbClVO83Gb71ecm6bzn
	5jEc11UmqvDgVvaJB4faV4ilwfLqCPs=
X-Google-Smtp-Source: 
 ABdhPJx5pK0nu8+ZBp5CzmYDD2cQfwv4vA7/9u6Bpa74FyTHSGNO1Il2/oOYszgVqXjtTDkpCaTuEQ==
X-Received: by 2002:adf:e44a:: with SMTP id t10mr5585197wrm.342.1641939287911;
        Tue, 11 Jan 2022 14:14:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id f5sm356997wri.52.2022.01.11.14.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 14:14:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] connman-conf: do nothing in qemu, do not touch eth0
Date: Tue, 11 Jan 2022 23:14:39 +0100
Message-Id: <20220111221440.3867495-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220111221440.3867495-1-alex@linutronix.de>
References: <20220111221440.3867495-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 22:14:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160468

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
 .../connman/connman-conf.bb                   | 33 +++++--------------
 .../qemuall/wired-connection.service          | 10 ------
 .../connman/connman-conf/qemuall/wired-setup  | 16 ---------
 .../connman/connman-conf/qemuall/wired.config |  9 -----
 .../connman/connman/connman                   |  5 ++-
 5 files changed, 10 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-connection.service
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
 delete mode 100644 meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 006f976997..97ac49818c 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -1,36 +1,19 @@
-SUMMARY = "Connman config to setup wired interface on qemu machines"
-DESCRIPTION = "This is the ConnMan configuration to set up a Wired \
-network interface for a qemu machine."
+SUMMARY = "Connman config to ignore wired interface on qemu machines"
+DESCRIPTION = "This is the ConnMan configuration to avoid touching wired \
+network interface inside qemu machines."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
-inherit systemd
-
-SRC_URI:append:qemuall = " file://wired.config \
-                           file://wired-setup \
-                           file://wired-connection.service \
-"
 PR = "r2"
 
 S = "${WORKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FILES:${PN} = "${localstatedir}/* ${datadir}/*"
+FILES:${PN} = "${sysconfdir}/*"
 
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
+# Kernel IP-Config is perfectly capable of setting up networking passed in via ip=
+do_install:append:qemuall() {
+    mkdir -p ${D}${sysconfdir}/default
+    echo "export EXTRA_PARAM=\"-I eth0\"" > ${D}${sysconfdir}/default/connman
 }
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
-- 
2.20.1


