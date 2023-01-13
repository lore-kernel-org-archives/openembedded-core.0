Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7812C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 16:57:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.93248.1673629025477453221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 08:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF6D0FEC;
	Fri, 13 Jan 2023 08:57:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35B7A3F67D;
	Fri, 13 Jan 2023 08:57:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] quilt: rewrite ptest glue
Date: Fri, 13 Jan 2023 16:57:01 +0000
Message-Id: <20230113165702.1312882-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 16:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175840

The ptest glue was overly complex. Not as many files are needed to be
installed if we tell it to use the system's quilt tools, there's no
need for a custom Makefile just to set some environment variables, and
/usr/bin/ed doesn't appear to be used at all.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/quilt/quilt.inc       | 28 ++++++++-------------
 meta/recipes-devtools/quilt/quilt/Makefile  | 14 -----------
 meta/recipes-devtools/quilt/quilt/run-ptest |  7 +++---
 meta/recipes-devtools/quilt/quilt/test.sh   | 25 +++++++++++++++++-
 4 files changed, 38 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/Makefile

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtool=
s/quilt/quilt.inc
index ec69705093b..b4284dcafb3 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f"
=20
 SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://run-ptest \
-        file://Makefile \
         file://test.sh \
         file://0001-tests-Allow-different-output-from-mv.patch \
         file://fix-grep-3.8.patch \
@@ -61,17 +60,12 @@ do_install:append:class-native () {
     touch ${D}${sysconfdir}/quiltrc
 }
=20
-do_compile_ptest() {
-	oe_runmake bin/patch-wrapper test/.depend
-}
-
 do_install_ptest() {
-	tar -c --exclude=3D\*.in bin/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	tar -c --exclude=3D\*.in compat/ | ( cd ${D}${PTEST_PATH} && tar -xf - =
)
-	tar -c --exclude=3D\*.in quilt/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	tar -c --exclude=3Dmail.test --exclude=3Ddelete.test test/ | ( cd ${D}$=
{PTEST_PATH} && tar -xf - && chmod 777 test)
-	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
-	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
+	install ${WORKDIR}/test.sh ${D}${PTEST_PATH}
+    mkdir ${D}${PTEST_PATH}/test
+    install ${S}/test/* ${D}${PTEST_PATH}/test
+    # mail needs a MTA, and the patch-wrapper is disabled
+    rm -f ${D}${PTEST_PATH}/test/mail.test ${D}${PTEST_PATH}/test/patch-=
wrapper.test
 }
=20
 PACKAGES +=3D "guards guards-doc"
@@ -85,9 +79,9 @@ FILES:guards-doc =3D "${mandir}/man1/guards.1"
 RDEPENDS:${PN} =3D "bash patch diffstat bzip2 util-linux less"
 RDEPENDS:${PN}:class-native =3D "diffstat-native patch-native bzip2-nati=
ve"
=20
-RDEPENDS:${PN}-ptest =3D "make file sed gawk diffutils findutils ed perl=
 \
-                        perl-module-filehandle perl-module-getopt-std \
-                        perl-module-posix perl-module-file-temp \
-                        perl-module-text-parsewords perl-module-overload=
ing \
-                        bash util-linux-getopt patch \
-                       "
+RDEPENDS:${PN}-ptest +=3D "file sed gawk diffutils findutils ed perl \
+                         perl-module-filehandle perl-module-getopt-std \
+                         perl-module-posix perl-module-file-temp \
+                         perl-module-text-parsewords perl-module-overloa=
ding \
+                         bash util-linux-getopt \
+                        "
diff --git a/meta/recipes-devtools/quilt/quilt/Makefile b/meta/recipes-de=
vtools/quilt/quilt/Makefile
deleted file mode 100644
index 1f6cd2479ca..00000000000
--- a/meta/recipes-devtools/quilt/quilt/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-PATH :=3D         $(CURDIR)/bin:$(CURDIR)/compat:$(PATH)
-QUILT_DIR :=3D    $(CURDIR)/quilt
-QUILTRC :=3D      $(CURDIR)/test/test.quiltrc
-export QUILT_DIR QUILTRC
-CHECK_ENV :=3D P=3Dpatches/; _P=3D../patches/; export P _P;
-CHECK_ENV +=3D QUILT_PC=3D.pc; export QUILT_PC
--include test/.depend
-
-check-% : test/%.test
-	@LANG=3DC; LC_ALL=3DC; \
-	export LANG LC_ALL; \
-	$(CHECK_ENV); \
-	cd $(<D); \
-	./run -q $(<F)
diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-d=
evtools/quilt/quilt/run-ptest
index d2de5c855a3..322508cbe25 100755
--- a/meta/recipes-devtools/quilt/quilt/run-ptest
+++ b/meta/recipes-devtools/quilt/quilt/run-ptest
@@ -1,8 +1,7 @@
 #!/bin/sh
=20
-THIS_SH=3D/bin/sh
-ln -sf /bin/ed /usr/bin/ed
 /usr/sbin/adduser --disabled-password --gecos "" quilttest
-su -c "${THIS_SH} ./test.sh" quilttest
+
+su -c ./test.sh quilttest
+
 /usr/sbin/deluser quilttest
-rm -f /usr/bin/ed
diff --git a/meta/recipes-devtools/quilt/quilt/test.sh b/meta/recipes-dev=
tools/quilt/quilt/test.sh
index 6563e4a2fb0..7dac8f44231 100755
--- a/meta/recipes-devtools/quilt/quilt/test.sh
+++ b/meta/recipes-devtools/quilt/quilt/test.sh
@@ -1 +1,24 @@
-for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; d=
o make check-$i; if [ $? -eq 0 ]; then echo PASS: $i.test; else echo FAIL=
: $i.test; fi; done
+#! /bin/sh
+
+set -e -u
+
+export LANG=3DC
+export LC_ALL=3DC
+export P=3Dpatches/
+export _P=3D../patches/
+export QUILTRC=3D$(pwd)/test/test.quiltrc
+export QUILT_PC=3D.pc
+export QUILT_DIR=3D/usr/share/quilt/
+
+# Specify on the commandline, else runs all of the tests
+TESTS=3D${@:-test/*.test}
+
+for FILENAME in $TESTS; do
+    TESTNAME=3D$(basename $FILENAME .test)
+    ./test/run $FILENAME
+    if [ $? -eq 0 ];
+        then echo PASS: $TESTNAME
+    else
+        echo FAIL: $TESTNAME
+    fi
+done
--=20
2.34.1


