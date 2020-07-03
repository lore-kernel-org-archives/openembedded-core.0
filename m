Received: from smtp-out01.xworks.net (smtp-out01.xworks.net [31.25.48.218])
 by mx.groups.io with SMTP id smtpd.web12.9341.1593779994989134889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 05:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kabelmail.de header.s=mail header.b=KfsL07pu;
 spf=pass (domain: kabelmail.de, ip: 31.25.48.218, mailfrom: timon.ulrich@kabelmail.de)
Received: from mailbackend6 (cluster06.xworks.net [10.100.1.80])
	by smtp-out01.xworks.net (Postfix) with ESMTP id EE8DB620E1;
	Fri,  3 Jul 2020 14:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kabelmail.de;
	s=mail; t=1593779992;
	bh=fUTVmTGx873WD7d4MKwiV4p1/dBxM2IFUVrcV6s34sc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KfsL07puA+FvZkE2gdWGtj20NAUWPhHBfRTfHfursxevqHPfT+5reJTCH1ioI718N
	 FW6C8hLsd5XoTuUtYQh9VszJaUaE+MGxYfCvDmjGOsyGEbw5UmYgXnZaxCxTokY9h2
	 cVehhz02J/3OpvoYXLOG5xKT4sRF4cp0XoHwfApo=
Received: from AN1049-Latitude-5590.anapur.local (pd95bd745.dip0.t-ipconnect.de [217.91.215.69])
	(authenticated bits=0)
	by smtp.kabelmail.de  with ESMTP id 063Cdf45006238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Fri, 3 Jul 2020 14:39:51 +0200
X-mediaBEAM-Originating-IP: [217.91.215.69]
X-mediaBEAM-AUTHID: [timon.ulrich@kabelmail.de]
From: "T. Ulrich" <timon.ulrich@kabelmail.de>
To: openembedded-core@lists.openembedded.org
Cc: Timon Ulrich <t.ulrich@anapur.de>
Subject: [PATCH v2] kernel.bbclass: add lz4 dependency and fix the call to lz4
Date: Fri,  3 Jul 2020 14:39:40 +0200
Message-Id: <20200703123940.24779-1-timon.ulrich@kabelmail.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <140262>
References: <140262>
X-mediaBEAM-AuthCheck: route13
X-mediaBEAM-AuthScore: 0.0/5.0, scanned in 1.196sec

From: Timon Ulrich <t.ulrich@anapur.de>

If the initramfs image is type lz4, then a native lz4 is needed.

Additionally an output filename needs to be specified when calling lz4,
otherwise STDOUT will be used implicitly.

Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6d07b29e2d..9e3c34ad48 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -5,6 +5,7 @@ KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel")
 
 PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
+DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
@@ -210,7 +211,7 @@ copy_initramfs() {
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


