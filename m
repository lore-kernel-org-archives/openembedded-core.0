Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.54.1616534900245956072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 14:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F28F331B
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 14:28:18 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D6C73F719
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 14:28:18 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] meson: use native-file instead of environment variables
Date: Tue, 23 Mar 2021 21:28:14 +0000
Message-Id: <20210323212814.567119-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323212814.567119-1-ross.burton@arm.com>
References: <20210323212814.567119-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Meson now supports native-files, which are the same as cross files but
describe the native build.

By writing and using a native file which describes the tools to use, we
can drop the environment variable overriding.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/meson.bbclass | 49 ++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index a7644e70cb..290b39e1e0 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -26,7 +26,8 @@ MESONOPTS =3D " --prefix ${prefix} \
               --sysconfdir ${sysconfdir} \
               --localstatedir ${localstatedir} \
               --sharedstatedir ${sharedstatedir} \
-              --wrap-mode nodownload"
+              --wrap-mode nodownload \
+              --native-file ${WORKDIR}/native.cross"
=20
 EXTRA_OEMESON_append =3D " ${PACKAGECONFIG_CONFARGS}"
=20
@@ -121,9 +122,28 @@ system =3D '${@meson_operating_system('TARGET_OS', d=
)}'
 cpu_family =3D '${@meson_cpu_family('TARGET_ARCH', d)}'
 cpu =3D '${TARGET_ARCH}'
 endian =3D '${@meson_endian('TARGET', d)}'
+EOF
+
+    cat >${WORKDIR}/native.cross <<EOF
+[binaries]
+c =3D ${@meson_array('BUILD_CC', d)}
+cpp =3D ${@meson_array('BUILD_CXX', d)}
+ar =3D ${@meson_array('BUILD_AR', d)}
+nm =3D ${@meson_array('BUILD_NM', d)}
+strip =3D ${@meson_array('BUILD_STRIP', d)}
+readelf =3D ${@meson_array('BUILD_READELF', d)}
+pkgconfig =3D 'pkg-config-native'
+
+[properties]
+needs_exe_wrapper =3D false
+c_args =3D ${@meson_array('BUILD_CFLAGS', d)}
+c_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
+cpp_args =3D ${@meson_array('BUILD_CXXFLAGS', d)}
+cpp_link_args =3D ${@meson_array('BUILD_LDFLAGS', d)}
 EOF
 }
=20
+# Tell externalsrc that changes to this file require a reconfigure
 CONFIGURE_FILES =3D "meson.build"
=20
 meson_do_configure() {
@@ -140,33 +160,6 @@ meson_do_configure() {
     fi
 }
=20
-override_native_tools() {
-    # Set these so that meson uses the native tools for its build sanity=
 tests,
-    # which require executables to be runnable. The cross file will stil=
l
-    # override these for the target build.
-    export CC=3D"${BUILD_CC}"
-    export CXX=3D"${BUILD_CXX}"
-    export LD=3D"${BUILD_LD}"
-    export AR=3D"${BUILD_AR}"
-    export STRIP=3D"${BUILD_STRIP}"
-    # These contain *target* flags but will be used as *native* flags.  =
The
-    # correct native flags will be passed via -Dc_args and so on, unset =
them so
-    # they don't interfere with tools invoked by Meson (such as g-ir-sca=
nner)
-    unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS
-}
-
-meson_do_configure_prepend_class-target() {
-    override_native_tools
-}
-
-meson_do_configure_prepend_class-nativesdk() {
-    override_native_tools
-}
-
-meson_do_configure_prepend_class-native() {
-    export PKG_CONFIG=3D"pkg-config-native"
-}
-
 python meson_do_qa_configure() {
     import re
     warn_re =3D re.compile(r"^WARNING: Cross property (.+) is using defa=
ult value (.+)$", re.MULTILINE)
--=20
2.25.1

