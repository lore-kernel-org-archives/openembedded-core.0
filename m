Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U2luA-00060X-J4
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:01:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Feb 2013 08:46:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="286896224"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2013 08:46:07 -0800
Message-ID: <5111374E.1050802@linux.intel.com>
Date: Tue, 05 Feb 2013 08:46:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
Cc: =?UTF-8?B?QmrDtnJuIFN0ZW5iZQ==?=, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
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
X-List-Received-Date: Tue, 05 Feb 2013 17:02:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/05/2013 07:55 AM, Bernhard Reutner-Fischer wrote:
> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>
> This breaks core-image-sato-sdk for TCLIBC="uclibc".
>
What's the issue?  Is it fixable instead of reverting the ptest patch? I 
think this would be the wrong approach to this kind of issue as we want 
to expand the usage of ptest.

Thanks

    Sau!

> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> ---
>   .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   61 --------------------
>   meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 -
>   meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   22 -------
>   3 files changed, 86 deletions(-)
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch b/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
> deleted file mode 100644
> index cb36c09..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -Add 'ptest' target to Makefile, to run tests without checking dependencies.
> -Add 'install-ptest' target, to copy needed files to ptest dir.
> -
> -Signed-off-by: Björn Stenberg <bjst@enea.com>
> -Upstream-status: Pending
> ----
> - Makefile.decl |   43 +++++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 43 insertions(+)
> -
> ---- a/Makefile.decl	2012-03-12 01:42:39.000000000 +0100
> -+++ b/Makefile.decl	2012-11-26 13:42:08.436865192 +0100
> -@@ -25,6 +25,49 @@
> - test-nonrecursive:
> - endif
> -
> -+ptest: ptest-nonrecursive
> -+	@ for subdir in $(SUBDIRS) .; do \
> -+	    test -d "$$subdir" -a "$$subdir" != "." -a "$$subdir" != "po" && \
> -+	    ( test -d $$subdir && cd $$subdir && $(MAKE) $(AM_MAKEFLAGS) $@ ) \
> -+	  done
> -+
> -+ptest-nonrecursive:
> -+	@test -z "${TEST_PROGS}" || ${GTESTER} --keep-going --verbose ${TEST_PROGS}
> -+
> -+install-ptest: install-ptest-nonrecursive
> -+	@test -z "$(SUBDIRS)" || for subdir in $(SUBDIRS); do \
> -+	    test "$$subdir" == "." || \
> -+	    (cd $$subdir && $(MAKE) DESTDIR=$(DESTDIR)/$$subdir $@ ) \
> -+	done
> -+
> -+# install files used for ptest:
> -+# - copy EXTRA_DIST (for test data in glib/tests)
> -+# - run dist-hook (for glib/tests/bookmarks/ and glib/tests/markups)
> -+# - copy TEST_PROGS (the test programs)
> -+# - copy INSTALL_PROGS (for glib/gtester)
> -+# - avoid libtool wrappers by copying binaries from .libs
> -+# - strip Makefile: target from all Makefiles
> -+install-ptest-nonrecursive:
> -+	@mkdir -p $(DESTDIR)
> -+	@if [ -n "${TEST_PROGS}" ]; then \
> -+		if [ -n "${EXTRA_DIST}" ]; then \
> -+			cp ${EXTRA_DIST} $(DESTDIR); \
> -+		fi; \
> -+		grep -q dist-hook: Makefile && \
> -+			$(MAKE) distdir=$(DESTDIR) dist-hook; \
> -+		if [ -d .libs ] ; then \
> -+			cd .libs; \
> -+		fi; \
> -+		cp ${TEST_PROGS} $(DESTDIR); \
> -+	fi;
> -+	@if [ -n "${INSTALL_PROGS}" ]; then \
> -+		if [ -d .libs ]  ; then \
> -+			cd .libs; \
> -+		fi; \
> -+		cp ${INSTALL_PROGS} $(DESTDIR); \
> -+	fi
> -+	@test -f Makefile && sed 's/^Makefile:/_Makefile:/' <Makefile >$(DESTDIR)/Makefile
> -+
> - # test-report: run tests in subdirs and generate report
> - # perf-report: run tests in subdirs with -m perf and generate report
> - # full-report: like test-report: with -m perf and -m slow
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
> deleted file mode 100644
> index 3deb586..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -make -k ptest
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
> index e1d44e2..e4293c8 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
> @@ -13,8 +13,6 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>              file://configure-libtool.patch \
>              file://glib-2.0_fix_for_x32.patch \
>              file://obsolete_automake_macros.patch \
> -           file://Makefile-ptest.patch \
> -           file://run-ptest \
>             "
>   SRC_URI[md5sum] = "a4ca31e258273c3761e3de2edd607661"
>   SRC_URI[sha256sum] = "855fcbf87cb93065b488358e351774d8a39177281023bae58c286f41612658a7"
> @@ -22,24 +20,6 @@ SRC_URI[sha256sum] = "855fcbf87cb93065b488358e351774d8a39177281023bae58c286f4161
>   SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
>   BBCLASSEXTEND = "native nativesdk"
>
> -RDEPENDS_${PN}-ptest += "\
> -            eglibc-gconv-utf-16 \
> -            eglibc-charmap-utf-8 \
> -            eglibc-gconv-cp1255 \
> -            eglibc-charmap-cp1255 \
> -            eglibc-gconv-utf-32 \
> -            eglibc-gconv-utf-7 \
> -            eglibc-charmap-invariant \
> -            eglibc-localedata-translit-cjk-variants \
> -            tzdata \
> -            tzdata-americas \
> -            tzdata-asia \
> -            tzdata-europe \
> -            tzdata-posix \
> -            python-pygobject \
> -            python-dbus \
> -           "
> -
>   do_configure_prepend() {
>   	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
>   }
> @@ -56,6 +36,4 @@ do_install_append() {
>     if [ -f ${D}${bindir}/glib-mkenums ]; then
>       sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
>     fi
> -
> -  ptest_do_install
>   }
>


