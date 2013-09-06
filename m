Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EF98B6185E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 13:38:12 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Fri, 6 Sep 2013
	15:38:12 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 45EF128CD08;
	Fri,  6 Sep 2013 15:38:12 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Sep 2013 15:38:09 +0200
Message-ID: <1378474690-39713-2-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378474690-39713-1-git-send-email-mihaela.sendrea@enea.com>
References: <1378474690-39713-1-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 2/3] expect: Add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2013 13:38:14 -0000
Content-Type: text/plain

Nedeed for gcc-runtime tests.

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 .../expect/expect/0001-configure.in.patch          |  108 ++++++++++++++++++++
 .../expect/expect/0002-tcl.m4.patch                |   17 +++
 meta/recipes-devtools/expect/expect_5.45.bb        |   53 ++++++++++
 3 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-configure.in.patch
 create mode 100644 meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
 create mode 100644 meta/recipes-devtools/expect/expect_5.45.bb

diff --git a/meta/recipes-devtools/expect/expect/0001-configure.in.patch b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
new file mode 100644
index 0000000..7595a25
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
@@ -0,0 +1,108 @@
+Allow cross compiling.
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Upstream-Status: Pending
+---
+diff -uNr a/configure.in b/configure.in
+--- a/configure.in	2012-12-14 15:31:32.623180450 +0100
++++ b/configure.in	2012-12-14 15:53:34.518233519 +0100
+@@ -481,7 +481,7 @@
+ ,
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ AC_MSG_CHECKING([if any value exists for WNOHANG])
+@@ -506,7 +506,9 @@
+ 	AC_MSG_RESULT(no)
+ 	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(yes)
++	AC_DEFINE_UNQUOTED(WNOHANG_BACKUP_VALUE, `cat wnohang`)
++	rm -f wnohang
+ )
+ 
+ #
+@@ -574,7 +576,8 @@
+ 	AC_DEFINE(REARM_SIG)
+ ,
+ 	AC_MSG_RESULT(no)
+-, AC_MSG_WARN([Expect can't be cross compiled])
++,
++	AC_MSG_RESULT(no)
+ )
+ 
+ # HPUX7 has trouble with the big cat so split it
+@@ -725,7 +728,9 @@
+ ,
+         AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++        AC_MSG_RESULT(yes)
++        AC_DEFINE(HAVE_SGTTYB)
++        PTY_TYPE=sgttyb
+ )
+ 
+ # mach systems have include files for unimplemented features
+@@ -749,7 +754,9 @@
+ ,
+         AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++        AC_DEFINE(HAVE_TERMIO)
++        PTY_TYPE=termios
++        AC_MSG_RESULT(yes)
+ )
+ 
+   # now check for the new style ttys (not yet posix)
+@@ -771,7 +778,9 @@
+   ,
+         AC_MSG_RESULT(no)
+   ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++        AC_DEFINE(HAVE_TERMIOS)
++        PTY_TYPE=termios
++        AC_MSG_RESULT(yes)
+   )
+ fi
+ 
+@@ -794,7 +803,7 @@
+ ,
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ AC_MSG_CHECKING([if TIOCGWINSZ in termios.h])
+@@ -816,7 +825,7 @@
+ ,
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ # finally check for Cray style ttys
+@@ -837,7 +846,7 @@
+ ,
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ #
+@@ -889,7 +898,8 @@
+ 	AC_MSG_RESULT(yes),
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_DEFINE(HAVE_SV_TIMEZONE)
++	AC_MSG_RESULT(yes),
+ )
+ 
+ 
diff --git a/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
new file mode 100644
index 0000000..dc4c6ba
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
@@ -0,0 +1,17 @@
+Use proper -L path when cross compiling.
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+Upstream-Status: Pending
+---
+diff -uNr a/tclconfig/tcl.m4 b/tclconfig/tcl.m4
+--- a/tclconfig/tcl.m4	2012-12-14 09:16:58.789861281 +0100
++++ b/tclconfig/tcl.m4	2012-12-14 10:55:43.542297010 +0100
+@@ -371,7 +371,7 @@
+     # of TCL_BUILD_LIB_SPEC. An extension should make use of TCL_LIB_SPEC
+     # instead of TCL_BUILD_LIB_SPEC since it will work with both an
+     # installed and uninstalled version of Tcl.
+-    if test -f "${TCL_BIN_DIR}/Makefile" ; then
++    if test -f "${TCL_BIN_DIR}/Makefile" || test "$cross_compiling" = yes; then
+         TCL_LIB_SPEC="${TCL_BUILD_LIB_SPEC}"
+         TCL_STUB_LIB_SPEC="${TCL_BUILD_STUB_LIB_SPEC}"
+         TCL_STUB_LIB_PATH="${TCL_BUILD_STUB_LIB_PATH}"
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
new file mode 100644
index 0000000..d7c0772
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -0,0 +1,53 @@
+DESCRIPTION = "expect."
+HOMEPAGE = " http://expect.nist.gov"
+LICENSE="GPLv3+"
+SECTION = "devel"
+
+LIC_FILES_CHKSUM = "file://README;md5=2862a5993e5f43b368a49cfaad5bead6"
+PR = "r1"
+DEPENDS = "tcl"
+RDEPENDS_${PN} = "tcl"
+ALLOW_EMPTY_${PN} = "1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/expect:"
+
+S = "${WORKDIR}/${BPN}${PV}"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/5.45/expect5.45.tar.gz \
+           file://0001-configure.in.patch \
+           file://0002-tcl.m4.patch \
+          "
+EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
+                 --with-tcl=${STAGING_LIBDIR} \
+                 --with-tclinclude=${STAGING_INCDIR} \
+                 --enable-shared \
+                 --enable-threads \
+                 --disable-rpath \
+                "
+EXTRA_OEMAKE_install = " 'SCRIPTS=' "
+FILES_${PN}-dbg += "${libdir}/expect5.45/.debug \
+                    ${libdir}/.debug \
+                   "
+FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
+                   ${STAGING_INCDIR}/expect.h \
+                   ${STAGING_INCDIR}/expect_tcl.h \
+                   ${STAGING_INCDIR}/expect_comm.h \
+                   ${STAGING_INCDIR}/tcldbg.h \
+                   ${includedir}/*.h \
+                  "
+
+FILES_${PN} += "${libdir}/libexpect${PV}.so \
+                ${libdir}/expect${PV}/* \
+               "
+
+inherit autotools
+
+do_install_append() {
+        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
+        install -m 0755 ${S}/fixline1           ${D}${libdir_native}/expect${PV}/
+        install -m 0755 ${S}/example/*          ${D}${libdir_native}/expect${PV}/
+        rm ${D}${libdir}/expect${PV}/libexpect*.so
+}
+
+SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
+SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
-- 
1.7.10.4


