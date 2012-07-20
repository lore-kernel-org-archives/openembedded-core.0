Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Ss7hv-00043h-FW
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 09:33:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Jul 2012 00:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170712086"
Received: from unknown (HELO envy.home) ([10.255.12.229])
	by azsmga001.ch.intel.com with ESMTP; 20 Jul 2012 00:21:39 -0700
Message-ID: <500906A1.8000600@linux.intel.com>
Date: Fri, 20 Jul 2012 00:20:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342762570-29343-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1342762570-29343-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.4.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] kernel.bbclass: fix external module building
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
X-List-Received-Date: Fri, 20 Jul 2012 07:33:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/19/2012 10:36 PM, Khem Raj wrote:
> From: Denis Carikli <GNUtoo@no-log.org>
> 
> Without that fix we have the following while compiling compat-wireless.
>   include/linux/mmzone.h:18:30: fatal error: generated/bounds.h: No such file or directory
> 
> Note that the compat-wireless recipe will be added in another commit.
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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

Hrm... I'm not clear on why this is necessary. I understand why you need
bounds.h... but I don't see why it isn't there already.

A few lines up we do:

cp -fR * $kerneldir

Which should cover include/generated/bounds.h...

Perhaps "make -C $kerneldir _mrproper_scripts" clears that out... Ah,
yes, that seems to be the case. Grumble.

OK,

Signed-off-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




