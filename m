Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94528C7EE23
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:40:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30014.1684262439007231522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E32D41FB;
	Tue, 16 May 2023 11:41:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A2703F793;
	Tue, 16 May 2023 11:40:37 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	kubiznak@2n.com
Subject: [PATCH 1/7] meta: depend on autoconf-archive-native, not autoconf-archive
Date: Tue, 16 May 2023 19:40:25 +0100
Message-Id: <20230516184031.2255171-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181414

From: Ross Burton <ross.burton@arm.com>

autoconf-archive is a collection of m4 autoconf macros needed at
build-time, and autoconf-archive-native is a suitable provider as there
is nothing in the recipe that needs to be cross-compiled.

Also if we use DEPENDS=3Dautoconf-archive then the recipe's -dev package
ends up RDEPENDing on autoconf-archive, which isn't correct.

Universally change any DEPENDS on autoconf-archive to the -native form,
and add any missing dependencies that were implicit before.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/neard/neard_0.18.bb                  | 2 +-
 meta/recipes-core/dbus/dbus_1.14.6.bb                          | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc                  | 2 +-
 meta/recipes-extended/wget/wget.inc                            | 2 +-
 .../gobject-introspection/gobject-introspection_1.74.0.bb      | 2 +-
 meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb                 | 2 +-
 meta/recipes-kernel/powertop/powertop_2.15.bb                  | 2 +-
 meta/recipes-support/icu/icu_72-1.bb                           | 3 +--
 meta/recipes-support/mpfr/mpfr_4.2.0.bb                        | 2 +-
 9 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb b/meta/recipes=
-connectivity/neard/neard_0.18.bb
index dbd6e3841a1..362a7615b6e 100644
--- a/meta/recipes-connectivity/neard/neard_0.18.bb
+++ b/meta/recipes-connectivity/neard/neard_0.18.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff8=
7c09e5b7ccc2c4ca7e \
                     file://src/near.h;beginline=3D1;endline=3D20;md5=3D3=
58e4deefef251a4761e1ffacc965d13 \
                    "
=20
-DEPENDS =3D "dbus glib-2.0 libnl"
+DEPENDS =3D "dbus glib-2.0 libnl autoconf-archive-native"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=
=3Dhttps;branch=3Dmaster \
            file://neard.in \
diff --git a/meta/recipes-core/dbus/dbus_1.14.6.bb b/meta/recipes-core/db=
us/dbus_1.14.6.bb
index a6e18a92cbb..da25155773a 100644
--- a/meta/recipes-core/dbus/dbus_1.14.6.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.6.bb
@@ -42,7 +42,7 @@ PACKAGECONFIG[verbose-mode] =3D "--enable-verbose-mode,=
,,"
 PACKAGECONFIG[audit] =3D "--enable-libaudit,--disable-libaudit,audit"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x"
=20
-DEPENDS =3D "expat virtual/libintl autoconf-archive glib-2.0"
+DEPENDS =3D "expat virtual/libintl autoconf-archive-native glib-2.0"
 RDEPENDS:${PN} +=3D "${PN}-common ${PN}-tools"
 RDEPENDS:${PN}:class-native =3D ""
=20
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes=
-devtools/e2fsprogs/e2fsprogs.inc
index d345b914722..0cb3f0e6a6f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D "file://NOTICE;md5=3Dd50be0580c0b0=
a7fbc7a4830bbe6c12b \
                       file://lib/et/et_name.c;beginline=3D1;endline=3D11=
;md5=3Dead236447dac7b980dbc5b4804d8c836 \
                       file://lib/ss/ss.h;beginline=3D1;endline=3D20;md5=3D=
6e89ad47da6e75fecd2b5e0e81e1d4a6"
 SECTION =3D "base"
-DEPENDS =3D "util-linux attr autoconf-archive"
+DEPENDS =3D "util-linux attr autoconf-archive-native"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=3D=
master;protocol=3Dhttps"
 S =3D "${WORKDIR}/git"
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/=
wget/wget.inc
index 58cb5ca73d3..d31756dbc8b 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e=
964aa6c70fd77641a71e"
=20
 inherit autotools gettext texinfo update-alternatives pkgconfig
=20
-DEPENDS +=3D "autoconf-archive"
+DEPENDS +=3D "autoconf-archive-native"
=20
 EXTRA_OECONF =3D "--without-libgnutls-prefix --without-libssl-prefix \
                 --disable-rpath"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspecti=
on_1.74.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion_1.74.0.bb
index 781ed65da37..d3a7ce2fd93 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74=
.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74=
.0.bb
@@ -27,7 +27,7 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
 MULTILIB_SCRIPTS =3D "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindi=
r}/g-ir-scanner"
=20
-DEPENDS +=3D " libffi zlib glib-2.0 python3 flex-native bison-native aut=
oconf-archive"
+DEPENDS +=3D " libffi zlib glib-2.0 python3 flex-native bison-native aut=
oconf-archive-native"
=20
 # target build needs qemu to run temporary introspection binaries create=
d
 # on the fly by g-ir-scanner and a native version of itself to run
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb b/meta/recipe=
s-graphics/xorg-lib/libx11_1.8.4.bb
index 1b95cfb4327..7831b4986af 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb
@@ -13,7 +13,7 @@ DEPENDS +=3D "xorgproto \
             xtrans \
             libxcb \
             xorgproto-native \
-            autoconf-archive \
+            autoconf-archive-native \
             "
=20
 PROVIDES =3D "virtual/libx11"
diff --git a/meta/recipes-kernel/powertop/powertop_2.15.bb b/meta/recipes=
-kernel/powertop/powertop_2.15.bb
index 0aae4c93978..65c6d0fcd37 100644
--- a/meta/recipes-kernel/powertop/powertop_2.15.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.15.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Power usage tool"
 DESCRIPTION =3D "Linux tool to diagnose issues with power consumption an=
d power management."
 HOMEPAGE =3D "https://01.org/powertop/"
 BUGTRACKER =3D "https://app.devzing.com/powertopbugs/bugzilla"
-DEPENDS =3D "ncurses libnl pciutils autoconf-archive"
+DEPENDS =3D "ncurses libnl pciutils autoconf-archive-native"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e"
=20
diff --git a/meta/recipes-support/icu/icu_72-1.bb b/meta/recipes-support/=
icu/icu_72-1.bb
index 2b20bdd7b23..c2eae5298fc 100644
--- a/meta/recipes-support/icu/icu_72-1.bb
+++ b/meta/recipes-support/icu/icu_72-1.bb
@@ -6,8 +6,7 @@ same results on all platforms."
 HOMEPAGE =3D "http://site.icu-project.org/"
=20
 LICENSE =3D "ICU"
-DEPENDS =3D "icu-native autoconf-archive"
-DEPENDS:class-native =3D "autoconf-archive-native"
+DEPENDS =3D "icu-native autoconf-archive-native"
=20
 CVE_PRODUCT =3D "international_components_for_unicode"
=20
diff --git a/meta/recipes-support/mpfr/mpfr_4.2.0.bb b/meta/recipes-suppo=
rt/mpfr/mpfr_4.2.0.bb
index fead5c38333..31804382e0f 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.0.bb
@@ -9,7 +9,7 @@ inherit autotools texinfo
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464 \
                     file://COPYING.LESSER;md5=3D3000208d539ec061b899bce1=
d9ce9404 \
                     "
-DEPENDS =3D "gmp autoconf-archive"
+DEPENDS =3D "gmp autoconf-archive-native"
=20
 SRC_URI =3D "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be=
2546fb4a9c26d993"
--=20
2.34.1


