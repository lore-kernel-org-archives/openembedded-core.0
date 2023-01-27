Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5AFC61DA4
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 19:43:52 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.112301.1674848624032213330
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 11:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id ED50920E67D9;
	Fri, 27 Jan 2023 11:43:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ED50920E67D9
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] newlib: Upgrade 4.2.0 -> 4.3.0
Date: Fri, 27 Jan 2023 12:43:30 -0700
Message-Id: <20230127194330.419782-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 19:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176454

- Rebased fix-rs6000-crt0.patch
- Patch fix_makefile_include_arm_h.patch is no longer required, the newli=
b
  header dependency has been fixed upstream at 26f9cfd7
- LICENSE checksum change due to:
  - Adding SPDX identifier
  - Deleted Phoenix Systems from License and updated each licenses
  numbers accordingly.
- Add a dummy limits.h header, to make the improved preprocessor
  checks happy during configure.
- Add a patch for libgloss to maintain current behavior of TCLIBC=3Dnewli=
b
  by making libgloss DEPEND on newlib and use its installed headers.
- Switch to git fetcher to simplify fetching the sources and avoid future
  issues due to the way newlib release snapshots were being published.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/conf/distro/include/maintainers.inc      |  4 +--
 .../newlib/libgloss/fix-rs6000-crt0.patch     | 24 +++++++++------
 .../libgloss-build-without-nostdinc.patch     | 30 +++++++++++++++++++
 .../{libgloss_4.2.0.bb =3D> libgloss_4.3.0.bb}  |  5 +++-
 meta/recipes-core/newlib/newlib.inc           | 23 +++++++-------
 .../newlib/{newlib_4.2.0.bb =3D> newlib_git.bb} |  0
 6 files changed, 63 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-core/newlib/libgloss/libgloss-build-with=
