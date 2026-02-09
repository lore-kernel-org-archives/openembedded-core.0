Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3C0E81BBA
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:56:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46682.1770641795140227489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E8F1063
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:28 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6761A3F740
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/9] classes/pkgconfig: rationalise variable usage
Date: Mon,  9 Feb 2026 12:56:23 +0000
Message-ID: <20260209125628.640221-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209125628.640221-1-ross.burton@arm.com>
References: <20260209125628.640221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230792

Our PKG_CONFIG_* variables were a bit of a mess.

First, PKG_CONFIG_DIR is not used by either pkg-config or pkgconf.  It's
set to (approximately) ${libdir}/pkgconfig but we also want to search
${datadir}/pkgconfig so it isn't actually useful as an intermediate
variable.

Remove PKG_CONFIG_DIR and replace with the neatest expression for the
value we want: ${STAGING_LIBDIR}/pkgconfig.

Second, PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR shouldn't be set to the
same paths. The semantics of these variables is that PKG_CONFIG_PATH is
searched first, followed by either PKG_CONFIG_LIBDIR or the default paths
compiled into the pkg-config binary.

Currently we set PKG_CONFIG_PATH to (approx.) ${libdir}:${datadir} and
PKG_CONFIG_LIBDIR to ${libdir}, so we search libdir twice.

Also the default paths embedded in the binary will be incorrect as they
point to pkgconfig-native's sysroot, so we absolutely need to set
PKG_CONFIG_LIBDIR.

Instead, set PKG_CONFIG_LIBDIR to ${libdir}:${datadir} so that the
default search path is correct. We can then leave PKG_CONFIG_PATH empty,
if a recipe has specific needs it can set that but normally it is not
needed anymore.

Then bubble these changes out to the few places where the variables are
used directly:

- Kernel/kconfig interaction where 'pkg-config' needs to read the
native files, not target.

- The class classes (native, etc) which redefine the values.  However,
as the values are defined in terms of sysroot variables, we can
typically remove assignments from those classes as they are redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cml1.bbclass           | 7 +++----
 meta/classes-recipe/cross-canadian.bbclass | 3 +--
 meta/classes-recipe/cross.bbclass          | 4 ++--
 meta/classes-recipe/kernel.bbclass         | 8 ++------
 meta/classes-recipe/native.bbclass         | 1 -
 meta/classes-recipe/nativesdk.bbclass      | 3 ---
 meta/classes-recipe/pkgconfig.bbclass      | 1 -
 meta/conf/bitbake.conf                     | 6 +++---
 meta/recipes-kernel/linux/linux-yocto.inc  | 7 +++----
 9 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.=
bbclass
index 3c2b4da4af..ac65eec4bf 100644
--- a/meta/classes-recipe/cml1.bbclass
+++ b/meta/classes-recipe/cml1.bbclass
@@ -51,12 +51,11 @@ python do_menuconfig() {
         mtime =3D 0
=20
     # setup native pkg-config variables (kconfig scripts call pkg-config=
 directly, cannot generically be overriden to pkg-config-native)
-    d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pk=
gconfig")
-    d.setVar("PKG_CONFIG_PATH", "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NAT=
IVE}/pkgconfig")
-    d.setVar("PKG_CONFIG_LIBDIR", "${PKG_CONFIG_DIR}")
+    d.setVar("PKG_CONFIG_PATH", "")
+    d.setVar("PKG_CONFIG_LIBDIR", "${STAGING_LIBDIR_NATIVE}/pkgconfig:${=
STAGING_DATADIR_NATIVE}/pkgconfig")
     d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
     # ensure that environment variables are overwritten with this tasks =
'd' values
-    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH =
PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
+    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_PATH PKG_CONFIG_LIBD=
IR PKG_CONFIG_SYSROOT_DIR")
=20
     oe_terminal("sh -c 'make %s; if [ $? -ne 0 ]; then echo \"Command fa=
iled.\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVa=
r('KCONFIG_CONFIG_COMMAND'),
                 d.getVar('PN') + ' Configuration', d)
diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-re=
cipe/cross-canadian.bbclass
index 059d9aa95f..6d3d2f7623 100644
--- a/meta/classes-recipe/cross-canadian.bbclass
+++ b/meta/classes-recipe/cross-canadian.bbclass
@@ -161,8 +161,7 @@ libexecdir =3D "${exec_prefix}/libexec/${TARGET_ARCH}=
${TARGET_VENDOR}-${TARGET_OS}
=20
 FILES:${PN} =3D "${prefix}"
=20
-export PKG_CONFIG_DIR =3D "${STAGING_DIR_HOST}${exec_prefix}/lib/pkgconf=
ig"
-export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
+PKG_CONFIG_LIBDIR =3D "${STAGING_DIR_HOST}${exec_prefix}/lib/pkgconfig:$=
{STAGING_DIR_HOST}${exec_prefix}/share/pkgconfig"
=20
 do_populate_sysroot[stamp-extra-info] =3D ""
 do_packagedata[stamp-extra-info] =3D ""
diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cros=
s.bbclass
index 574ce6988d..82a49dc8f5 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -33,8 +33,8 @@ PACKAGE_ARCH =3D "${BUILD_ARCH}"
=20
 MULTIMACH_TARGET_SYS =3D "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
