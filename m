Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4199AD6EC16
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:46:15 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.116414.1732891567303213416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 06:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 575D917B5
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 15:46:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.172.109]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tH2Fw-1PWV8b0; Fri, 29 Nov 2024 15:46:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-ore][PATCHv2] libsecret: add pam support depending on DISTRO_FEATURES
Date: Fri, 29 Nov 2024 15:45:56 +0100
Message-ID: <20241129144556.2259-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1732891564-63FEB6C2-37B2F174/0/0 CLEAN NORMAL
X-TOI-MSGID: 14f01168-bf6b-4604-a5af-ba2d812c437c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 14:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208018

pam module has been ported from gnome-keyring to libsecret
[https://gitlab.gnome.org/GNOME/libsecret/-/commit/9a37dc839a9be1670afeb6=
47d9f82b6ef1cd0893]

Add a PACKAGECONFIG for pam and enable it if pam is in DISTRO_FEATURES

Add a recipe for pam_wrapper, needed to build the tests

[https://gitlab.com/cwrap/pam_wrapper]

Import cmocka recipe from meta-oe
[https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-test=
/cmocka/cmocka_1.1.7.bb]

(From OE-Core rev: 3ef7f9650df0d99cd3a25ad470ac67aed1351d11)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc      |  2 +
 meta/recipes-devtools/cmocka/cmocka_1.1.7.bb  | 43 ++++++++++++++++
 ...or-previous-declaration-of-uintptr_t.patch | 43 ++++++++++++++++
 meta/recipes-devtools/cmocka/files/run-ptest  | 10 ++++
 ...rapper-add-pc_sysrootdir-to-pc-files.patch | 49 +++++++++++++++++++
 .../pam-wrapper/pam-wrapper_1.1.7.bb          | 23 +++++++++
 .../libsecret/libsecret_0.21.4.bb             |  5 +-
 7 files changed, 173 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/cmocka/cmocka_1.1.7.bb
 create mode 100644 meta/recipes-devtools/cmocka/files/0001-include-Check=
-for-previous-declaration-of-uintptr_t.patch
 create mode 100644 meta/recipes-devtools/cmocka/files/run-ptest
 create mode 100644 meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pa=
mwrapper-add-pc_sysrootdir-to-pc-files.patch
 create mode 100644 meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.b=
b

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index d61b88f7de..e6675fce36 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -98,6 +98,7 @@ RECIPE_MAINTAINER:pn-cdrtools-native =3D "Yi Zhao <yi.z=
hao@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-cmake =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-cmake-native =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
+RECIPE_MAINTAINER:pn-cmocka =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-connman =3D "Changhyeok Bae <changhyeok.bae@gmail.c=
om>"
 RECIPE_MAINTAINER:pn-connman-conf =3D "Ross Burton <ross.burton@arm.com>=
"
 RECIPE_MAINTAINER:pn-connman-gnome =3D "Ross Burton <ross.burton@arm.com=
>"
@@ -569,6 +570,7 @@ RECIPE_MAINTAINER:pn-ovmf =3D "Unassigned <unassigned=
@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ovmf-shell-image =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-p11-kit =3D "Alexander Kanavin <alex.kanavin@gmail.=
com>"
 RECIPE_MAINTAINER:pn-package-index =3D "Ross Burton <ross.burton@arm.com=
>"
+RECIPE_MAINTAINER:pn-pam-wrapper =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-pango =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-parted =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-patch =3D "Hongxu Jia <hongxu.jia@windriver.com>"
diff --git a/meta/recipes-devtools/cmocka/cmocka_1.1.7.bb b/meta/recipes-=
devtools/cmocka/cmocka_1.1.7.bb
new file mode 100644
index 0000000000..6c94e9e275
--- /dev/null
+++ b/meta/recipes-devtools/cmocka/cmocka_1.1.7.bb
@@ -0,0 +1,43 @@
+DESCRIPTION =3D "cmocka is an elegant unit testing framework for C with =
support for mock \
+objects. It only requires the standard C library, works on a range of co=
mputing \
+platforms (including embedded) and with different compilers."
+HOMEPAGE =3D "https://cmocka.org/"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
+
+SRCREV =3D "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
+PV .=3D "+git"
+SRC_URI =3D "git://git.cryptomilk.org/projects/cmocka.git;protocol=3Dhtt=
ps;branch=3Dstable-1.1 \
+           file://0001-include-Check-for-previous-declaration-of-uintptr=
_t.patch \
+           file://run-ptest \
+          "
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake ptest
+
+EXTRA_OECMAKE +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_=
BUILD_TYPE=3DDebug -DUNIT_TESTING=3DON', '', d)}"
+# Use -Wl,wrap linker flag, which does not work with LTO
+LTO =3D ""
+
+do_install:append () {
+    install -d ${D}${libdir}/${BPN}/example
+    install -d ${D}${libdir}/${BPN}/example/mock/chef_wrap
+    install -d ${D}${libdir}/${BPN}/example/mock/uptime
+
+    install -m 0755 ${B}/example/*_test ${D}/${libdir}/${BPN}/example
+    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${=
libdir}/${BPN}/example/mock/chef_wrap
+    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${libdir}/${BPN=
}/example/mock/uptime
+    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${libdir}/=
${BPN}/example/mock/uptime
+    install -m 0644 ${B}/example/mock/uptime/libproc_uptime.so ${D}/${li=
bdir}/${BPN}/example/mock/libproc_uptime.so
+}
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
+}
+
+PACKAGE_BEFORE_PN +=3D "${PN}-examples"
+
+FILES:${PN}-examples =3D "${libdir}/${BPN}/example"
diff --git a/meta/recipes-devtools/cmocka/files/0001-include-Check-for-pr=
evious-declaration-of-uintptr_t.patch b/meta/recipes-devtools/cmocka/file=
s/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
new file mode 100644
index 0000000000..65d30ea993
--- /dev/null
+++ b/meta/recipes-devtools/cmocka/files/0001-include-Check-for-previous-=
declaration-of-uintptr_t.patch
@@ -0,0 +1,43 @@
+From a54e035f802e79e3292d8ad39a14bd7c060eb7b1 Mon Sep 17 00:00:00 2001
+From: Breno Leitao <breno.leitao@gmail.com>
+Date: Tue, 21 Mar 2023 21:58:28 -0700
+Subject: [PATCH] include: Check for previous declaration of uintptr_t
+
+Adding a extra check before declaring uintptr_t. Currently musl uses
+macro __DEFINED_uintptr_t once it defines uintptr_t type. Checking
+this macro before defining it, and, defining it when uintptr_t is
+defined.
+
+Taken from Alpine
+
+Upstream-Status: Pending
+Signed-off-by: Breno Leitao <breno.leitao@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/cmocka.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/cmocka.h b/include/cmocka.h
+index a21d965..f540793 100644
+--- a/include/cmocka.h
++++ b/include/cmocka.h
+@@ -121,7 +121,7 @@ typedef uintmax_t LargestIntegralType;
+     ((LargestIntegralType)(value))
+=20
+ /* Smallest integral type capable of holding a pointer. */
+-#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && !defined(HA=
VE_UINTPTR_T)
++#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && !defined(HA=
VE_UINTPTR_T) && !defined(__DEFINED_uintptr_t)
+ # if defined(_WIN32)
+     /* WIN32 is an ILP32 platform */
+     typedef unsigned int uintptr_t;
+@@ -147,6 +147,7 @@ typedef uintmax_t LargestIntegralType;
+=20
+ # define _UINTPTR_T
+ # define _UINTPTR_T_DEFINED
++# define __DEFINED_uintptr_t
+ #endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
+=20
+ /* Perform an unsigned cast to uintptr_t. */
+--=20
+2.40.0
+
diff --git a/meta/recipes-devtools/cmocka/files/run-ptest b/meta/recipes-=
devtools/cmocka/files/run-ptest
new file mode 100644
index 0000000000..48b9cd9fc5
--- /dev/null
+++ b/meta/recipes-devtools/cmocka/files/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd tests
+for i in `ls *`; do
+   if [ ./$i ] ; then
+       echo "PASS: $i"
+   else
+       echo "FAIL: $i"
+   fi
+done
diff --git a/meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrappe=
r-add-pc_sysrootdir-to-pc-files.patch b/meta/recipes-devtools/pam-wrapper=
/pam-wrapper/0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch
new file mode 100644
index 0000000000..03c4141aa2
--- /dev/null
+++ b/meta/recipes-devtools/pam-wrapper/pam-wrapper/0001-pamwrapper-add-p=
c_sysrootdir-to-pc-files.patch
@@ -0,0 +1,49 @@
+From 15733e45935dbef71b6c4547cd3a905014793aed Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 29 Nov 2024 13:49:16 +0100
+Subject: [PATCH] pamwrapper: add ${pc_sysrootdir} to pc files
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ libpamtest.pc.cmake         | 2 +-
+ pam_wrapper-config.cmake.in | 4 ++--
+ pam_wrapper.pc.cmake        | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/libpamtest.pc.cmake b/libpamtest.pc.cmake
+index 6726d76..9cee8bf 100644
+--- a/libpamtest.pc.cmake
++++ b/libpamtest.pc.cmake
+@@ -1,4 +1,4 @@
+ Name: libpamtest
+ Description: A helper library for PAM testing
+ Version: @APPLICATION_VERSION@
+-Libs: @CMAKE_INSTALL_FULL_LIBDIR@/libpamtest.so
++Libs: ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/libpamtest.so
+diff --git a/pam_wrapper-config.cmake.in b/pam_wrapper-config.cmake.in
+index d89e9a4..6ff00d7 100644
+--- a/pam_wrapper-config.cmake.in
++++ b/pam_wrapper-config.cmake.in
+@@ -1,2 +1,2 @@
+-set(PAM_WRAPPER_LIBRARY @CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@)
+-set(PAM_WRAPPER_MODULE_DIR @CMAKE_INSTALL_FULL_LIBDIR@/@PROJECT_NAME@)
++set(PAM_WRAPPER_LIBRARY ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/@PA=
M_WRAPPER_LIB@)
++set(PAM_WRAPPER_MODULE_DIR ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/=
@PROJECT_NAME@)
+diff --git a/pam_wrapper.pc.cmake b/pam_wrapper.pc.cmake
+index 7ebe607..f722781 100644
+--- a/pam_wrapper.pc.cmake
++++ b/pam_wrapper.pc.cmake
+@@ -1,6 +1,6 @@
+-modules=3D@CMAKE_INSTALL_FULL_LIBDIR@/pam_wrapper
++modules=3D${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/pam_wrapper
+=20
+ Name: @PROJECT_NAME@
+ Description: The pam_wrapper library
+ Version: @PROJECT_VERSION@
+-Libs: @CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@
++Libs: ${pc_sysrootdir}@CMAKE_INSTALL_FULL_LIBDIR@/@PAM_WRAPPER_LIB@
+--=20
+2.47.0
+
diff --git a/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb b/met=
a/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb
new file mode 100644
index 0000000000..8df3295eb6
--- /dev/null
+++ b/meta/recipes-devtools/pam-wrapper/pam-wrapper_1.1.7.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "A tool to test PAM applications and PAM modules"
+HOMEPAGE =3D "https://gitlab.com/cwrap/pam_wrapper"
+LICENSE =3D "GPL-3.0-only"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
+
+SRCREV =3D "f140952e99bb0682bc6da7858f6ca25b70fab86c"
+SRC_URI =3D " \
+	git://gitlab.com/cwrap/pam_wrapper.git;protocol=3Dhttps;branch=3Dmaster=
 \
+	file://0001-pamwrapper-add-pc_sysrootdir-to-pc-files.patch \
+"
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig python3targetconfig
+
+EXTRA_OECMAKE +=3D "-DPAM_LIBRARY=3D${libdir}/libpam.so.0"
+
+DEPENDS +=3D "cmocka libpam"
+
+FILES:${PN} +=3D "${libdir}"
+
+RDEPENDS:${PN} +=3D "python3-core libpython3"
+
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb b/meta/reci=
pes-gnome/libsecret/libsecret_0.21.4.bb
index 88c3c73510..fd3f7a38c3 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb
@@ -8,16 +8,17 @@ HOMEPAGE =3D "https://github.com/GNOME/libsecret"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D23c2a5e0106b99d75238986559bb5=
fc6"
=20
-
 inherit gnomebase gi-docgen vala gobject-introspection manpages
=20
-DEPENDS +=3D "glib-2.0 libgcrypt gettext-native"
+DEPENDS +=3D "glib-2.0 libgcrypt gettext-native pam-wrapper"
=20
 SRC_URI[archive.sha256sum] =3D "163d08d783be6d4ab9a979ceb5a4fecbc1d9660d=
3c34168c581301cd53912b20"
=20
 GTKDOC_MESON_OPTION =3D 'gtk_doc'
=20
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[manpages] =3D "-Dmanpage=3Dtrue,-Dmanpage=3Dfalse,libxslt-=
native xmlto-native"
+PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam"
=20
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
--=20
2.47.0