out-nostdinc.patch
 rename meta/recipes-core/newlib/{libgloss_4.2.0.bb =3D> libgloss_4.3.0.b=
b} (75%)
 rename meta/recipes-core/newlib/{newlib_4.2.0.bb =3D> newlib_git.bb} (10=
0%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 23c2e02d0d..ec7ea90d16 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -339,7 +339,7 @@ RECIPE_MAINTAINER:pn-libgcc-initial =3D "Khem Raj <ra=
j.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgcrypt =3D "Hongxu Jia <hongxu.jia@windriver.com=
>"
 RECIPE_MAINTAINER:pn-libgfortran =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgit2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
-RECIPE_MAINTAINER:pn-libgloss =3D "Alejandro Hernandez <aehs29@gmail.com=
>"
+RECIPE_MAINTAINER:pn-libgloss =3D "Alejandro Hernandez <alejandro@enedin=
o.org>"
 RECIPE_MAINTAINER:pn-libglu =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libgpg-error =3D "Hongxu Jia <hongxu.jia@windriver.=
com>"
 RECIPE_MAINTAINER:pn-libgudev =3D "Ross Burton <ross.burton@arm.com>"
@@ -535,7 +535,7 @@ RECIPE_MAINTAINER:pn-nativesdk-libtool =3D "Richard P=
urdie <richard.purdie@linuxfo
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host =3D "Ross Burton <r=
oss.burton@arm.com>"
 RECIPE_MAINTAINER:pn-nativesdk-qemu-helper =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-sdk-provides-dummy =3D "Richard Purdie <r=
ichard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-newlib =3D "Alejandro Hernandez <aehs29@gmail.com>"
+RECIPE_MAINTAINER:pn-newlib =3D "Alejandro Hernandez <alejandro@enedino.=
org>"
 RECIPE_MAINTAINER:pn-ncurses =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-neard =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-net-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
diff --git a/meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch b/me=
ta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch
index c220fb8437..8c29fea8cf 100644
--- a/meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch
+++ b/meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch
@@ -5,35 +5,41 @@ name for crt0 in specific, so performing all of them re=
sults in an error during
 do_install, we simply modify the name of the objects so the installation=
 can proceed
 and leave it to the user to select which object files to use.
=20
-Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.co=
m>
=20
-Index: newlib-3.0.0/libgloss/rs6000/Makefile.in
+01/2023: Rebased for libgloss 4.3.0
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.=
org>
+
+
+Index: git/libgloss/rs6000/Makefile.in
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- newlib-3.0.0.orig/libgloss/rs6000/Makefile.in
-+++ newlib-3.0.0/libgloss/rs6000/Makefile.in
-@@ -358,7 +358,7 @@ install-sim:
- 	set -e; for x in ${SIM_CRT0} ${SIM_BSP} ${SIM_SCRIPTS}; do ${INSTALL_D=
ATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
+--- git.orig/libgloss/rs6000/Makefile.in
++++ git/libgloss/rs6000/Makefile.in
+@@ -362,7 +362,7 @@ install-sim:
 =20
  install-mvme:
+ 	${mkinstalldirs} ${DESTDIR}${tooldir}/lib${MULTISUBDIR}
 -	set -e; for x in ${MVME_CRT0} ${MVME_BSP} ${MVME_SCRIPTS}; do ${INSTAL=
L_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
 +	set -e; for x in ${MVME_CRT0} ${MVME_BSP} ${MVME_SCRIPTS}; do ${INSTAL=
L_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/mvme-$$x; done
 =20
  install-solaris:
- 	set -e; for x in ${SOLARIS_CRT0} ${SOLARIS_BSP} ${SOLARIS_SCRIPTS}; do=
 ${INSTALL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
-@@ -367,15 +367,15 @@ install-linux:
- 	set -e; for x in ${LINUX_CRT0} ${LINUX_BSP} ${LINUX_SCRIPTS}; do ${INS=
TALL_DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
+ 	${mkinstalldirs} ${DESTDIR}${tooldir}/lib${MULTISUBDIR}
+@@ -374,17 +374,17 @@ install-linux:
 =20
  install-yellowknife:
+ 	${mkinstalldirs} ${DESTDIR}${tooldir}/lib${MULTISUBDIR}
 -	set -e; for x in ${YELLOWKNIFE_CRT0} ${YELLOWKNIFE_BSP}; do ${INSTALL_=
DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
 +	set -e; for x in ${YELLOWKNIFE_CRT0} ${YELLOWKNIFE_BSP}; do ${INSTALL_=
DATA} $$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/yellowknife-$$x; done
  	set -e; for x in ${YELLOWKNIFE_SCRIPTS}; do ${INSTALL_DATA} $(srcdir)/=
$$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
 =20
  install-ads:
+ 	${mkinstalldirs} ${DESTDIR}${tooldir}/lib${MULTISUBDIR}
 -	set -e; for x in ${ADS_CRT0} ${ADS_BSP}; do ${INSTALL_DATA} $$x $(DEST=
DIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
 +	set -e; for x in ${ADS_CRT0} ${ADS_BSP}; do ${INSTALL_DATA} $$x $(DEST=
DIR)${tooldir}/lib${MULTISUBDIR}/ads-$$x; done
  	set -e; for x in ${ADS_SCRIPTS}; do ${INSTALL_DATA} $(srcdir)/$$x $(DE=
STDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
 =20
  install-mbx:
+ 	${mkinstalldirs} ${DESTDIR}${tooldir}/lib${MULTISUBDIR}
 -	set -e; for x in ${MBX_CRT0} ${MBX_BSP}; do ${INSTALL_DATA} $$x $(DEST=
DIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
 +	set -e; for x in ${MBX_CRT0} ${MBX_BSP}; do ${INSTALL_DATA} $$x $(DEST=
DIR)${tooldir}/lib${MULTISUBDIR}/mbx-$$x; done
  	set -e; for x in ${MBX_SCRIPTS} ${MBX_SPECS}; do ${INSTALL_DATA} $(src=
dir)/$$x $(DESTDIR)${tooldir}/lib${MULTISUBDIR}/$$x; done
diff --git a/meta/recipes-core/newlib/libgloss/libgloss-build-without-nos=
tdinc.patch b/meta/recipes-core/newlib/libgloss/libgloss-build-without-no=
stdinc.patch
new file mode 100644
index 0000000000..2b66155eea
--- /dev/null
+++ b/meta/recipes-core/newlib/libgloss/libgloss-build-without-nostdinc.p=
atch
@@ -0,0 +1,30 @@
+Upstream-Status: Inappropriate  [OE-Specific]
+
+Since commit e0c0ad82 libgloss started passing the -nostdinc to CC.
+
+They dont want to build against C library headers that are already in
+the system to avoid pollution, however, we purposely build libgloss
+against the newly built newlib C library, thats why we keep newlib
+and libgloss in separate recipes and create a dependency between them.
+
+This causes an issue where bitbake stops finding newlib headers while
+libgloss is being built.
+
+Do not pass -nostdinc to CC to maintain current behavior of
+TCLIBC=3Dnewlib
+
+
+Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.=
org>
+Index: newlib-3.0.0/libgloss/configure
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- newlib-3.0.0.orig/libgloss/configure
++++ newlib-3.0.0/libgloss/configure
+@@ -5106,7 +5106,7 @@ fi
+ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_compiler_isys=
tem" >&5
+ $as_echo "$libc_cv_compiler_isystem" >&6; }
+-CC=3D"$CC -nostdinc $libc_cv_compiler_isystem"
++CC=3D"$CC $libc_cv_compiler_isystem"
+=20
+ host_makefile_frag_path=3D$host_makefile_frag
+=20
diff --git a/meta/recipes-core/newlib/libgloss_4.2.0.bb b/meta/recipes-co=
re/newlib/libgloss_4.3.0.bb
similarity index 75%
rename from meta/recipes-core/newlib/libgloss_4.2.0.bb
rename to meta/recipes-core/newlib/libgloss_4.3.0.bb
index 8c8ee91395..7e34e33c7a 100644
--- a/meta/recipes-core/newlib/libgloss_4.2.0.bb
+++ b/meta/recipes-core/newlib/libgloss_4.3.0.bb
@@ -4,8 +4,9 @@ DEPENDS +=3D "newlib"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/libgloss:"
=20
+SRC_URI:append =3D " file://libgloss-build-without-nostdinc.patch"
 SRC_URI:append:powerpc =3D " file://fix-rs6000-crt0.patch"
-SRC_URI:append:arm =3D " file://fix_makefile_include_arm_h.patch"
+SRC_URI:append:powerpc =3D " file://fix-rs6000-cflags.patch"
=20
 do_configure() {
 	${S}/libgloss/configure ${EXTRA_OECONF}
@@ -28,6 +29,8 @@ do_install:append() {
 # Split packages correctly
 FILES:${PN} +=3D "${libdir}/*.ld ${libdir}/*.specs"
 FILES:${PN}-dev +=3D "${libdir}/cpu-init/*"
+# RiscV installation moved the syscall header to this location
+FILES:${PN}-dev +=3D "${prefix}/${TARGET_SYS}/include/machine/*.h"
=20
 INHIBIT_PACKAGE_STRIP =3D "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newl=
ib/newlib.inc
index 27b52a43af..5351a9f991 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -10,24 +10,19 @@ LIC_FILES_CHKSUM =3D " \
 		file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504 \
 		file://COPYING.LIBGLOSS;md5=3Dc0469b6ebb847a75781066be515f032d \
 		file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
-		file://COPYING.NEWLIB;md5=3D8bb75595dbcc7d45e5c0d116d7bdf6ce \
+		file://COPYING.NEWLIB;md5=3D5a9d477b5f4eab20dccf655a77107a6e \
 		file://newlib/libc/posix/COPYRIGHT;md5=3D103468ff1982be840fdf4ee9f8b51=
bbf \
-		file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=3D73640207fbc79b=
198c7ffd4ad4d97aa0 \
 		"
=20
-# Newlib maintainers sometimes publish the source
-# from a specific snapshot, after an upgrade we can
-# delete the following line and keep the empty default
-NEWLIB_SNAPSHOT =3D ".20211231"
-NEWLIB_SNAPSHOT ?=3D ""
-SRC_URI =3D "https://sourceware.org/pub/newlib/newlib-${PV}${NEWLIB_SNAP=
SHOT}.tar.gz"
-SRC_URI[sha256sum] =3D "c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d1398676073=
69cb2915ffc54435"
-
+BASEVER =3D "4.3.0"
+PV =3D "${BASEVER}+git${SRCPV}"
+SRC_URI =3D "git://sourceware.org/git/newlib-cygwin.git;protocol=3Dhttps=
;branch=3Dmain"
+SRCREV=3D"9e09d6ed83cce4777a5950412647ccc603040409"
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 DEPENDS =3D "virtual/${TARGET_PREFIX}gcc"
=20
-S =3D "${WORKDIR}/newlib-${PV}${NEWLIB_SNAPSHOT}"
+S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 ## disable stdlib
@@ -52,6 +47,12 @@ EXTRA_OECONF =3D " \
=20
 do_configure[cleandirs] =3D "${B}"
=20
+# We need a dummy limits.h to pass preprocessor checks
+do_configure:append(){
+    install -d ${STAGING_INCDIR}
+    touch  ${STAGING_INCDIR}/limits.h
+}
+
 do_install() {
 	oe_runmake install DESTDIR=3D'${D}'
 }
diff --git a/meta/recipes-core/newlib/newlib_4.2.0.bb b/meta/recipes-core=
/newlib/newlib_git.bb
similarity index 100%
rename from meta/recipes-core/newlib/newlib_4.2.0.bb
rename to meta/recipes-core/newlib/newlib_git.bb
--=20
2.34.1


