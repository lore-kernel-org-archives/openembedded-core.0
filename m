Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 55DD06B22D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 22:51:57 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Jul 2013 15:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,697,1367996400"; d="scan'208";a="270312854"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jul 2013 15:51:56 -0700
Message-ID: <51E8718C.70104@linux.intel.com>
Date: Thu, 18 Jul 2013 15:51:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Tudor Florea <tudor.florea@enea.com>
References: <1374105371-28913-1-git-send-email-tudor.florea@enea.com>
In-Reply-To: <1374105371-28913-1-git-send-email-tudor.florea@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kmod: add ptest
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
X-List-Received-Date: Thu, 18 Jul 2013 22:51:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2013 04:56 PM, Tudor Florea wrote:
> Install kmod test suite and run it as ptest.
>
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
>   meta/recipes-kernel/kmod/kmod.inc         |    4 +++-
>   meta/recipes-kernel/kmod/kmod/ptest.patch |   20 ++++++++++++++++++++
>   meta/recipes-kernel/kmod/kmod/run-ptest   |    5 +++++
>   meta/recipes-kernel/kmod/kmod_git.bb      |    9 +++++++++
>   4 files changed, 37 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch
>   create mode 100755 meta/recipes-kernel/kmod/kmod/run-ptest
>
> diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
> index 3cd963f..a780b6c 100644
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -15,11 +15,13 @@ DEPENDS += "pkgconfig-native"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                       file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                      "
> -inherit autotools gtk-doc
> +inherit autotools gtk-doc ptest
>
>   SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
>              file://depmod-search.conf \
>              file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
> +           file://run-ptest \
> +           file://ptest.patch \
>             "
>
>   SRCREV = "62081c0f68905b22f375156d4532fd37fa5c8d33"
> diff --git a/meta/recipes-kernel/kmod/kmod/ptest.patch b/meta/recipes-kernel/kmod/kmod/ptest.patch
> new file mode 100644
> index 0000000..8f3355f
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod/ptest.patch

This patch needs a header with Upstream-Status: and Signed-off-by:

Sau!

> @@ -0,0 +1,20 @@
> +diff -ruN a/Makefile.am b/Makefile.am
> +--- a/Makefile.am	2013-07-12 17:11:05.278331557 +0200
> ++++ b/Makefile.am	2013-07-12 17:14:27.033788016 +0200
> +@@ -204,6 +204,16 @@
> +
> + distclean-local: $(DISTCLEAN_LOCAL_HOOKS)
> +
> ++install-ptest:
> ++	@$(MKDIR_P) $(DESTDIR)/testsuite
> ++	@for file in $(TESTSUITE); do \
> ++		install $$file $(DESTDIR)/testsuite; \
> ++	done;
> ++	@cp Makefile $(DESTDIR)
> ++	@sed -i 's/^Makefile/_Makefile/'  ${DESTDIR}/Makefile
> ++	@tar -czf $(DESTDIR)/tools.tgz $(noinst_SCRIPTS) $(noinst_PROGRAMS)
> ++	@tar -C testsuite -czf $(DESTDIR)/testsuite.tgz rootfs-pristine .libs
> ++
> + # ------------------------------------------------------------------------------
> + # custom release helpers
> + # ------------------------------------------------------------------------------
> diff --git a/meta/recipes-kernel/kmod/kmod/run-ptest b/meta/recipes-kernel/kmod/kmod/run-ptest
> new file mode 100755
> index 0000000..fac24fd
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +tar -xzf tools.tgz
> +tar -C testsuite -xzf testsuite.tgz
> +make rootfs
> +make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
> index ca6b004..cb7a131 100644
> --- a/meta/recipes-kernel/kmod/kmod_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -36,6 +36,15 @@ do_install_append () {
>           install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
>   }
>
> +do_compile_prepend() {
> +            sed -i 's/ac_pwd=/#ac_pwd=/' config.status ; sed -i "/#ac_pwd=/a\ac_pwd='.'" config.status
> +}
> +
> +do_compile_ptest () {
> +        oe_runmake buildtest-TESTS
> +        oe_runmake rootfs
> +}
> +
>   inherit update-alternatives
>
>   ALTERNATIVE_PRIORITY = "60"
>

