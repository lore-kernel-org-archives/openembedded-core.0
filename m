Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013CFC6369B
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.28118.1650885652332320941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBEF2ED1
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:20:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89FBD3F73B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 04:20:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] subversion: upgrade to 1.14.2
Date: Mon, 25 Apr 2022 12:20:45 +0100
Message-Id: <20220425112045.3812850-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425112045.3812850-1-ross.burton@arm.com>
References: <20220425112045.3812850-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164819

This release is primarily to fix two CVEs:
- CVE-2021-28544
- CVE-2022-24070

It also rewrites the macOS autoconf macros to be cross-compile friendly,
so we don't need to delete them anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../subversion/subversion/disable_macos.patch | 71 -------------------
 ...version_1.14.1.bb =3D> subversion_1.14.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/disable_m=
acos.patch
 rename meta/recipes-devtools/subversion/{subversion_1.14.1.bb =3D> subve=
rsion_1.14.2.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion/disable_macos.pa=
tch b/meta/recipes-devtools/subversion/subversion/disable_macos.patch
deleted file mode 100644
index 8d2d635992..0000000000
--- a/meta/recipes-devtools/subversion/subversion/disable_macos.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 9c350c037ca3489dbeece6ecc2d7e2e5dbb177e9 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 15:21:46 +0800
-Subject: [PATCH] These tests don't work in cross compiling, just disable=
 them
- for now, we don't build subversion on OS-X at this time.
-
-RP 1014/7/16
-
-Upstream-Status: Pending [needs a rewrite to support a cache value]
-
-Rebase to 1.12.0
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- build/ac-macros/macosx.m4 | 31 +------------------------------
- 1 file changed, 1 insertion(+), 30 deletions(-)
-
-diff --git a/build/ac-macros/macosx.m4 b/build/ac-macros/macosx.m4
-index 92fa58e..a568e1c 100644
---- a/build/ac-macros/macosx.m4
-+++ b/build/ac-macros/macosx.m4
-@@ -24,21 +24,7 @@ dnl Check for _dyld_image_name and _dyld_image_header=
 availability
- AC_DEFUN(SVN_LIB_MACHO_ITERATE,
- [
-   AC_MSG_CHECKING([for Mach-O dynamic module iteration functions])
--  AC_RUN_IFELSE([AC_LANG_PROGRAM([[
--    #include <mach-o/dyld.h>
--    #include <mach-o/loader.h>
--  ]],[[
--    const struct mach_header *header =3D _dyld_get_image_header(0);
--    const char *name =3D _dyld_get_image_name(0);
--    if (name && header) return 0;
--    return 1;
--  ]])],[
--    AC_DEFINE([SVN_HAVE_MACHO_ITERATE], [1],
--              [Is Mach-O low-level _dyld API available?])
--    AC_MSG_RESULT([yes])
--  ],[
-     AC_MSG_RESULT([no])
--  ])
- ])
-=20
- dnl SVN_LIB_MACOS_PLIST
-@@ -46,23 +32,8 @@ dnl Assign variables for Mac OS property list support
- AC_DEFUN(SVN_LIB_MACOS_PLIST,
- [
-   AC_MSG_CHECKING([for Mac OS property list utilities])
--
--  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
--    #include <AvailabilityMacros.h>
--    #if !defined(MAC_OS_X_VERSION_MAX_ALLOWED) \
--     || !defined(MAC_OS_X_VERSION_10_0) \
--     || (MAC_OS_X_VERSION_MAX_ALLOWED <=3D MAC_OS_X_VERSION_10_0)
--    #error ProperyList API unavailable.
--    #endif
--  ]],[[]])],[
--    SVN_MACOS_PLIST_LIBS=3D"-framework CoreFoundation"
--    AC_SUBST(SVN_MACOS_PLIST_LIBS)
--    AC_DEFINE([SVN_HAVE_MACOS_PLIST], [1],
--              [Is Mac OS property list API available?])
--    AC_MSG_RESULT([yes])
--  ],[
-+  AC_SUBST([SVN_MACOS_PLIST_LIBS], [""])
-     AC_MSG_RESULT([no])
--  ])
- ])
-=20
- dnl SVN_LIB_MACOS_KEYCHAIN
---=20
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.1.bb b/meta=
/recipes-devtools/subversion/subversion_1.14.2.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.14.1.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.2.bb
index 71183ac7ce..ba208d922f 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
@@ -9,11 +9,10 @@ DEPENDS =3D "apr-util serf sqlite3 file lz4"
 DEPENDS:append:class-native =3D " file-replacement-native"
=20
 SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://disable_macos.patch \
            file://serfmacro.patch \
            "
=20
-SRC_URI[sha256sum] =3D "2c5da93c255d2e5569fa91d92457fdb65396b0666fad4fd5=
9b22e154d986e1a9"
+SRC_URI[sha256sum] =3D "c9130e8d0b75728a66f0e7038fc77052e671830d785b5616=
aad53b4810d3cc28"
=20
 inherit autotools pkgconfig gettext python3native
=20
--=20
2.25.1


