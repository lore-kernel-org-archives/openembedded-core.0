Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TlMa6-0004un-7P
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 17:33:18 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 19 Dec 2012 17:18:37 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 1327B290C65;
	Wed, 19 Dec 2012 17:18:33 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:18:31 +0100
Message-ID: <1355933911-48562-6-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1355933911-48562-1-git-send-email-bjst@enea.com>
References: <1355933911-48562-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 5/5] Add ptest for bash.
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
 .../bash/bash-4.2/build-tests.patch                |   48 ++++++++++++++++=
++++
 meta/recipes-extended/bash/bash-4.2/run-ptest      |    2 +
 .../bash/bash-4.2/test-output.patch                |   25 ++++++++++
 meta/recipes-extended/bash/bash.inc                |   16 ++++++-
 meta/recipes-extended/bash/bash_4.2.bb             |    3 +
 5 files changed, 93 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/build-tests.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/run-ptest
 create mode 100644 meta/recipes-extended/bash/bash-4.2/test-output.patch

diff --git a/meta/recipes-extended/bash/bash-4.2/build-tests.patch b/meta/r=
ecipes-extended/bash/bash-4.2/build-tests.patch
new file mode 100644
index 0000000..0360881
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/build-tests.patch
@@ -0,0 +1,48 @@
+Add 'ptest' target to Makefile, to run tests without checking dependencies=
.
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Upstream-Status: Pending
+---
+diff -uNr a/Makefile.in b/Makefile.in
+--- a/Makefile.in	2012-11-06 08:40:07.552403063 +0100
++++ b/Makefile.in	2012-11-06 11:13:36.958297555 +0100
+@@ -827,20 +827,34 @@
+ 	fi
+=20
+ recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)recho.c ${LIBS=
_FOR_BUILD}
++	@$(CC) $(CCFLAGS) -o $@ $<
+=20
+ zecho$(EXEEXT):		$(SUPPORT_SRC)zecho.c
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)zecho.c ${LIBS=
_FOR_BUILD}
++	@$(CC) $(CCFLAGS) -o $@ $<
+=20
+ printenv$(EXEEXT):	$(SUPPORT_SRC)printenv.c
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)printenv.c ${L=
IBS_FOR_BUILD}
++	@$(CC) $(CCFLAGS) -o $@ $<
+=20
+ xcase$(EXEEXT):	$(SUPPORT_SRC)xcase.c
+-	@$(CC_FOR_BUILD) $(CCFLAGS_FOR_BUILD) -o $@ $(SUPPORT_SRC)xcase.c ${LIBS=
_FOR_BUILD}
++	@$(CC) $(CCFLAGS) -o $@ $<
+=20
+-test tests check:	force $(Program) $(TESTS_SUPPORT)
++test tests check:
++	@$(MAKE) install-test
++	@$(MAKE) runtest
++
++install-test: buildtest
++ifeq ($(origin INSTALL_TEST_DIR), undefined)
+ 	@-test -d tests || mkdir tests
+ 	@cp $(TESTS_SUPPORT) tests
++else
++	@-test -d $(INSTALL_TEST_DIR) || mkdir -p $(INSTALL_TEST_DIR)
++	@cp -r $(srcdir)/tests/* $(INSTALL_TEST_DIR)/
++	@cp $(TESTS_SUPPORT) $(INSTALL_TEST_DIR)
++endif
++
++buildtest: force $(Program) $(TESTS_SUPPORT)
++
++runtest:
+ 	@( cd $(srcdir)/tests && \
+ 		PATH=3D$(BUILD_DIR)/tests:$$PATH THIS_SH=3D$(THIS_SH) $(SHELL) ${TESTSC=
RIPT} )
+=20
diff --git a/meta/recipes-extended/bash/bash-4.2/run-ptest b/meta/recipes-e=
xtended/bash/bash-4.2/run-ptest
new file mode 100644
index 0000000..66f1eee
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+echo Makefile: | make -f Makefile -f - -k THIS_SH=3D/bin/bash BUILD_DIR=3D=
. runtest
diff --git a/meta/recipes-extended/bash/bash-4.2/test-output.patch b/meta/r=
ecipes-extended/bash/bash-4.2/test-output.patch
new file mode 100644
index 0000000..7d0ce63
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/test-output.patch
@@ -0,0 +1,25 @@
+Add FAIL/PASS output to test output.
+
+Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
+Upstream-status: Pending
+---
+diff -uNr a/tests/run-all b/tests/run-all
+--- a/tests/run-all	1999-10-08 17:07:46.000000000 +0200
++++ b/tests/run-all	2012-10-27 21:04:18.663331887 +0200
+@@ -22,7 +22,15 @@
+ 	case $x in
+ 	$0|run-minimal|run-gprof)	;;
+ 	*.orig|*~) ;;
+-	*)	echo $x ; sh $x ;;
++    *)  echo $x
++         output=3D`sh $x`
++         if [ -n "$output" ]; then
++             echo "$output"
++             echo "FAIL: $x"
++         else
++             echo "PASS: $x"
++         fi
++         ;;
+ 	esac
+ done
+=20
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/ba=
sh/bash.inc
index f1de931..20a23f0 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -4,7 +4,7 @@ SECTION =3D "base/shell"
=20
 DEPENDS =3D "ncurses bison-native"
=20
-inherit autotools gettext update-alternatives
+inherit autotools gettext update-alternatives ptest
=20
 PARALLEL_MAKE =3D ""
=20
@@ -17,18 +17,32 @@ ALTERNATIVE_PRIORITY =3D "100"
=20
 export AUTOHEADER =3D "true"
=20
+RDEPENDS_${PN}-ptest +=3D "make"
+
 do_configure_prepend () {
 	if [ ! -e acinclude.m4 ]; then
 		cat aclocal.m4 > acinclude.m4
 	fi
 }
=20
+do_compile_append () {
+        if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+            oe_runmake buildtest
+        fi
+}
+
 do_install_append () {
 	# Move /usr/bin/bash to /bin/bash, if need
 	if [ "${base_bindir}" !=3D "${bindir}" ]; then
 		mkdir -p ${D}${base_bindir}
 		mv ${D}${bindir}/bash ${D}${base_bindir}
 	fi
+
+        if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+            ptest_do_install
+            make INSTALL_TEST_DIR=3D${D}${PTEST_PATH}/tests install-test
+            cp ${B}/Makefile ${D}${PTEST_PATH}
+        fi
 }
=20
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended=
/bash/bash_4.2.bb
index 07dda09..fefe7b7 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -19,6 +19,9 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=
=3Dtarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-010;apply=3Dyes;stri=
plevel=3D0;name=3Dpatch010 \
            file://execute_cmd.patch;striplevel=3D0 \
            file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://run-ptest \
            "
=20
 SRC_URI[tarball.md5sum] =3D "3fb927c7c33022f1c327f14a81c0d4b0"
--=20
1.7.5.4



