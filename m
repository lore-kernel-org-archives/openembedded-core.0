Return-Path: <paul.barker.ct@bp.renesas.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40866CE7A9A
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 20:21:30 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web11.19595.1725567688304379366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 13:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.171, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.10,205,1719846000"; 
   d="scan'208";a="217671513"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Sep 2024 05:21:26 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 60C904009BF6;
	Fri,  6 Sep 2024 05:21:25 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [master/scarthgap PATCH] meta-ide-support: Mark recipe as MACHINE-specific
Date: Thu,  5 Sep 2024 21:21:02 +0100
Message-Id: <20240905202102.565-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 20:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204243

meta-ide-support:do_write_test_data dumps the bitbake data dictionary to
a file using export2json(). As this obviously includes the value of
MACHINE, and other MACHINE-specific variables, the recipe needs to be
marked as MACHINE-specific.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 meta/recipes-core/meta/meta-ide-support.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index d85aa120c08b..7ed422ce4ddb 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Integrated Development Environment support"
 DESCRIPTION = "Meta package for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS = "virtual/libc gdb-cross-${TARGET_ARCH} qemu-native qemu-helper-native unfs3-native cmake-native autoconf-native automake-native meson-native intltool-native pkgconfig-native"
 RM_WORK_EXCLUDE += "${PN}"
-- 
2.43.0


