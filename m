Received: from smtp-out01.xworks.net (smtp-out01.xworks.net [31.25.48.218])
 by mx.groups.io with SMTP id smtpd.web11.5050.1593757342415438395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 23:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kabelmail.de header.s=mail header.b=nAMOWvXP;
 spf=pass (domain: kabelmail.de, ip: 31.25.48.218, mailfrom: timon.ulrich@kabelmail.de)
Received: from mailbackend3 (cluster06.xworks.net [10.100.1.80])
	by smtp-out01.xworks.net (Postfix) with ESMTP id C44AC61227;
	Fri,  3 Jul 2020 08:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kabelmail.de;
	s=mail; t=1593757338;
	bh=o/hvk5l5VFzCmHnrWmVZBoM5pKCZ6Nq1BHCC5ibrl10=;
	h=From:To:Subject:Date;
	b=nAMOWvXPnL08FVTG7rYhNhV3o349pYIhve13aPbC141y6FcVYs5z/N4K2Bbex3/cf
	 vQfmOXIHjd/ie7L/rfZwzDE9TBalxZEH+rOy7s0L4Cesf1+Z4w8amaE+12JNuAQ3Br
	 Q+iLvVQfeplNIhUXCxbO1jk3oJUk4vxRwiFP25QQ=
Received: from AN1049-Latitude-5590.anapur.local (pd95bd745.dip0.t-ipconnect.de [217.91.215.69])
	(authenticated bits=0)
	by smtp.kabelmail.de  with ESMTP id 0636MBMX007771
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Fri, 3 Jul 2020 08:22:17 +0200
X-mediaBEAM-Originating-IP: [217.91.215.69]
X-mediaBEAM-AUTHID: [timon.ulrich@kabelmail.de]
From: "T. Ulrich" <timon.ulrich@kabelmail.de>
To: openembedded-core@lists.openembedded.org
Cc: Timon Ulrich <t.ulrich@anapur.de>
Subject: [PATCH] kernel.bbclass: add lz4 dependency and fix the call to lz4
Date: Fri,  3 Jul 2020 08:22:10 +0200
Message-Id: <20200703062210.9471-1-timon.ulrich@kabelmail.de>
X-Mailer: git-send-email 2.17.1
X-mediaBEAM-AuthCheck: route13
X-mediaBEAM-AuthScore: 0.0/5.0, scanned in 1.202sec

From: Timon Ulrich <t.ulrich@anapur.de>

If the initramfs image is type lz4, then a native lz4 is needed.

Additionally an output filename needs to be specified when calling lz4,
otherwise STDOUT will be used implicitly.

Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6d07b29e2d..add0b13bcb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -4,7 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native lz4-native bison-native"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
@@ -210,7 +210,7 @@ copy_initramfs() {
 				;;
 			*lz4)
 				echo "lz4 decompressing image"
-				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img
+				lz4 -df ${B}/usr/${INITRAMFS_IMAGE_NAME}.$img ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 				break
 				;;
 			*lzo)
-- 
2.17.1


