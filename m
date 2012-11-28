Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bjst@sestofb10.enea.se>) id 1TdhyF-0000o4-Om
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 14:46:36 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 28 Nov 2012 14:32:21 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id ABBA9290C5D;
	Wed, 28 Nov 2012 14:32:20 +0100 (CET)
Date: Wed, 28 Nov 2012 14:32:20 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20121128133220.GH44729@sestofb10.enea.se>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
	<1353600120-22967-4-git-send-email-bjst@enea.com>
MIME-Version: 1.0
In-Reply-To: <1353600120-22967-4-git-send-email-bjst@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 3/4] Add ptest for glib.
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
X-List-Received-Date: Wed, 28 Nov 2012 13:46:37 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Moved install logic from recipe to makefiles.

Signed-off-by: Bj=F6rn Stenberg <bjst@enea.com>
---
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   61 ++++++++++++++++=
++++
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 +
 meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb      |   40 +++++++++++++
 meta/recipes-core/glib-2.0/glib.inc                |    5 +-
 4 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patc=
h
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch b/met=
a/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
new file mode 100644
index 0000000..a6cc719
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
@@ -0,0 +1,61 @@
+Add 'ptest' target to Makefile, to run tests without checking dependencies=
.
+Add 'install-ptest' target, to copy needed files to ptest dir.
+
+Signed-off-by: Bj=F6rn Stenberg <bjst@enea.com>
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
++	    (cd $$subdir && $(MAKE) PTESTDIR=3D$(PTESTDIR)/$$subdir $@ ) \
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
++	@mkdir -p $(PTESTDIR)
++	@if [ -n "${TEST_PROGS}" ]; then \
++		if [ -n "${EXTRA_DIST}" ]; then \
++			cp ${EXTRA_DIST} $(PTESTDIR); \
++		fi; \
++		grep -q dist-hook: Makefile && \
++			$(MAKE) distdir=3D$(PTESTDIR) dist-hook; \
++		if [ -d .libs ] ; then \
++			cd .libs; \
++		fi; \
++		cp ${TEST_PROGS} $(PTESTDIR); \
++	fi;
++	@if [ -n "${INSTALL_PROGS}" ]; then \
++		if [ -d .libs ]  ; then \
++			cd .libs; \
++		fi; \
++		cp ${INSTALL_PROGS} $(PTESTDIR); \
++	fi
++	@test -f Makefile && sed 's/^Makefile:/_Makefile:/' <Makefile >$(PTESTDI=
R)/Makefile
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.34.1.bb
index 18a155d..9b51c56 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb
@@ -12,6 +12,8 @@ SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.get=
Var('PV',1).split('.')[1]
 SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
            file://glib-2.0_fix_for_x32.patch \
+           file://Makefile-ptest.patch \
+           file://run-ptest \
           "
 SRC_URI[md5sum] =3D "ee779493b083be9348a841e0a51f1b27"
 SRC_URI[sha256sum] =3D "6e84dc9d84b104725b34d255421ed7ac3629e49f437d37addd=
e5ce3891c2e2f1"
@@ -19,6 +21,38 @@ SRC_URI[sha256sum] =3D "6e84dc9d84b104725b34d255421ed7ac=
3629e49f437d37addde5ce3891
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
+FILES_${PN}-dbg +=3D "${PTEST_PATH}/gio/.libs/.debug \
+                    ${PTEST_PATH}/gio/tests/.debug \
+                    ${PTEST_PATH}/gio/tests/.libs/.debug \
+                    ${PTEST_PATH}/glib/.debug \
+                    ${PTEST_PATH}/glib/.libs/.debug \
+                    ${PTEST_PATH}/glib/tests/.debug \
+                    ${PTEST_PATH}/glib/tests/.libs/.debug \
+                    ${PTEST_PATH}/gobject/.libs/.debug \
+                    ${PTEST_PATH}/gobject/tests/.debug \
+                    ${PTEST_PATH}/gobject/tests/.libs/.debug \
+                    ${PTEST_PATH}/tests/.debug \
+                    ${PTEST_PATH}/tests/.libs/.debug \
+                    ${PTEST_PATH}/tests/refcount/.libs/.debug"
+
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codege=
n/gdbus-codegen.in
 }
@@ -36,4 +70,10 @@ do_install_append() {
   if [ -f ${D}${bindir}/glib-mkenums ]; then
     sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-=
mkenums
   fi
+
+  if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+      mkdir -p ${D}${PTEST_PATH}=20
+      install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
+      make PTESTDIR=3D${D}${PTEST_PATH} install-ptest
+  fi
 }
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index ed9bed9..1c83f96 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -25,9 +25,10 @@ inherit autotools gettext gtk-doc pkgconfig
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


