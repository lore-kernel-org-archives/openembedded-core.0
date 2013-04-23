Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UUko9-0002Qr-Gr
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 23:31:32 +0200
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 56A42D1A73B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 23:13:45 +0200 (CEST)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id DF77FA6226
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 23:13:38 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2013 23:13:36 +0200
Message-Id: <1366751616-23687-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH] subversion: upgrade to 1.7.9
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
X-List-Received-Date: Tue, 23 Apr 2013 21:31:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../subversion-1.7.8/fix-install-depends.patch     | 48 ----------------=
------
 .../subversion/subversion-1.7.8/libtool2.patch     | 15 -------
 .../subversion-1.7.9/fix-install-depends.patch     | 48 ++++++++++++++++=
++++++
 .../subversion/subversion-1.7.9/libtool2.patch     | 15 +++++++
 .../subversion/subversion_1.7.8.bb                 | 38 ----------------=
-
 .../subversion/subversion_1.7.9.bb                 | 38 ++++++++++++++++=
+
 6 files changed, 101 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.8/fix=
-install-depends.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.8/lib=
tool2.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.9/fix=
-install-depends.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.9/lib=
tool2.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion_1.7.8.bb
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.9.bb

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.8/fix-instal=
l-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.8/fix-i=
nstall-depends.patch
deleted file mode 100644
index fb79b8c..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.8/fix-install-depen=
ds.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-install-neon-lib should depend on libsvn_delta's installation
-
-install-neon-lib needs libsvn_delta-1.la which will be regenerated
-during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
-in regenerating and at the same time install-neon-lib links it, the
-error willl happen.
-
-Let install-neon-lib run after libsvn_delta-1.la is installed will fix
-the problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- build-outputs.mk |    2 +-
- build.conf       |    2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
---- subversion-1.7.6.orig/build-outputs.mk
-+++ subversion-1.7.6/build-outputs.mk
-@@ -983,11 +983,11 @@ install-locale: subversion/po/de.mo subv
- 	$(MKDIR) $(DESTDIR)$(localedir)/zh_CN/LC_MESSAGES
- 	cd subversion/po ; $(INSTALL_LOCALE) zh_CN.mo $(DESTDIR)$(localedir)/z=
h_CN/LC_MESSAGES/$(PACKAGE_NAME).mo
- 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
- 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/z=
h_TW/LC_MESSAGES/$(PACKAGE_NAME).mo
-=20
--install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la=20
-+install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_F=
S_LIB_INSTALL_DEPS)
- 	$(MKDIR) $(DESTDIR)$(neon_libdir)
- 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la=
 $(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
-=20
- install-ramod-lib: subversion/libsvn_fs/libsvn_fs-1.la subversion/libsv=
n_ra_svn/libsvn_ra_svn-1.la subversion/libsvn_repos/libsvn_repos-1.la sub=
version/libsvn_ra_local/libsvn_ra_local-1.la=20
- 	$(MKDIR) $(DESTDIR)$(ramod_libdir)
---- subversion-1.7.6.orig/build.conf
-+++ subversion-1.7.6/build.conf
-@@ -270,10 +270,12 @@ msvc-export =3D svn_ra.h private\svn_ra_pr
- [libsvn_ra_neon]
- type =3D ra-module
- path =3D subversion/libsvn_ra_neon
- install =3D neon-lib
- libs =3D libsvn_delta libsvn_subr aprutil apriconv apr neon
-+# conditionally add more dependencies
-+add-install-deps =3D $(SVN_FS_LIB_INSTALL_DEPS)
- msvc-static =3D yes
-=20
- # Accessing repositories via DAV through serf
- [libsvn_ra_serf]
- type =3D ra-module
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.p=
atch b/meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.patch
deleted file mode 100644
index 5cd572b..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
---- a/configure.ac	2011-10-20 21:56:02.230663987 +0200
-+++ b/configure.ac	2011-08-17 15:01:30.000000000 +0200
-@@ -227,8 +227,8 @@
-   LIBTOOL=3D"$sh_libtool"
-   SVN_LIBTOOL=3D"$sh_libtool"
- else
--  sh_libtool=3D"$abs_builddir/libtool"
--  SVN_LIBTOOL=3D"\$(SHELL) $sh_libtool"
-+  sh_libtool=3D"$abs_builddir/$host_alias-libtool"
-+  SVN_LIBTOOL=3D"\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
- fi
- AC_SUBST(SVN_LIBTOOL)
-=20
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.9/fix-instal=
l-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.9/fix-i=
nstall-depends.patch
new file mode 100644
index 0000000..fb79b8c
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.9/fix-install-depen=
ds.patch
@@ -0,0 +1,48 @@
+install-neon-lib should depend on libsvn_delta's installation
+
+install-neon-lib needs libsvn_delta-1.la which will be regenerated
+during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
+in regenerating and at the same time install-neon-lib links it, the
+error willl happen.
+
+Let install-neon-lib run after libsvn_delta-1.la is installed will fix
+the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ build-outputs.mk |    2 +-
+ build.conf       |    2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+--- subversion-1.7.6.orig/build-outputs.mk
++++ subversion-1.7.6/build-outputs.mk
+@@ -983,11 +983,11 @@ install-locale: subversion/po/de.mo subv
+ 	$(MKDIR) $(DESTDIR)$(localedir)/zh_CN/LC_MESSAGES
+ 	cd subversion/po ; $(INSTALL_LOCALE) zh_CN.mo $(DESTDIR)$(localedir)/z=
h_CN/LC_MESSAGES/$(PACKAGE_NAME).mo
+ 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
+ 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/z=
h_TW/LC_MESSAGES/$(PACKAGE_NAME).mo
+=20
+-install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la=20
++install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_F=
S_LIB_INSTALL_DEPS)
+ 	$(MKDIR) $(DESTDIR)$(neon_libdir)
+ 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la=
 $(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
+=20
+ install-ramod-lib: subversion/libsvn_fs/libsvn_fs-1.la subversion/libsv=
n_ra_svn/libsvn_ra_svn-1.la subversion/libsvn_repos/libsvn_repos-1.la sub=
version/libsvn_ra_local/libsvn_ra_local-1.la=20
+ 	$(MKDIR) $(DESTDIR)$(ramod_libdir)
+--- subversion-1.7.6.orig/build.conf
++++ subversion-1.7.6/build.conf
+@@ -270,10 +270,12 @@ msvc-export =3D svn_ra.h private\svn_ra_pr
+ [libsvn_ra_neon]
+ type =3D ra-module
+ path =3D subversion/libsvn_ra_neon
+ install =3D neon-lib
+ libs =3D libsvn_delta libsvn_subr aprutil apriconv apr neon
++# conditionally add more dependencies
++add-install-deps =3D $(SVN_FS_LIB_INSTALL_DEPS)
+ msvc-static =3D yes
+=20
+ # Accessing repositories via DAV through serf
+ [libsvn_ra_serf]
+ type =3D ra-module
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.p=
atch b/meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.patch
new file mode 100644
index 0000000..5cd572b
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+--- a/configure.ac	2011-10-20 21:56:02.230663987 +0200
++++ b/configure.ac	2011-08-17 15:01:30.000000000 +0200
+@@ -227,8 +227,8 @@
+   LIBTOOL=3D"$sh_libtool"
+   SVN_LIBTOOL=3D"$sh_libtool"
+ else
+-  sh_libtool=3D"$abs_builddir/libtool"
+-  SVN_LIBTOOL=3D"\$(SHELL) $sh_libtool"
++  sh_libtool=3D"$abs_builddir/$host_alias-libtool"
++  SVN_LIBTOOL=3D"\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
+ fi
+ AC_SUBST(SVN_LIBTOOL)
+=20
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.8.bb b/meta/=
recipes-devtools/subversion/subversion_1.7.8.bb
deleted file mode 100644
index 1b1ca93..0000000
--- a/meta/recipes-devtools/subversion/subversion_1.7.8.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION =3D "The Subversion (svn) client"
-SECTION =3D "console/network"
-DEPENDS =3D "apr-util neon sqlite3"
-RDEPENDS_${PN} =3D "neon"
-LICENSE =3D "Apache-2"
-HOMEPAGE =3D "http://subversion.tigris.org"
-
-BBCLASSEXTEND =3D "native"
-
-inherit gettext
-
-SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://libtool2.patch \
-           file://fix-install-depends.patch \
-"
-SRC_URI[md5sum] =3D "454b9f398415c3504435bf8c3f6ed127"
-SRC_URI[sha256sum] =3D "fc83d4d98ccea8b7bfa8f5c20fff545c8baa7d035db93097=
7550c51c6ca23686"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a14fd2da3134e40a087eb4326a4e=
cd4"
-
-EXTRA_OECONF =3D " \
-                --without-berkeley-db --without-apxs \
-                --without-swig --with-apr=3D${STAGING_BINDIR_CROSS} \
-                --with-apr-util=3D${STAGING_BINDIR_CROSS} \
-                ac_cv_path_RUBY=3Dnone"
-
-inherit autotools
-
-export LDFLAGS +=3D " -L${STAGING_LIBDIR} "
-
-acpaths =3D "-I build/ -I build/ac-macros/"
-
-do_configure_prepend () {
-	rm -f ${S}/libtool
-	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m=
4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
-	rm -f ${S}/aclocal.m4
-	sed -i -e 's:with_sasl=3D"/usr/local":with_sasl=3D"${STAGING_DIR}":' ${=
S}/build/ac-macros/sasl.m4
-}
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.9.bb b/meta/=
recipes-devtools/subversion/subversion_1.7.9.bb
new file mode 100644
index 0000000..641655e
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion_1.7.9.bb
@@ -0,0 +1,38 @@
+DESCRIPTION =3D "The Subversion (svn) client"
+SECTION =3D "console/network"
+DEPENDS =3D "apr-util neon sqlite3"
+RDEPENDS_${PN} =3D "neon"
+LICENSE =3D "Apache-2"
+HOMEPAGE =3D "http://subversion.tigris.org"
+
+BBCLASSEXTEND =3D "native"
+
+inherit gettext
+
+SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://libtool2.patch \
+           file://fix-install-depends.patch \
+"
+SRC_URI[md5sum] =3D "8d532025771a67c06c23f299699f056f"
+SRC_URI[sha256sum] =3D "f8454c585f99afed764232a5048d9b8bfd0a25a9ab8e339e=
a69fe1204c453ef4"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a14fd2da3134e40a087eb4326a4e=
cd4"
+
+EXTRA_OECONF =3D " \
+                --without-berkeley-db --without-apxs \
+                --without-swig --with-apr=3D${STAGING_BINDIR_CROSS} \
+                --with-apr-util=3D${STAGING_BINDIR_CROSS} \
+                ac_cv_path_RUBY=3Dnone"
+
+inherit autotools
+
+export LDFLAGS +=3D " -L${STAGING_LIBDIR} "
+
+acpaths =3D "-I build/ -I build/ac-macros/"
+
+do_configure_prepend () {
+	rm -f ${S}/libtool
+	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m=
4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
+	rm -f ${S}/aclocal.m4
+	sed -i -e 's:with_sasl=3D"/usr/local":with_sasl=3D"${STAGING_DIR}":' ${=
S}/build/ac-macros/sasl.m4
+}
--=20
1.7.11.7



