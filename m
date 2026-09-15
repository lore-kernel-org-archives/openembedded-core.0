Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DE5C982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 15:52:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.143.1789487516926044676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 08:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qLtlL4eD;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF55F2F;
	Tue, 15 Sep 2026 08:51:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9CE13F882;
	Tue, 15 Sep 2026 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487516; bh=zNoqEVbatzugFlHrD33fnCjvv6FNw5LJOxEgr7y80nk=;
	h=From:To:Cc:Subject:Date:From;
	b=qLtlL4eDeKZv1CHjR2C092cDSU++PcmFhwHgrz+y5ucX+YVRj9143FTOnq1vbwaIu
	 HWZ7FECQTdyi90UC7oBdM/qRNn7pcMuZDTkpD4PzSGE/B+BKTbDx4vnRj/NzDD+qvS
	 8HWLVP+svPr2PRq88pgUefLF0aksX6Sz9Gkp+gJ0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH] libjpeg-turbo: fix declared zlib linkage
Date: Tue, 15 Sep 2026 16:51:51 +0100
Message-ID: <20260915155151.913330-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245858

The generated .cmake files were using but not defining dependencies if
they were taken from the system instead of bundled, backport a patch
from upstream to fix this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../jpeg/libjpeg-turbo/zlib.patch             | 50 +++++++++++++++++++
 .../jpeg/libjpeg-turbo_3.2.0.bb               |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/jpeg/libjpeg-turbo/zlib.patch

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo/zlib.patch b/meta/r=
ecipes-graphics/jpeg/libjpeg-turbo/zlib.patch
new file mode 100644
index 00000000000..4a62eecb8ab
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo/zlib.patch
@@ -0,0 +1,50 @@
+From 95156233739078e7d4de0aeeacc4b0595630f393 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Wed, 15 Jul 2026 13:03:38 -0400
+Subject: [PATCH] Build: Fix CMake pkg config file if WITH_SYSTEM_*
+
+If WITH_SYSTEM_ZLIB or WITH_SYSTEM_SPNG is defined, then the generated
+CMake package config file will include (respectively)
+
+    INTERFACE_LINK_LIBRARIES "ZLIB::ZLIB"
+
+or
+
+    INTERFACE_LINK_LIBRARIES "PkgConfig::spng"
+
+in the libjpeg-turbo::turbojpeg and libjpeg-turbo::turbojpeg-static
+target properties.  Thus, our CMake package config file needs to find
+those dependencies.
+
+Fixes #901
+
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turb=
o/commit/95156233739078e7d4de0aeeacc4b0595630f393]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ release/Config.cmake.in | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/release/Config.cmake.in b/release/Config.cmake.in
+index 0c1ba8aa6d..04c147ef0a 100644
+--- a/release/Config.cmake.in
++++ b/release/Config.cmake.in
+@@ -1,4 +1,19 @@
+ @PACKAGE_INIT@
+=20
++set(WITH_SYSTEM_SPNG @WITH_SYSTEM_SPNG@)
++set(WITH_SYSTEM_ZLIB @WITH_SYSTEM_ZLIB@)
++
++if(WITH_SYSTEM_SPNG OR WITH_SYSTEM_ZLIB)
++  include(CMakeFindDependencyMacro)
++  if(WITH_SYSTEM_SPNG)
++    find_dependency(PkgConfig)
++    if(PkgConfig_FOUND)
++      pkg_check_modules(spng REQUIRED spng IMPORTED_TARGET)
++    endif()
++  else()
++    find_dependency(ZLIB)
++  endif()
++endif()
++
+ include("${CMAKE_CURRENT_LIST_DIR}/@CMAKE_PROJECT_NAME@Targets.cmake")
+ check_required_components("@CMAKE_PROJECT_NAME@")
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
index 7a548d4e9c6..3364c0fb565 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb
@@ -9,7 +9,8 @@ DEPENDS =3D "zlib"
 DEPENDS:append:x86-64:class-target =3D " nasm-native"
 DEPENDS:append:x86:class-target =3D " nasm-native"
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
+SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
+           file://zlib.patch"
 SRC_URI[sha256sum] =3D "6f30092cef9fb839779646608f4ee14ae3cbac989c47fa05=
e841b0841f09878e"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.=
\d+)*)"
=20
--=20
2.43.0


