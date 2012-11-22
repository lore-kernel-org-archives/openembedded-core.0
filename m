Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TbZRk-000431-Gg
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 17:16:12 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 22 Nov 2012 17:02:04 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 84FBC291437;
	Thu, 22 Nov 2012 17:02:04 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 17:01:59 +0100
Message-ID: <1353600120-22967-4-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1353600120-22967-1-git-send-email-bjst@enea.com>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
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
X-List-Received-Date: Thu, 22 Nov 2012 16:16:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   30 ++++++++++
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 +
 meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb      |   57 ++++++++++++++++=
++++
 meta/recipes-core/glib-2.0/glib.inc                |    5 +-
 4 files changed, 93 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patc=
h
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch b/met=
a/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
new file mode 100644
index 0000000..b5b1498
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
@@ -0,0 +1,30 @@
+Add 'ptest' target to Makefile, to run tests without checking dependencies=
.
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Upstream-status: Pending
+---
+ Makefile.decl |   13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+--- a/Makefile.decl	2012-03-12 01:42:39.000000000 +0100
++++ b/Makefile.decl	2012-11-12 17:02:36.838107381 +0100
+@@ -25,6 +25,19 @@
+ test-nonrecursive:
+ endif
+=20
++ptest: ptest-nonrecursive
++if OS_UNIX
++	@ for subdir in $(SUBDIRS) .; do \
++	    test -d "$$subdir" -a "$$subdir" !=3D "." -a "$$subdir" !=3D "po" &&=
 \
++	    ( test -d $$subdir && cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $@ ) \
++	  done
++
++ptest-nonrecursive:
++	@test -z "${TEST_PROGS}" || ${GTESTER} --keep-going --verbose ${TEST_PRO=
GS}
++else
++ptest-nonrecursive:
++endif
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
index 18a155d..dd4674b 100644
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
@@ -36,4 +70,27 @@ do_install_append() {
   if [ -f ${D}${bindir}/glib-mkenums ]; then
     sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-=
mkenums
   fi
+
+  if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+      mkdir -p ${D}${PTEST_PATH}=20
+      install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
+
+      for subdir in tests glib/tests gobject/tests gio/tests; do
+          mkdir -p ${D}${PTEST_PATH}/$subdir
+          cp ${S}/$subdir/Makefile ${D}${PTEST_PATH}/$subdir
+          cp ${S}/$subdir/.libs/* ${D}${PTEST_PATH}/$subdir
+      done
+
+      cp ${S}/Makefile ${D}${PTEST_PATH}
+      cp ${S}/glib/Makefile ${D}${PTEST_PATH}/glib
+      cp ${S}/glib/.libs/gtester ${D}${PTEST_PATH}/glib
+      cp ${S}/glib/tests/pages.ini       ${D}${PTEST_PATH}/glib/tests
+      cp ${S}/glib/tests/keyfiletest.ini ${D}${PTEST_PATH}/glib/tests
+      cp ${S}/glib/tests/empty           ${D}${PTEST_PATH}/glib/tests
+      cp ${S}/glib/tests/echo-script     ${D}${PTEST_PATH}/glib/tests
+      cp -r ${S}/glib/tests/bookmarks    ${D}${PTEST_PATH}/glib/tests
+      cp -r ${S}/glib/tests/markups      ${D}${PTEST_PATH}/glib/tests
+
+      find ${D}${PTEST_PATH} -name Makefile | xargs sed -i 's/^Makefile:/_=
Makefile:/'
+  fi
 }
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index ed9bed9..91225d5 100644
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
+EXTRA_OECONF =3D "--enable-included-printf=3Dno ${CORECONF} ${TEST_CONF}"
 EXTRA_OECONF_class-native =3D "${CORECONF}"
 EXTRA_OECONF_linuxstdbase =3D "--enable-included-printf=3Dno ${CORECONF}"
=20
--=20
1.7.5.4



