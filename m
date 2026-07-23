Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33D4C531CC
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 19:38:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4838.1784835472404040676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 12:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=JqqDmVkO;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 978D61477
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:37:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D4A23F66F
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 12:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784835471; bh=V9lwHw+cuEnTSWF16XXdOTW+4cUQYKCxG2aioxh+aWc=;
	h=From:To:Subject:Date:From;
	b=JqqDmVkOHDVe8+wAeE1m7a/PnfEUoXJISUZHUoEoConpnrLOHG6Ml6X2qXwZ3oMfD
	 Vn7+z4ocfXeszaNdjEtZwdP4HTepB+9NlYRjNA1pC917lHq+A/KpfafHNhM7Y8q56p
	 cdtzF8kzA61l/sCTmmzqrNTdauZIE/cAZLFlJcU4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libgit2: remove library paths from installed .cmake
Date: Thu, 23 Jul 2026 20:37:44 +0100
Message-ID: <20260723193744.3592838-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 19:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241866

The libgit2 cmake rules generate a .cmake file that tells people linking
to libgit2 how to link.  This includes the complete path to each of the
libraries that libgit2 links, such as /path/to/sysroot/usr/lib/libssl.so.

The build paths were previously removed with a quick sed, but this breaks
builds where those target paths exist on the build host as they get used
verbatim.

However, all of this linkage is redundant as the library directly links
to these libraries.  Mark the linkage as private, so the references do
not appear in the .cmake files.

[ YOCTO #16373 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...m-libraries-are-private-link-librari.patch | 42 +++++++++++++++++++
 meta/recipes-support/libgit2/libgit2_1.9.4.bb |  8 ++--
 2 files changed, 45 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/libgit2/files/0001-cmake-mark-sy=
stem-libraries-are-private-link-librari.patch

diff --git a/meta/recipes-support/libgit2/files/0001-cmake-mark-system-li=
braries-are-private-link-librari.patch b/meta/recipes-support/libgit2/fil=
es/0001-cmake-mark-system-libraries-are-private-link-librari.patch
new file mode 100644
index 00000000000..267770ae6fe
--- /dev/null
+++ b/meta/recipes-support/libgit2/files/0001-cmake-mark-system-libraries=
-are-private-link-librari.patch
@@ -0,0 +1,42 @@
+From 5670d3eed82f0d64766158809bf3d0c7c631b0ea Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 23 Jul 2026 17:35:23 +0100
+Subject: [PATCH] cmake: mark system libraries are private link libraries
+
+When generating libgit2Targets.cmake, mark the system libraries that
+libgit2.so links to as private, as the don't not need to be seen by
+applications that link to libgit2.
+
+This stops the generated file from containing absolute paths to the
+libraries, which both leaks build information and means the build output
+is not relocatable:
+
+set_target_properties(libgit2::libgit2package PROPERTIES
+  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
+  INTERFACE_LINK_LIBRARIES "/PATH/TO/SYSROOT/usr/lib/libssl.so;/PATH/TO/=
SYSROOT/usr/lib/libcrypto.so;/PATH/TO/SYSROOT/usr/lib/libpcre2-8.so;/PATH=
/TO/SYSROOT/usr/lib/libz.so;rt"
+)
+
+Making the linkage private removes the INTERFACE_LINK_LIBRARIES line,
+and applications linking to libgit2 still succeed.
+
+Upstream-Status: Submitted [https://github.com/libgit2/libgit2/pull/7324=
]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/libgit2/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libgit2/CMakeLists.txt b/src/libgit2/CMakeLists.txt
+index 8045ddef9..fafdb09ec 100644
+--- a/src/libgit2/CMakeLists.txt
++++ b/src/libgit2/CMakeLists.txt
+@@ -65,7 +65,7 @@ if (NOT BUILD_SHARED_LIBS AND XCODE_VERSION)
+ endif()
+=20
+ add_library(libgit2package ${SRC_RC} ${LIBGIT2_OBJECTS})
+-target_link_libraries(libgit2package ${LIBGIT2_SYSTEM_LIBS})
++target_link_libraries(libgit2package PRIVATE ${LIBGIT2_SYSTEM_LIBS})
+ target_include_directories(libgit2package SYSTEM PRIVATE ${LIBGIT2_INCL=
UDES})
+ target_include_directories(libgit2package INTERFACE $<INSTALL_INTERFACE=
:${CMAKE_INSTALL_INCLUDEDIR}>)
+=20
+--=20
+2.43.0
diff --git a/meta/recipes-support/libgit2/libgit2_1.9.4.bb b/meta/recipes=
-support/libgit2/libgit2_1.9.4.bb
index 10999f972ed..7310dda66dd 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8eacfdc17c8f4d=
219e131a073973b97d"
=20
 DEPENDS =3D "curl openssl zlib libssh2 libgcrypt libpcre2"
=20
-SRC_URI =3D "git://github.com/libgit2/libgit2.git;branch=3Dmaint/v1.9;pr=
otocol=3Dhttps;tag=3Dv${PV}"
+SRC_URI =3D "git://github.com/libgit2/libgit2.git;branch=3Dmaint/v1.9;pr=
otocol=3Dhttps;tag=3Dv${PV} \
+           file://0001-cmake-mark-system-libraries-are-private-link-libr=
ari.patch"
+
 SRCREV =3D "f7164261c9bc0a7e0ebf767c584e5192810a8b24"
=20
 inherit cmake
@@ -17,7 +19,3 @@ EXTRA_OECMAKE =3D "\
 "
=20
 BBCLASSEXTEND =3D "native"
-
-do_install:append() {
-    sed -i -e 's,${RECIPE_SYSROOT},,g' ${D}${libdir}/cmake/libgit2/libgi=
t2Targets.cmake
-}
--=20
2.43.0


