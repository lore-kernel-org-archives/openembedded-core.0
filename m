Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89324C44502
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:46 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139207.1783291364875117975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JAOcJHfs;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-474560436c3so2305802f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291363; x=1783896163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cWth7lRGFmMDqsp0T3PbEzeOqvQ/TgySl/uJ1sUhww=;
        b=JAOcJHfsC0bhB+Oaa1cNa5vfe/9HHZMWrbxsiN2vSpWTf6+ogRol/dMtXFumYCAyK+
         +qkyxNCPZKPBOmHWFNJmHyIEVNozPTxgYb5+68939R/cabu/von9vwzcaEqG/EWj2ADp
         EzT83lxeB+Q7Hvxf3VPhfQTFxICXZ1B7uUl9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291363; x=1783896163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+cWth7lRGFmMDqsp0T3PbEzeOqvQ/TgySl/uJ1sUhww=;
        b=Ohb2gF9R0MovdAEknCMUgbregOrSQfkMituD0h+G76jcTiEf6s2XcbVa59Nlwv+zpv
         /UzDkdNnbVLtpqv1EtyBKCqZvTNkIaoqzBUApLJfrz9TQiOf12ZOITPDYuN0iy7xlqSF
         /r4FXOtzRcd6BQSBW3srG1DkGsGL4KvQtpsu+XfMWMlctxi3+5OUPVHsCdfKK8iv7J/i
         tmuYtJkDyV3fWkZQRuaa3sACzPKAGGpGEKKHdjU2mED3u1JB0ZDntiuJlFG2YBDMFMmd
         j11VY18mQjSYU1cevfxbldVAORCfJN9CvbihjK9AYoF4DuUyX4p1DKodpI/lSPW9xBQK
         sArw==
X-Gm-Message-State: AOJu0YxTmmwLDYEIPkanAA5sSru6DtFaFJKdKfJ9pWv2AVbE0fc58nlH
	CRpPObWMja9ZWn76HHB28oZUJXUQFrBmCdylEc+W4eDlTZMohw8XiXQB0hkTkHSr0HGBVfB1hF5
	LkSzFKNg=
X-Gm-Gg: AfdE7cnWPwu93mqgFIK9Gn6Lv0D/cyIWZilcyTzDPxHoksvb4XqlYAoUlp1dxx4yJN8
	ixUxCVZ9PJzFz8Hzgjb8l8eshHjMZor/iprqJUN1zv9KuKSK2E2MwAX0ntE9K+pSTaIeTKH3pYA
	bKp8XQceB0SjnLSAUmcu0r2Ip6kyLTcWNmjy11bVnJQ1UhJUE3HokTyhxTUH+og85Mm0Hg+AJOe
	74zCpyHlVUE0uVZLeMpyxyB3tQ6aW6PnRYKtxdE/Kf/fnp/oUyTYGWYWtfOam4NxHiKJTPNua9v
	3YsvM8KMMPBghkeTsAaJIF/RqbK5nZv5O+yjzgqXt/uiz4KMHg/Y3csj5b01PvC7MprxsyGOtdo
	t59TBO3k8TYBnuBzLnPRmhgW22k5u0hmRwUBppy07QANpjGQINxxWe3gIkO0a5SxB/eLts3nrbA
	NW/Ht5tMngmAv9ZBJBZtRTTsxFEA==
X-Received: by 2002:a05:6000:4805:b0:474:9991:60d0 with SMTP id ffacd0b85a97d-47aaa516fcfmr10457552f8f.12.1783291362734;
        Sun, 05 Jul 2026 15:42:42 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/55] bluez5: set L2CAP IMTU for OBEX profile listeners
Date: Mon,  6 Jul 2026 00:40:54 +0200
Message-ID: <f355092d9193c3dc0b17f0e5c6388ebf3fe798a9.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240158

From: Wei Deng <wei.deng@oss.qualcomm.com>

Backport upstream fix that adds an imtu field to default_settings for
OBEX profiles (OPP, FTP, PBAP, MAS, MNS) and applies it to the L2CAP
listening socket via bt_io_set(). Without this, the listening socket
advertises the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,
limiting the peer's outgoing PDU size and degrading Rx throughput.

Upstream-Status: Backport [bluez/bluez@646014a]
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
(cherry picked from commit 13cb97f6279e71320f6454fd5b89c3845b826c49)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...2CAP-IMTU-for-OBEX-profile-listeners.patch | 118 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 4e51cc9a213..ad07e0d3c4f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -74,6 +74,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch \
            file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
