Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D71B56D5AE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2013 18:24:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Nov 2013 11:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,623,1378882800"; d="scan'208";a="426942074"
Received: from unknown (HELO [10.255.15.48]) ([10.255.15.48])
	by fmsmga002.fm.intel.com with ESMTP; 02 Nov 2013 11:24:14 -0700
Message-ID: <527542CF.5040909@linux.intel.com>
Date: Sat, 02 Nov 2013 11:22:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	Mihaela Sendrea <mihaela.sendrea@enea.com>
References: <1383358116-997-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1383358116-997-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH V3] expect: Add recipe
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
X-List-Received-Date: Sat, 02 Nov 2013 18:24:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


The recipe itself needs some work.

See below

Sau!


On 11/01/2013 07:08 PM, Khem Raj wrote:
> From: Mihaela Sendrea <mihaela.sendrea@enea.com>
>
> Nedeed for gcc-runtime tests.
>
> Fixed build on multilib and add patch to remove
> !/depot/path/expect -f
> which caused rpm to puke on rfs generation
>
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> Signed-off-by: Khem Raj <kraj@juniper.net>
> ---
>   .../expect/expect/0001-configure.in.patch          | 108 ++++++++++++++++
>   .../expect/expect/0002-tcl.m4.patch                |  17 +++
>   .../expect/expect/01-example-shebang.patch         | 144 +++++++++++++++++++++
>   meta/recipes-devtools/expect/expect_5.45.bb        |  52 ++++++++
>   4 files changed, 321 insertions(+)
>   create mode 100644 meta/recipes-devtools/expect/expect/0001-configure.in.patch
>   create mode 100644 meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
>   create mode 100644 meta/recipes-devtools/expect/expect/01-example-shebang.patch
>   create mode 100644 meta/recipes-devtools/expect/expect_5.45.bb
>
> diff --git a/meta/recipes-devtools/expect/expect/0001-configure.in.patch b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
> new file mode 100644
> index 0000000..7595a25
> --- /dev/null
> +++ b/meta/recipes-devtools/expect/expect/0001-configure.in.patch
> @@ -0,0 +1,108 @@
> +Allow cross compiling.
> +
> +Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> +Upstream-Status: Pending
> +---
> +diff -uNr a/configure.in b/configure.in
> +--- a/configure.in	2012-12-14 15:31:32.623180450 +0100
> ++++ b/configure.in	2012-12-14 15:53:34.518233519 +0100
> +@@ -481,7 +481,7 @@
> + ,
> + 	AC_MSG_RESULT(no)
> + ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++	AC_MSG_RESULT(no)
> + )
> +
> + AC_MSG_CHECKING([if any value exists for WNOHANG])
> +@@ -506,7 +506,9 @@
> + 	AC_MSG_RESULT(no)
> + 	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
> + ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++	AC_MSG_RESULT(yes)
> ++	AC_DEFINE_UNQUOTED(WNOHANG_BACKUP_VALUE, `cat wnohang`)
> ++	rm -f wnohang
> + )
> +
> + #
> +@@ -574,7 +576,8 @@
> + 	AC_DEFINE(REARM_SIG)
> + ,
> + 	AC_MSG_RESULT(no)
> +-, AC_MSG_WARN([Expect can't be cross compiled])
> ++,
> ++	AC_MSG_RESULT(no)
> + )
> +
> + # HPUX7 has trouble with the big cat so split it
> +@@ -725,7 +728,9 @@
> + ,
> +         AC_MSG_RESULT(no)
> + ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++        AC_MSG_RESULT(yes)
> ++        AC_DEFINE(HAVE_SGTTYB)
> ++        PTY_TYPE=sgttyb
> + )
> +
> + # mach systems have include files for unimplemented features
> +@@ -749,7 +754,9 @@
> + ,
> +         AC_MSG_RESULT(no)
> + ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++        AC_DEFINE(HAVE_TERMIO)
> ++        PTY_TYPE=termios
> ++        AC_MSG_RESULT(yes)
> + )
> +
> +   # now check for the new style ttys (not yet posix)
> +@@ -771,7 +778,9 @@
> +   ,
> +         AC_MSG_RESULT(no)
> +   ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++        AC_DEFINE(HAVE_TERMIOS)
> ++        PTY_TYPE=termios
> ++        AC_MSG_RESULT(yes)
> +   )
> + fi
> +
> +@@ -794,7 +803,7 @@
> + ,
> + 	AC_MSG_RESULT(no)
> + ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++	AC_MSG_RESULT(no)
> + )
> +
> + AC_MSG_CHECKING([if TIOCGWINSZ in termios.h])
> +@@ -816,7 +825,7 @@
> + ,
> + 	AC_MSG_RESULT(no)
> + ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++	AC_MSG_RESULT(no)
> + )
> +
> + # finally check for Cray style ttys
> +@@ -837,7 +846,7 @@
> + ,
> + 	AC_MSG_RESULT(no)
> + ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++	AC_MSG_RESULT(no)
> + )
> +
> + #
> +@@ -889,7 +898,8 @@
> + 	AC_MSG_RESULT(yes),
> + 	AC_MSG_RESULT(no)
> + ,
> +-	AC_MSG_ERROR([Expect can't be cross compiled])
> ++	AC_DEFINE(HAVE_SV_TIMEZONE)
> ++	AC_MSG_RESULT(yes),
> + )
> +
> +
> diff --git a/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
> new file mode 100644
> index 0000000..dc4c6ba
> --- /dev/null
> +++ b/meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
> @@ -0,0 +1,17 @@
> +Use proper -L path when cross compiling.
> +
> +Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> +Upstream-Status: Pending
> +---
> +diff -uNr a/tclconfig/tcl.m4 b/tclconfig/tcl.m4
> +--- a/tclconfig/tcl.m4	2012-12-14 09:16:58.789861281 +0100
> ++++ b/tclconfig/tcl.m4	2012-12-14 10:55:43.542297010 +0100
> +@@ -371,7 +371,7 @@
> +     # of TCL_BUILD_LIB_SPEC. An extension should make use of TCL_LIB_SPEC
> +     # instead of TCL_BUILD_LIB_SPEC since it will work with both an
> +     # installed and uninstalled version of Tcl.
> +-    if test -f "${TCL_BIN_DIR}/Makefile" ; then
> ++    if test -f "${TCL_BIN_DIR}/Makefile" || test "$cross_compiling" = yes; then
> +         TCL_LIB_SPEC="${TCL_BUILD_LIB_SPEC}"
> +         TCL_STUB_LIB_SPEC="${TCL_BUILD_STUB_LIB_SPEC}"
> +         TCL_STUB_LIB_PATH="${TCL_BUILD_STUB_LIB_PATH}"
> diff --git a/meta/recipes-devtools/expect/expect/01-example-shebang.patch b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
> new file mode 100644
> index 0000000..8597f31
> --- /dev/null
> +++ b/meta/recipes-devtools/expect/expect/01-example-shebang.patch
> @@ -0,0 +1,144 @@
> +Author: Mike Markley <mike@markley.org>
> +Author: Sergei Golovan <sgolovan@debian.org>
> +Description: Fixes shebangs in examples (Closes: #152367).
> +
> +Backported from Debian
> +
> +Upstream-Status: Pending
> +Index: expect5.45/example/beer.exp
> +===================================================================
> +--- expect5.45.orig/example/beer.exp	2006-01-25 13:51:39.000000000 -0800
> ++++ expect5.45/example/beer.exp	2013-11-01 17:35:19.817318341 -0700
> +@@ -1,4 +1,9 @@
> +-#!/depot/path/expect -f
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec tclsh "$0" ${1+"$@"}
> ++
> ++package require Expect
> +
> + # 99 bottles of beer on the wall, Expect-style
> + # Author: Don Libes <libes@nist.gov>
> +Index: expect5.45/example/expectd.proto
> +===================================================================
> +--- expect5.45.orig/example/expectd.proto	2010-07-02 09:03:31.000000000 -0700
> ++++ expect5.45/example/expectd.proto	2013-11-01 17:35:19.821318341 -0700
> +@@ -1,4 +1,10 @@
> +-#!/depot/tcl/src/expect/e --
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec tclsh "$0" ${1+"$@"}
> ++
> ++package require Expect
> ++
> + # Description: Simple fragment to begin a telnet daemon
> + # For more information, see Chapter 17 of "Exploring Expect"
> + # Author: Don Libes, NIST
> +Index: expect5.45/example/irsh
> +===================================================================
> +--- expect5.45.orig/example/irsh	2010-07-02 09:03:31.000000000 -0700
> ++++ expect5.45/example/irsh	2013-11-01 17:35:19.821318341 -0700
> +@@ -1,4 +1,9 @@
> +-#!/depot/path/expect --
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec tclsh "$0" ${1+"$@"}
> ++
> ++package require Expect
> +
> + # Do rsh interactively.  For example, consider the following command:
> + #    rsh <remote> ls -l "|" more
> +Index: expect5.45/example/passwd.cgi
> +===================================================================
> +--- expect5.45.orig/example/passwd.cgi	2000-01-06 15:22:07.000000000 -0800
> ++++ expect5.45/example/passwd.cgi	2013-11-01 17:35:19.821318341 -0700
> +@@ -1,4 +1,9 @@
> +-#!/depot/path/expect --
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec tclsh "$0" ${1+"$@"}
> ++
> ++package require Expect
> +
> + # This is a CGI script to process requests created by the accompanying
> + # passwd.html form.  This script is pretty basic, although it is
> +Index: expect5.45/example/passwdprompt
> +===================================================================
> +--- expect5.45.orig/example/passwdprompt	2003-09-05 12:01:59.000000000 -0700
> ++++ expect5.45/example/passwdprompt	2013-11-01 17:35:19.821318341 -0700
> +@@ -1,4 +1,9 @@
> +-#!/depot/path/expect
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec tclsh "$0" ${1+"$@"}
> ++
> ++package require Expect
> +
> + # This script prompts for a passwd from stdin while echoing *'s
> +
> +Index: expect5.45/example/reprompt
> +===================================================================
> +--- expect5.45.orig/example/reprompt	2000-01-06 15:22:07.000000000 -0800
> ++++ expect5.45/example/reprompt	2013-11-01 17:35:19.821318341 -0700
> +@@ -1,4 +1,9 @@
> +-#!/depot/path/expect --
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec tclsh "$0" ${1+"$@"}
> ++
> ++package require Expect
> +
> + # Name: reprompt
> + # Description: reprompt every so often until user enters something
> +Index: expect5.45/example/term_expect
> +===================================================================
> +--- expect5.45.orig/example/term_expect	2005-02-15 10:11:31.000000000 -0800
> ++++ expect5.45/example/term_expect	2013-11-01 17:35:19.821318341 -0700
> +@@ -1,4 +1,9 @@
> +-#!/depot/path/expectk
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec wish "$0" ${1+"$@"}
> ++
> ++package require Expect
> +
> + # Name: tkterm - terminal emulator using Expect and Tk text widget, v3.0
> + # Author: Don Libes, July '94
> +Index: expect5.45/example/vrfy
> +===================================================================
> +--- expect5.45.orig/example/vrfy	2010-07-02 09:03:31.000000000 -0700
> ++++ expect5.45/example/vrfy	2013-11-01 17:35:19.821318341 -0700
> +@@ -1,4 +1,9 @@
> +-#!/depot/path/expect -f
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec tclsh "$0" ${1+"$@"}
> ++
> ++package require Expect
> +
> +
> + # separate address into user and host
> +Index: expect5.45/example/xrlogin
> +===================================================================
> +--- expect5.45.orig/example/xrlogin	2000-01-06 15:22:08.000000000 -0800
> ++++ expect5.45/example/xrlogin	2013-11-01 17:35:19.821318341 -0700
> +@@ -1,4 +1,10 @@
> +-#!/depot/path/expect --
> ++#!/bin/sh
> ++# -*- tcl -*-
> ++# The next line is executed by /bin/sh, but not tcl \
> ++exec tclsh "$0" ${1+"$@"}
> ++
> ++package require Expect
> ++
> + # xrlogin - rlogin but with current DISPLAY
> + #
> + # You can extend this idea to save any arbitrary information across rlogin
> diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
> new file mode 100644
> index 0000000..bfb8200
> --- /dev/null
> +++ b/meta/recipes-devtools/expect/expect_5.45.bb
> @@ -0,0 +1,52 @@
> +DESCRIPTION = "expect."

This needs a better full descption about what expect is, it would be 
nice to also have a short (less than 80 chars) SUMMARY.

> +HOMEPAGE = " http://expect.nist.gov"
> +LICENSE="GPLv3+"
> +SECTION = "devel"
> +
> +LIC_FILES_CHKSUM = "file://README;md5=2862a5993e5f43b368a49cfaad5bead6"
> +DEPENDS = "tcl"
> +RDEPENDS_${PN} = "tcl"
You don't need an RDEPENDS_${PN} if it matches with the DEPENDS

> +ALLOW_EMPTY_${PN} = "1"
This should not be needed and if it is needed, it should co-exist with 
the FILES_${PN} entry below

> +
> +S = "${WORKDIR}/${BPN}${PV}"
> +
Setting of S normally is after the SRC_URI and SRC_URI[*] checksum 
entries (which should move up here from below)

> +SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
> +           file://0001-configure.in.patch \
> +           file://0002-tcl.m4.patch \
> +           file://01-example-shebang.patch \
> +          "
> +EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
> +                 --with-tcl=${STAGING_LIBDIR} \
> +                 --with-tclinclude=${STAGING_INCDIR} \
> +                 --enable-shared \
> +                 --enable-threads \
> +                 --disable-rpath \
> +                "
> +EXTRA_OEMAKE_install = " 'SCRIPTS=' "
> +FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
> +                    ${libdir}/.debug \
> +                   "
> +FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
> +                   ${STAGING_INCDIR}/expect.h \
> +                   ${STAGING_INCDIR}/expect_tcl.h \
> +                   ${STAGING_INCDIR}/expect_comm.h \
> +                   ${STAGING_INCDIR}/tcldbg.h \
> +                   ${includedir}/*.h \
> +                  "
> +
> +FILES_${PN} += "${libdir}/libexpect${PV}.so \
> +                ${libdir}/expect${PV}/* \
> +               "
> +
> +inherit autotools
> +
Should move up to after the DEPENDS line before SRC_URI

> +do_install_append() {
> +	install -d ${D}${libdir}
> +        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
> +        install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV}/
> +        install -m 0755 ${S}/example/*          ${D}${libdir}/expect${PV}/
> +        rm ${D}${libdir}/expect${PV}/libexpect*.so
> +}
> +
Should move up after the S line before the packaging information

> +SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
> +SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
>
Already noted that this should move up to between SRC_URI and S


The ordering of the metadata is not standard, normally the ordering is 
such that it follows the process and tasks that bitbake does to fetch, 
patch, configure, compile, install, package.

Thanks
	Sau!


