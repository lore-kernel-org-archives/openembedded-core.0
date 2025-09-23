Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07613CAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 22:52:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2111.1758667958076685189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 15:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vKZLegrv;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NMq9tY1545329;
	Tue, 23 Sep 2025 17:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758667929;
	bh=VJx8eF5zOxLu93UKZRVLiQVpfYsi2Kx2UFQiyNTbN4M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vKZLegrvwW843D7X8xU8RZ/6xrRbACBESqVllGFU6Bk+lExI5UZSMH1P63H+vqP0e
	 TfCKz1xSgag/u6C7D2HmTgmgPkSdD6uVuw1lL3n7Fyy6JInMYZx9UR0IycRjvheiSu
	 2IAPqlBcTY1kkD3RTDML00paw7Pv5QIkLGU7juv4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NMq96P2303654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 17:52:09 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 17:52:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 17:52:09 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NMq8TN750856;
	Tue, 23 Sep 2025 17:52:08 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv10 7/7] xuser-account: merge with xserver-nodm-init
Date: Tue, 23 Sep 2025 17:51:43 -0500
Message-ID: <20250923225150.2407390-8-rs@ti.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 22:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223937

From: Randolph Sapp <rs@ti.com>

Merge the xuser-account recipe with xserver-nodm-init, since:

 - This is the only recipe dependent on it
 - This matches the current behavior in weston-init
 - Running x11 as root is no longer a supported path in
   xserver-nodm-init

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../xserver-nodm-init}/system-xuser.conf      |  0
 .../x11-common/xserver-nodm-init_3.0.bb       | 20 +++++++++---
 .../user-creation/xuser-account_0.1.bb        | 31 -------------------
 4 files changed, 15 insertions(+), 37 deletions(-)
 rename meta/{recipes-support/user-creation/files => recipes-graphics/x11-common/xserver-nodm-init}/system-xuser.conf (100%)
 delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 621bf32066..b8f405741c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -931,7 +931,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config = "Unassigned <unassigned@yoctoproject.
 RECIPE_MAINTAINER:pn-xserver-xorg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xset = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xtrans = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xuser-account = "Randolph Sapp <rs@ti.com>"
 RECIPE_MAINTAINER:pn-xvinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwayland = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwininfo = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b/meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
similarity index 100%
rename from meta/recipes-support/user-creation/files/system-xuser.conf
rename to meta/recipes-graphics/x11-common/xserver-nodm-init/system-xuser.conf
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 1fc10159e8..e4fe1f3c27 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -1,14 +1,15 @@
-SUMMARY = "Simple Xserver Init Script (no dm)"
+SUMMARY = "Simple Xserver Init Script and user account"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SECTION = "x11"
 
 SRC_URI = "file://emptty.conf.in \
-           file://default.desktop"
+           file://default.desktop \
+           file://system-xuser.conf"
 
 S = "${UNPACKDIR}"
 
-inherit features_check
+inherit features_check useradd
 
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
@@ -26,10 +27,19 @@ do_install() {
 
     sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/emptty/conf
     sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/conf
+
+    install -D -m 0644 ${S}/system-xuser.conf ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
 }
 
 FILES:${PN} = "${sysconfdir}/emptty/conf \
-               ${datadir}/xsessions/default.desktop"
+               ${datadir}/xsessions/default.desktop \
+               ${sysconfdir}/dbus-1/system.d/system-xuser.conf"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "--create-home \
+                       --groups video,tty,audio,input,shutdown,disk,nopasswdlogin \
+                       --user-group xuser"
+GROUPADD_PARAM:${PN} = "-r nopasswdlogin"
 
-RDEPENDS:${PN} = "emptty xuser-account"
+RDEPENDS:${PN} = "emptty"
 RPROVIDES:${PN} += "virtual-emptty-conf"
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
deleted file mode 100644
index f1e4cb674f..0000000000
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Creates an 'xuser' account used for running X11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-SRC_URI = "file://system-xuser.conf"
-
-inherit allarch useradd
-
-S = "${UNPACKDIR}"
-
-do_configure() {
-    :
-}
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
-}
-
-FILES:${PN} = "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--create-home \
-                       --groups video,tty,audio,input,shutdown,disk,nopasswdlogin \
-                       --user-group xuser"
-GROUPADD_PARAM:${PN} = "-r nopasswdlogin"
-
-ALLOW_EMPTY:${PN} = "1"
-- 
2.51.0


