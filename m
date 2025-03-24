Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99380C36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:20:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45385.1742836813794517305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 10:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A07B1C14
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:20:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6F883F58B
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:20:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] attr: merge .bb and .inc
Date: Mon, 24 Mar 2025 17:20:06 +0000
Message-ID: <20250324172008.3110176-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324172008.3110176-1-ross.burton@arm.com>
References: <20250324172008.3110176-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 17:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213562

There's only one recipe using the .inc so the split is mostly pointless.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/attr/attr.inc      | 76 -------------------------
 meta/recipes-support/attr/attr_2.5.2.bb | 75 +++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-support/attr/attr.inc

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/at=
tr/attr.inc
deleted file mode 100644
index 5d6929fe507..00000000000
--- a/meta/recipes-support/attr/attr.inc
+++ /dev/null
@@ -1,76 +0,0 @@
-SUMMARY =3D "Utilities for manipulating filesystem extended attributes"
-DESCRIPTION =3D "Implement the ability for a user to attach name:value p=
airs to objects within the XFS filesystem."
-
-HOMEPAGE =3D "http://savannah.nongnu.org/projects/attr/"
-SECTION =3D "libs"
-
-DEPENDS =3D "virtual/libintl"
-
-LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
-LICENSE:${PN} =3D "GPL-2.0-or-later"
-LICENSE:lib${BPN} =3D "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D2d0aa14b3fce4694e4f615e30=
186335f \
-                    file://doc/COPYING.LGPL;md5=3Db8d31f339300bc239d7346=
1d68e77b9c \
-                    file://tools/attr.c;endline=3D17;md5=3Dbe0403261f084=
7e5f43ed5b08d19593c \
-                    file://libattr/libattr.c;endline=3D17;md5=3D7970f770=
49f8fa1199fff62a7ab724fb"
-
-SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
-           file://run-ptest \
-           file://0001-attr.c-Include-libgen.h-for-posix-version-of-base=
nam.patch \
-"
-
-inherit ptest update-alternatives autotools gettext
-
-PACKAGES =3D+ "lib${BPN}"
-
-FILES:lib${BPN} =3D "${libdir}/lib*${SOLIBS} ${sysconfdir}"
-
-ALTERNATIVE_PRIORITY =3D "100"
-ALTERNATIVE:${PN} =3D "setfattr getfattr"
-ALTERNATIVE_TARGET[setfattr] =3D "${bindir}/setfattr"
-ALTERNATIVE_TARGET[getfattr] =3D "${bindir}/getfattr"
-
-PTEST_BUILD_HOST_FILES =3D "builddefs"
-PTEST_BUILD_HOST_PATTERN =3D "^RPM"
-
-do_install_ptest() {
-        cp ${B}/Makefile ${D}${PTEST_PATH}
-        sed -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
-            -e 's|${DEBUG_PREFIX_MAP}||g' \
-            -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-            -i ${D}${PTEST_PATH}/Makefile
-
-	sed -e "s|^srcdir =3D.*|srcdir =3D .|" \
-	    -e "s|^abs_srcdir =3D.*|abs_srcdir =3D .|" \
-	    -e "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D ..|" \
-	    -e "s|^Makefile:.*|Makefile:|" \
-	    -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
-	    -i ${D}${PTEST_PATH}/Makefile
-
-	cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}
-	cp -rf ${S}/test/ ${D}${PTEST_PATH}
-}
-
-do_install_ptest:append:libc-musl() {
-        sed -i -e 's|f: Operation n|f: N|g' ${D}${PTEST_PATH}/test/attr.=
test
-}
-
-RDEPENDS:${PN}-ptest =3D "attr \
-                        bash \
-                        coreutils \
-                        perl-module-constant \
-                        perl-module-filehandle \
-                        perl-module-getopt-std \
-                        perl-module-posix \
-                        make \
-                        perl \
-                        gawk \
-                        perl-module-cwd \
-                        perl-module-file-basename \
-                        perl-module-file-path \
-                        perl-module-file-spec \
-                        "
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-support/attr/attr_2.5.2.bb b/meta/recipes-suppo=
rt/attr/attr_2.5.2.bb
index 2110c6d8853..b1a20930ed7 100644
--- a/meta/recipes-support/attr/attr_2.5.2.bb
+++ b/meta/recipes-support/attr/attr_2.5.2.bb
@@ -1,5 +1,78 @@
-require attr.inc
+SUMMARY =3D "Utilities for manipulating filesystem extended attributes"
+DESCRIPTION =3D "Implement the ability for a user to attach name:value p=
airs to objects within the XFS filesystem."
+
+HOMEPAGE =3D "http://savannah.nongnu.org/projects/attr/"
+SECTION =3D "libs"
+
+DEPENDS =3D "virtual/libintl"
+
+LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
+LICENSE:${PN} =3D "GPL-2.0-or-later"
+LICENSE:lib${BPN} =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D2d0aa14b3fce4694e4f615e30=
186335f \
+                    file://doc/COPYING.LGPL;md5=3Db8d31f339300bc239d7346=
1d68e77b9c \
+                    file://tools/attr.c;endline=3D17;md5=3Dbe0403261f084=
7e5f43ed5b08d19593c \
+                    file://libattr/libattr.c;endline=3D17;md5=3D7970f770=
49f8fa1199fff62a7ab724fb"
+
+SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
+           file://run-ptest \
+           file://0001-attr.c-Include-libgen.h-for-posix-version-of-base=
nam.patch \
+"
=20
 SRC_URI[sha256sum] =3D "39bf67452fa41d0948c2197601053f48b3d78a0293897343=
