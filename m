Received: from smtp-out01.xworks.net (smtp-out01.xworks.net [31.25.48.218])
 by mx.groups.io with SMTP id smtpd.web11.12694.1594113926121518356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 02:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kabelmail.de header.s=mail header.b=W6SMpNK0;
 spf=pass (domain: kabelmail.de, ip: 31.25.48.218, mailfrom: timon.ulrich@kabelmail.de)
Received: from mailbackend1 (cluster06.xworks.net [10.100.1.80])
	by smtp-out01.xworks.net (Postfix) with ESMTP id CA0F65F16C;
	Tue,  7 Jul 2020 11:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kabelmail.de;
	s=mail; t=1594113922;
	bh=VHtqtau5Mkv4jk2JkCQWxRJmvWx88EWPbRoXANTO4xU=;
	h=From:To:Subject:Date;
	b=W6SMpNK0yDSBc2MzMIA7TmagCIdPjIQWT0treXt1eCGcGPOOxFrgQzSzmFXA4ThP9
	 dovaLS4EUk8rQU37Vbb3K+QbN/nTp9cQJS7AbRKt+yiavA6xw2TvQqncydQG1jM8Qh
	 itCxgigAb6NmboGx8pdCkabBQnBcOvI+0aZ5hQYc=
Received: from AN1049-Latitude-5590.anapur.local (pd95bd745.dip0.t-ipconnect.de [217.91.215.69])
	(authenticated bits=0)
	by smtp.kabelmail.de  with ESMTP id 0679PBkr024913
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 7 Jul 2020 11:25:21 +0200
X-mediaBEAM-Originating-IP: [217.91.215.69]
X-mediaBEAM-AUTHID: [timon.ulrich@kabelmail.de]
From: "T. Ulrich" <timon.ulrich@kabelmail.de>
To: openembedded-core@lists.openembedded.org
Cc: Timon Ulrich <t.ulrich@anapur.de>
Subject: [PATCH] kernel.bbclass: make dependency on lzop-native conditional
Date: Tue,  7 Jul 2020 11:25:11 +0200
Message-Id: <20200707092511.7781-1-timon.ulrich@kabelmail.de>
X-Mailer: git-send-email 2.17.1
X-mediaBEAM-AuthCheck: route13
X-mediaBEAM-AuthScore: 0.0/5.0, scanned in 1.190sec

From: Timon Ulrich <t.ulrich@anapur.de>

a native lzop is only needed when an lzo compressed initramfs is actually present

Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
---
 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c834aad033..3230c12ccf 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
-DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
+DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
+DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
-- 
2.17.1


