Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RaccE-0001B8-Gi
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 01:22:34 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Dec 2011 16:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101893169"
Received: from unknown (HELO envy.home) ([10.255.12.211])
	by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2011 16:15:37 -0800
Message-ID: <4EE7EA96.4080806@linux.intel.com>
Date: Tue, 13 Dec 2011 16:15:18 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
X-Enigmail-Version: 1.3.3
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/9] kernel.bbclass: compile kernel and modules in a single task
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
X-List-Received-Date: Wed, 14 Dec 2011 00:22:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/13/2011 08:19 AM, Dmitry Eremin-Solenikov wrote:
> There is no point in compiling kernel modules in a separate task, run
> right after do_compile. On the other hand merging those tasks will e.g.
> make icecc used also for modules compilation, etc.

This split was done intentionally to allow tasks to be inserted between
compile and compile_kernelmodules. See:

commit 509364eb634cf148b6ac1fb5f51924f4eb6a8991
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Mar 15 11:25:01 2011 +0100

    kernel bbclass: split do_compile into do_compile and do_compile_modules

    This allows recipes to insert a custom task in between building
*Image and modules

    >From OE .dev revision 615876fe218dc3feb4a3df9e6546a7b1a6376800

    (From OE-Core rev: a2cc999d663407d17f41e1b0344361944993fa86)

    Signed-off-by: Koen Kooi <koen@openembedded.org>
    Acked-by: Graeme Gregory <dp@xora.org.uk>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

If you want to be able to use icecc, can you pull the necessary logic
into compile_kernelmodules rather than reverting Koen's patch?

Thanks,

Darren

> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  meta/classes/kernel.bbclass |    6 +-----
>  1 files changed, 1 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3f2f75a..a75c199 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -89,17 +89,13 @@ kernel_do_compile() {
>  	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
>  		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
>  	fi
> -}
>  
> -do_compile_kernelmodules() {
> -	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> -		oe_runmake ${PARALLEL_MAKE} modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> +		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>  	else
>  		bbnote "no modules to compile"
>  	fi
>  }
> -addtask compile_kernelmodules after do_compile before do_install
>  
>  kernel_do_install() {
>  	#

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


