Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9C8C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 21:49:39 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.37.1747345777978710468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 14:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Yb+yB3r1;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54FLnRF63814616
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 16:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747345767;
	bh=iDdIEDgYngvBpPtN1c57aSd0luTAouIGjR51tpIJjis=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Yb+yB3r1nEgVlh886CG+HJGL+Vn0ZXiUrr9x9ub4D2nkmlOOrAJk6S0/MzaLpSpVE
	 VjxC1ZH6TFSRmtpZSKh9JWBDH0AG9X8BxtNcETZh0KqxMah8T7+WmrnLD6f4vvfMHA
	 rN4m/uxUBsB+Dx2Pp9xHshGG1RgzGmlNOxyWiRKQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54FLnRpx005495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 May 2025 16:49:27 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 May 2025 16:49:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 May 2025 16:49:27 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54FLnRi2051200;
	Thu, 15 May 2025 16:49:27 -0500
From: <rs@ti.com>
To: <mathieu.dubois-briand@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv4 1/5] libx11: create tmpfile dir for x11 domain socket
Date: Thu, 15 May 2025 16:49:15 -0500
Message-ID: <20250515214919.1404453-2-rs@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515214919.1404453-1-rs@ti.com>
References: <20250515214919.1404453-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 21:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216709

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
 meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
index 5ce5481743..59df95291a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
@@ -36,6 +36,19 @@ PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 
 PACKAGES =+ "${PN}-xcb"
 
+do_install:append() {
+	# temporary directory required for x11 domain sockets
+	if ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${libdir}/tmpfiles.d
+		echo "D! /tmp/.X11-unix 1777 root root 10d" \
+			> ${D}${libdir}/tmpfiles.d/x11.conf
+	else
+		install -d ${D}${sysconfdir}/default/volatiles
+		echo "d root root 1777 /tmp/.X11-unix none" \
+			> ${D}${sysconfdir}/default/volatiles/99_x11
+	fi
+}
+
 FILES:${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt"
 FILES:${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES:${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
-- 
2.49.0