=20
-export PKG_CONFIG_DIR =3D "${exec_prefix}/lib/pkgconfig"
-export PKG_CONFIG_SYSROOT_DIR =3D ""
+PKG_CONFIG_LIBDIR =3D "${exec_prefix}/lib/pkgconfig:${exec_prefix}/share=
/pkgconfig"
+PKG_CONFIG_SYSROOT_DIR =3D ""
=20
 TARGET_CPPFLAGS =3D ""
 TARGET_CFLAGS =3D ""
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
index f989b31c47..b43b4ff4fb 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -365,9 +365,7 @@ kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
=20
 	# setup native pkg-config variables (kconfig scripts call pkg-config di=
rectly, cannot generically be overriden to pkg-config-native)
-	export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native}/pkgconfi=
g"
-	export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkg=
config"
-	export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
+	export PKG_CONFIG_LIBDIR=3D"${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGIN=
G_DATADIR_NATIVE}/pkgconfig"
 	export PKG_CONFIG_SYSROOT_DIR=3D""
=20
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
@@ -421,9 +419,7 @@ do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
=20
 	# setup native pkg-config variables (kconfig scripts call pkg-config di=
rectly, cannot generically be overriden to pkg-config-native)
-	export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native}/pkgconfi=
g"
-	export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkg=
config"
-	export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
+	export PKG_CONFIG_LIBDIR=3D"${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGIN=
G_DATADIR_NATIVE}/pkgconfig"
 	export PKG_CONFIG_SYSROOT_DIR=3D""
=20
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/nat=
ive.bbclass
index b3411d20ca..e114669940 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -98,7 +98,6 @@ do_populate_sysroot[sstate-outputdirs] =3D "${COMPONENT=
S_DIR}/${PACKAGE_ARCH}/${PN
 # Since we actually install these into situ there is no staging prefix
 STAGING_DIR_HOST =3D ""
 STAGING_DIR_TARGET =3D ""
-PKG_CONFIG_DIR =3D "${libdir}/pkgconfig"
=20
 EXTRA_NATIVE_PKGCONFIG_PATH ?=3D ""
 PKG_CONFIG_PATH .=3D "${EXTRA_NATIVE_PKGCONFIG_PATH}"
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/=
nativesdk.bbclass
index c2e53c8450..117cc2329f 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -74,9 +74,6 @@ exec_prefix =3D "${SDKPATHNATIVE}${prefix_nativesdk}"
 baselib =3D "lib"
 sbindir =3D "${bindir}"
=20
-export PKG_CONFIG_DIR =3D "${STAGING_DIR_HOST}${libdir}/pkgconfig"
-export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
-
 python nativesdk_virtclass_handler () {
     pn =3D e.data.getVar("PN")
     if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
diff --git a/meta/classes-recipe/pkgconfig.bbclass b/meta/classes-recipe/=
pkgconfig.bbclass
index ea91338d34..50e74d0120 100644
--- a/meta/classes-recipe/pkgconfig.bbclass
+++ b/meta/classes-recipe/pkgconfig.bbclass
@@ -6,7 +6,6 @@
=20
 DEPENDS:prepend =3D "pkgconfig-native "
=20
-export PKG_CONFIG_DIR
 export PKG_CONFIG_PATH
 export PKG_CONFIG_LIBDIR
 export PKG_CONFIG_SYSROOT_DIR
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index be76c88cce..0c56f0fa15 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -768,11 +768,11 @@ BUILDCFG_NEEDEDVARS[type] =3D "list"
=20
 # Other
=20
-PKG_CONFIG_DIR =3D "${STAGING_DIR_HOST}${libdir}/pkgconfig"
-PKG_CONFIG_PATH =3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
-PKG_CONFIG_LIBDIR =3D "${PKG_CONFIG_DIR}"
+PKG_CONFIG_PATH =3D ""
+PKG_CONFIG_LIBDIR =3D "${STAGING_LIBDIR}/pkgconfig:${STAGING_DATADIR}/pk=
gconfig"
 PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
 PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
+# With pkg-config these have the sysroot prefixed
 PKG_CONFIG_SYSTEM_LIBRARY_PATH =3D "${base_libdir}:${libdir}"
 PKG_CONFIG_SYSTEM_INCLUDE_PATH =3D "${includedir}"
=20
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
index 4d0a726bb6..d57c1aae25 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -89,9 +89,8 @@ EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG",=
 "True", "", "PAHOLE=3Dfalse"
=20
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config=
 directly, cannot generically be overriden to pkg-config-native)
-    d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pk=
gconfig")
-    d.setVar("PKG_CONFIG_PATH", "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NAT=
IVE}/pkgconfig")
-    d.setVar("PKG_CONFIG_LIBDIR", "${PKG_CONFIG_DIR}")
+    d.setVar("PKG_CONFIG_PATH", "")
+    d.setVar("PKG_CONFIG_LIBDIR", "${STAGING_LIBDIR_NATIVE}/pkgconfig:${=
STAGING_DATADIR_NATIVE}/pkgconfig")
     d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
-    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH =
PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
+    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_PATH PKG_CONFIG_LIBD=
IR PKG_CONFIG_SYSROOT_DIR")
 }
--=20
2.43.0


