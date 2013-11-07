Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 58AB26D552
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 02:34:44 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rq13so388379pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 18:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qoUpj7NhaagPloA/tbbPt2NdaPFzkt1U4GbX4bckxyY=;
	b=hP7f5+7a16E3c72YErsO5UgJBQV/WK1Tl5r59A3HvyNZK/CSwpHpNssMC/OaCBauHG
	h3DmBIAyFJujLq3wuihXRNFBG2EE6+koISCXyUmAq9Ii7AkqpBYIrP7wzbipKEBJq7Hv
	aiRFCflRPHNmhD1Ou6WOVNlDz7L7gT0giwUZH2UYMwzIRIb9Vijli16p+pqX5dUmPWm1
	+k0paKndU63EAEkBgC03ufd4JDbNZmZGuovrWeCk1YZ7vxbhDFo/bEeI/k7SgEAj6ny/
	iu+Zln6jBV/PHrx7NHwviLKbGEg4UB1xhk77O2B2IpsspI3fi71G7PHZLViYoGzD1iGt
	kIWQ==
X-Received: by 10.68.96.130 with SMTP id ds2mr6339039pbb.99.1383791686032;
	Wed, 06 Nov 2013 18:34:46 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id oj6sm2122014pab.9.2013.11.06.18.34.44
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 18:34:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 18:33:59 -0800
Message-Id: <1383791639-31227-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH V6] expect: Add recipe
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
X-List-Received-Date: Thu, 07 Nov 2013 02:34:44 -0000

From: Mihaela Sendrea <mihaela.sendrea@enea.com>

Nedeed for gcc-runtime tests.

