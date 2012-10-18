Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwTy-0005Kc-Ra
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:14:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Oct 2012 13:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,608,1344236400"; d="scan'208";a="207809750"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by orsmga001.jf.intel.com with ESMTP; 18 Oct 2012 13:00:57 -0700
Message-ID: <50805FF9.7050606@linux.intel.com>
Date: Thu, 18 Oct 2012 13:00:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348574105.31293.69.camel@phil-desktop>
In-Reply-To: <1348574105.31293.69.camel@phil-desktop>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module.bbclass: Move do_make_scripts() to module-base
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
X-List-Received-Date: Thu, 18 Oct 2012 20:14:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 04:55 AM, Phil Blundell wrote:
> It's sometimes useful to have this function available to recipes which
> don't wish to use module.bbclass for whatever reason.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/classes/module-base.bbclass |   11 +++++++++++
>   meta/classes/module.bbclass      |   11 -----------
>   2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index 9379bf8..210c47c 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -26,3 +26,14 @@ KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
>
>   # kernel modules are generally machine specific
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +#
> +# Ensure the hostprogs are available for module compilation. Modules that
> +# inherit this recipe and override do_compile() should be sure to call
> +# do_make_scripts() or ensure the scripts are built independently.
> +#
> +do_make_scripts() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +	           -C ${STAGING_KERNEL_DIR} scripts
> +}
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 91628e4..c721202 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -3,17 +3,6 @@ DEPENDS += "virtual/kernel"
>
>   inherit module-base
>
> -#
> -# Ensure the hostprogs are available for module compilation. Modules that
> -# inherit this recipe and override do_compile() should be sure to call
> -# do_make_scripts() or ensure the scripts are built independently.
> -#
> -do_make_scripts() {
> -	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -	oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> -	           -C ${STAGING_KERNEL_DIR} scripts
> -}
> -
>   addtask make_scripts before do_compile
>   do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>   do_make_scripts[deptask] = "do_populate_sysroot"
>

Merged into OE-Core

Thanks
	Sau!



