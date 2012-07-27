Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SutDc-0000Mj-Nu
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 00:41:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2012 15:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188029332"
Received: from unknown (HELO envy.home) ([10.255.12.238])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2012 15:29:33 -0700
Message-ID: <501315E8.8070801@linux.intel.com>
Date: Fri, 27 Jul 2012 15:27:52 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1342826543-23508-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH V2 1/2] kernel.bbclass: fix external module building
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
X-List-Received-Date: Fri, 27 Jul 2012 22:41:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/20/2012 04:22 PM, Khem Raj wrote:
> From: Denis Carikli <GNUtoo@no-log.org>
> 
> Without that fix we have the following while compiling compat-wireless.
>   include/linux/mmzone.h:18:30: fatal error: generated/bounds.h: No such file or directory
> 
> Note that the compat-wireless recipe will be added in another commit.
> 
> make -C $kerneldir _mrproper_scripts deleted this file along with
> other things so we resurrect it with this patch.
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

This addresses my concerns and incorporates Paul's request for
documentation in the commit header.

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  meta/classes/kernel.bbclass |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 08b5e61..ce4d7de 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -187,6 +187,9 @@ kernel_do_install() {
>  		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
>  	fi
>  
> +	# Necessary for building modules like compat-wireless.
> +	cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
> +
>  	# Remove the following binaries which cause strip or arch QA errors
>  	# during do_package for cross-compiled platforms
>  	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


