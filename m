Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6254BECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 14:23:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.37551.1661523821717967664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 07:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 565E723A;
	Fri, 26 Aug 2022 07:23:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9E543F71A;
	Fri, 26 Aug 2022 07:23:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] libgcrypt: rewrite ptest
Date: Fri, 26 Aug 2022 15:23:37 +0100
Message-Id: <20220826142337.42920-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826142337.42920-1-ross.burton@arm.com>
References: <20220826142337.42920-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 14:23:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169921

Instead of installing pieces of the build system, we can install the
test driver (which can also be used to list the files needed) and run
the tests directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libgcrypt/files/no-native-gpg-error.patch | 18 ++++++++++++++++++
 .../recipes-support/libgcrypt/files/run-ptest |  8 +++++++-
 .../libgcrypt/libgcrypt_1.10.1.bb             | 19 ++++---------------
 3 files changed, 29 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/no-native-gpg-er=
ror.patch

diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.pat=
ch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
new file mode 100644
index 00000000000..b9a607863d3
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -0,0 +1,18 @@
+Don't depend on a native libgpg-error to build the test driver, as it's
+an optional dependency for some C annotations.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/tests/testdrv.c b/tests/testdrv.c
+index 0ccde326..6d6abd57 100644
+--- a/tests/testdrv.c
++++ b/tests/testdrv.c
+@@ -32,7 +32,6 @@
+ # include <fcntl.h>
+ # include <sys/wait.h>
+ #endif
+-#include <gpg-error.h> /* For some macros.  */
+=20
+ #include "stopwatch.h"
+=20
diff --git a/meta/recipes-support/libgcrypt/files/run-ptest b/meta/recipe=
s-support/libgcrypt/files/run-ptest
index 4818a061b4b..c349ae1944e 100644
--- a/meta/recipes-support/libgcrypt/files/run-ptest
+++ b/meta/recipes-support/libgcrypt/files/run-ptest
@@ -1,3 +1,9 @@
 #!/bin/sh
=20
-make -C build/tests runtest-TESTS
+# Run the tests in regression mode so they are quicker
+export GCRYPT_IN_REGRESSION_TEST=3D1
+# The 'random' test invokes itself, so we need to be sure that the test
+# directory is on PATH.
+export PATH=3D$PATH:.
+
+./testdrv --verbose
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.10.1.bb
index 5047c9075f1..b0d88de3aa1 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
@@ -17,13 +17,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a=
9ba36caa9b7df079bae19f \
                     "
=20
 DEPENDS =3D "libgpg-error"
-RDEPENDS:${PN}-ptest =3D "bash make"
=20
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-p=
ath.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthr=
ead.patch \
+           file://no-native-gpg-error.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bf=
fcef2f01baffe9de"
@@ -38,8 +38,6 @@ inherit autotools texinfo binconfig-disabled pkgconfig =
ptest
 EXTRA_OECONF =3D "--disable-asm"
 EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
=20
-PRIVATE_LIBS:${PN}-ptest:append =3D " libgcrypt.so.20"
-
 PACKAGECONFIG ??=3D "capabilities"
 PACKAGECONFIG[capabilities] =3D "--with-capabilities,--without-capabilit=
ies,libcap"
=20
@@ -49,18 +47,9 @@ do_configure:prepend () {
 }
=20
 do_install_ptest() {
-    cp -r --preserve=3Dmode,links -v ${S} ${D}${PTEST_PATH}
-    cp -r --preserve=3Dmode,links -v ${B} ${D}${PTEST_PATH}
-    rm ${D}${PTEST_PATH}/build/cipher/gost-s-box
-    rm ${D}${PTEST_PATH}/build/doc/yat2m
-    rm ${D}${PTEST_PATH}/build/libtool
-    rm ${D}${PTEST_PATH}/build/config.status
-    rm ${D}${PTEST_PATH}/build/config.log
-    rm ${D}${PTEST_PATH}/build/src/mpicalc
-    rm ${D}${PTEST_PATH}/${BP}/autom4te* -rf
-    sed -i -e 's/Makefile:.*/Makefile-disabled:/' ${D}${PTEST_PATH}/buil=
d/Makefile
-    find ${D}/${PTEST_PATH}/build -name "*.cmake" -or -name "Makefile" \
-    | xargs sed -e "s|${WORKDIR}|${PTEST_PATH}|g" -e "s|${WORKDIR}/recip=
e-sysroot-native||g" -i
+    cd tests
+    oe_runmake testdrv-build testdrv
+    install testdrv $(srcdir=3D${S}/tests ./testdrv-build --files | sort=
 | uniq) ${D}${PTEST_PATH}
 }
=20
 FILES:${PN}-dev +=3D "${bindir}/hmac256 ${bindir}/dumpsexp"
--=20
2.34.1


