Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D528CAC5BB
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 00:30:59 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1370.1759365050276167843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 17:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UllIxroJ;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5920UhKA3183938;
	Wed, 1 Oct 2025 19:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759365043;
	bh=gS5yLW0q6n0UJd/CcFQfu2Lk7lK0HLpQiQOEiE3VMfM=;
	h=From:To:CC:Subject:Date;
	b=UllIxroJbbPy+x7neHUnvXtP2JpGSJ+1wBOYFd8lZMzjiixdTP0b1gN1FwF3RRfC8
	 0ypN81EWo+NzipirpR01/7D2xIbC3mxAQeobXSbywWMXHtuzR8ZnAG0SOZjTFQskR5
	 0X+XeIPe2g4I9DY0+gXbkiuDF2+Z/iOSsTNOyj4E=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5920Uhm43799112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Oct 2025 19:30:43 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 19:30:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 19:30:42 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5920UgF01095040;
	Wed, 1 Oct 2025 19:30:42 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <mathieu.dubois-briand@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH] libx11: create tmpfile dir for x11 domain socket
Date: Wed, 1 Oct 2025 19:30:34 -0500
Message-ID: <20251002003034.344992-1-rs@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 00:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224339

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
index 580e44889d..23a4b228a9 100644
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
+	# systemd provides their own definition using tmpfiles.d
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


