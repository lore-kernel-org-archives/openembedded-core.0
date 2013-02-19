Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U7nIE-0000Kc-27
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 14:31:38 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Feb 2013 14:14:17 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id CB145291D4C;
	Tue, 19 Feb 2013 14:14:17 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 14:13:58 +0100
Message-ID: <1361279644-17675-3-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1361279644-17675-1-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: Anders Roxell <anders.roxell@enea.com>
Subject: [PATCH 2/8] zlib: Add ptest
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
X-List-Received-Date: Tue, 19 Feb 2013 13:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Anders Roxell <anders.roxell@enea.com>

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
Signed-off-by: Anders Roxell <anders.roxell@enea.com>
---
 .../zlib/zlib-1.2.7/Makefile-runtests.patch        |   38 ++++++++++++++++=
++++
 meta/recipes-core/zlib/zlib-1.2.7/run-ptest        |    7 ++++
 meta/recipes-core/zlib/zlib_1.2.7.bb               |   22 +++++++++++
 3 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.pat=
ch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/run-ptest

diff --git a/meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.patch b/me=
ta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.patch
new file mode 100644
index 0000000..04c55b4
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.patch
@@ -0,0 +1,38 @@
+Add 'ptest' target to Makefile, to run tests without checking dependencies=
.
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Upstream-Status: Pending
+---
+diff -uNr a/Makefile.in b/Makefile.in
+--- a/Makefile.in	2012-04-23 07:58:06.000000000 +0200
++++ b/Makefile.in	2012-10-24 08:24:19.822544837 +0200
+@@ -83,6 +83,9 @@
+ test: all teststatic testshared
+=20
+ teststatic: static
++	@make runteststatic
++
++runteststatic:
+ 	@TMPST=3D`mktemp fooXXXXXX`; \
+ 	if echo hello world | ./minigzip | ./minigzip -d && ./example $$TMPST ; =
then \
+ 	  echo '		*** zlib test OK ***'; \
+@@ -92,6 +95,9 @@
+ 	rm -f $$TMPST
+=20
+ testshared: shared
++	@make runtestshared
++
++runtestshared:
+ 	@LD_LIBRARY_PATH=3D`pwd`:$(LD_LIBRARY_PATH) ; export LD_LIBRARY_PATH; \
+ 	LD_LIBRARYN32_PATH=3D`pwd`:$(LD_LIBRARYN32_PATH) ; export LD_LIBRARYN32_=
PATH; \
+ 	DYLD_LIBRARY_PATH=3D`pwd`:$(DYLD_LIBRARY_PATH) ; export DYLD_LIBRARY_PAT=
H; \
+@@ -105,6 +111,9 @@
+ 	rm -f $$TMPSH
+=20
+ test64: all64
++	@make runtest64
++
++runtest64:
+ 	@TMP64=3D`mktemp fooXXXXXX`; \
+ 	if echo hello world | ./minigzip64 | ./minigzip64 -d && ./example64 $$TM=
P64; then \
+ 	  echo '		*** zlib 64-bit test OK ***'; \
diff --git a/meta/recipes-core/zlib/zlib-1.2.7/run-ptest b/meta/recipes-cor=
e/zlib/zlib-1.2.7/run-ptest
new file mode 100644
index 0000000..19d9632
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.7/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+FILE=3Dzlib-ptest-$$.log
+make -k runteststatic runtestshared > $FILE
+sed -i -r -e 's/^(\s+\*+ (.+?) test OK \*+)/\1\nPASS: \2/' $FILE
+sed -i -r -e 's/^(\s+\*+ (.+?) test FAILED \*+)/\1\nFAIL: \2/' $FILE
+cat $FILE
+rm -f $FILE
diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/=
zlib_1.2.7.bb
index 803fec3..61380ec 100644
--- a/meta/recipes-core/zlib/zlib_1.2.7.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
@@ -8,20 +8,42 @@ LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;endline=
=3D23;md5=3D94d1b5a40dadd127f33
=20
 SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
            file://remove.ldconfig.call.patch \
+           file://Makefile-runtests.patch \
+           file://run-ptest \
            "
 SRC_URI[md5sum] =3D "2ab442d169156f34c379c968f3f482dd"
 SRC_URI[sha256sum] =3D "49e2e9658dfb036900da6ea0267a737fa3c4eee6666776d378=
c79d52e9334934"
=20
+RDEPENDS_${PN}-ptest +=3D "make"
+RDEPENDS_${PN}-ptest_virtclass-native =3D ""
+RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""
+
+FILES_${PN}-dbg +=3D "${PTEST_PATH}/.debug"
+
+inherit ptest
+
 do_configure (){
 	./configure --prefix=3D${prefix} --shared --libdir=3D${libdir}
 }
=20
 do_compile (){
 	oe_runmake
+	if [ ${PTEST_ENABLED} =3D "1" ] ; then
+		oe_runmake static shared
+	fi
 }
=20
 do_install() {
 	oe_runmake DESTDIR=3D${D} install
+
+	if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
+		ptest_do_install
+		install ${B}/Makefile   ${D}${PTEST_PATH}
+		install ${B}/example    ${D}${PTEST_PATH}
+		install ${B}/minigzip   ${D}${PTEST_PATH}
+		install ${B}/examplesh  ${D}${PTEST_PATH}
+		install ${B}/minigzipsh ${D}${PTEST_PATH}
+	fi
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
1.7.5.4



