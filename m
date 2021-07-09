Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9390.1625828932348001148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F5C8ED1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jul 2021 04:08:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214DA3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jul 2021 04:08:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] parted: improve ptest execution
Date: Fri,  9 Jul 2021 12:08:47 +0100
Message-Id: <20210709110847.3758093-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Delete the right log files in run-ptest so the tests can be executed
more than once.

Install config.h so the tests which examine the build configuration will
do the right thing, specifically this causes the tests using libblkid to
execute instead of skip.

Add missing RDEPENDS: mkswap and tune2fs binaries, loop and vfat kernel
modules.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/parted/files/run-ptest |  2 +-
 meta/recipes-extended/parted/parted_3.4.bb   | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-=
extended/parted/files/run-ptest
index 374f1bfbc9b..c3d6fca3391 100644
--- a/meta/recipes-extended/parted/files/run-ptest
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -2,6 +2,6 @@
=20
 mkdir -p /etc/udev/mount.blacklist.d
 echo /dev/sda1 >> /etc/udev/mount.blacklist.d/parted-tmp
-rm -f *.log
+rm -f tests/*.log
 make -C tests test-suite.log
 rm /etc/udev/mount.blacklist.d/parted-tmp
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-ex=
tended/parted/parted_3.4.bb
index fb583489f83..4b76ca48616 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -35,10 +35,13 @@ do_install_ptest() {
 	cp ${S}/build-aux/test-driver $t/build-aux/
 	cp -r ${S}/tests $t
 	cp ${B}/tests/Makefile $t/tests/
+	mkdir $t/lib
+	cp ${B}/lib/config.h $t/lib
 	sed -i "s|^VERSION.*|VERSION =3D ${PV}|g" $t/tests/Makefile
 	sed -i "s|^srcdir =3D.*|srcdir =3D \.|g" $t/tests/Makefile
 	sed -i "s|^abs_srcdir =3D.*|abs_srcdir =3D \.|g" $t/tests/Makefile
-	sed -i "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D \.\.|g" $t/tests/Mak=
efile
+	sed -i "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D "${PTEST_PATH}"|g" $=
t/tests/Makefile
+	sed -i "s|^abs_top_builddir =3D.*|abs_top_builddir =3D "${PTEST_PATH}"|=
g" $t/tests/Makefile
 	sed -i "s|^Makefile:.*|Makefile:|g" $t/tests/Makefile
 	sed -i "/^BUILDINFO.*$/d" $t/tests/Makefile
 	for i in print-align print-max print-flags dup-clobber duplicate fs-res=
ize; \
@@ -46,9 +49,8 @@ do_install_ptest() {
 	done
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
-
-RDEPENDS_${PN}-ptest =3D "bash coreutils perl util-linux-losetup python3=
 make gawk e2fsprogs-mke2fs python3-core dosfstools"
-RRECOMMENDS_${PN}-ptest =3D "kernel-module-scsi-debug"
+RDEPENDS_${PN}-ptest =3D "bash coreutils perl util-linux-losetup util-li=
nux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-c=
ore dosfstools"
+RRECOMMENDS_${PN}-ptest =3D "kernel-module-scsi-debug kernel-module-loop=
 kernel-module-vfat"
 RDEPENDS_${PN}-ptest_append_libc-glibc =3D "\
         glibc-utils \
         locale-base-en-us \
--=20
2.25.1

