Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1T7S8b-0001Wh-K6
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 16:23:57 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.298.4;
	Fri, 31 Aug 2012 16:10:36 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id D79A82867CE;
	Fri, 31 Aug 2012 16:10:35 +0200 (CEST)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 16:10:28 +0200
Message-ID: <1346422229-61628-3-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1346422229-61628-1-git-send-email-bjst@enea.com>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 2/3] Enable bash-ptest
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
X-List-Received-Date: Fri, 31 Aug 2012 14:23:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch Makefile.in to allow test programs be built on host and ran on
target.
Patch tests/run-all to output PASS/FAIL for each testcase.
Patch recipe to contitionally build and install ptest.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 .../bash/bash-4.2/build-tests.patch                |   34 ++++++++++++++++=
++++
 meta/recipes-extended/bash/bash-4.2/run-ptest      |    2 +
 .../bash/bash-4.2/test-output.patch                |   19 +++++++++++
 meta/recipes-extended/bash/bash.inc                |   23 +++++++++++++
 meta/recipes-extended/bash/bash_4.2.bb             |    5 ++-
 5 files changed, 82 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash-4.2/build-tests.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/run-ptest
 create mode 100644 meta/recipes-extended/bash/bash-4.2/test-output.patch

diff --git a/meta/recipes-extended/bash/bash-4.2/build-tests.patch b/meta/r=
ecipes-extended/bash/bash-4.2/build-tests.patch
new file mode 100644
index 0000000..17276c7
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/build-tests.patch
@@ -0,0 +1,34 @@
+diff -uNr a/Makefile.in b/Makefile.in
+--- a/Makefile.in	2012-08-31 13:54:15.259491840 +0200
++++ b/Makefile.in	2012-08-31 14:54:46.508053649 +0200
+@@ -827,20 +827,26 @@
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
++	@$(MAKE) buildtest
++	@$(MAKE) runtest
++
++buildtest: force $(Program) $(TESTS_SUPPORT)
+ 	@-test -d tests || mkdir tests
+ 	@cp $(TESTS_SUPPORT) tests
++
++runtest:
+ 	@( cd $(srcdir)/tests && \
+ 		PATH=3D$(BUILD_DIR)/tests:$$PATH THIS_SH=3D$(THIS_SH) $(SHELL) ${TESTSC=
RIPT} )
diff --git a/meta/recipes-extended/bash/bash-4.2/run-ptest b/meta/recipes-e=
xtended/bash/bash-4.2/run-ptest
new file mode 100644
index 0000000..8dd3b99
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+make -k THIS_SH=3D/bin/bash BUILD_DIR=3D. runtest
diff --git a/meta/recipes-extended/bash/bash-4.2/test-output.patch b/meta/r=
ecipes-extended/bash/bash-4.2/test-output.patch
new file mode 100644
index 0000000..065a85c
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/test-output.patch
@@ -0,0 +1,19 @@
+diff -uNr a/tests/run-all b/tests/run-all
+--- a/tests/run-all	2012-06-14 10:15:15.007467700 +0200
++++ b/tests/run-all	2012-06-14 10:19:26.464678067 +0200
+@@ -22,6 +22,14 @@
+ 	case $x in
+ 	$0|run-minimal|run-gprof)	;;
+ 	*.orig|*~) ;;
+-	*)	echo $x ; sh $x ;;
++	*)	echo $x
++		output=3D`sh $x`
++		if [ -n "$output" ]; then
++			echo "$output"
++			echo "FAIL: $x"
++		else
++			echo "PASS: $x"
++		fi
++		;;
+ 	esac
+ done
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/ba=
sh/bash.inc
index 3684191..7f7a965 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -21,18 +21,41 @@ ALTERNATIVE_PRIORITY =3D "100"
=20
 export AUTOHEADER =3D "true"
=20
+RDEPENDS_${PN}-ptest +=3D "make"
+FILES_${PN}-dbg +=3D "${PTEST_PATH}/.debug \
+                    ${PTEST_PATH}/tests/.debug"
+
+PTEST_ENABLED =3D "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs', '1', '=
0', d)}"
+
 do_configure_prepend () {
 	if [ ! -e acinclude.m4 ]; then
 		cat aclocal.m4 > acinclude.m4
 	fi
 }
=20
+do_compile_append () {
+        if [ ${PTEST_ENABLED} =3D "1" ] ; then
+		oe_runmake buildtest
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
+            mkdir -p ${D}${PTEST_PATH}
+            install -m 0755 ${WORKDIR}/run-ptest    ${D}${PTEST_PATH}
+            install -m 0755 ${B}/Makefile           ${D}${PTEST_PATH}
+            install -m 0755 ${B}/recho              ${D}${PTEST_PATH}
+            install -m 0755 ${B}/zecho              ${D}${PTEST_PATH}
+            install -m 0755 ${B}/printenv           ${D}${PTEST_PATH}
+            install -m 0755 ${B}/xcase              ${D}${PTEST_PATH}
+            cp -r ${B}/tests                        ${D}${PTEST_PATH}
+        fi
 }
=20
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended=
/bash/bash_4.2.bb
index 50f2ff6..5e9b50e 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
=20
-PR =3D "r4"
+PR =3D "r5"
=20
 SRC_URI =3D "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=3Dtarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=3Dyes;stri=
plevel=3D0;name=3Dpatch001 \
@@ -14,6 +14,9 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=
=3Dtarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-009;apply=3Dyes;stri=
plevel=3D0;name=3Dpatch009 \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-010;apply=3Dyes;stri=
plevel=3D0;name=3Dpatch010 \
            file://execute_cmd.patch;striplevel=3D0 \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://run-ptest \
            "
=20
 SRC_URI[tarball.md5sum] =3D "3fb927c7c33022f1c327f14a81c0d4b0"
--=20
1.7.5.4



