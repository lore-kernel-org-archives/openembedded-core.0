Return-Path: <denis@denix.org>
X-Greylist: delayed 332 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Aug 2018 00:32:12 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B0F047923C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 00:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 62A0F20B0C;
	Thu, 16 Aug 2018 00:26:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fiz0xJSPiR4k; Thu, 16 Aug 2018 00:26:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C2DA720567;
	Thu, 16 Aug 2018 00:26:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 50D2016358D; Wed, 15 Aug 2018 20:26:36 -0400 (EDT)
Date: Wed, 15 Aug 2018 20:26:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <20180816002636.GW19965@denix.org>
References: <20180728084950.13242-1-anuj.mittal@intel.com>
	<20180728084950.13242-2-anuj.mittal@intel.com>
MIME-Version: 1.0
In-Reply-To: <20180728084950.13242-2-anuj.mittal@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH 2/2] make-mod-scripts: add build requirements for external modules
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
X-List-Received-Date: Thu, 16 Aug 2018 00:32:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 28, 2018 at 04:49:50PM +0800, Anuj Mittal wrote:
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
> 
> Newer kernels (4.14/v4.15+) have dependencies for the build of
> modules (and hence external modules). Without these dependencies
> explicitly in the build chain, you can end up with build failures like:
> 
>   work-shared/qemux86/kernel-source/scripts/extract-cert.c:21:25: fatal
>   error: openssl/bio.h: No such file or directory
>   |  #include <openssl/bio.h>
>   |                          ^
>   | compilation terminated.
>   | make[2]: *** [scripts/extract-cert] Error 1
>   | make[1]: *** [scripts] Error 2
> 
> To ensure that these headers are in place, and that the scripts use
> our build environment flags, we add a dependency on openssl-native
> and use oe_make to invoke the build.
> 
> Older kernels have no issues with the extra dependency, so there's no
> need to make this conditional.
> 
> (From OE-Core rev: 916cb2029d3c97bf12ebf03832b9ba980451dbcf)
> 
> Fixes [YOCTO #12860]
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> [Tweaked to have changes in module*.bbclass instead from where
> make-mod-scripts was split in sumo]
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/classes/module-base.bbclass | 5 ++++-
>  meta/classes/module.bbclass      | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index 64729770c7..9f3465eb9d 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -12,6 +12,9 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>  # we didn't pick the name.
>  export KBUILD_OUTPUT = "${STAGING_KERNEL_BUILDDIR}"
>  
> +DEPENDS += "bc-native"
> +EXTRA_OEMAKE += " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> +
>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
>  KERNEL_OBJECT_SUFFIX = ".ko"
>  
> @@ -22,6 +25,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  # be called before do_compile. See module.bbclass for an example.
>  do_make_scripts() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
> -	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>  	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts prepare

This now breaks out-of-tree kernel modules that provide own non-standard 
Makefiles with something like "-f build.mak" added to EXTRA_OEMAKE.

That is because do_make_scripts() gets executed inside kernel-source directory 
(-C ${STAGING_KERNEL_DIR} above) and supposed to use kernel's Makefile, while 
do_compile()/do_install() are executed within module's sources and use 
whatever Makefile it provides. That is why it historically was using "make" 
here and not "oe_runmake".

When Bruce separated this code into make-mod-scripts, it was possible to also 
use oe_runmake there, as it now had own context. But the backport to rocko 
moved it back into module-base.bbclass and it gets executed within module's 
environment, including custom EXTRA_OEMAKE, which often breaks (i.e. few of my 
modules are now broken).

Should this backport only touch DEPENDS and do_make_scripts[depends], as the 
changelog claims, and leave make/oe_runmake and EXTRA_OEMAKE alone?


>  }
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 78d1b21dbd..282900dc6d 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -2,7 +2,7 @@ inherit module-base kernel-module-split pkgconfig
>  
>  addtask make_scripts after do_prepare_recipe_sysroot before do_configure
>  do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
> -do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
> +do_make_scripts[depends] += "virtual/kernel:do_shared_workdir openssl-native:do_populate_sysroot"
>  
>  EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
>  
> -- 
> 2.17.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

