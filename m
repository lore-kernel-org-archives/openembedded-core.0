Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBFDCAC591
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 21:29:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.31041.1757539786893575784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 14:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bN/g5J3M;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58ALTOI2227621;
	Wed, 10 Sep 2025 16:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757539764;
	bh=8MRFHLGTD95iyBZgYVfcV9V1FMO6L+KSyiyA+4UiOeY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bN/g5J3MAWkG6d04hOkxdU4B899/u/+JrdFBwC5Exd0iNCzDy+gXYtcosxpo4xID3
	 Lw2Kztt5FxuedCuA3vpfMkFqkDMrW4zmyJeGpUeZRkKT8LtHFIbF2yXFk65U1J3pmJ
	 6OdKd8iMQXQROJqXbKuf8mdbjst8pkpbLP3NgWmk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58ALTOrx663505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 10 Sep 2025 16:29:24 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 10
 Sep 2025 16:29:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Sep 2025 16:29:23 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58ALTNiK1102015;
	Wed, 10 Sep 2025 16:29:23 -0500
From: <rs@ti.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv7 1/6] libx11: create tmpfile dir for x11 domain socket
Date: Wed, 10 Sep 2025 16:28:42 -0500
Message-ID: <20250910212855.2480561-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910212855.2480561-1-rs@ti.com>
References: <20250910212855.2480561-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 21:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223240

From: Randolph Sapp <rs@ti.com>

Register a volatile directory entry for the x11 domain socket when not
using systemd. This will make sure the directory is always created with
the correct permissions. Systemd already provides their own tmpfile.d
entry for the same behavior.

Currently some x11 related applications will create this directory if it
doesn't already exist, but this is not true for everything. In addition,
if the application in question isn't started as root, it's possible this
directory can be owned by a non-root user. This isn't an issue by
itself, but it can potentially lead to problems in a multi-user
environment.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-graphics/xorg-lib/libx11/99_x11    |  1 +
 meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/99_x11

diff --git a/meta/recipes-graphics/xorg-lib/libx11/99_x11 b/meta/recipes-graphics/xorg-lib/libx11/99_x11
new file mode 100644
index 0000000000..53c5b49d10
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/99_x11
@@ -0,0 +1 @@
+d root root 1777 /tmp/.X11-unix none
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
index 580e44889d..78713f4ac5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
@@ -21,7 +21,8 @@ PE = "1"
 
 XORG_PN = "libX11"
 
-SRC_URI += "file://disable_tests.patch"
+SRC_URI += "file://disable_tests.patch \
+            file://99_x11"
 
 SRC_URI[sha256sum] = "fa026f9bb0124f4d6c808f9aef4057aad65e7b35d8ff43951cef0abe06bb9a9a"
 
@@ -35,7 +36,17 @@ PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
 
 PACKAGES =+ "${PN}-xcb"
 
-FILES:${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${datadir}/X11/Xcms.txt"
+do_install:append() {
+	# temporary directory required for x11 domain sockets
+        # systemd provides their own definition using tmpfiles.d
+	if ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'false', 'true', d)}; then
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
2.51.0


