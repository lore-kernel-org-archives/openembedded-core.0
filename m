Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27810C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 11:59:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6998.1686225559378282533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 04:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2FCAAB6;
	Thu,  8 Jun 2023 05:00:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E52153F663;
	Thu,  8 Jun 2023 04:59:17 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 1/2] nettle: rewrite ptest integration
Date: Thu,  8 Jun 2023 12:59:15 +0100
Message-Id: <20230608115916.1539101-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 11:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182506

From: Ross Burton <ross.burton@arm.com>

Instead of patching a relative path to an unversioned libnettle.so to be
a bare filename which then needs nettle-dev to be installed, create a
symlink in the expected place which points to the actual library. This
means nettle-ptest no longer needs to depend on nettle-dev.

Explicitly skip symbols-test, it has been silently failing as nm isn't
available and also needs a static libnettle.a to run.

Install two rsa-* example binaries that are needed for pkcs1-conv-test
to pass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../nettle/nettle/dlopen-test.patch           | 29 --------------
 meta/recipes-support/nettle/nettle/run-ptest  | 40 ++++++++++---------
 meta/recipes-support/nettle/nettle_3.8.1.bb   | 21 +++++-----
 3 files changed, 32 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-support/nettle/nettle/dlopen-test.patch

diff --git a/meta/recipes-support/nettle/nettle/dlopen-test.patch b/meta/=
recipes-support/nettle/nettle/dlopen-test.patch
deleted file mode 100644
index ab9b91f88bc..00000000000
--- a/meta/recipes-support/nettle/nettle/dlopen-test.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Remove the relative path for libnettle.so so the test
-program can find it.
-Relative paths are not suitable, as the folder strucure for ptest
-is different from the one expected by the nettle testsuite.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- testsuite/dlopen-test.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testsuite/dlopen-test.c b/testsuite/dlopen-test.c
-index 4265bf7..1a25d17 100644
---- a/testsuite/dlopen-test.c
-+++ b/testsuite/dlopen-test.c
-@@ -15,7 +15,7 @@ int
- main (int argc UNUSED, char **argv UNUSED)
- {
- #if HAVE_LIBDL
--  void *handle =3D dlopen ("../libnettle." SO_EXT, RTLD_NOW);
-+  void *handle =3D dlopen ("libnettle.so", RTLD_NOW);
-   int (*get_version)(void);
-   if (!handle)
-     {
---=20
-2.17.1
-
diff --git a/meta/recipes-support/nettle/nettle/run-ptest b/meta/recipes-=
support/nettle/nettle/run-ptest
index b90bed66d27..61a43c78f12 100644
--- a/meta/recipes-support/nettle/nettle/run-ptest
+++ b/meta/recipes-support/nettle/nettle/run-ptest
@@ -6,31 +6,35 @@ failed=3D0
 all=3D0
=20
 for f in *-test; do
-    if [ "$f" =3D "sha1-huge-test" ] ; then
-        echo "SKIP: $f (skipped for ludicrous run time)"
-        continue
-    fi
-
-    "./$f"
-    case "$?" in
-        0)
-            echo "PASS: $f"
-            all=3D$((all + 1))
+    case "$f" in
+        "sha1-huge-test")
+            echo "SKIP: $f (long run time)"
             ;;
-        77)
-            echo "SKIP: $f"
+        "symbols-test")
+            echo "SKIP: $f (needs static libraries)"
             ;;
         *)
-            echo "FAIL: $f"
-            failed=3D$((failed + 1))
-            all=3D$((all + 1))
+            "./$f"
+            case "$?" in
+                0)
+                    echo "PASS: $f"
+                    all=3D$((all + 1))
+                    ;;
+                77)
+                    echo "SKIP: $f"
+                    ;;
+                *)
+                    echo "FAIL: $f"
+                    failed=3D$((failed + 1))
+                    all=3D$((all + 1))
+                    ;;
+            esac
             ;;
     esac
 done
=20
 if [ "$failed" -eq 0 ] ; then
-  echo "All $all tests passed"
+    echo "All $all tests passed"
 else
-  echo "$failed of $all tests failed"
+    echo "$failed of $all tests failed"
 fi
-
diff --git a/meta/recipes-support/nettle/nettle_3.8.1.bb b/meta/recipes-s=
upport/nettle/nettle_3.8.1.bb
index bf491322354..184023e4031 100644
--- a/meta/recipes-support/nettle/nettle_3.8.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.8.1.bb
@@ -20,10 +20,6 @@ SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://check-header-files-of-openssl-only-if-enable_.patch \
            "
=20
-SRC_URI:append:class-target =3D "\
-            file://dlopen-test.patch \
-            "
-
 SRC_URI[sha256sum] =3D "364f3e2b77cd7dcde83fd7c45219c834e54b0c75e428b6f8=
94a23d12dd41cbfe"
=20
 UPSTREAM_CHECK_REGEX =3D "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
@@ -44,14 +40,17 @@ do_install:append() {
=20
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/testsuite/
-        install ${S}/testsuite/gold-bug.txt ${D}${PTEST_PATH}/testsuite/
-        install ${S}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
-        # tools can be found in PATH, not in ../tools/
-        sed -i -e 's|../tools/||' ${D}${PTEST_PATH}/testsuite/*-test
         install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
-}
+        install ${S}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
+        install ${S}/testsuite/gold-bug.txt ${D}${PTEST_PATH}/testsuite/
=20
-RDEPENDS:${PN}-ptest +=3D "${PN}-dev"
-INSANE_SKIP:${PN}-ptest +=3D "dev-deps"
+        # Install a symlink for dlopen-test
+        ln -sr ${D}${libdir}/libnettle.so.*.* ${D}${PTEST_PATH}/libnettl=
e.so
+        # These examples are needed for pkcs1-conv-test
+        install ${B}/examples/rsa-sign ${B}/examples/rsa-verify ${D}${PT=
EST_PATH}/testsuite/
+        # Fix build-time relative paths
+        sed -i -e 's|../tools/|${bindir}/|g' ${D}${PTEST_PATH}/testsuite=
/*-test
+        sed -i -e 's|../examples/|./|g' ${D}${PTEST_PATH}/testsuite/*-te=
st
+}
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


