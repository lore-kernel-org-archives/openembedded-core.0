Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UPvRi-0006Qi-Am
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 15:52:21 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 10 Apr 2013 15:34:56 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 6BA892837E9;
	Wed, 10 Apr 2013 15:34:56 +0200 (CEST)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2013 15:34:56 +0200
Message-ID: <1365600896-15876-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <20130320083055.GQ31812@sestofb10.enea.se>
References: <20130320083055.GQ31812@sestofb10.enea.se>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH v4] ptest bug fixes
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
X-List-Received-Date: Wed, 10 Apr 2013 13:52:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Move ${PN}-ptest to start of PACKAGES to ensure all ptest files are
packaged in the -ptest package.

Add QA exclusions to insane.bbclass to ensure -ptest packages can contain
any files they need.

Disable ptest for native packages.

Don't emit errors on missing _ptest functions.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
Signed-off-by: Anders Roxell <anders.roxell@enea.com>
Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta/classes/insane.bbclass |    6 +++---
 meta/classes/native.bbclass |    3 +++
 meta/classes/ptest.bbclass  |   17 +++++------------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 75db7a2..336beaa 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -216,7 +216,7 @@ def package_qa_check_dev(path, name, d, elf, messages):
     Check for ".so" library symlinks in non-dev packages
     """
=20
-    if not name.endswith("-dev") and not name.endswith("-dbg") and not nam=
e.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(path=
):
+    if not name.endswith("-dev") and not name.endswith("-dbg") and not nam=
e.endswith("-ptest") and not name.startswith("nativesdk-") and path.endswit=
h(".so") and os.path.islink(path):
         messages.append("non -dev/-dbg/-nativesdk package contains symlink=
 .so: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
=20
@@ -229,7 +229,7 @@ def package_qa_check_staticdev(path, name, d, elf, mess=
ages):
     libgcc.a, libgcov.a will be skipped in their packages
     """
=20
-    if not name.endswith("-pic") and not name.endswith("-staticdev") and p=
ath.endswith(".a") and not path.endswith("_nonshared.a"):
+    if not name.endswith("-pic") and not name.endswith("-staticdev") and n=
ot name.endswith("-ptest") and path.endswith(".a") and not path.endswith("_=
nonshared.a"):
         messages.append("non -staticdev package contains static .a library=
: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
=20
@@ -273,7 +273,7 @@ def package_qa_check_dbg(path, name, d, elf, messages):
     Check for ".debug" files or directories outside of the dbg package
     """
=20
-    if not "-dbg" in name:
+    if not "-dbg" in name and not "-ptest" in name:
         if '.debug' in path.split(os.path.sep):
             messages.append("non debug package contains .debug directory: =
%s path %s" % \
                      (name, package_qa_clean_path(path,d)))
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index bfc9e4c..cd930f0 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -50,6 +50,9 @@ TOOLCHAIN_OPTIONS =3D ""
=20
 DEPENDS_GETTEXT =3D "gettext-native"
=20
+# Don't build ptest natively
+PTEST_ENABLED =3D "0"
+
 # Don't use site files for native builds
 export CONFIG_SITE =3D ""
=20
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 6ab5ee4..37357e8 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -7,25 +7,18 @@ DESCRIPTION_${PN}-ptest ?=3D "${DESCRIPTION}  \
 This package contains a test directory ${PTEST_PATH} for package test purp=
oses."
=20
 PTEST_PATH ?=3D "${libdir}/${PN}/ptest"
-FILES_${PN}-ptest =3D "${PTEST_PATH}/*"
+FILES_${PN}-ptest =3D "${PTEST_PATH}"
 SECTION_${PN}-ptest =3D "devel"
 ALLOW_EMPTY_${PN}-ptest =3D "1"
 PTEST_ENABLED =3D "${@base_contains("DISTRO_FEATURES", "ptest", "1", "0", =
d)}"
 RDEPENDS_${PN}-ptest_virtclass-native =3D ""
 RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""
=20
-PACKAGES +=3D "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest',=
 '', d)}"
-
-FILES_${PN}-dbg +=3D "${PTEST_PATH}/.debug \
-                    ${PTEST_PATH}/*/.debug \
-                    ${PTEST_PATH}/*/*/.debug \
-                    ${PTEST_PATH}/*/*/*/.debug \
-                    ${PTEST_PATH}/*/*/*/*/.debug \
-                   "
+PACKAGES =3D+ "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest',=
 '', d)}"
=20
 do_configure_ptest_base() {
     if [ ${PTEST_ENABLED} =3D 1 ]; then
-        if [ type -t do_configure_ptest =3D function ]; then
+        if [ a$(type -t do_configure_ptest) =3D afunction ]; then
             do_configure_ptest
         fi
     fi
@@ -33,7 +26,7 @@ do_configure_ptest_base() {
=20
 do_compile_ptest_base() {
     if [ ${PTEST_ENABLED} =3D 1 ]; then
-        if [ type -t do_compile_ptest =3D function ]; then
+        if [ a$(type -t do_compile_ptest) =3D afunction ]; then
             do_compile_ptest
         fi
     fi
@@ -46,7 +39,7 @@ do_install_ptest_base() {
             if grep -q install-ptest: Makefile; then
                 oe_runmake DESTDIR=3D${D}${PTEST_PATH} install-ptest
             fi
-            if [ type -t do_install_ptest =3D function ]; then
+            if [ a$(type -t do_install_ptest) =3D afunction ]; then
                 do_install_ptest
             fi
         fi
--=20
1.7.10.4



