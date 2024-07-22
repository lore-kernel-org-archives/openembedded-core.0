Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB408C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 05:35:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11986.1721626507253158927
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 22:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9843E40C56;
	Mon, 22 Jul 2024 05:35:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mChJ9Z457EZy; Mon, 22 Jul 2024 05:35:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1CE8840C2E;
	Mon, 22 Jul 2024 05:35:04 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id B4867163FF1;
	Mon, 22 Jul 2024 01:35:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Hnatiuk <ohnatiuk@cisco.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH v3 1/2] gcc: remove paths to sysroot from configargs.h and checksum-options for gcc-cross-canadian
Date: Mon, 22 Jul 2024 01:34:58 -0400
Message-Id: <20240722053459.2462155-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 05:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202302

From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>

Apply fixes from gcc-cross (84a78f46d594 and 0ead8cbdfb96) to gcc-cross-c=
anadian.
This will improve (but not fix) reproducibility of gcc-cross-canadian.
Also move this code to functions to avoid code duplication.

Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v3 - add common functions to gcc-common.inc instead of gcc-configure-comm=
on.h

 meta/recipes-devtools/gcc/gcc-common.inc      | 19 +++++++++++++++++++
 .../gcc/gcc-configure-common.inc              |  1 -
 .../gcc/gcc-cross-canadian.inc                |  3 +++
 meta/recipes-devtools/gcc/gcc-cross.inc       | 15 ++-------------
 meta/recipes-devtools/gcc/gcc-target.inc      | 16 ++--------------
 5 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
index 5ac82b1b57..507b257e1f 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -116,3 +116,22 @@ target_prefix ?=3D "${prefix}"
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] =3D "WORKDIR"
 should_apply[vardepsexclude] +=3D "PN"
+
+remove_sysroot_paths_from_configargs () {
+	# Prevent sysroot path from being used in configargs.h header, as it wi=
ll
+	# be rewritten when used by other sysroots preventing support for gcc
+	# plugins. Additionally the path is embeddeded into the output binary, =
this
+	# prevents building a reproducible binary.
+	oe_runmake configure-gcc
+	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
+	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
+}
+
+remove_sysroot_paths_from_checksum_options () {
+	# Prevent sysroot/workdir paths from being used in checksum-options.
+	# checksum-options is used to generate a checksum which is embedded int=
o
+	# the output binary.
+	oe_runmake TARGET-gcc=3Dchecksum-options all-gcc
+	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
+	sed -i 's@${1}@/host@g' ${B}/gcc/checksum-options
+}
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
index d77b2ec3d1..5c79936242 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -119,4 +119,3 @@ do_configure () {
=20
 	oe_runconf
 }
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
index 7c4233c211..9528b71272 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -64,6 +64,9 @@ do_configure () {
 }
=20
 do_compile () {
+	remove_sysroot_paths_from_configargs
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}'
+
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind=
.h md-unwind-support.h sfp-machine.h gthr-default.h)
 }
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
index 5b0ca15d47..f8a7730cf3 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -62,19 +62,8 @@ do_compile () {
 	export CXXFLAGS_FOR_TARGET=3D"${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET=3D"${TARGET_LDFLAGS}"
=20
-	# Prevent native/host sysroot path from being used in configargs.h head=
er,
-	# as it will be rewritten when used by other sysroots preventing suppor=
t
-	# for gcc plugins
-	oe_runmake configure-gcc
-	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
-	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
-
-	# Prevent sysroot/workdir paths from being used in checksum-options.
-	# checksum-options is used to generate a checksum which is embedded int=
o
-	# the output binary.
-	oe_runmake TARGET-gcc=3Dchecksum-options all-gcc
-	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
-	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/checksum-options
+	remove_sysroot_paths_from_configargs
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}'
=20
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind=
.h md-unwind-support.h sfp-machine.h gthr-default.h)
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
index e9187fc444..bd7506fe3a 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -132,20 +132,8 @@ FILES:${PN}-doc =3D "\
 "
=20
 do_compile () {
-	# Prevent full target sysroot path from being used in configargs.h head=
er,
-	# as it will be rewritten when used by other sysroots preventing suppor=
t
-	# for gcc plugins. Additionally the path is embeddeded into the output
-	# binary, this prevents building a reproducible binary.
-	oe_runmake configure-gcc
-	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
-	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
-
-	# Prevent sysroot/workdir paths from being used in checksum-options.
-	# checksum-options is used to generate a checksum which is embedded int=
o
-	# the output binary.
-	oe_runmake TARGET-gcc=3Dchecksum-options all-gcc
-	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
-	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/checksum-options
+	remove_sysroot_paths_from_configargs
+	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_TARGET}'
=20
 	oe_runmake all-host
 }
--=20
2.25.1


