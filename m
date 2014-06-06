Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D2DA96FC4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 18:11:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Jun 2014 11:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,990,1392192000"; d="scan'208";a="524146470"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO [10.255.12.167])
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 06 Jun 2014 11:11:04 -0700
Message-ID: <53920437.1070908@linux.intel.com>
Date: Fri, 06 Jun 2014 11:11:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Wenlin Kang <wenlin.kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1401867930-28172-1-git-send-email-wenlin.kang@windriver.com>
In-Reply-To: <1401867930-28172-1-git-send-email-wenlin.kang@windriver.com>
Subject: Re: [PATCH] bash: fix to build bash/po/ correctly
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
X-List-Received-Date: Fri, 06 Jun 2014 18:11:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/04/2014 12:45 AM, Wenlin Kang wrote:
> There was an ignored error while building bash, causing the po/
> directory not built out correctly, the log follow:
> make[1]: *** No rule to make target `/config.status',
> needed by `Makefile'. Stop.
> make: [installdirs] Error 2 (ignored)
>
> The cause is that some variable,PACKAGE and VERSION don't be defined,
> and others don't get correct value, eg, top_builddir in po/Makevar,
> GETTEXT_MACRO_VERSION and MKDIR_P in po/Makefile.in.in and so on.
>
> The patch fixed above problem.

No Signed-off-by: tag for this patch for OE-Core, I see one in the patch 
below.

The patch does not seem to apply correctly, did you verify this against 
master?

Sau!


> ---
>   .../bash/bash/fix-to-build-po-correctly.patch      |   83 ++++++++++++++++++++
>   meta/recipes-extended/bash/bash_4.3.bb             |    1 +
>   2 files changed, 84 insertions(+)
>   create mode 100644 meta/recipes-extended/bash/bash/fix-to-build-po-correctly.patch
>
> diff --git a/meta/recipes-extended/bash/bash/fix-to-build-po-correctly.patch b/meta/recipes-extended/bash/bash/fix-to-build-po-correctly.patch
> new file mode 100644
> index 0000000..9db6fe2
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash/fix-to-build-po-correctly.patch
> @@ -0,0 +1,83 @@
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +
> +diff -aurN bash-4.3-org/aclocal.m4 bash-4.3/aclocal.m4
> +--- bash-4.3-org/aclocal.m4	2014-05-23 15:28:54.252565146 +0800
> ++++ bash-4.3/aclocal.m4	2014-05-23 15:33:19.924570133 +0800
> +@@ -3710,6 +3710,14 @@
> +   AC_REQUIRE([AC_PROG_INSTALL])dnl
> +   AC_REQUIRE([AM_MKINSTALLDIRS])dnl
> +   AC_REQUIRE([AM_NLS])dnl
> ++  AC_REQUIRE([AC_PROG_MKDIR_P])dnl
> ++  AC_REQUIRE([AC_PROG_SED])dnl
> ++
> ++  AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
> ++
> ++  dnl Release version of the gettext macros. This is used to ensure that
> ++  dnl the gettext macros and po/Makefile.in.in are in sync.
> ++  AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
> +
> +   dnl Perform the following tests also if --disable-nls has been given,
> +   dnl because they are needed for "make dist" to work.
> +@@ -3723,6 +3731,22 @@
> +     :)
> +   AC_PATH_PROG(GMSGFMT, gmsgfmt, $MSGFMT)
> +
> ++ dnl Test whether it is GNU msgfmt >= 0.15.
> ++changequote(,)dnl
> ++  case `$MSGFMT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
> ++    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) MSGFMT_015=: ;;
> ++    *) MSGFMT_015=$MSGFMT ;;
> ++  esac
> ++changequote([,])dnl
> ++  AC_SUBST([MSGFMT_015])
> ++changequote(,)dnl
> ++  case `$GMSGFMT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
> ++    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) GMSGFMT_015=: ;;
> ++    *) GMSGFMT_015=$GMSGFMT ;;
> ++  esac
> ++changequote([,])dnl
> ++  AC_SUBST([GMSGFMT_015])
> ++
> +   dnl Search for GNU xgettext 0.12 or newer in the PATH.
> +   dnl The first test excludes Solaris xgettext and early GNU xgettext versions.
> +   dnl The second test excludes FreeBSD xgettext.
> +@@ -3733,6 +3757,15 @@
> +   dnl Remove leftover from FreeBSD xgettext call.
> +   rm -f messages.po
> +
> ++  dnl Test whether it is GNU xgettext >= 0.15.
> ++changequote(,)dnl
> ++  case `$XGETTEXT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
> ++    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) XGETTEXT_015=: ;;
> ++    *) XGETTEXT_015=$XGETTEXT ;;
> ++  esac
> ++changequote([,])dnl
> ++  AC_SUBST([XGETTEXT_015])
> ++
> +   dnl Search for GNU msgmerge 0.11 or newer in the PATH.
> +   AM_PATH_PROG_WITH_TEST(MSGMERGE, msgmerge,
> +     [$ac_dir/$ac_word --update -q /dev/null /dev/null >/dev/null 2>&1], :)
> +diff -aurN bash-4.3-org/configure.ac bash-4.3/configure.ac
> +--- bash-4.3-org/configure.ac	2014-05-23 15:28:54.208565145 +0800
> ++++ bash-4.3/configure.ac	2014-05-23 15:29:35.640565923 +0800
> +@@ -1201,6 +1201,10 @@
> + #AC_SUBST(ALLOCA_SOURCE)
> + #AC_SUBST(ALLOCA_OBJECT)
> +
> ++# Define the identity of the package.
> ++AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
> ++AC_SUBST([VERSION], ['AC_PACKAGE_VERSION'])dnl
> ++
> + AC_OUTPUT([Makefile builtins/Makefile lib/readline/Makefile lib/glob/Makefile \
> + 	  lib/intl/Makefile \
> + 	  lib/malloc/Makefile lib/sh/Makefile lib/termcap/Makefile \
> +diff -aurN bash-4.3-org/po/Makevars bash-4.3/po/Makevars
> +--- bash-4.3-org/po/Makevars	2014-05-23 15:28:54.204565145 +0800
> ++++ bash-4.3/po/Makevars	2014-05-23 15:30:04.772566469 +0800
> +@@ -5,7 +5,7 @@
> +
> + # These two variables depend on the location of this directory.
> + subdir = po
> +-top_builddir = $(BUILD_DIR)
> ++top_builddir = ..
> +
> + # These options get passed to xgettext.
> + XGETTEXT_OPTIONS = --keyword=_ --keyword=N_ -C
> diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
> index 25b7410..a6d7d40 100644
> --- a/meta/recipes-extended/bash/bash_4.3.bb
> +++ b/meta/recipes-extended/bash/bash_4.3.bb
> @@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
>              file://build-tests.patch \
>              file://test-output.patch \
>              file://run-ptest \
> +           file://fix-to-build-po-correctly.patch \
>              "
>
>   SRC_URI[tarball.md5sum] = "81348932d5da294953e15d4814c74dd1"
>

