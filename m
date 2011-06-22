Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QZRyu-0002ds-Kc
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:16:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jun 2011 11:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,407,1304319600"; d="scan'208";a="18395083"
Received: from unknown (HELO [10.255.13.180]) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2011 11:13:16 -0700
Message-ID: <4E0230BC.6020404@linux.intel.com>
Date: Wed, 22 Jun 2011 11:13:16 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1308757294-21106-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1308757294-21106-1-git-send-email-koen@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: restore kernel-abiversion file
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
X-List-Received-Date: Wed, 22 Jun 2011 18:16:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/22/2011 08:41 AM, Koen Kooi wrote:
> This fixes external module recipes that need $KERNEL_VERSION. It got removed by
> 
>     commit a9d41062e24a6b99661b3a5256f369b557433607
>     Author: Darren Hart <dvhart@linux.intel.com>
>     Date:   Tue Mar 8 17:09:10 2011 -0800
> 
>         kernel/bbclass: rework kernel and module classes to allow for building out-of-tree modules
> 
> seemingly as an oversight.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/classes/kernel.bbclass |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 1bb69f5..8f9f108 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -123,6 +123,12 @@ kernel_do_install() {
>  	install -d $kerneldir
>  
>  	#
> +	# Store the kernel version in sysroots for module-base.bbclass
> +	#
> +
> +	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion

From everything I can see this is an openembedded construct - which
external modules need this? An example recipe I can review?

I'd like to understand this better as I don't like the idea of depending
on an arbitrary file that isn't part of the kernel build system to build
modules.

It seems to me that these modules should be able to DEPEND on something
provided by the kernel recipes, rather than checking the contents of a
file stuck in the build tree.

--
Darren

> +
> +	#
>  	# Copy the entire source tree. In case an external build directory is
>  	# used, copy the build directory over first, then copy over the source
>  	# dir. This ensures the original Makefiles are used and not the

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


