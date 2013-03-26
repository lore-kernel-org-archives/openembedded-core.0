Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UKWNk-0004fJ-7K
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 17:05:52 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Mar 2013 08:48:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="219057115"
Received: from unknown (HELO envy.home) ([10.255.13.151])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Mar 2013 08:48:50 -0700
Message-ID: <5151C361.7020202@linux.intel.com>
Date: Tue, 26 Mar 2013 08:48:49 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1364308617.git.bruce.ashfield@windriver.com>
	<cd19c63a4d2874eb48c9a96a69a38af730c00834.1364308617.git.bruce.ashfield@windriver.com>
In-Reply-To: <cd19c63a4d2874eb48c9a96a69a38af730c00834.1364308617.git.bruce.ashfield@windriver.com>
X-Enigmail-Version: 1.5.1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] linux-yocto/3.8: allow kernel feature _appends to be overriden
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
X-List-Received-Date: Tue, 26 Mar 2013 16:05:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/26/2013 07:46 AM, Bruce Ashfield wrote:
> It was pointed out that the current way the KERNEL_FEATURES variable
> is appended in the base linux-yocto recipe doesn't allow the appended
> features to be prevented in a layer without using python code and
> a recipe finalize hook.
> 
> To allow easier overriding of 'extra' or 'optional' features that are
> defined in the linux-yocto recipe, we create a KERNEL_EXTRA_FEATURES
> variable. This variable can be set in a layer to define extra features
> or cleared to prevent the recipe's extra features from being appended
> to the core functionality.

You know what I'm going to say right? Docume.... right, good.

Bruce, are you keeping a list of things that have changed and need
documentation in the kernel-dev manual? Could you share it?

--
Darren

> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_3.8.bb |    7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> index b395e45..f29675a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> @@ -23,8 +23,7 @@ KMETA = "meta"
>  COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
>  
>  # Functionality flags
> -KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
> -KERNEL_FEATURES_append_qemux86=" cfg/sound.scc"
> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
> -KERNEL_FEATURES_append_qemux86=" cfg/paravirt_kvm.scc"
> +KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> +KERNEL_FEATURES_append_qemux86=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc cfg/paravirt_kvm.scc"
> +KERNEL_FEATURES_append_qemux86-64=" ${KERNEL_EXTRA_FEATURES} cfg/sound.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


