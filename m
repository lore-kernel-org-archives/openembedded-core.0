Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TlMa4-0004un-Sy
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 17:33:17 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 19 Dec 2012 17:18:33 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id EEE0A290C5F;
	Wed, 19 Dec 2012 17:18:32 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:18:27 +0100
Message-ID: <1355933911-48562-2-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1355933911-48562-1-git-send-email-bjst@enea.com>
References: <1355933911-48562-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 1/5] Add a new distro feature "ptest".
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 16:33:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch creates a new distro feature "ptest", which creates -ptest
packages containing the test suite of the package for running on the
target. Test files are installed in /usr/lib/<pkg>/ptest.

The patch also includes a change to automake, splitting the "make check"
target into separate steps for building and running the tests.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/classes/image.bbclass                         |    6 ++-
 meta/classes/packagegroup.bbclass                  |    2 +-
 meta/classes/ptest.bbclass                         |   34 ++++++++++++++++=
++++
 .../automake/automake/buildtest.patch              |   33 ++++++++++++++++=
+++
 meta/recipes-devtools/automake/automake_1.12.5.bb  |    3 +-
 5 files changed, 74 insertions(+), 4 deletions(-)
 create mode 100644 meta/classes/ptest.bbclass
 create mode 100644 meta/recipes-devtools/automake/automake/buildtest.patch

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 719d871..9bc5d31 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -29,13 +29,13 @@ ROOTFS_BOOTSTRAP_INSTALL =3D "${@base_contains("IMAGE_F=
EATURES", "package-manageme
 FEATURE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packages(oe.data=
.typed_value('IMAGE_FEATURES', d), d))}"
 FEATURE_INSTALL_OPTIONAL =3D "${@' '.join(oe.packagegroup.optional_package=
s(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
=20
-# packages to install from features, excluding dev/dbg/doc
+# packages to install from features, excluding dev/dbg/doc/ptest
 NORMAL_FEATURE_INSTALL =3D "${@' '.join(oe.packagegroup.required_packages(=
normal_groups(d), d))}"
 NORMAL_FEATURE_INSTALL_OPTIONAL =3D "${@' '.join(oe.packagegroup.optional_=
packages(normal_groups(d), d))}"
=20
 def normal_groups(d):
     """Return all the IMAGE_FEATURES, with the exception of our special pa=
ckage groups"""
-    extras =3D set(['dev-pkgs', 'staticdev-pkgs', 'doc-pkgs', 'dbg-pkgs'])
+    extras =3D set(['dev-pkgs', 'staticdev-pkgs', 'doc-pkgs', 'dbg-pkgs', =
'ptest-pkgs'])
     features =3D set(oe.data.typed_value('IMAGE_FEATURES', d))
     return features.difference(extras)
=20
@@ -57,6 +57,8 @@ def complementary_globs(featurevar, d):
             globs.append('*-doc')
         elif feature =3D=3D 'dbg-pkgs':
             globs.append('*-dbg')
+        elif feature =3D=3D 'ptest-pkgs':
+            globs.append('*-ptest')
     return ' '.join(globs)
=20
 IMAGE_INSTALL_COMPLEMENTARY =3D '${@complementary_globs("IMAGE_FEATURES", =
