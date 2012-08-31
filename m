Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1T7S8d-0001Wu-W7
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 16:24:00 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.298.4;
	Fri, 31 Aug 2012 16:10:33 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id D1D3828677E;
	Fri, 31 Aug 2012 16:10:35 +0200 (CEST)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 16:10:27 +0200
Message-ID: <1346422229-61628-2-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1346422229-61628-1-git-send-email-bjst@enea.com>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 1/3] Add -ptest package group
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
X-List-Received-Date: Fri, 31 Aug 2012 14:24:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch creates a new package group -ptest to contain the tests from
each package.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/classes/distutils-common-base.bbclass |    5 ++++-
 meta/classes/image.bbclass                 |    6 ++++--
 meta/classes/task.bbclass                  |    2 +-
 meta/conf/bitbake.conf                     |   12 +++++++++++-
 4 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/dist=
utils-common-base.bbclass
index f66a5cd..7db015b 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -5,7 +5,7 @@ EXTRA_OEMAKE =3D ""
 export STAGING_INCDIR
 export STAGING_LIBDIR
=20
-PACKAGES =3D "${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
+PACKAGES =3D "${PN}-dev ${PN}-dbg ${PN}-ptest ${PN}-doc ${PN}"
=20
 FILES_${PN} =3D "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
=20
@@ -19,3 +19,6 @@ FILES_${PN}-dbg +=3D "\
   ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
   ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
 "
+FILES_${PN}-ptest +=3D "\
+  ${PYTHON_SITEPACKAGES_DIR}/${PTEST_NAME} \
+"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 72720f1..c154bc2 100644
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
@@ -53,6 +53,8 @@ def complementary_globs(featurevar, d):
             globs.append('*-doc')
         elif feature =3D=3D 'dbg-pkgs':
             globs.append('*-dbg')
+        elif feature =3D=3D 'ptest-pkgs':
+            globs.append('*-ptest')
     return ' '.join(globs)
=20
 IMAGE_INSTALL_COMPLEMENTARY =3D '${@complementary_globs("IMAGE_FEATURES", =
d)}'
diff --git a/meta/classes/task.bbclass b/meta/classes/task.bbclass
index 6ec154a..653f149 100644
--- a/meta/classes/task.bbclass
+++ b/meta/classes/task.bbclass
@@ -20,7 +20,7 @@ python () {
     packages =3D d.getVar('PACKAGES', True).split()
     genpackages =3D []
     for pkg in packages:
-        for postfix in ['-dbg', '-dev']:
+        for postfix in ['-dbg', '-ptest', '-dev']:
             genpackages.append(pkg+postfix)
     d.setVar('PACKAGES', ' '.join(packages+genpackages))
 }
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7dfeda3..d10e933 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -220,6 +220,10 @@ SUMMARY_${PN}-dbg ?=3D "${SUMMARY} - Debugging files"
 DESCRIPTION_${PN}-dbg ?=3D "${DESCRIPTION}  \
 This package contains ELF symbols and related sources for debugging purpos=
es."
=20
+SUMMARY_${PN}-ptest ?=3D "${SUMMARY} - Package test files"
+DESCRIPTION_${PN}-ptest ?=3D "${DESCRIPTION}  \
+This package contains test directory with the name ${PTEST_NAME} for packa=
ge test purposes."
+
 SUMMARY_${PN}-dev ?=3D "${SUMMARY} - Development files"
 DESCRIPTION_${PN}-dev ?=3D "${DESCRIPTION}  \
 This package contains symbolic links, header files, and \
@@ -263,7 +267,7 @@ SOLIBSDEV_darwin8 =3D ".dylib"
 SOLIBSDEV_darwin9 =3D ".dylib"
=20
 PACKAGE_BEFORE_PN ?=3D ""
-PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale $=
{PACKAGE_BEFORE_PN} ${PN}"
+PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale $=
{PN}-ptest ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC =3D "${PN}-locale-*"
 FILES =3D ""
=20
@@ -307,6 +311,12 @@ SECTION_${PN}-dbg =3D "devel"
 ALLOW_EMPTY_${PN}-dbg =3D "1"
 RRECOMMENDS_${PN}-dbg =3D "${PN} (=3D ${EXTENDPKGV})"
=20
+PTEST_PATH ?=3D "${libdir}/${PN}/ptest"
+FILES_${PN}-ptest =3D "${PTEST_PATH}/*"
+SECTION_${PN}-ptest =3D "devel"
+ALLOW_EMPTY_${PN}-ptest =3D "1"
+RDEPENDS_${PN}-ptest =3D "${PN} (=3D ${EXTENDPKGV})"
+
 FILES_${PN}-locale =3D "${datadir}/locale"
=20
 # File manifest
--=20
1.7.5.4



