Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487CCC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 18:26:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.585.1640024798669744734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45FE3D6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:26:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E61B23F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:26:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] kmod: merge target/native recipes
Date: Mon, 20 Dec 2021 18:26:34 +0000
Message-Id: <20211220182635.885262-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220182635.885262-1-ross.burton@arm.com>
References: <20211220182635.885262-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 18:26:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159897

There's no good reason to keep separate target and native recipes for
kmod, so merge them into a single kmod_29.bb which uses class extension.

The symlinks are not created differently for target vs native builds, as
the native sbindir is in PATH.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb   | 15 -------
 meta/recipes-kernel/kmod/kmod.inc             | 37 ----------------
 .../kmod/{kmod_git.bb =3D> kmod_29.bb}          | 44 +++++++++++++++----
 3 files changed, 35 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
 delete mode 100644 meta/recipes-kernel/kmod/kmod.inc
 rename meta/recipes-kernel/kmod/{kmod_git.bb =3D> kmod_29.bb} (60%)

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-k=
ernel/kmod/kmod-native_git.bb
deleted file mode 100644
index 4dd34b1c82..0000000000
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-require kmod.inc
-
-DEPENDS +=3D "zlib-native"
-
-inherit native
-
-do_install:append (){
-	for tool in depmod insmod lsmod modinfo modprobe rmmod
-	do
-		ln -s kmod ${D}${bindir}/$tool
-	done
-}
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod=
/kmod.inc
deleted file mode 100644
index d527887b78..0000000000
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ /dev/null
@@ -1,37 +0,0 @@
-# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY =3D "Tools for managing Linux kernel modules"
-DESCRIPTION =3D "kmod is a set of tools to handle common tasks with Linu=
x kernel modules like \
-               insert, remove, list, check properties, resolve dependenc=
ies and aliases."
-HOMEPAGE =3D "http://kernel.org/pub/linux/utils/kernel/kmod/"
-LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
-LICENSE:libkmod =3D "LGPL-2.1+"
-SECTION =3D "base"
-
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343 \
-                    file://libkmod/COPYING;md5=3Da6f89e2100d9b6cdffcea4f=
398e37343 \
-                    file://tools/COPYING;md5=3D751419260aa954499f7abaaba=
a882bbe \
-                   "
-inherit autotools gtk-doc pkgconfig manpages
-
-SRCREV =3D "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
-# Lookout for PV bump too when SRCREV is changed
-PV =3D "29"
-
-SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;bra=
nch=3Dmaster \
-           file://depmod-search.conf \
-           file://avoid_parallel_tests.patch \
-           "
-
-S =3D "${WORKDIR}/git"
-
-EXTRA_OECONF +=3D" --enable-tools --with-zlib"
-
-PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug"
-PACKAGECONFIG[logging] =3D " --enable-logging,--disable-logging"
-PACKAGECONFIG[manpages] =3D "--enable-manpages, --disable-manpages, libx=
slt-native xmlto-native"
-PACKAGECONFIG[xz] =3D "--with-xz,--without-xz,xz"
-PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
-
-GTKDOC_DOCDIR =3D "${S}/libkmod/docs"
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/k=
mod/kmod_29.bb
similarity index 60%
rename from meta/recipes-kernel/kmod/kmod_git.bb
rename to meta/recipes-kernel/kmod/kmod_29.bb
index 234f072fb6..904a17d9d0 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_29.bb
@@ -1,7 +1,38 @@
 # Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
-require kmod.inc
+SUMMARY =3D "Tools for managing Linux kernel modules"
+DESCRIPTION =3D "kmod is a set of tools to handle common tasks with Linu=
x kernel modules like \
+               insert, remove, list, check properties, resolve dependenc=
ies and aliases."
+HOMEPAGE =3D "http://kernel.org/pub/linux/utils/kernel/kmod/"
+LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
+LICENSE:libkmod =3D "LGPL-2.1+"
+SECTION =3D "base"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343 \
+                    file://libkmod/COPYING;md5=3Da6f89e2100d9b6cdffcea4f=
398e37343 \
+                    file://tools/COPYING;md5=3D751419260aa954499f7abaaba=
a882bbe \
+                   "
+inherit autotools bash-completion gtk-doc pkgconfig manpages update-alte=
rnatives
+
+SRCREV =3D "b6ecfc916a17eab8f93be5b09f4e4f845aabd3d1"
+
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;bra=
nch=3Dmaster \
+           file://depmod-search.conf \
+           file://avoid_parallel_tests.patch \
+           "
+
+S =3D "${WORKDIR}/git"
+
+EXTRA_OECONF +=3D "--enable-tools --with-zlib"
+
+PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug"
+PACKAGECONFIG[logging] =3D " --enable-logging,--disable-logging"
+PACKAGECONFIG[manpages] =3D "--enable-manpages, --disable-manpages, libx=
slt-native xmlto-native"
+PACKAGECONFIG[xz] =3D "--with-xz,--without-xz,xz"
+PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
+
+GTKDOC_DOCDIR =3D "${S}/libkmod/docs"
=20
 DEPENDS +=3D "zlib"
 PROVIDES +=3D "module-init-tools-insmod-static module-init-tools-depmod =
module-init-tools"
@@ -13,7 +44,7 @@ RREPLACES:${PN} +=3D "module-init-tools-insmod-static m=
odule-init-tools-depmod mod
 RCONFLICTS:libkmod2 +=3D "module-init-tools-insmod-static module-init-to=
ols-depmod module-init-tools"
=20
 # autotools set prefix to /usr, however we want them in /bin and /sbin
-EXTRA_OECONF +=3D " --bindir=3D${base_bindir} --sbindir=3D${base_sbindir=
}"
+EXTRA_OECONF +=3D "--bindir=3D${base_bindir} --sbindir=3D${base_sbindir}=
"
=20
 do_install:append () {
         install -dm755 ${D}${base_bindir}
@@ -33,26 +64,21 @@ do_install:append () {
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${nonarch_ba=
se_libdir}/depmod.d/search.conf"
 }
=20
-inherit update-alternatives bash-completion
-
 ALTERNATIVE_PRIORITY =3D "70"
=20
 ALTERNATIVE:kmod =3D "insmod modprobe rmmod modinfo bin-lsmod lsmod depm=
od"
=20
+ALTERNATIVE_LINK_NAME[depmod] =3D "${base_sbindir}/depmod"
 ALTERNATIVE_LINK_NAME[insmod] =3D "${base_sbindir}/insmod"
 ALTERNATIVE_LINK_NAME[modprobe] =3D "${base_sbindir}/modprobe"
 ALTERNATIVE_LINK_NAME[rmmod] =3D "${base_sbindir}/rmmod"
 ALTERNATIVE_LINK_NAME[modinfo] =3D "${base_sbindir}/modinfo"
 ALTERNATIVE_LINK_NAME[bin-lsmod] =3D "${base_bindir}/lsmod"
-
 ALTERNATIVE_LINK_NAME[lsmod] =3D "${base_sbindir}/lsmod"
 ALTERNATIVE_TARGET[lsmod] =3D "${base_bindir}/lsmod.${BPN}"
=20
-ALTERNATIVE_LINK_NAME[depmod] =3D "${base_sbindir}/depmod"
-
 PACKAGES =3D+ "libkmod"
-
 FILES:libkmod =3D "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${=
SOLIBS}"
 FILES:${PN} +=3D "${nonarch_base_libdir}/depmod.d ${nonarch_base_libdir}=
/modprobe.d"
=20
-BBCLASSEXTEND =3D "nativesdk"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


