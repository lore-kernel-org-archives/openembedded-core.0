Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AFEE81BB6
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:56:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46684.1770641797698337033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:56:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B6D8339
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A07E3F740
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 04:56:36 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 9/9] kernel: remove pkg-config variables for old (<5.15) kernels
Date: Mon,  9 Feb 2026 12:56:27 +0000
Message-ID: <20260209125628.640221-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209125628.640221-1-ross.burton@arm.com>
References: <20260209125628.640221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230796

The kernel has supported setting an alternative binary for pkg-config
with a variable since 5.19 (in 2022[1]) and we set that to
pkg-config-native, so there is no longer any need to also manually set
the PKG_CONFIG_* variables.

The relevant commit was backported and is present in 5.15.91 onwards,
but is not yet in 5.10.x.

[1] linux d5ea4fece450 ("kbuild: Allow kernel installation packaging to o=
verride pkg-config")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/kernel.bbclass        | 9 ---------
 meta/recipes-kernel/linux/linux-yocto.inc | 7 ++-----
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
index b43b4ff4fb..1ebf027281 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -251,7 +251,6 @@ KERNEL_EXTRA_ARGS ?=3D ""
 EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"$=
{KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}"'
 EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFLAGS}=
" HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
 EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD_CXX=
FLAGS}"'
-# Only for newer kernels (5.19+), native pkg-config variables are set fo=
r older kernels when building kernel and modules
 EXTRA_OEMAKE +=3D ' HOSTPKG_CONFIG=3D"pkg-config-native"'
=20
 KERNEL_ALT_IMAGETYPE ??=3D ""
@@ -364,10 +363,6 @@ KERNEL_DEBUG_TIMESTAMPS ??=3D "0"
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
=20
-	# setup native pkg-config variables (kconfig scripts call pkg-config di=
rectly, cannot generically be overriden to pkg-config-native)
-	export PKG_CONFIG_LIBDIR=3D"${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGIN=
G_DATADIR_NATIVE}/pkgconfig"
-	export PKG_CONFIG_SYSROOT_DIR=3D""
-
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
@@ -418,10 +413,6 @@ addtask transform_kernel after do_compile before do_=
install
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
=20
-	# setup native pkg-config variables (kconfig scripts call pkg-config di=
rectly, cannot generically be overriden to pkg-config-native)
-	export PKG_CONFIG_LIBDIR=3D"${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGIN=
G_DATADIR_NATIVE}/pkgconfig"
-	export PKG_CONFIG_SYSROOT_DIR=3D""
-
 	if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
index d57c1aae25..4e230d405a 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -88,9 +88,6 @@ do_kernel_configme[depends] +=3D '${@bb.utils.contains(=
"KERNEL_DEBUG", "True", "pa
 EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAH=
OLE=3Dfalse", d)}'
=20
 do_devshell:prepend() {
-    # setup native pkg-config variables (kconfig scripts call pkg-config=
 directly, cannot generically be overriden to pkg-config-native)
-    d.setVar("PKG_CONFIG_PATH", "")
-    d.setVar("PKG_CONFIG_LIBDIR", "${STAGING_LIBDIR_NATIVE}/pkgconfig:${=
STAGING_DATADIR_NATIVE}/pkgconfig")
-    d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
-    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_PATH PKG_CONFIG_LIBD=
IR PKG_CONFIG_SYSROOT_DIR")
+    d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
+    d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
 }
--=20
2.43.0


