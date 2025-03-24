Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800BAC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:20:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45386.1742836814343419189
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 10:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31AEE16F3
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:20:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F0473F58B
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:20:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] attr: improve ptest packaging
Date: Mon, 24 Mar 2025 17:20:07 +0000
Message-ID: <20250324172008.3110176-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324172008.3110176-1-ross.burton@arm.com>
References: <20250324172008.3110176-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 17:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213563

As there's just a few test binaries in attr, instead of installing large
chunks of the build tree we can install just those and use a boilerplate
test runner.

Also add a comment explaining why we have to sed the test suite if musl
is used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/attr/attr/run-ptest | 34 +++++++++++++++-----
 meta/recipes-support/attr/attr_2.5.2.bb  | 40 +++++++-----------------
 2 files changed, 38 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-support/attr/attr/run-ptest b/meta/recipes-supp=
ort/attr/attr/run-ptest
index 3e7a3a17a04..028671a9bde 100644
--- a/meta/recipes-support/attr/attr/run-ptest
+++ b/meta/recipes-support/attr/attr/run-ptest
@@ -1,10 +1,30 @@
 #!/bin/sh
=20
-set +e
-make test-suite.log
-exitcode=3D$?
-if [ $exitcode -ne 0 -a -e test-suite.log ]; then
-    cat test-suite.log
-fi
-exit $exitcode
+failed=3D0
+all=3D0
=20
+for f in *.test; do
+    ./run $f
+    case "$?" in
+        0)
+            echo "PASS: $f"
+            all=3D$((all + 1))
+            ;;
+        77)
+            echo "SKIP: $f"
+            ;;
+        *)
+            echo "FAIL: $f"
+            failed=3D$((failed + 1))
+            all=3D$((all + 1))
+            ;;
+    esac
+done
+
+if [ "$failed" -eq 0 ] ; then
+    echo "All $all tests passed"
+    exit 0
+else
+    echo "$failed of $all tests failed"
+    exit 1
+fi
diff --git a/meta/recipes-support/attr/attr_2.5.2.bb b/meta/recipes-suppo=
rt/attr/attr_2.5.2.bb
index b1a20930ed7..390445b959f 100644
--- a/meta/recipes-support/attr/attr_2.5.2.bb
+++ b/meta/recipes-support/attr/attr_2.5.2.bb
@@ -32,47 +32,29 @@ ALTERNATIVE:${PN} =3D "setfattr getfattr"
 ALTERNATIVE_TARGET[setfattr] =3D "${bindir}/setfattr"
 ALTERNATIVE_TARGET[getfattr] =3D "${bindir}/getfattr"
=20
-PTEST_BUILD_HOST_FILES =3D "builddefs"
-PTEST_BUILD_HOST_PATTERN =3D "^RPM"
-
 do_install_ptest() {
-        cp ${B}/Makefile ${D}${PTEST_PATH}
-        sed -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
-            -e 's|${DEBUG_PREFIX_MAP}||g' \
-            -e 's:${HOSTTOOLS_DIR}/::g' \
-            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-            -i ${D}${PTEST_PATH}/Makefile
+    install -m755 ${S}/test/run ${S}/test/sort-getfattr-output ${D}${PTE=
ST_PATH}/
=20
-	sed -e "s|^srcdir =3D.*|srcdir =3D .|" \
-	    -e "s|^abs_srcdir =3D.*|abs_srcdir =3D .|" \
-	    -e "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D ..|" \
-	    -e "s|^Makefile:.*|Makefile:|" \
-	    -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
-	    -i ${D}${PTEST_PATH}/Makefile
-
-	cp -rf ${S}/build-aux/ ${D}${PTEST_PATH}
-	cp -rf ${S}/test/ ${D}${PTEST_PATH}
+    for t in $(makefile-getvar ${S}/test/Makemodule.am TESTS); do
+        install -m644 ${S}/$t ${D}${PTEST_PATH}/
+    done
 }
=20
 do_install_ptest:append:libc-musl() {
-        sed -i -e 's|f: Operation n|f: N|g' ${D}${PTEST_PATH}/test/attr.=
test
+    # With glibc strerror(ENOTSUP) is "Operation not supported" but
+    # musl is "Not supported".
+    # https://savannah.nongnu.org/bugs/?62370
+    sed -i -e 's|f: Operation not supported|f: Not supported|g' ${D}${PT=
EST_PATH}/attr.test
 }
=20
 RDEPENDS:${PN}-ptest =3D "attr \
-                        bash \
-                        coreutils \
-                        perl-module-constant \
-                        perl-module-filehandle \
-                        perl-module-getopt-std \
-                        perl-module-posix \
-                        make \
                         perl \
-                        gawk \
                         perl-module-cwd \
                         perl-module-file-basename \
                         perl-module-file-path \
-                        perl-module-file-spec \
+                        perl-module-filehandle \
+                        perl-module-getopt-std \
+                        perl-module-posix \
                         "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


