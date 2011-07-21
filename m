Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qjxiz-0004AE-Tl
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 20:11:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2011 11:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,242,1309762800"; d="scan'208";a="28640765"
Received: from doubt.jf.intel.com (HELO [10.7.199.53]) ([10.7.199.53])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2011 11:07:45 -0700
Message-ID: <4E286B0C.1030902@linux.intel.com>
Date: Thu, 21 Jul 2011 11:08:12 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1311267679.git.bruce.ashfield@windriver.com>
	<069e9d973b31c8938d43e7c36f17d3d51ba90c18.1311267679.git.bruce.ashfield@windriver.com>
In-Reply-To: <069e9d973b31c8938d43e7c36f17d3d51ba90c18.1311267679.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 2/4] kernel: copy defconfig to {B} vs {S}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 18:11:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/21/2011 10:16 AM, Bruce Ashfield wrote:
> For kernel's that use a split source/object build the copy
> of defconfig to {S} in the base kernel class is problematic.
> The previous solution for this was to override the do_configure
> of the base kernel class in a subclass. While this is still
> a viable/valid option, it does mean that changes to the base
> do_configure will be missed.
> 
> The solution to this is to copy a defconfig to {B} which is
> typically the same as {S}, so most kernel recipes won't see or
> care about this change.
> 
> With this change in place, linux-yocto.bbclass can drop its
> override of do_configure.
> 
> Tested with linux-yocto and oe linux recipes.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/classes/kernel-yocto.bbclass |    6 ------
>  meta/classes/kernel.bbclass       |    4 ++--
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 98272fc..a374df1 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -118,12 +118,6 @@ python do_kernel_configcheck() {
>      bb.plain( "%s" % result )
>  }
>  
> -# overrides the base kernel_do_configure, since we don't want all the
> -# defconfig processing in there
> -kernel_do_configure() {
> -        yes '' | oe_runmake oldconfig
> -}
> -
>  
>  # Ensure that the branches (BSP and meta) are on the locatios specified by
>  # their SRCREV values. If they are NOT on the right commits, the branches
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 2e36e86..9c492a3 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -181,8 +181,8 @@ sysroot_stage_all_append() {
>  kernel_do_configure() {
>  	# Copy defconfig to .config if .config does not exist. This allows
>  	# recipes to manage the .config themselves in do_configure_prepend().
> -	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${S}/.config" ]; then
> -		cp "${WORKDIR}/defconfig" "${S}/.config"
> +	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
> +		cp "${WORKDIR}/defconfig" "${B}/.config"
>  	fi
>  	yes '' | oe_runmake oldconfig
>  

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


