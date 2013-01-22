Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Txl0Y-0000YG-SU
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 22:03:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2013 12:48:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,516,1355126400"; d="scan'208";a="275335168"
Received: from unknown (HELO envy.home) ([10.255.15.13])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2013 12:48:19 -0800
Message-ID: <50FEFB12.5060905@linux.intel.com>
Date: Tue, 22 Jan 2013 12:48:18 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
	<81a1810d4c60fe2648c4e34d64c63ced7e0a7296.1358432402.git.laurentiu.palcu@intel.com>
In-Reply-To: <81a1810d4c60fe2648c4e34d64c63ced7e0a7296.1358432402.git.laurentiu.palcu@intel.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] kernel.bbclass: remove references to update-modules
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
X-List-Received-Date: Tue, 22 Jan 2013 21:03:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/17/2013 06:58 AM, Laurentiu Palcu wrote:
> Since update-modules is now obsolete, remove it from the bbclass.
> 
> [YOCTO #3598]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/kernel.bbclass |   36 +++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 46ba55f..4893cf2 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base module_strip
>  
>  PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> +DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX}"
>  

...

> -    use_update_modules = oe.utils.contains('DISTRO_FEATURES', 'update-modules', True, False, d)
> -    if use_update_modules:
> -        postinst = d.getVar('pkg_postinst_modules', True)
> -        postrm = d.getVar('pkg_postrm_modules', True)
> -    else:
> -        postinst = None
> -        postrm = None
> +    postinst = d.getVar('pkg_postinst_modules', True)
> +    postrm = d.getVar('pkg_postrm_modules', True)

This seems to be inverted logic from the original. If update-modules is
removed, then use_update_modules should be false right? Which would have
previously set postinst and postrm to None.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


