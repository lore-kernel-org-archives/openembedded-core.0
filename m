Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 26FFA7423D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 14:49:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jan 2016 06:49:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,344,1449561600"; d="scan'208";a="888800908"
Received: from unknown (HELO [10.219.16.227]) ([10.219.16.227])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2016 06:49:15 -0800
To: openembedded-core@lists.openembedded.org
References: <1446210513-16152-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD280119A934F7@EU-MBX-02.mgc.mentorg.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <56A63611.8050505@linux.intel.com>
Date: Mon, 25 Jan 2016 08:49:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD280119A934F7@EU-MBX-02.mgc.mentorg.com>
Subject: Re: [RFC][PATCH] python: ensure usage of host modules while cross compiling
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
X-List-Received-Date: Mon, 25 Jan 2016 14:49:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ping

This has been here for a while now, if it doesnt apply let me know and I 
will rebase this, this fixes bug 8671.

On 11/02/2015 02:08 AM, Belal, Awais wrote:
> Ping!
>
> BR,
> Awais
>
> ________________________________________
> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-bounces@lists.openembedded.org] on behalf of Belal, Awais
> Sent: Friday, October 30, 2015 6:08 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [RFC][PATCH] python: ensure usage of host modules while      cross compiling
>
> The issue is generally seen on x86 type of machines passing
> -march=bdverX (X=3,4 etc) flags but in general this should
> cause a problem when freshly built target modules are tried
> for an import during the cross build process.
> Aiding the PYTHONPATH with CROSSPYTHONPATH which contains
> the native modules resolves the issue.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>   ...e-of-native-modules-while-cross-compiling.patch | 31 ++++++++++++++++++++++
>   meta/recipes-devtools/python/python_2.7.9.bb       |  1 +
>   2 files changed, 32 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python/0001-ensure-usage-of-native-modules-while-cross-compiling.patch
>
> diff --git a/meta/recipes-devtools/python/python/0001-ensure-usage-of-native-modules-while-cross-compiling.patch b/meta/recipes-devtools/python/python/0001-ensure-usage-of-native-modules-while-cross-compiling.patch
> new file mode 100644
> index 0000000..1e87e89
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/0001-ensure-usage-of-native-modules-while-cross-compiling.patch
> @@ -0,0 +1,31 @@
> +From 4eb30173f2d254f19d5ef18fabed3bdb2e5c1182 Mon Sep 17 00:00:00 2001
> +From: Awais Belal <awais_belal@mentor.com>
> +Date: Fri, 30 Oct 2015 17:47:07 +0500
> +Subject: [PATCH] ensure usage of native modules while cross compiling
> +
> +The PYTHONPATH variable augments the default search path and
> +is prepended to it. We need to make sure that host modules
> +are used while cross compiling otherwise an illegal instruction
> +error is generated if the modules built for target are imported.
> +
> +Signed-off-by: Awais Belal <awais_belal@mentor.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 87a4f02..fa9e0dd 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -33,7 +33,7 @@ if test "$cross_compiling" = yes; then
> +           AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
> +       fi
> +         AC_MSG_RESULT($interp)
> +-      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
> ++      PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH):$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
> +     fi
> + elif test "$cross_compiling" = maybe; then
> +     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
> index f7e2f27..9a43cf7 100644
> --- a/meta/recipes-devtools/python/python_2.7.9.bb
> +++ b/meta/recipes-devtools/python/python_2.7.9.bb
> @@ -26,6 +26,7 @@ SRC_URI += "\
>     file://parallel-makeinst-create-bindir.patch \
>     file://use_sysroot_ncurses_instead_of_host.patch \
>     file://avoid_parallel_make_races_on_pgen.patch \
> +  file://0001-ensure-usage-of-native-modules-while-cross-compiling.patch \
>   "
>
>   S = "${WORKDIR}/Python-${PV}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