Fixed build on multilib and add patch to remove
!/depot/path/expect -f
which caused rpm to puke on rfs generation

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../expect/expect/0001-configure.in.patch          | 108 ++++++++++++++++
 .../expect/expect/0002-tcl.m4.patch                |  17 +++
 .../expect/expect/01-example-shebang.patch         | 144 +++++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.bb        |  61 +++++++++
 4 files changed, 330 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-configure.in.patch
 create mode 100644 meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
 create mode 100644 meta/recipes-devtools/expect/expect/01-example-shebang.patch
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
diff --git a/meta/recipes-devtools/expect/expect/01-example-shebang.patch b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
new file mode 100644
index 0000000..8597f31
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
@@ -0,0 +1,144 @@
+Author: Mike Markley <mike@markley.org>
+Author: Sergei Golovan <sgolovan@debian.org>
+Description: Fixes shebangs in examples (Closes: #152367).
+
+Backported from Debian
+
+Upstream-Status: Pending
+Index: expect5.45/example/beer.exp
+===================================================================
+--- expect5.45.orig/example/beer.exp	2006-01-25 13:51:39.000000000 -0800
++++ expect5.45/example/beer.exp	2013-11-01 17:35:19.817318341 -0700
+@@ -1,4 +1,9 @@
+-#!/depot/path/expect -f
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec tclsh "$0" ${1+"$@"}
++
++package require Expect
+ 
+ # 99 bottles of beer on the wall, Expect-style
+ # Author: Don Libes <libes@nist.gov>
+Index: expect5.45/example/expectd.proto
+===================================================================
+--- expect5.45.orig/example/expectd.proto	2010-07-02 09:03:31.000000000 -0700
++++ expect5.45/example/expectd.proto	2013-11-01 17:35:19.821318341 -0700
+@@ -1,4 +1,10 @@
+-#!/depot/tcl/src/expect/e --
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec tclsh "$0" ${1+"$@"}
++
++package require Expect
++
+ # Description: Simple fragment to begin a telnet daemon
+ # For more information, see Chapter 17 of "Exploring Expect"
+ # Author: Don Libes, NIST
+Index: expect5.45/example/irsh
+===================================================================
+--- expect5.45.orig/example/irsh	2010-07-02 09:03:31.000000000 -0700
++++ expect5.45/example/irsh	2013-11-01 17:35:19.821318341 -0700
+@@ -1,4 +1,9 @@
+-#!/depot/path/expect --
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec tclsh "$0" ${1+"$@"}
++
++package require Expect
+ 
+ # Do rsh interactively.  For example, consider the following command:
+ #    rsh <remote> ls -l "|" more
+Index: expect5.45/example/passwd.cgi
+===================================================================
+--- expect5.45.orig/example/passwd.cgi	2000-01-06 15:22:07.000000000 -0800
++++ expect5.45/example/passwd.cgi	2013-11-01 17:35:19.821318341 -0700
+@@ -1,4 +1,9 @@
+-#!/depot/path/expect --
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec tclsh "$0" ${1+"$@"}
++
++package require Expect
+ 
+ # This is a CGI script to process requests created by the accompanying
+ # passwd.html form.  This script is pretty basic, although it is
+Index: expect5.45/example/passwdprompt
+===================================================================
+--- expect5.45.orig/example/passwdprompt	2003-09-05 12:01:59.000000000 -0700
++++ expect5.45/example/passwdprompt	2013-11-01 17:35:19.821318341 -0700
+@@ -1,4 +1,9 @@
+-#!/depot/path/expect
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec tclsh "$0" ${1+"$@"}
++
++package require Expect
+ 
+ # This script prompts for a passwd from stdin while echoing *'s
+ 
+Index: expect5.45/example/reprompt
+===================================================================
+--- expect5.45.orig/example/reprompt	2000-01-06 15:22:07.000000000 -0800
++++ expect5.45/example/reprompt	2013-11-01 17:35:19.821318341 -0700
+@@ -1,4 +1,9 @@
+-#!/depot/path/expect --
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec tclsh "$0" ${1+"$@"}
++
++package require Expect
+ 
+ # Name: reprompt
+ # Description: reprompt every so often until user enters something
+Index: expect5.45/example/term_expect
+===================================================================
+--- expect5.45.orig/example/term_expect	2005-02-15 10:11:31.000000000 -0800
++++ expect5.45/example/term_expect	2013-11-01 17:35:19.821318341 -0700
+@@ -1,4 +1,9 @@
+-#!/depot/path/expectk
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec wish "$0" ${1+"$@"}
++
++package require Expect
+ 
+ # Name: tkterm - terminal emulator using Expect and Tk text widget, v3.0
+ # Author: Don Libes, July '94
+Index: expect5.45/example/vrfy
+===================================================================
+--- expect5.45.orig/example/vrfy	2010-07-02 09:03:31.000000000 -0700
++++ expect5.45/example/vrfy	2013-11-01 17:35:19.821318341 -0700
+@@ -1,4 +1,9 @@
+-#!/depot/path/expect -f
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec tclsh "$0" ${1+"$@"}
++
++package require Expect
+ 
+ 
+ # separate address into user and host
+Index: expect5.45/example/xrlogin
+===================================================================
+--- expect5.45.orig/example/xrlogin	2000-01-06 15:22:08.000000000 -0800
++++ expect5.45/example/xrlogin	2013-11-01 17:35:19.821318341 -0700
+@@ -1,4 +1,10 @@
+-#!/depot/path/expect --
++#!/bin/sh
++# -*- tcl -*-
++# The next line is executed by /bin/sh, but not tcl \
++exec tclsh "$0" ${1+"$@"}
++
++package require Expect
++
+ # xrlogin - rlogin but with current DISPLAY
+ #
+ # You can extend this idea to save any arbitrary information across rlogin
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
new file mode 100644
index 0000000..b649a42
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -0,0 +1,61 @@
+SUMMARY = "tool for automating interactive applications according to a script"
+DESCRIPTION = "Expect is a tool for automating interactive applications according to a script. \
+Following the script, Expect knows what can be expected from a program and what \
+the correct response should be. Expect is also useful for testing these same \
+applications. And by adding Tk, you can also wrap interactive applications in \
+X11 GUIs. An interpreted language provides branching and high-level control \
+structures to direct the dialogue. In addition, the user can take control and \
+interact directly when desired, afterward returning control to the script. \
+"
+HOMEPAGE = "http://sourceforge.net/projects/expect/"
+LICENSE="PD"
+SECTION = "devel"
+
+LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
+
+DEPENDS += "tcl"
+RDEPENDS_${PN} = "tcl"
+
+inherit autotools
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
+           file://0001-configure.in.patch \
+           file://0002-tcl.m4.patch \
+           file://01-example-shebang.patch \
+          "
+SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
+SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
+
+S = "${WORKDIR}/${BPN}${PV}"
+
+do_install_append() {
+	install -d ${D}${libdir}
+        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
+        install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV}/
+        install -m 0755 ${S}/example/*          ${D}${libdir}/expect${PV}/
+        rm ${D}${libdir}/expect${PV}/libexpect*.so
+}
+
+EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
+                 --with-tcl=${STAGING_LIBDIR} \
+                 --with-tclinclude=${STAGING_INCDIR} \
+                 --enable-shared \
+                 --enable-threads \
+                 --disable-rpath \
+                "
+EXTRA_OEMAKE_install = " 'SCRIPTS=' "
+
+FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
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
-- 
1.8.3.2


