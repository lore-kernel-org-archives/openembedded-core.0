Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3E2C3DA63
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 17:10:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3710.1721236253352148548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 10:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C98C40C67;
	Wed, 17 Jul 2024 17:10:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ej1iLjPpeEKu; Wed, 17 Jul 2024 17:10:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7F7A640A03;
	Wed, 17 Jul 2024 17:10:51 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1CE5D163FF4;
	Wed, 17 Jul 2024 13:10:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH v2] nativesdk-libtool: sanitize the script, remove buildpaths
Date: Wed, 17 Jul 2024 13:10:50 -0400
Message-Id: <20240717171050.704718-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 17:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202170

From: Denys Dmytriyenko <denys@konsulko.com>

Use the same sed command to sanitize libtool script for target recipe
and nativesdk one. Otherwise fails with buildpaths QA error:

ERROR: nativesdk-libtool-2.5.0-r0 do_package_qa: QA Issue: File /usr/loca=
l/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/libtoo=
l in package nativesdk-libtool contains reference to TMPDIR [buildpaths]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v2 - extract common code into .inc

 meta/recipes-devtools/libtool/libtool_2.5.0.bb    | 15 +--------------
 .../libtool/nativesdk-libtool_2.5.0.bb            |  1 +
 .../libtool/remove-buildpaths.inc                 | 13 +++++++++++++
 3 files changed, 15 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/remove-buildpaths.inc

diff --git a/meta/recipes-devtools/libtool/libtool_2.5.0.bb b/meta/recipe=
s-devtools/libtool/libtool_2.5.0.bb
index 44a4950574..c1e315aece 100644
--- a/meta/recipes-devtools/libtool/libtool_2.5.0.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.5.0.bb
@@ -1,4 +1,5 @@
 require libtool-${PV}.inc
+require remove-buildpaths.inc
=20
 SRC_URI +=3D "file://multilib.patch"
=20
@@ -15,20 +16,6 @@ SYSROOT_DIRS_IGNORE +=3D " \
=20
 ACLOCALEXTRAPATH:class-target =3D ""
=20
-do_install:append () {
-        sed -e 's@--sysroot=3D${STAGING_DIR_HOST}@@g' \
-            -e "s@${DEBUG_PREFIX_MAP}@@g" \
-            -e 's@${STAGING_DIR_HOST}@@g' \
-            -e 's@${STAGING_DIR_NATIVE}@@g' \
-            -e 's@^\(sys_lib_search_path_spec=3D"\).*@\1${libdir} ${base=
_libdir}"@' \
-            -e 's@^\(compiler_lib_search_dirs=3D"\).*@\1${libdir} ${base=
_libdir}"@' \
-            -e 's@^\(compiler_lib_search_path=3D"\).*@\1${libdir} ${base=
_libdir}"@' \
-            -e 's@^\(predep_objects=3D"\).*@\1"@' \
-            -e 's@^\(postdep_objects=3D"\).*@\1"@' \
-            -e "s@${HOSTTOOLS_DIR}/@@g" \
-            -i ${D}${bindir}/libtool
-}
-
 inherit multilib_script
=20
 MULTILIB_SCRIPTS =3D "${PN}:${bindir}/libtool"
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb b/m=
eta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
index ddb60e717c..2589bd617e 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
@@ -1,4 +1,5 @@
 require libtool-${PV}.inc
+require remove-buildpaths.inc
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/libtool:"
=20
diff --git a/meta/recipes-devtools/libtool/remove-buildpaths.inc b/meta/r=
ecipes-devtools/libtool/remove-buildpaths.inc
new file mode 100644
index 0000000000..1ca95aeace
--- /dev/null
+++ b/meta/recipes-devtools/libtool/remove-buildpaths.inc
@@ -0,0 +1,13 @@
+do_install:append () {
+        sed -e 's@--sysroot=3D${STAGING_DIR_HOST}@@g' \
+            -e "s@${DEBUG_PREFIX_MAP}@@g" \
+            -e 's@${STAGING_DIR_HOST}@@g' \
+            -e 's@${STAGING_DIR_NATIVE}@@g' \
+            -e 's@^\(sys_lib_search_path_spec=3D"\).*@\1${libdir} ${base=
_libdir}"@' \
+            -e 's@^\(compiler_lib_search_dirs=3D"\).*@\1${libdir} ${base=
_libdir}"@' \
+            -e 's@^\(compiler_lib_search_path=3D"\).*@\1${libdir} ${base=
_libdir}"@' \
+            -e 's@^\(predep_objects=3D"\).*@\1"@' \
+            -e 's@^\(postdep_objects=3D"\).*@\1"@' \
+            -e "s@${HOSTTOOLS_DIR}/@@g" \
+            -i ${D}${bindir}/libtool
+}
--=20
2.25.1


