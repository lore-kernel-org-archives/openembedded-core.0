Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A76C3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 19:11:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.3378.1747681911591982960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 12:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sJsRUFoj;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JJBYKX542495;
	Mon, 19 May 2025 14:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747681894;
	bh=OMQiSlmqTdDUrZyNh7CiuqsEh9cSZTduM6nPkTNmFK4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sJsRUFojY84qYrxlfvDBNnkYWLAAcAggAQhbbzjVvi1FaC7+mvYwnatIVJF5uj4oR
	 EKF5+rvjIu91w2kjv1YAgF5A4v9JvVYEKsvRhjO8gwsBC3cP6Si4LroF6hKyASctVl
	 xxnKO+/nML02XGXDT9tCRIECdNXHczAzjWH5TnXk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JJBY97942178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 14:11:34 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 14:11:33 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 14:11:33 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JJBXpU070069;
	Mon, 19 May 2025 14:11:33 -0500
From: <rs@ti.com>
To: <mathieu.dubois-briand@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv5 1/5] libx11: create tmpfile dir for x11 domain socket
Date: Mon, 19 May 2025 14:11:26 -0500
Message-ID: <20250519191130.3532263-2-rs@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519191130.3532263-1-rs@ti.com>
References: <20250519191130.3532263-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 19:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216871

From: Randolph Sapp <rs@ti.com>

Register a tmpfile.d or volatile directory entry for the x11 domain
socket so this will always be created with the correct permissions.

Currently some x11 related applications will create this directory if it
doesn't already exist, but this is not true for everything. In addition,
if the application in question isn't started as root, it's possible this
directory can be owned by a non-root user. This isn't an issue by
itself, but it can potentially lead to problems in a multi-user
environment.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-graphics/xorg-lib/libx11/99_x11   |  1 +
 meta/recipes-graphics/xorg-lib/libx11/x11.conf |  1 +
 .../recipes-graphics/xorg-lib/libx11_1.8.12.bb | 18 ++++++++++++++++--
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/99_x11
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/x11.conf

diff --git a/meta/recipes-graphics/xorg-lib/libx11/99_x11 b/meta/recipes-graphics/xorg-lib/libx11/99_x11
new file mode 100644
index 0000000000..53c5b49d10
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/99_x11
@@ -0,0 +1 @@
+d root root 1777 /tmp/.X11-unix none
diff --git a/meta/recipes-graphics/xorg-lib/libx11/x11.conf b/meta/recipes-graphics/xorg-lib/libx11/x11.conf
new file mode 100644
index 0000000000..48e2d56c8b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/x11.conf
@@ -0,0 +1 @@
+D! /tmp/.X11-unix 1777 root root 10d
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
index 5ce5481743..35ac39edfb 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
@@ -22,7 +22,9 @@ PE = "1"
 
 XORG_PN = "libX11"
 
-SRC_URI += "file://disable_tests.patch"
+SRC_URI += "file://disable_tests.patch \
+            file://x11.conf \
+            file://99_x11"
 
 SRC_URI[sha256sum] = "fa026f9bb0124f4d6c808f9aef4057aad65e7b35d8ff43951cef0abe06bb9a9a"
 
@@ -36,7 +38,19 @@ PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 
 PACKAGES =+ "${PN}-xcb"
 
-FILES:${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt"
+do_install:append() {
+	# temporary directory required for x11 domain sockets
+	if ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${libdir}/tmpfiles.d
+		install -m 0644 ${UNPACKDIR}/x11.conf ${D}${libdir}/tmpfiles.d/x11.conf
+	else
+		install -d ${D}${sysconfdir}/default/volatiles
+		install -m 0644 ${UNPACKDIR}/99_x11 ${D}${sysconfdir}/default/volatiles/99_x11
+	fi
+}
+
+FILES:${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt \
+                ${libdir}/tmpfiles.d/x11.conf ${sysconfdir}/default/volatiles/99_x11"
 FILES:${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES:${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
-- 
2.49.0


