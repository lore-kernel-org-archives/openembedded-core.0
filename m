Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TlMa5-0004un-VH
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 17:33:18 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 19 Dec 2012 17:18:33 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 06864290C63;
	Wed, 19 Dec 2012 17:18:33 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:18:29 +0100
Message-ID: <1355933911-48562-4-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1355933911-48562-1-git-send-email-bjst@enea.com>
References: <1355933911-48562-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 3/5] Add ptest for glib.
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
X-List-Received-Date: Wed, 19 Dec 2012 16:33:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   61 ++++++++++++++++=
++++
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 +
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   25 +++++++-
 meta/recipes-core/glib-2.0/glib.inc                |    7 +-
 4 files changed, 91 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patc=
h
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch b/met=
a/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
new file mode 100644
index 0000000..cb36c09
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
@@ -0,0 +1,61 @@
+Add 'ptest' target to Makefile, to run tests without checking dependencies=
.
+Add 'install-ptest' target, to copy needed files to ptest dir.
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Upstream-status: Pending
+---
+ Makefile.decl |   43 +++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 43 insertions(+)
+
+--- a/Makefile.decl	2012-03-12 01:42:39.000000000 +0100
++++ b/Makefile.decl	2012-11-26 13:42:08.436865192 +0100
+@@ -25,6 +25,49 @@
+ test-nonrecursive:
+ endif
+=20
++ptest: ptest-nonrecursive
++	@ for subdir in $(SUBDIRS) .; do \
++	    test -d "$$subdir" -a "$$subdir" !=3D "." -a "$$subdir" !=3D "po" &&=
 \
++	    ( test -d $$subdir && cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $@ ) \
++	  done
++
++ptest-nonrecursive:
++	@test -z "${TEST_PROGS}" || ${GTESTER} --keep-going --verbose ${TEST_PRO=
GS}
++
++install-ptest: install-ptest-nonrecursive
++	@test -z "$(SUBDIRS)" || for subdir in $(SUBDIRS); do \
++	    test "$$subdir" =3D=3D "." || \
++	    (cd $$subdir && $(MAKE) DESTDIR=3D$(DESTDIR)/$$subdir $@ ) \
++	done
++
++# install files used for ptest:
++# - copy EXTRA_DIST (for test data in glib/tests)
++# - run dist-hook (for glib/tests/bookmarks/ and glib/tests/markups)
++# - copy TEST_PROGS (the test programs)
++# - copy INSTALL_PROGS (for glib/gtester)
++# - avoid libtool wrappers by copying binaries from .libs
++# - strip Makefile: target from all Makefiles
++install-ptest-nonrecursive:
++	@mkdir -p $(DESTDIR)
++	@if [ -n "${TEST_PROGS}" ]; then \
++		if [ -n "${EXTRA_DIST}" ]; then \
++			cp ${EXTRA_DIST} $(DESTDIR); \
++		fi; \
++		grep -q dist-hook: Makefile && \
++			$(MAKE) distdir=3D$(DESTDIR) dist-hook; \
++		if [ -d .libs ] ; then \
++			cd .libs; \
++		fi; \
++		cp ${TEST_PROGS} $(DESTDIR); \
++	fi;
++	@if [ -n "${INSTALL_PROGS}" ]; then \
++		if [ -d .libs ]  ; then \
++			cd .libs; \
++		fi; \
++		cp ${INSTALL_PROGS} $(DESTDIR); \
++	fi
++	@test -f Makefile && sed 's/^Makefile:/_Makefile:/' <Makefile >$(DESTDIR=
)/Makefile
++
+ # test-report: run tests in subdirs and generate report
+ # perf-report: run tests in subdirs with -m perf and generate report
+ # full-report: like test-report: with -m perf and -m slow
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-c=
ore/glib-2.0/glib-2.0/run-ptest
new file mode 100644
index 0000000..3deb586
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+make -k ptest
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.34.3.bb
index 966a851..9854585 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -12,6 +12,8 @@ SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.get=
Var('PV',1).split('.')[1]
 SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://glib-2.0_fix_for_x32.patch \
+           file://Makefile-ptest.patch \
+           file://run-ptest \
           "
 SRC_URI[md5sum] =3D "a4ca31e258273c3761e3de2edd607661"
 SRC_URI[sha256sum] =3D "855fcbf87cb93065b488358e351774d8a39177281023bae58c=
286f41612658a7"
@@ -19,6 +21,24 @@ SRC_URI[sha256sum] =3D "855fcbf87cb93065b488358e351774d8=
a39177281023bae58c286f4161
 SRC_URI_append_class-native =3D " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND =3D "native nativesdk"
=20
+RDEPENDS_${PN}-ptest +=3D "\
+            eglibc-gconv-utf-16 \
+            eglibc-charmap-utf-8 \
+            eglibc-gconv-cp1255 \
+            eglibc-charmap-cp1255 \
+            eglibc-gconv-utf-32 \
+            eglibc-gconv-utf-7 \
+            eglibc-charmap-invariant \
+            eglibc-localedata-translit-cjk-variants \
+            tzdata \
+            tzdata-americas \
+            tzdata-asia \
+            tzdata-europe \
+            tzdata-posix \
+            python-pygobject \
+            python-dbus \
+           "
+
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codege=
n/gdbus-codegen.in
 }
@@ -28,12 +48,13 @@ do_install_append() {
   rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
   rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
   # and empty dirs
-  rmdir ${D}${libdir}/gio/modules/
-  rmdir ${D}${libdir}/gio/
+  rm -rf ${D}${libdir}/gio
=20
   # Some distros have both /bin/perl and /usr/bin/perl, but we set perl lo=
cation
   # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
   if [ -f ${D}${bindir}/glib-mkenums ]; then
     sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-=
mkenums
   fi
+
+  ptest_do_install
 }
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index bc831e6..53b20b6 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -21,13 +21,14 @@ PACKAGES =3D+ "${PN}-utils ${PN}-bash-completion ${PN}-=
codegen"
 LEAD_SONAME =3D "libglib-2.0.*"
 FILES_${PN}-utils =3D "${bindir}/* ${datadir}/glib-2.0/gettext"
=20
-inherit autotools gettext gtk-doc pkgconfig
+inherit autotools gettext gtk-doc pkgconfig ptest
=20
 S =3D "${WORKDIR}/glib-${PV}"
=20
-CORECONF =3D "--disable-dtrace --disable-fam --disable-libelf --disable-sy=
stemtap --disable-modular-tests"
+CORECONF =3D "--disable-dtrace --disable-fam --disable-libelf --disable-sy=
stemtap"
=20
-EXTRA_OECONF =3D "--enable-included-printf=3Dno ${CORECONF}"
+PTEST_CONF =3D "${@base_contains('DISTRO_FEATURES', 'ptest', '', '--disabl=
e-modular-tests', d)}"
+EXTRA_OECONF =3D "--enable-included-printf=3Dno ${CORECONF} ${PTEST_CONF}"
 EXTRA_OECONF_class-native =3D "${CORECONF}"
 EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno ${CORECONF}"
=20
--=20
1.7.5.4



