Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.8760.1615558589780950099
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4DxntM0n7Qz1qtxX;
	Fri, 12 Mar 2021 15:16:27 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4DxntM04ptz1qr5H;
	Fri, 12 Mar 2021 15:16:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id KRHxDlDGa-yz; Fri, 12 Mar 2021 15:16:26 +0100 (CET)
X-Auth-Info: wZQcHxf1sFELa/Kq0BSU8xVwdBVF71NRAzcIB5JSpRE=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 12 Mar 2021 15:16:25 +0100 (CET)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Zhang Qiang <qiang.zhang@windriver.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>
Subject: [PATCH][dunfell] kernel.bbclass: Configuration for environment with HOSTCXX
Date: Fri, 12 Mar 2021 15:16:18 +0100
Message-Id: <20210312141618.94024-1-marex@denx.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Zhang Qiang <qiang.zhang@windriver.com>

When compiling xilinx-zynq board linux-kernel-dev(v5.8) if
"GCC_PLUGINS=3Dy", The following error will appear:

"HOSTCXX -fPIC scripts/gcc-plugins/arm_ssp_per_task_plugin.o
fatal error: gmp.h: No such file or directory"

the GCC_PLUGINS depend on return result of gcc-plugin.sh execution
however in gcc-plugin.sh use HOSTCC to detect the feature of GNU
extension of gcc, this will result that HOSTCC can compile the file
successfully, but HOSTCXX is used in the actual compilation process.

Signed-off-by: Zhang Qiang <qiang.zhang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Armin Kuster <akuster808@gmail.com>
---
NOTE: I am running into the same problem when compiling v5.10.y, so
      it would be helpful to backport this patch.
      740d87766c ("kernel.bbclass: Configuration for environment with HOS=
TCXX")
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 83a574efcd..22b1224d79 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -194,6 +194,8 @@ UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
 KERNEL_EXTRA_ARGS ?=3D ""
=20
 EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS=
}" HOSTCPP=3D"${BUILD_CPP}""
+EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LD=
FLAGS}""
+
 KERNEL_ALT_IMAGETYPE ??=3D ""
=20
 copy_initramfs() {
--=20
2.30.1

