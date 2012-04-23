Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SMLO1-0006RB-Mn
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 17:41:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Apr 2012 08:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="132876800"
Received: from unknown (HELO envy.home) ([10.7.199.64])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2012 08:31:35 -0700
Message-ID: <4F9575B9.7030601@linux.intel.com>
Date: Mon, 23 Apr 2012 08:31:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
	<1334667923-13908-2-git-send-email-obi@opendreambox.org>
In-Reply-To: <1334667923-13908-2-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 1/5] {kernel, module}.bbclass: don't run depmod for module packages during do_rootfs
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
X-List-Received-Date: Mon, 23 Apr 2012 15:41:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 04/17/2012 06:05 AM, Andreas Oberritter wrote:
> * depmod already gets executed by pkg_postinst_kernel-image.

What if you install a module package after the initial system
installation? Don't you want the module install to run depmod?

--
Darren

> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/classes/kernel.bbclass |    4 +---
>  meta/classes/module.bbclass |    7 +++----
>  2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3519e7c..c21ab96 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -276,9 +276,7 @@ fi
>  }
>  
>  pkg_postinst_modules () {
> -if [ -n "$D" ]; then
> -	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
> -else
> +if [ -z "$D" ]; then
>  	depmod -a
>  	update-modules || true
>  fi
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 53c16b7..91628e4 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -37,15 +37,14 @@ module_do_install() {
>  }
>  
>  pkg_postinst_append () {
> -	if [ -n "$D" ]; then
> -		exit 1
> -	fi
> +if [ -z "$D" ]; then
>  	depmod -a
>  	update-modules || true
> +fi
>  }
>  
>  pkg_postrm_append () {
> -	update-modules || true
> +update-modules || true
>  }
>  
>  EXPORT_FUNCTIONS do_compile do_install

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