32a6309a680c6c87"
=20
+inherit ptest update-alternatives autotools gettext
+
+PACKAGES =3D+ "lib${BPN}"
+
+FILES:lib${BPN} =3D "${libdir}/lib*${SOLIBS} ${sysconfdir}"
+
+ALTERNATIVE_PRIORITY =3D "100"
+ALTERNATIVE:${PN} =3D "setfattr getfattr"
+ALTERNATIVE_TARGET[setfattr] =3D "${bindir}/setfattr"
+ALTERNATIVE_TARGET[getfattr] =3D "${bindir}/getfattr"
+
+PTEST_BUILD_HOST_FILES =3D "builddefs"
+PTEST_BUILD_HOST_PATTERN =3D "^RPM"
+
+do_install_ptest() {
+        cp ${B}/Makefile ${D}${PTEST_PATH}
+        sed -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
+            -e 's|${DEBUG_PREFIX_MAP}||g' \
+            -e 's:${HOSTTOOLS_DIR}/::g' \
+            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+            -i ${D}${PTEST_PATH}/Makefile
+
+	sed -e "s|^srcdir =3D.*|srcdir =3D .|" \
+	    -e "s|^abs_srcdir =3D.*|abs_srcdir =3D .|" \
+	    -e "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D ..|" \
+	    -e "s|^Makefile:.*|Makefile:|" \
+	    -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
+	    -i ${D}${PTEST_PATH}/Makefile
+
+	cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}
+	cp -rf ${S}/test/ ${D}${PTEST_PATH}
+}
+
+do_install_ptest:append:libc-musl() {
+        sed -i -e 's|f: Operation n|f: N|g' ${D}${PTEST_PATH}/test/attr.=
test
+}
+
+RDEPENDS:${PN}-ptest =3D "attr \
+                        bash \
+                        coreutils \
+                        perl-module-constant \
+                        perl-module-filehandle \
+                        perl-module-getopt-std \
+                        perl-module-posix \
+                        make \
+                        perl \
+                        gawk \
+                        perl-module-cwd \
+                        perl-module-file-basename \
+                        perl-module-file-path \
+                        perl-module-file-spec \
+                        "
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


