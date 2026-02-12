Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E4DEE36A7
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:43:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49972.1770914582865873415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E751339
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:42:56 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2CE2C3F63F
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 08:43:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] cmake: remove obsolete patches
Date: Thu, 12 Feb 2026 16:42:53 +0000
Message-ID: <20260212164254.1110652-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212164254.1110652-1-ross.burton@arm.com>
References: <20260212164254.1110652-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231046

0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch can be
replaced with two variable assignments to seed the results we want.

0002-CMakeLists.txt-disable-USE_NGHTTP2.patch is not needed anymore as
the vendored curl will disable the use of nghttp2 automatically if it
isn't found.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../cmake/cmake-native_4.2.3.bb               |  5 ++-
 ...ext2fs-ext2_fs.h-by-cmake-s-internal.patch | 38 -------------------
 ...2-CMakeLists.txt-disable-USE_NGHTTP2.patch | 36 ------------------
 3 files changed, 3 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-Disable-use-of=
-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt=
-disable-USE_NGHTTP2.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb b/meta/rec=
ipes-devtools/cmake/cmake-native_4.2.3.bb
index a4d5327438..cf800d4854 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
@@ -5,8 +5,6 @@ DEPENDS +=3D "bzip2-replacement-native xz-native zlib-nat=
ive ncurses-native zstd-n
=20
 SRC_URI +=3D "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
-            file://0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-inter=
nal.patch \
-            file://0002-CMakeLists.txt-disable-USE_NGHTTP2.patch \
             "
=20
 LICENSE:append =3D " & BSD-1-Clause & MIT & BSD-2-Clause & curl & Apache=
-2.0"
@@ -37,6 +35,9 @@ EXTRA_OECMAKE +=3D "\
     -DHAVE_SYS_ACL_H=3D0 \
 "
=20
+# Ensure e2fsprogs isn't found on the host to remove a build dependency =
and reproducible builds.
+EXTRA_OECMAKE +=3D "-DHAVE_EXT2FS_EXT2_FS_H=3D0 -DHAVE_WORKING_EXT2_IOC_=
GETFLAGS=3D0"
+
 do_configure () {
 	${S}/bootstrap --verbose --prefix=3D${prefix} \
 		${@oe.utils.parallel_make_argument(d, '--parallel=3D%d')} \
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs=
-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/=
0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
deleted file mode 100644
index 7a717f72d8..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_f=
s.h-by-cmake-s-internal.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d3859840c134012b18e3bca7e4bab60c9bc8efd5 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Thu, 5 Jul 2018 10:28:04 -0300
-Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
-
- libarchive copy
-Organization: O.S. Systems Software LTDA.
-
-We don't want to add a dependency on e2fsprogs-native for cmake-native,
-and we don't use CPack so just disable this functionality.
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- Utilities/cmlibarchive/CMakeLists.txt | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarch=
ive/CMakeLists.txt
-index 9957052d..71a7aeb5 100644
---- a/Utilities/cmlibarchive/CMakeLists.txt
-+++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -734,12 +734,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
- LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
- LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
- LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
--LA_CHECK_INCLUDE_FILE("ext2fs/ext2_fs.h" HAVE_EXT2FS_EXT2_FS_H)
--
--CHECK_C_SOURCE_COMPILES("#include <sys/ioctl.h>
--#include <ext2fs/ext2_fs.h>
--int main(void) { return EXT2_IOC_GETFLAGS; }" HAVE_WORKING_EXT2_IOC_GET=
FLAGS)
--
-+SET(HAVE_EXT2FS_EXT2_FS_H 0)
-+SET(HAVE_WORKING_EXT2_IOC_GETFLAGS 0)
- LA_CHECK_INCLUDE_FILE("fcntl.h" HAVE_FCNTL_H)
- LA_CHECK_INCLUDE_FILE("fnmatch.h" HAVE_FNMATCH_H)
- LA_CHECK_INCLUDE_FILE("grp.h" HAVE_GRP_H)
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disabl=
e-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.t=
xt-disable-USE_NGHTTP2.patch
deleted file mode 100644
index c03e5e2364..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_N=
GHTTP2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 811ad63aeff08fb6308203989f6cc664d00a2fa9 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 28 Dec 2022 17:51:27 +0800
-Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
-
-nghttp2 depends on cmake-native to build, to break circular
-dependency, disable nghttp2.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Adjust the patch to apply on top of v3.28.3.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
-Adjust the patch to apply on top of v3.30.1.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- Utilities/cmcurl/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLis=
ts.txt
-index 63d3a4f5..ab5f1c50 100644
---- a/Utilities/cmcurl/CMakeLists.txt
-+++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -109,7 +109,7 @@ set(USE_ECH OFF)
- set(USE_HTTPSRR OFF)
- set(USE_LIBIDN2 ON)
- set(USE_LIBRTMP OFF)
--set(USE_NGHTTP2 ON)
-+set(USE_NGHTTP2 OFF)
- set(USE_NGTCP2 OFF)
- set(USE_OPENSSL_QUIC OFF)
- set(USE_QUICHE OFF)
--=20
2.43.0


