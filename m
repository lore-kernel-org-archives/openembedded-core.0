Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.35886.1601907531293889828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 07:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mfe@pengutronix.de)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1kPRKC-0000Sh-Ku; Mon, 05 Oct 2020 16:18:48 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1kPRKC-0002Ex-A3; Mon, 05 Oct 2020 16:18:48 +0200
From: "Marco Felsch" <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: mfe@pengutronix.de
Subject: [PATCH] Revert "kernel.bbclass: make dependency on lzop-native conditional"
Date: Mon,  5 Oct 2020 16:18:38 +0200
Message-Id: <20201005141838.8559-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: 8bit

This reverts commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd.

This commit breaks compiling if no initramfs is used because the kernel
image can be compressed too using lzo.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 meta/classes/kernel.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78def5bbc1..06150e8072 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -4,8 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
-DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
-- 
2.20.1

