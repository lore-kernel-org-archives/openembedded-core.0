Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF80CCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 23:20:55 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.5524.1761607248062051671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 16:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EvNgbFO7;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59RNKix51376243;
	Mon, 27 Oct 2025 18:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761607244;
	bh=aw84uaJSd55aGPxO1RQhNGw/R5kJJiAJjsuo3otzR5k=;
	h=From:To:CC:Subject:Date;
	b=EvNgbFO7mksBnaW7x5VxWyAF+Vbr2chV9GuYwWBx62gO8i+/ouGMdzj28i0wYxdmb
	 6J89UwwzakjoBzwKOD7m2cCLI1oYEL/YMOociDta2f/18DrM8Pjc4p6qLSLhPOmzcS
	 sL+8CUmZSp5hj7ByufFwI37bEgddfWTNC2sINZ6U=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59RNKiLK1706594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Oct 2025 18:20:44 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 18:20:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 18:20:43 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59RNKhK71404068;
	Mon, 27 Oct 2025 18:20:43 -0500
From: <rs@ti.com>
To: <Ross.Burton@arm.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH] x11-volatiles: register x11 volatile directories
Date: Mon, 27 Oct 2025 18:19:19 -0500
Message-ID: <20251027231918.3987817-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 23:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225369

From: Randolph Sapp <rs@ti.com>

Add a volatiles entry for popular x11 and adjacent utilities. This is
designed to mimic the systemd tmpfiles.d entries and prevent any one
user from creating these directories with permissions that may
negatively impact multi-user environments.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Split to separate package and conditionally enabled following previous
discussions here:
https://lists.openembedded.org/g/openembedded-core/topic/115646663#msg225134

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../x11-common/x11-volatiles.bb               | 20 +++++++++++++++++++
 .../x11-common/x11-volatiles/02_x11           |  6 ++++++
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  2 ++
 .../xwayland/xwayland_24.1.8.bb               |  2 +-
 5 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/x11-common/x11-volatiles.bb
 create mode 100644 meta/recipes-graphics/x11-common/x11-volatiles/02_x11

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 444c7f6521..cf74785e59 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -886,6 +886,7 @@ RECIPE_MAINTAINER:pn-wic-tools = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wireless-regdb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpa-supplicant = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-x11-volatiles = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-x11perf = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-x264 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xauth = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/x11-common/x11-volatiles.bb b/meta/recipes-graphics/x11-common/x11-volatiles.bb
new file mode 100644
index 0000000000..23bd6e1661
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/x11-volatiles.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Xserver Volatile Directories"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
+SECTION = "x11"
+
+SRC_URI = "file://02_x11"
+
+S = "${UNPACKDIR}"
+
+inherit bin_package features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+CONFLICT_DISTRO_FEATURES = "systemd"
+
+do_install() {
+	install -d ${D}${sysconfdir}/default/volatiles
+	install -m 0644 ${UNPACKDIR}/02_x11 ${D}${sysconfdir}/default/volatiles
+}
+
+FILES:${PN} += "${sysconfdir}/default/volatiles"
diff --git a/meta/recipes-graphics/x11-common/x11-volatiles/02_x11 b/meta/recipes-graphics/x11-common/x11-volatiles/02_x11
new file mode 100644
index 0000000000..35c3698479
--- /dev/null
+++ b/meta/recipes-graphics/x11-common/x11-volatiles/02_x11
@@ -0,0 +1,6 @@
+# Volatile entries to match systemd
+# https://github.com/systemd/systemd/blob/main/tmpfiles.d/x11.conf
+d root root 1777 /tmp/.X11-unix none
+d root root 1777 /tmp/.ICE-unix none
+d root root 1777 /tmp/.XIM-unix none
+d root root 1777 /tmp/.font-unix none
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 14c45be432..3c8cb0173f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -26,3 +26,5 @@ RCONFLICTS:${PN} = "${PN}-extension-dri \
                     ${PN}-extension-extmod \
                     ${PN}-extension-dbe \
                    "
+
+RDEPENDS:${PN} += "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "x11-volatiles", d)}"
diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
index 900da524b3..a621af1a7f 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.8.bb
@@ -47,4 +47,4 @@ do_install:append() {
 
 FILES:${PN} += "${libdir}/xorg/protocol.txt"
 
-RDEPENDS:${PN} += "xkbcomp"
+RDEPENDS:${PN} += "xkbcomp ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "", "x11-volatiles", d)}"
-- 
2.51.1


