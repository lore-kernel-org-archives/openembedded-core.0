Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UXcfB-0003Vb-Oq
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 21:26:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2013 12:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,590,1363158000"; d="scan'208";a="306358384"
Received: from envy2.jf.intel.com (HELO envy2.home) ([10.7.199.54])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2013 12:08:07 -0700
Message-ID: <51816817.7080101@linux.intel.com>
Date: Wed, 01 May 2013 12:08:07 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1367244122.14512.124.camel@phil-desktop.brightsign>
In-Reply-To: <1367244122.14512.124.camel@phil-desktop.brightsign>
X-Enigmail-Version: 1.5.1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Don't include source files for "other" architectures in the sysroot
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
X-List-Received-Date: Wed, 01 May 2013 19:26:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/29/2013 07:02 AM, Phil Blundell wrote:
> Since the sysroot is per-machine, we can be fairly confident that any
> out-of-tree modules which look at our sources will be building for the
> same architecture that we are.  This being the case there's no need to
> ship the sources for any other architectures, which saves disk space and
> time (about 30 seconds in do_package, in a somewhat unscientific test
> with ARCH=mips).
> 
> Of course, an even better fix would be to not install these files in the
> first place, but deleting them is easier.

No objection, and reducing kernel related build/package time is a good
thing.

You've stated that this successfully removes code on mips, have you also
tested that basic module building still works? For example, does
hello-mod still build?

Have you confirmed this on any other architectures? I'd like to see a
test at least on the core emulated BSPs (or maybe at least 2 of them)
before we pull this in as we have spent quite a bit of effort getting
modules building to date, I'd hate to break that due to a lack of testing.

> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/kernel.bbclass |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 00e27ef..ffb0b11 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -167,6 +167,7 @@ kernel_do_install() {
>  	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
>  	make -C $kerneldir _mrproper_scripts
>  	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
> +	rm -rf $(find $kerneldir/arch -maxdepth 1 -not -path $kerneldir/arch/$ARCH -not -path $kerneldir/arch/Kconfig -not -path $kerneldir/arch/. -not -path $kerneldir/arch)

Any particular reason for not using "-exec rm" like the other code
removal commands here?

>  	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
>  
>  	# As of Linux kernel version 3.0.1, the clean target removes
> 

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


