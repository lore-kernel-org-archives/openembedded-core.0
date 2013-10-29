Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 726ED6D37D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 14:54:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2013 07:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426505759"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 07:54:55 -0700
Message-ID: <526FCC3F.9020005@linux.intel.com>
Date: Tue, 29 Oct 2013 07:54:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Mihaela Sendrea <mihaela.sendrea@enea.com>, 
	openembedded-core@lists.openembedded.org
References: <1378714602-54741-1-git-send-email-mihaela.sendrea@enea.com>
	<1378714602-54741-2-git-send-email-mihaela.sendrea@enea.com>
In-Reply-To: <1378714602-54741-2-git-send-email-mihaela.sendrea@enea.com>
Subject: Re: [PATCH v2 2/3] expect: Add recipe
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
X-List-Received-Date: Tue, 29 Oct 2013 14:54:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2013 01:16 AM, Mihaela Sendrea wrote:
> Nedeed for gcc-runtime tests.
>
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>   .../expect/expect/0001-configure.in.patch          |  108 ++++++++++++++++++++
>   .../expect/expect/0002-tcl.m4.patch                |   17 +++
>   meta/recipes-devtools/expect/expect_5.45.bb        |   53 ++++++++++
>   3 files changed, 178 insertions(+)
>   create mode 100644 meta/recipes-devtools/expect/expect/0001-configure.in.patch
>   create mode 100644 meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
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
> diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
> new file mode 100644
> index 0000000..d7c0772
> --- /dev/null
> +++ b/meta/recipes-devtools/expect/expect_5.45.bb
> @@ -0,0 +1,53 @@
> +DESCRIPTION = "expect."
> +HOMEPAGE = " http://expect.nist.gov"
> +LICENSE="GPLv3+"
> +SECTION = "devel"
> +
> +LIC_FILES_CHKSUM = "file://README;md5=2862a5993e5f43b368a49cfaad5bead6"
> +PR = "r1"
You should not need this PR in this recipe or dejagnu. Please submit a 
v3 with the PR removed from both recipes.

> +DEPENDS = "tcl"
> +RDEPENDS_${PN} = "tcl"
> +ALLOW_EMPTY_${PN} = "1"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/expect:"
> +
Why is this needed?  This is the default it should just work.
Please remove it and resubmit.

Thanks	
	Sau!


> +S = "${WORKDIR}/${BPN}${PV}"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/5.45/expect5.45.tar.gz \
> +           file://0001-configure.in.patch \
> +           file://0002-tcl.m4.patch \
> +          "
> +EXTRA_OECONF += "--includedir=${STAGING_INCDIR} \
> +                 --with-tcl=${STAGING_LIBDIR} \
> +                 --with-tclinclude=${STAGING_INCDIR} \
> +                 --enable-shared \
> +                 --enable-threads \
> +                 --disable-rpath \
> +                "
> +EXTRA_OEMAKE_install = " 'SCRIPTS=' "
> +FILES_${PN}-dbg += "${libdir}/expect5.45/.debug \
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
> +do_install_append() {
> +        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
> +        install -m 0755 ${S}/fixline1           ${D}${libdir_native}/expect${PV}/
> +        install -m 0755 ${S}/example/*          ${D}${libdir_native}/expect${PV}/
> +        rm ${D}${libdir}/expect${PV}/libexpect*.so
> +}
> +
> +SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
> +SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
>

