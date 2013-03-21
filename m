Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UIhbx-0003pW-Um
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 16:41:15 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 21 Mar 2013 16:24:08 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id E054B28900E;
	Thu, 21 Mar 2013 16:24:08 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Mar 2013 16:23:26 +0100
Message-ID: <1363879406-3440-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <20130320083055.GQ31812@sestofb10.enea.se>
References: <20130320083055.GQ31812@sestofb10.enea.se>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH] ptest bugfix: Make all ptest files go into -ptest package
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
X-List-Received-Date: Thu, 21 Mar 2013 15:41:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Move ${PN}-ptest to start of PACKAGES to ensure all ptest files are
packaged in the -ptest package.

Add QA exclusions to insane.bbclass to ensure -ptest packages can contain
any files they need.

This patch fixes bug #4069.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/classes/insane.bbclass |    6 +++---
 meta/classes/ptest.bbclass  |    9 +--------
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 2f10688..5170580 100644
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
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 6ab5ee4..69d2c68 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -14,14 +14,7 @@ PTEST_ENABLED =3D "${@base_contains("DISTRO_FEATURES", "=
ptest", "1", "0", d)}"
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
--=20
1.7.5.4



