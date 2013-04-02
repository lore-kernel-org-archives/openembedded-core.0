Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UN8U2-0003mb-2l
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 23:11:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Apr 2013 13:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,394,1363158000"; d="scan'208";a="311374510"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.70])
	by orsmga002.jf.intel.com with ESMTP; 02 Apr 2013 13:53:52 -0700
Message-ID: <515B455E.4030504@linux.intel.com>
Date: Tue, 02 Apr 2013 13:53:50 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Chase Maupin <Chase.Maupin@ti.com>
References: <1364575688-19681-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1364575688-19681-1-git-send-email-Chase.Maupin@ti.com>
X-Enigmail-Version: 1.5.1
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-dtb: Add simple DTB symlinks for devicetree
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
X-List-Received-Date: Tue, 02 Apr 2013 21:11:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 03/29/2013 09:48 AM, Chase Maupin wrote:
> * This is similar to the symlinks provided for the kernel image
>   in the /boot directory of a file system.  The goal is to have
>   simply named symlinks in /boot that mirror the device tree
>   name in the kernel sources.  This is so that programs like
>   U-Boot can easily find the default device tree binary in the
>   /boot directory and use that when booting the kernel.
> * Use update-alternatives to handle proper creation and removal
>   of the symlinks.

Hi Chase,

So I have no experience myself with Device Tree. Adding Bruce A. for some
additional review.

I am going to assume this is the right thing to do for u-boot systems.
Which devices have you verified this as working with?

> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index ec6c375..66cf255 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -45,3 +45,23 @@ do_deploy_append() {
>          done
>      fi
>  }
> +
> +pkg_postinst_kernel-devicetree () {

Please use tabs for bash functions. Oddly, I see the only tabs in this
file are in the anonymous python blocks. Doh.

> +    cd /${KERNEL_IMAGEDEST}
> +    for DTS_FILE in ${KERNEL_DEVICETREE}
> +    do
> +        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> +        DTB_NAME="devicetree-uImage-${DTS_BASE_NAME}.dtb"


Is "uImage" always correct here? Or should we be using
${KERNEL_IMAGETYPE} here?


> +        update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb ${DTB_NAME} ${KERNEL_PRIORITY} || true
> +    done
> +}
> +
> +pkg_postrm_kernel-devicetree () {
> +    cd /${KERNEL_IMAGEDEST}
> +    for DTS_FILE in ${KERNEL_DEVICETREE}
> +    do
> +        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> +        DTB_NAME="devicetree-uImage-${DTS_BASE_NAME}.dtb"
> +        update-alternatives --remove ${DTS_BASE_NAME}.dtb ${DTB_NAME} ${KERNEL_PRIORITY} || true
> +    done
> +}
> 

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


