Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TbCNw-0002Ec-WA
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 16:38:45 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 21 Nov 2012 16:23:33 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id B5C5A29143A;
	Wed, 21 Nov 2012 16:23:32 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Nov 2012 16:23:10 +0100
Message-ID: <1353511391-60570-4-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1353511391-60570-1-git-send-email-bjst@enea.com>
References: <1353511391-60570-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 3/4] Add ptest for glib-2.0.
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
X-List-Received-Date: Wed, 21 Nov 2012 15:38:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   30 ++++++++++
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 +
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |   57 ++++++++++++++++=
++++
 .../ptest-runner/files/ptest-runner                |    3 +
 4 files changed, 93 insertions(+), 0 deletions(-)
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.32.4.bb
index 10c0b61..343b458 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -15,6 +15,8 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.=
tar.xz \
            file://glib-2.0_fix_for_x32.patch \
            file://nodbus.patch \
            file://nolibelf.patch \
+           file://Makefile-ptest.patch \
+           file://run-ptest \
           "
 SRC_URI[md5sum] =3D "bf84fefd9c1a5b5a7a38736f4ddd674a"
 SRC_URI[sha256sum] =3D "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709b=
da4d11b167fae2"
@@ -22,6 +24,38 @@ SRC_URI[sha256sum] =3D "a5d742a4fda22fb6975a8c0cfcd2499d=
d1c809b8afd4ef709bda4d11b1
 SRC_URI_append_virtclass-native =3D " file://glib-gettextize-dir.patch"
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
 	sed -i -e "s:TEST_PROGS +=3D gdbus-serialization::g"  ${S}/gio/tests/Make=
file.am
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codege=
n/gdbus-codegen.in
@@ -40,4 +74,27 @@ do_install_append() {
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
diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/re=
cipes-support/ptest-runner/files/ptest-runner
index 4f3c7ce..5022218 100644
--- a/meta/recipes-support/ptest-runner/files/ptest-runner
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -1,5 +1,8 @@
 #!/bin/sh
=20
+export MALLOC_CHECK_=3D2
+export MALLOC_PERTURB_=3D$(($RANDOM % 255 + 1))
+
 echo "START: $0"
 cd /usr/lib
 for x in *
--=20
1.7.5.4



