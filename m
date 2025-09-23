Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D41CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 22:52:33 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.2090.1758667953625111515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 15:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OCCJlC17;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NMq9Kh1082629;
	Tue, 23 Sep 2025 17:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758667929;
	bh=8MRFHLGTD95iyBZgYVfcV9V1FMO6L+KSyiyA+4UiOeY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OCCJlC17c6viRodTnUT27kRNQe+iwHngXmU2Ath/IwJpqQ/X6LcEca+mUi54Whipp
	 kUfq8/KTNvXznDyMtQzpi+vTyovWThonPd6z0+bHljMNzH1GQIOpMXq7VqYL17srY9
	 w/GF95ShqCIjkkUWdNoUWJlAtU+OtPFG9wGdF3k8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NMq9kG1406603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 17:52:09 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 17:52:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 17:52:08 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NMq8TH750856;
	Tue, 23 Sep 2025 17:52:08 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv10 1/7] libx11: create tmpfile dir for x11 domain socket
Date: Tue, 23 Sep 2025 17:51:37 -0500
Message-ID: <20250923225150.2407390-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923225150.2407390-1-rs@ti.com>
References: <20250923225150.2407390-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 22:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223933

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


