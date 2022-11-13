Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEFCC43217
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 08:43:22 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.web09.997.1668328996662690218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 00:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@email.de header.s=s29768273 header.b=vYuMmcZL;
 spf=pass (domain: email.de, ip: 212.227.17.12, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1668328994;
	bh=cg1pGxAsDkfwPhbFTCPFkweNs7laE5h5zI5HZFqz3H0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=vYuMmcZLFidM2+z/YrBar3ah/GUYrPFLFNwDOuUYiUjhwpX9TSKSDrM48tK0+P6so
	 FSf9yQadCoq0DnyWzI7qIqI0e2UoCSQIFRG8HvjUSghf8KyKjmw28DWc36Mu+lPDK2
	 0j8tCnPC6qI9L+OYufPk/sUhKyMLaSJJjlbt95fEdP5BMJAkfsaSe8QPwrmslk9Ru7
	 Yp97ANrmL1QIhVk9CeV+kz4zFhpTJoKTv1FksfyTrS7sxa93Lb+OZ5/J4qsdOykjV7
	 rqwEIWmmsDLkC12p/v8jsHeWFMOVy6dAdPDrNOjOusS+VFTOn6O+iySsODTUmc72Y+
	 +HusAwD07r1Bg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MrwwJ-1pHLym3MMX-00nWmb; Sun, 13 Nov 2022 09:43:13 +0100
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH 1/2] initial machine configs: set PREFERRED_PROVIDERs as weaker defaults
Date: Sun, 13 Nov 2022 08:42:54 +0000
Message-Id: <20221113084255.18113-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:H1soe9siaEyReGiiwYTt0gAxs+S4wQ0CLhGJQfwsc45cHylWCJJ
 eODLSl8Obcjq0csDJJ8C0q7DosjOjJT2s/WL7wolF4h19joRmCyz6i7iXntklNqA4QXnxBz
 +s0k7Y977u0DEINef+5GnOujfhajOOxTuBShJo2S/Q/QMziLNXVLvd4DJd4ERN5qzIFqK7+
 +xMIvPf3kfiTmhxKa6RiQ==
UI-OutboundReport: notjunk:1;M01:P0:ocOncfsJN/c=;L0T2hFAwyWuM9j/6zYSH8K0V1sF
 yodc3+c7AZp5N45zv1dN/KD3T8sOkuzXdml8mK0Dm8k9+38F7L4zs3eMAAo4r33Dr9hiigGl3
 4//gv7BAcyr8CbjvJnFrYUU7Cg07waL17qErXP87MOv2FS3edDkKAM+ZiSZA+Uy3vNev/BPgb
 1XK8FU/5pw+tIPxNdIHchRbPNh14hBtGzQCNbZDnOtwUssNrYk0ObyOvmL21ijpXF7BNgaSiD
 ko5ursjE7FQka1XtGDfaqpFBd4RuvOEle9cXvvly4xp0IJ5kaiuPRNITLwPaw7Fpd8vECkxXx
 TLjXqVZQsrYKLNYnmYob13FTMNi6LQAZQDrjIRWi2mpv7jyoyufIVg2vuyiEE69CiAbOs/VxV
 KrEYMpO+Jk1LTNISqil0wXC9ltPzkPTMArDzPhShEWVGaMGbvRf4ql6Mk2vi8I/FhYzlIUiPy
 5aD8O2vKH5jawhMFYBa6t1JeeYjvaYFWbIsk9Gtb1f7xDvc32BMlxIXY1ZgeTMbpIFu947ieQ
 cbt2jZm+44L+um6/tdyuql6fDJj+TYG2fE8eJPxp4Lcqd13b7Mu+ZU7WhgFLKYCIcCW9TkK+A
 niWRavDanzZndmcqWS0ss+qXdb4Ws5bFC7j5IZYZ/KqWlya/s233t0UElx/P+Bj3ImmtHRRE7
 rewsfq5wc5g1tuQdGsHv2qbjMxmPfj4q6lvzZ78Ukrr58A+8G41xBvlQ9/CT8t1hDWaZhQ2Df
 VKgLekAVZKuiAYl2B41+snLHGDeNe8BQ+vy3r2vfX219z8AQ/W6IyPogQUEr3ylnuAHIWI+3J
 HwWb5E7Xgj6/XCAh38w05nWxYBCThtW1H3bC7s1CJHDZhCG8UyiYKW0VfSYmQV5fVNulDE+Zn
 Y6mOYIOBInhynnwK+2ZdHXB2ruVLJwKg+zUuLwFgbjUvSHgBKU2PK3NRCwya55cvkhuipNMgj
 g9fQwV7udBCZg2D2NC0bcklo4BQ=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 08:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173185

From: Christoph Lauer <christoph.lauer@xtronic.de>

This gives BSP creators the flexibility to change PREFERRED_PROVIDERs with=
 weak defaults

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf         | 6 +++---
 meta-yocto-bsp/conf/machine/edgerouter.conf               | 2 +-
 meta-yocto-bsp/conf/machine/include/genericx86-common.inc | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yoct=
o-bsp/conf/machine/beaglebone-yocto.conf
index 284559c50c..d5c5a4a2ef 100644
=2D-- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -2,7 +2,7 @@
 #@NAME: Beaglebone-yocto machine
 #@DESCRIPTION: Reference machine configuration for http://beagleboard.org=
/bone and http://beagleboard.org/black boards

-PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/xserver ??=3D "xserver-xorg"
 XSERVER ?=3D "xserver-xorg \
            xf86-video-modesetting \
            "
@@ -23,14 +23,14 @@ do_image_wic[depends] +=3D "mtools-native:do_populate_=
sysroot dosfstools-native:do
 SERIAL_CONSOLES ?=3D "115200;ttyS0 115200;ttyO0 115200;ttyAMA0"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"

-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.15%"

 KERNEL_IMAGETYPE =3D "zImage"
 KERNEL_DEVICETREE =3D "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegr=
een.dtb"
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"

-PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot"
+PREFERRED_PROVIDER_virtual/bootloader ??=3D "u-boot"

 SPL_BINARY =3D "MLO"
 UBOOT_SUFFIX =3D "img"
diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/=
conf/machine/edgerouter.conf
index 249864e9ce..367d2e091a 100644
=2D-- a/meta-yocto-bsp/conf/machine/edgerouter.conf
+++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
@@ -10,7 +10,7 @@ KERNEL_IMAGETYPE =3D "vmlinux"
 KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"
 KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  =3D ".comment"

-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.15%"

 SERIAL_CONSOLES =3D "115200;ttyS0"
diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/m=
eta-yocto-bsp/conf/machine/include/genericx86-common.inc
index 8c5e5522bc..2fe34dcd47 100644
=2D-- a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
+++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
@@ -3,8 +3,8 @@ require conf/machine/include/x86/qemuboot-x86.inc
 MACHINE_FEATURES +=3D "wifi efi pcbios"

 PREFERRED_VERSION_linux-yocto ?=3D "5.15%"
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
+PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
+PREFERRED_PROVIDER_virtual/xserver ??=3D "xserver-xorg"
 XSERVER ?=3D "${XSERVER_X86_BASE} \
             ${XSERVER_X86_EXT} \
             ${XSERVER_X86_I915} \
=2D-
2.17.1


