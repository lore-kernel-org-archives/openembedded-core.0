Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TbZRk-000430-IH
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 17:16:12 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 22 Nov 2012 17:02:04 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 8C40629143A;
	Thu, 22 Nov 2012 17:02:04 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2012 17:02:00 +0100
Message-ID: <1353600120-22967-5-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1353600120-22967-1-git-send-email-bjst@enea.com>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 4/4] Add ptest for dbus.
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

This patch adds a new recipe dbus-test to build and package the dbus test
suite. The reason for a separate recipe is that the dbus test suite depends
on dbus-glib, so it cannot be compiled at the same time as dbus.

An RDEPENDS rule is added to the dbus recipe to include the dbus-test
package into the image when ptest is enabled, since the standard -ptest
suffix mechanism does not apply to this package.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-core/dbus/dbus-1.6.4/run-ptest        |    3 +
 .../dbus/dbus-1.6.4/test-run-path.patch            |   26 ++++++
 meta/recipes-core/dbus/dbus-test_1.6.4.bb          |   84 ++++++++++++++++=
++++
 meta/recipes-core/dbus/dbus.inc                    |    3 +
 4 files changed, 116 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-core/dbus/dbus-1.6.4/run-ptest
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch
 create mode 100644 meta/recipes-core/dbus/dbus-test_1.6.4.bb

diff --git a/meta/recipes-core/dbus/dbus-1.6.4/run-ptest b/meta/recipes-cor=
e/dbus/dbus-1.6.4/run-ptest
new file mode 100755
index 0000000..e08ecb1
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.6.4/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+cd test
+make -k runtest-TESTS
diff --git a/meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch b/meta/r=
ecipes-core/dbus/dbus-1.6.4/test-run-path.patch
new file mode 100644
index 0000000..5c08c93
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch
@@ -0,0 +1,26 @@
+
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Upstream-Status: Pending
+
+--- a/test/Makefile.am	2012-06-15 15:25:43.000000000 +0200
++++ b/test/Makefile.am	2012-11-16 09:24:44.263140840 +0100
+@@ -119,12 +119,13 @@
+ 	DBUS_TEST_HOMEDIR=3D@abs_top_builddir@/dbus \
+ 	DBUS_TEST_SYSCONFDIR=3D$(DESTDIR)$(sysconfdir)
+=20
++ptest_run_dir =3D ..
++
+ TESTS_ENVIRONMENT =3D \
+-	DBUS_BLOCK_ON_ABORT=3D1 \
+-	DBUS_FATAL_WARNINGS=3D1 \
+-	DBUS_TEST_DAEMON=3D@abs_top_builddir@/bus/dbus-daemon$(EXEEXT) \
+-	DBUS_TEST_DATA=3D@abs_top_builddir@/test/data \
+-	DBUS_TEST_HOMEDIR=3D@abs_top_builddir@/dbus \
++	DBUS_FATAL_WARNINGS=3D0 \
++	DBUS_TEST_DAEMON=3D$(ptest_run_dir)/bus/dbus-daemon$(EXEEXT) \
++	DBUS_TEST_DATA=3D$(ptest_run_dir)/test/data \
++	DBUS_TEST_HOMEDIR=3D$(ptest_run_dir)/dbus \
+ 	$(NULL)
+=20
+ test_corrupt_SOURCES =3D corrupt.c
diff --git a/meta/recipes-core/dbus/dbus-test_1.6.4.bb b/meta/recipes-core/=
dbus/dbus-test_1.6.4.bb
new file mode 100644
index 0000000..84829f7
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus-test_1.6.4.bb
@@ -0,0 +1,84 @@
+DESCRIPTION =3D "D-Bus test package, only used for D-bus functionality tes=
t."
+HOMEPAGE =3D "http://dbus.freedesktop.org"
+SECTION =3D "base"
+LICENSE =3D "AFL-2 | GPLv2+"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10dded3b58148f3f1fd804b26354af3=
e \
+                    file://dbus/dbus.h;firstline=3D6;endline=3D20;md5=3D6e=
ea2e0c7750dd8e620dcb1437312fa5"
+
+DEPENDS =3D "python-pygobject dbus dbus-glib"
+
+SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+           file://tmpdir.patch \
+           file://test-run-path.patch \
+           file://dbus-1.init  \
+           file://run-ptest \
+           "
+
+S=3D"${WORKDIR}/dbus-${PV}"
+FILESPATH =3D "${FILE_DIRNAME}/dbus-${PV}"
+
+inherit autotools pkgconfig gettext
+
+EXTRA_OECONF_X =3D "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x',=
 '--without-x', d)}"