+           file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
new file mode 100644
index 00000000000..332b11464eb
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
@@ -0,0 +1,118 @@
+From 646014a6a246fe99df27da12d2de7bcd2e04d0df Mon Sep 17 00:00:00 2001
+From: Wei Deng <wei.deng@oss.qualcomm.com>
+Date: Thu, 4 Jun 2026 15:00:24 +0530
+Subject: [PATCH] profile: Set L2CAP IMTU for OBEX profile listeners
+
+The default_settings entries for OBEX profiles (OPP, FTP, PBAP, MAS,
+MNS) have no imtu field, so ext_start_servers() creates the L2CAP
+listening socket without an explicit IMTU. This causes the socket to
+advertise the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,
+limiting the peer's outgoing PDU size and degrading Rx throughput.
+
+Add an imtu field to default_settings and set it to 32767 for all
+OBEX profiles that use L2CAP. Copy the value in ext_set_defaults()
+and apply it to the listening socket via bt_io_set() after
+bt_io_listen() succeeds.
+
+Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/646014a6a246fe99df27da12d2de7bcd2e04d0df]
+---
+ src/profile.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/src/profile.c b/src/profile.c
+index dfc5f7161..65df0f7a0 100644
+--- a/src/profile.c
++++ b/src/profile.c
+@@ -55,6 +55,8 @@
+ #define MAS_DEFAULT_CHANNEL	16
+ #define MNS_DEFAULT_CHANNEL	17
+ 
++#define BT_RX_MTU		32767
++
+ #define BTD_PROFILE_PSM_AUTO	-1
+ #define BTD_PROFILE_CHAN_AUTO	-1
+ 
+@@ -678,6 +680,7 @@ struct ext_profile {
+ 
+ 	uint16_t version;
+ 	uint16_t features;
++	uint16_t imtu;
+ 
+ 	GSList *records;
+ 	GSList *servers;
+@@ -1423,6 +1426,9 @@ static uint32_t ext_start_servers(struct ext_profile *ext,
+ 			if (psm == 0)
+ 				bt_io_get(io, NULL, BT_IO_OPT_PSM, &psm,
+ 							BT_IO_OPT_INVALID);
++			if (ext->imtu)
++				bt_io_set(io, NULL, BT_IO_OPT_IMTU, ext->imtu,
++							BT_IO_OPT_INVALID);
+ 			l2cap->io = io;
+ 			l2cap->proto = BTPROTO_L2CAP;
+ 			l2cap->psm = psm;
+@@ -2075,6 +2081,7 @@ static struct default_settings {
+ 					struct ext_io *rfcomm);
+ 	uint16_t	version;
+ 	uint16_t	features;
++	uint16_t	imtu;
+ } defaults[] = {
+ 	{
+ 		.uuid		= SPP_UUID,
+@@ -2142,6 +2149,7 @@ static struct default_settings {
+ 		.authorize	= false,
+ 		.get_record	= get_opp_record,
+ 		.version	= 0x0102,
++		.imtu		= BT_RX_MTU,
+ 	}, {
+ 		.uuid		= OBEX_FTP_UUID,
+ 		.name		= "File Transfer",
+@@ -2151,6 +2159,7 @@ static struct default_settings {
+ 		.authorize	= true,
+ 		.get_record	= get_ftp_record,
+ 		.version	= 0x0103,
++		.imtu		= BT_RX_MTU,
+ 	}, {
+ 		.uuid		= OBEX_SYNC_UUID,
+ 		.name		= "Synchronization",
+@@ -2167,6 +2176,7 @@ static struct default_settings {
+ 		.authorize	= true,
+ 		.get_record	= get_pse_record,
+ 		.version	= 0x0101,
++		.imtu		= BT_RX_MTU,
+ 	}, {
+ 		.uuid		= OBEX_PCE_UUID,
+ 		.name		= "Phone Book Access Client",
+@@ -2182,7 +2192,8 @@ static struct default_settings {
+ 		.mode		= BT_IO_MODE_ERTM,
+ 		.authorize	= true,
+ 		.get_record	= get_mas_record,
+-		.version	= 0x0100
++		.version	= 0x0100,
++		.imtu		= BT_RX_MTU,
+ 	}, {
+ 		.uuid		= OBEX_MNS_UUID,
+ 		.name		= "Message Notification",
+@@ -2191,7 +2202,8 @@ static struct default_settings {
+ 		.mode		= BT_IO_MODE_ERTM,
+ 		.authorize	= true,
+ 		.get_record	= get_mns_record,
+-		.version	= 0x0104
++		.version	= 0x0104,
++		.imtu		= BT_RX_MTU,
+ 	},
+ };
+ 
+@@ -2249,6 +2261,9 @@ static void ext_set_defaults(struct ext_profile *ext)
+ 		if (settings->features)
+ 			ext->features = settings->features;
+ 
++		if (settings->imtu)
++			ext->imtu = settings->imtu;
++
+ 		if (settings->name)
+ 			ext->name = g_strdup(settings->name);
+ 	}
+-- 
+2.34.1
+