d)}'
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.=
bbclass
index fc67302..af6ee5d 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -25,7 +25,7 @@ python () {
     packages =3D d.getVar('PACKAGES', True).split()
     genpackages =3D []
     for pkg in packages:
-        for postfix in ['-dbg', '-dev']:
+        for postfix in ['-dbg', '-dev', '-ptest']:
             genpackages.append(pkg+postfix)
     d.setVar('PACKAGES', ' '.join(packages+genpackages))
 }
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
new file mode 100644
index 0000000..8bde489
--- /dev/null
+++ b/meta/classes/ptest.bbclass
@@ -0,0 +1,34 @@
+# Ptest packages are built indirectly by a distro_feature,
+# no need for them to be a direct target of 'world'
+EXCLUDE_FROM_WORLD =3D "1"
+
+SUMMARY_${PN}-ptest ?=3D "${SUMMARY} - Package test files"
+DESCRIPTION_${PN}-ptest ?=3D "${DESCRIPTION}  \
+This package contains a test directory ${PTEST_PATH} for package test purp=
oses."
+
+PTEST_PATH ?=3D "${libdir}/${PN}/ptest"
+FILES_${PN}-ptest =3D "${PTEST_PATH}/*"
+SECTION_${PN}-ptest =3D "devel"
+ALLOW_EMPTY_${PN}-ptest =3D "1"
+PTEST_ENABLED =3D "${@base_contains("DISTRO_FEATURES", "ptest", "1", "0", =
d)}"
+RDEPENDS_${PN}-ptest_virtclass-native =3D ""
+RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""
+
+PACKAGES +=3D "${PN}-ptest"
+
+FILES_${PN}-dbg +=3D "${PTEST_PATH}/*/.debug \
+                    ${PTEST_PATH}/*/*/.debug \
+                    ${PTEST_PATH}/*/*/*/.debug \
+                    ${PTEST_PATH}/*/*/*/*/.debug \
+                   "
+
+ptest_do_install() {
+    if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+        if grep -q install-ptest: Makefile; then
+            oe_runmake DESTDIR=3D${D}${PTEST_PATH} install-ptest
+        fi
+    fi
+}
+
+EXPORT_FUNCTIONS ptest_do_install
diff --git a/meta/recipes-devtools/automake/automake/buildtest.patch b/meta=
/recipes-devtools/automake/automake/buildtest.patch
new file mode 100644
index 0000000..1dd5337
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/buildtest.patch
@@ -0,0 +1,33 @@
+Split "check-TESTS" into a buildtest and runtest target, so that they can
+be run separately.
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Upstream-Status: Pending
+
+--- a/lib/am/check.am	2012-11-14 13:46:16.335475995 +0100
++++ b/lib/am/check.am	2012-08-13 18:40:12.000000000 +0200
+@@ -44,7 +44,7 @@
+ am__tty_colors =3D $(am__tty_colors_dummy)
+ endif !%?COLOR%
+
+-.PHONY: check-TESTS
++.PHONY: check-TESTS buildtest-TESTS runtest-TESTS
+
+ if %?PARALLEL_TESTS%
+
+@@ -465,7 +465,14 @@
+
+ else !%?PARALLEL_TESTS%
+
+-check-TESTS: $(TESTS)
++AM_RECURSIVE_TARGETS +=3D buildtest runtest
++
++buildtest-TESTS: $(TESTS)
++
++check-TESTS: buildtest-TESTS
++	$(MAKE) $(AM_MAKEFLAGS) runtest-TESTS
++
++runtest-TESTS:
+	@failed=3D0; all=3D0; xfail=3D0; xpass=3D0; skip=3D0; \
+	srcdir=3D$(srcdir); export srcdir; \
+ ## Make sure Solaris VPATH-expands all members of this list, even
diff --git a/meta/recipes-devtools/automake/automake_1.12.5.bb b/meta/recip=
es-devtools/automake/automake_1.12.5.bb
index 76e2b87..c681674 100644
--- a/meta/recipes-devtools/automake/automake_1.12.5.bb
+++ b/meta/recipes-devtools/automake/automake_1.12.5.bb
@@ -23,7 +23,8 @@ PATHFIXPATCH_class-nativesdk =3D ""
 SRC_URI +=3D "${PATHFIXPATCH} \
 	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
 	    file://python-libdir.patch \
-            file://py-compile-compile-only-optimized-byte-code.patch"
+            file://py-compile-compile-only-optimized-byte-code.patch \
+            file://buildtest.patch"
=20
 SRC_URI[md5sum] =3D "674f6d28f8723e0f478cb03de30f36f1"
 SRC_URI[sha256sum] =3D "82089e23b384d3e64efa4f09f133a02dadb91c0593d4f1d4e1=
2c29d806be9925"
--=20
1.7.5.4



