Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17191.1793381415247022046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Rh6IPP+M;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91F98168F
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:30:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64DD73F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793381414; bh=yg032j4JEWWnY4lOPRi2AcaLp/lyI8hI8+l6EQXuOZI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rh6IPP+MwqluUzhQ+jlBUEyGsReOOpk+X07Lo9w5x+tlNOwV19XfsMfVeVCaZEBFJ
	 EQRsE+AW8Gcb07LQ4bGnTnd8PujQwHWil6ZZKHtYJWxeY7mVliN/RgrrnImOeWcM6y
	 Ngx9icsGbX0agpsYtPXha+8F8xU3+DG1Mjz7kFac=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3: conslidate sysconfigdata cleanup
Date: Fri, 30 Oct 2026 17:30:08 +0000
Message-ID: <20261030173010.4102708-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030173010.4102708-1-ross.burton@arm.com>
References: <20261030173010.4102708-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249059
Content-Type: text/plain; charset="utf-8"

There's no need to have two almost-identical blocks for removing build
references from the Python and JSON representations of the same data.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index d6e84e782a2..81da730c0c0 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -366,7 +366,8 @@ PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
=20
 py_package_preprocess () {
         # Remove references to buildmachine paths in target Makefile and=
 _sysconfigdata
-        sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-=
libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \
+        sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' \
+                -e s:'--with-libtool-sysroot=3D${STAGING_DIR_TARGET}'::g=
 \
                 -e 's|${DEBUG_PREFIX_MAP}||g' \
                 -e 's:${HOSTTOOLS_DIR}/::g' \
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
@@ -375,8 +376,10 @@ py_package_preprocess () {
                 -e 's:BUILD_GNU_TYPE\(.*\)=3D\(.*\)[a-z\-]*:BUILD_GNU_TY=
PE\1=3D\2${HOST_SYS}:g' \
                 -e 's:build_alias=3D${BUILD_ARCH}:build_alias=3D${HOST_A=
RCH}:g' \
                 -e 's:--build=3D${BUILD_ARCH}:--build=3D${HOST_ARCH}:g' =
\
+                -e 's|"userbase": ".*"|"userbase": ""|g' \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON=
_MAJMIN}${PYTHON_ABI}*/Makefile \
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*=
.py \
+                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars=
*.json \
                 ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
=20
         # Reformat and recompile _sysconfigdata after modifying it so th=
at it remains
@@ -391,18 +394,6 @@ py_package_preprocess () {
         #Remove the unneeded copy of target sysconfig data
         rm -rf ${PKGD}/${libdir}/python-sysconfigdata
=20
-	# Remove references to buildpaths in _sysconfig_vars JSON files
-        sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-=
libtool-sysroot=3D${STAGING_DIR_TARGET}'::g \
-                -e 's|${DEBUG_PREFIX_MAP}||g' \
-                -e 's:${HOSTTOOLS_DIR}/::g' \
-                -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-                -e 's:${RECIPE_SYSROOT}::g' \
-                -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-                -e 's:build_alias=3D${BUILD_ARCH}:build_alias=3D${HOST_A=
RCH}:g' \
-                -e 's:--build=3D${BUILD_ARCH}:--build=3D${HOST_ARCH}:g' =
\
-                -e 's|"userbase": ".*"|"userbase": ""|g' \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
-
         # Fix extensions in build-details.json
         sed -i -e 's:${BUILD_ARCH}-${HOST_OS}:${HOST_ARCH}-${HOST_OS}:g'=
 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/build-details.json
 }
--=20
2.43.0

