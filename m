Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6215B6028B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 15:07:00 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jul 2013 08:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,736,1367996400"; d="scan'208";a="272604316"
Received: from unknown (HELO [10.255.14.43]) ([10.255.14.43])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jul 2013 08:06:59 -0700
Message-ID: <51EFED93.7080109@linux.intel.com>
Date: Wed, 24 Jul 2013 08:06:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Gabriel Barbu <gabriel.barbu@enea.com>
References: <1374667573-31160-1-git-send-email-gabriel.barbu@enea.com>
In-Reply-To: <1374667573-31160-1-git-send-email-gabriel.barbu@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] strace: Add ptest
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
X-List-Received-Date: Wed, 24 Jul 2013 15:07:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2013 05:06 AM, Gabriel Barbu wrote:
> Install strace test suite and run it as ptest.
>
> Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
> ---
>   .../strace/strace-4.8/Makefile-ptest.patch         |   23 ++++++++++++++++++++
>   meta/recipes-devtools/strace/strace-4.8/run-ptest  |    2 ++
>   meta/recipes-devtools/strace/strace_4.8.bb         |   19 ++++++++++++++--
>   3 files changed, 42 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
>   create mode 100755 meta/recipes-devtools/strace/strace-4.8/run-ptest
>
> diff --git a/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
> new file mode 100644
> index 0000000..9cd491b
> --- /dev/null

Please add an Upstream-Status and Signed-off-by per the OE-Core patch 
guidelines.

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

I have had to ask this of the recent ptest, maybe your team can do an 
internal review before sending these patches to the list.

Thanks
  	 Sau!

> +++ b/meta/recipes-devtools/strace/strace-4.8/Makefile-ptest.patch
> @@ -0,0 +1,23 @@
> +--- old/tests/Makefile.am	2013-07-23 13:44:24.660481381 +0200
> ++++ new/tests/Makefile.am	2013-07-23 16:22:42.937654391 +0200
> +@@ -9,3 +9,20 @@
> + EXTRA_DIST = init.sh $(TESTS)
> +
> + CLEANFILES = check.log
> ++
> ++buildtest-TESTS: $(check_PROGRAMS) $(TESTS)
> ++
> ++install-ptest:
> ++	install $(BUILDDIR)/strace $(DESTDIR)
> ++	install "$(srcdir)/.."/strace-log-merge $(DESTDIR)
> ++	install -d $(DESTDIR)/$(TESTDIR)
> ++	cp $(BUILDDIR)/$(TESTDIR)/Makefile $(DESTDIR)/$(TESTDIR)
> ++	sed -i -e 's/^Makefile:/_Makefile:/' $(DESTDIR)/$(TESTDIR)/Makefile
> ++	for file in $(check_PROGRAMS); do \
> ++		install $(BUILDDIR)/$(TESTDIR)/$$file $(DESTDIR)/$(TESTDIR); \
> ++	done
> ++	for file in $(EXTRA_DIST); do \
> ++		install $(srcdir)/$$file $(DESTDIR)/$(TESTDIR); \
> ++		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
> ++	done
> ++	sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/net
> diff --git a/meta/recipes-devtools/strace/strace-4.8/run-ptest b/meta/recipes-devtools/strace/strace-4.8/run-ptest
> new file mode 100755
> index 0000000..133cf92
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace-4.8/run-ptest
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +make -C tests -k runtest-TESTS
> diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
> index 0f4d2f0..79a4ad7 100644
> --- a/meta/recipes-devtools/strace/strace_4.8.bb
> +++ b/meta/recipes-devtools/strace/strace_4.8.bb
> @@ -7,11 +7,16 @@ PR = "r0"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>              file://git-version-gen \
> -           file://strace-add-configure-options.patch"
> +           file://strace-add-configure-options.patch \
> +           file://Makefile-ptest.patch \
> +           file://run-ptest \
> +          "
>
>   SRC_URI[md5sum] = "c575ef43829586801f514fd91bfe7575"
>   SRC_URI[sha256sum] = "f492291f07a7c805c07a8395cce1ea054a6401ad414f4cc12185672215e1d7f8"
> -inherit autotools
> +
> +inherit autotools ptest
> +RDEPENDS_${PN}-ptest += "make"
>
>   PACKAGECONFIG_class-target ?= "libaio"
>   PACKAGECONFIG_class-target += "${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
> @@ -21,6 +26,8 @@ PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
>
>   export INCLUDES = "-I. -I./linux"
>
> +TESTDIR = "tests"
> +
>   do_configure_prepend() {
>   	cp ${WORKDIR}/git-version-gen ${S}
>   }
> @@ -30,4 +37,12 @@ do_install_append() {
>   	rm ${D}${bindir}/strace-graph
>   }
>
> +do_compile_ptest() {
> +	oe_runmake -C ${TESTDIR} buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
> +}
> +
>   BBCLASSEXTEND = "native"
>