+EXTRA_OECONF_X_virtclass-native =3D "--without-x"
+
+EXTRA_OECONF =3D "--enable-tests \
+                --enable-checks \
+                --enable-asserts \
+                --enable-verbose-mode \
+                --disable-xml-docs \
+                --disable-doxygen-docs \
+                --disable-libaudit \
+                --with-xml=3Dexpat \
+                --with-systemdsystemunitdir=3D${systemd_unitdir}/system/ \
+                ${EXTRA_OECONF_X}"
+
+FILES_${PN}-dbg =3D "\
+                   ${PTEST_PATH}/test/name-test/.debug \
+                   ${PTEST_PATH}/test/.debug \
+                   ${PTEST_PATH}/test/.libs/.debug \
+                   ${PTEST_PATH}/.debug \
+                   ${PTEST_PATH}/bus/.debug \
+                   ${PTEST_PATH}/dbus/.debug \
+                   ${PTEST_PATH}/tools/.debug \
+                   ${PTEST_PATH}/tools/.libs/.debug \
+                   /usr/src \
+                   /usr/src/debug \
+                   /usr/src/debug/${PN}-${PV}/dbus-${PV}/test/name-test/.d=
ebug \
+                   /usr/src/debug/${PN}-${PV}/dbus-${PV}/test/.debug \
+                   /usr/src/debug/${PN}-${PV}/dbus-${PV}/test/.libs/.debug=
 \
+                   /usr/src/debug/${PN}-${PV}/dbus-${PV}/.debug \
+                   /usr/src/debug/${PN}-${PV}/dbus-${PV}/bus/.debug \
+                   /usr/src/debug/${PN}-${PV}/dbus-${PV}/tools/.debug \
+                   /usr/src/debug/${PN}-${PV}/dbus-${PV}/tools/.libs/.debu=
g \
+                  "
+
+FILES_${PN}-staticdev =3D "${PTEST_PATH}/test/.libs \
+                         ${PTEST_PATH}/tools/.libs \
+                        "
+do_install() {
+    mkdir -p ${D}${libdir}/${PN}
+    touch ${D}${libdir}/${PN}/empty_file
+
+    if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ] ; then
+        mkdir -p ${D}${PTEST_PATH}
+        install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}
+        cp ${S}/Makefile ${D}${PTEST_PATH}
+
+        for subdir in dbus bus tools test doc; do
+            mkdir -p ${D}${PTEST_PATH}/$subdir
+        done
+
+        cp ${S}/bus/bus-test*   ${D}${PTEST_PATH}/bus
+        cp ${S}/bus/dbus-daemon ${D}${PTEST_PATH}/bus
+        cp ${S}/dbus/dbus-test  ${D}${PTEST_PATH}/dbus
+        cp ${S}/tools/.libs/*   ${D}${PTEST_PATH}/tools
+
+        cp -r ${S}/test         ${D}${PTEST_PATH}
+        find ${D}${PTEST_PATH}/test -name "*.[choa]" -o -name "*.la" | xar=
gs rm
+        mv -f ${D}${PTEST_PATH}/test/.libs/* ${D}${PTEST_PATH}/test
+        rm -rf ${D}${PTEST_PATH}/test/.libs
+
+        find ${D}${PTEST_PATH} -name Makefile | xargs sed -i 's/^Makefile:=
/_Makefile:/'
+    fi
+}
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.=
inc
index d165cdd..ab7d9f6 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -9,6 +9,9 @@ X11DEPENDS =3D "virtual/libx11 libsm"
 DEPENDS =3D "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x1=
1', '${X11DEPENDS}', '', d)}"
 DEPENDS_class-native =3D "expat-native virtual/libintl-native"
 DEPENDS_class-nativesdk =3D "nativesdk-expat virtual/nativesdk-libintl vir=
tual/libx11"
+RDEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-test', ''=
, d)}"
+RDEPENDS_class-native =3D ""
+
=20
 INC_PR =3D "r5"
=20
--=20
1.7.5.4



