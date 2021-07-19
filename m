Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26172.1626692459988933608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 04:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F19A6D
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 04:00:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18A103F73D
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 04:00:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] parted: add device mappper PACKAGECONFIG
Date: Mon, 19 Jul 2021 12:00:57 +0100
Message-Id: <20210719110057.2857968-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of forcibly disabling the device mapper support, add a disabled
PACKAGECONFIG.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/parted/parted_3.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-ex=
tended/parted/parted_3.4.bb
index d805f31ceb..d9b3ffb852 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -16,11 +16,10 @@ SRC_URI =3D "${GNU_MIRROR}/parted/parted-${PV}.tar.xz=
 \
 SRC_URI[md5sum] =3D "357d19387c6e7bc4a8a90fe2d015fe80"
 SRC_URI[sha256sum] =3D "e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03d=
c642afd009da5342"
=20
-EXTRA_OECONF =3D "--disable-device-mapper"
-
 inherit autotools pkgconfig gettext texinfo ptest
=20
 PACKAGECONFIG ?=3D "readline"
+PACKAGECONFIG[device-mapper] =3D "--enable-device-mapper,--disable-devic=
e-mapper,libdevmapper lvm2"
 PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline=
"
=20
 BBCLASSEXTEND =3D "native nativesdk"
@@ -49,6 +48,7 @@ do_install_ptest() {
 	done
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
+
 RDEPENDS_${PN}-ptest =3D "bash coreutils perl util-linux-losetup util-li=
nux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-c=
ore dosfstools"
 RRECOMMENDS_${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-loo=
p kernel-module-vfat"
 RDEPENDS_${PN}-ptest_append_libc-glibc =3D "\
--=20
2.25.1

